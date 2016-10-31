package com.lew.jlight.web.controller;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.util.DigestUtil;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.LoginService;
import com.lew.jlight.web.service.RoleService;
import com.lew.jlight.web.service.UserRoleService;
import com.lew.jlight.web.service.UserService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import static com.google.common.base.Preconditions.checkArgument;

@Controller
@RequestMapping
public class LoginController {

    @Resource
    private LoginService loginService;

    @Resource
    private UserRoleService userRoleService;

    @Resource
    private UserService userService;


    @Resource
    private RoleService roleService;

    @RequestMapping("login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String doLogin(String account, String password, ModelMap modelMap) throws Exception {
        checkArgument(!Strings.isNullOrEmpty(account), "account should not be empty or null");
        checkArgument(!Strings.isNullOrEmpty(password), "password should not be empty or null");
        password = DigestUtil.sha256().digest(password);
        UsernamePasswordToken token = new UsernamePasswordToken(account, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            loginService.doLogin(account, password, ServletUtil.getIpAddr());
            subject.login(token);
            if (subject.isAuthenticated()) {
                User user = userService.getByAccount(account);
                String userId = user.getUserId();
                List<UserRole> userRoleList = userRoleService.getListByUserId(userId);
                Map<String,String> roleMap = Maps.newHashMap();
                userRoleList.forEach(userRole -> {
                    Role role = roleService.getDetail(userRole.getRoleId());
                    roleMap.put(userRole.getRoleId(),role.getName());
                });
                if(userRoleList.size()>0){
                    String roleId = userRoleList.get(0).getRoleId();
                    UserContextUtil.setAttribute("roleId",roleId);
                }
                UserContextUtil.setAttribute("roleMap",roleMap);
                UserContextUtil.setAttribute("userId",userId);
                return "redirect:/index";
            }
        } catch (IncorrectCredentialsException e) {
            modelMap.put("msg", "帐号或者密码错误");
        } catch (ExcessiveAttemptsException e) {
            modelMap.put("msg", "登录失败次数过多");
        } catch (LockedAccountException e) {
            modelMap.put("msg", "帐号已被锁定");
        } catch (DisabledAccountException e) {
            modelMap.put("msg", "帐号已被禁用");
        } catch (ExpiredCredentialsException e) {
            modelMap.put("msg", "帐号已过期");
        } catch (UnknownAccountException e) {
            modelMap.put("msg", "帐号不存在");
        } catch (UnauthorizedException e) {
            modelMap.put("msg", "您没有得到相应的授权");
        }
        return "login";
    }
}
