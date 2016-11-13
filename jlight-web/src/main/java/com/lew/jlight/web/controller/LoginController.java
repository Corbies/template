package com.lew.jlight.web.controller;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.util.DigestUtil;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.RoleService;
import com.lew.jlight.web.service.UserRoleService;
import com.lew.jlight.web.util.ServletUtil;
import com.lew.jlight.web.util.UserContextUtil;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import static com.google.common.base.Preconditions.checkArgument;

@Controller
@RequestMapping
public class LoginController {

    @Resource
    private RoleService roleService;

    @Resource
    private UserRoleService userRoleService;

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @PostMapping("login")
    public String doLogin(String account, String password, ModelMap modelMap) throws Exception {
        checkArgument(!Strings.isNullOrEmpty(account), "account should not be empty or null");
        checkArgument(!Strings.isNullOrEmpty(password), "password should not be empty or null");
        UsernamePasswordToken token = new UsernamePasswordToken(account, DigestUtil.sha256().digest(password));
        Subject subject = SecurityUtils.getSubject();
        String msg;
        ServletUtil.getRequest().setAttribute("account",account);
        try {
           /* loginService.doLogin(account, password, ServletUtil.getIpAddr());
            User user = userService.getByAccount(account);
            List<UserRole> userRoleList = userRoleService.getListByUserId(user.getUserId());
            if(userRoleList==null || userRoleList.size()==0){
                throw  new UnauthorizedException();
            }*/
            subject.login(token);
            User user = (User) UserContextUtil.getAttribute("currentUser");
            String userId = user.getUserId();
            Map<String,String> roleMap = Maps.newHashMap();
            List<UserRole> userRoleList = userRoleService.getListByUserId(user.getUserId());
            if(userRoleList==null || userRoleList.size()==0){
                throw  new UnauthorizedException();
            }
            userRoleList.forEach(userRole -> {
                Role role = roleService.getByRoleId(userRole.getRoleId());
                roleMap.put(userRole.getRoleId(),role.getName());
            });
            if(userRoleList.size()>0){
                String roleId = userRoleList.get(0).getRoleId();
                UserContextUtil.setAttribute("roleId",roleId);
            }
            //记录登录信息到上下文
            UserContextUtil.setAttribute("roleMap",roleMap);
            UserContextUtil.setAttribute("userId",userId);
            UserContextUtil.setAttribute("account",account);
            return "redirect:/index";
        } catch (IncorrectCredentialsException | UnknownAccountException e) {
            msg = "帐号或者密码错误";
            modelMap.put("msg", msg);
        } catch (ExcessiveAttemptsException e) {
            msg = "登录失败次数过多";
            modelMap.put("msg", msg);
        } catch (LockedAccountException e) {
            msg = "帐号已被锁定";
            modelMap.put("msg", msg);
        } catch (DisabledAccountException e) {
            msg="帐号已被禁用";
            modelMap.put("msg", msg);
        } catch (ExpiredCredentialsException e) {
            msg = "帐号已过期";
            modelMap.put("msg", msg);
        } catch (UnauthorizedException e) {
            msg="帐号未分配角色或权限";
            modelMap.put("msg", msg);
        }catch (Exception e){
            msg="系统发生错误，请联系管理员";
            modelMap.put("msg",msg);
        }
        ServletUtil.getRequest().setAttribute("msg",msg);
        return "login";
    }
}
