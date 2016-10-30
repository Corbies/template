package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.UserDao;
import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.UserService;
import com.lew.jlight.web.util.DigestUtil;

import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Component
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Resource
    private RoleDao roleDao;

    @Resource
    private UserRoleDao userRoleDao;

    public UserServiceImpl(){
        System.out.println("sss");
    }

    @Override
    public List getList(ParamFilter<String, String> param) {
        Page page = param.getPage();
        return userDao.findMap("getList", param, page);
    }

    @Override
    public void updateDefaultPwd(String userIds) {
        Preconditions.checkArgument(Strings.isNullOrEmpty(userIds),"用户编号不能为空");
        String[] idArray = userIds.split(",");
        for (String userId : idArray) {
            User user = userDao.findUnique("getByUserId", userId);
            Preconditions.checkNotNull(user,"用户不存在");
        }
        for (String userId : idArray) {
            String defaultPwd = DigestUtil.sha256().digest("123456");
            Map<String, String> paramMap = Maps.newHashMapWithExpectedSize(2);
            paramMap.put("defaultPwd", defaultPwd);
            paramMap.put("userId", userId);
            userDao.update("updateDefaultPwd", paramMap);
        }
    }
    @Override
    public void update(String roleIds, User user) {
        Response response = new Response();
        Preconditions.checkArgument(!Strings.isNullOrEmpty(roleIds),"角色编号不能为空");
        String[] roleIdArry = roleIds.split(",");
        Preconditions.checkArgument(!BeanUtil.isEmpty(roleIdArry),"角色编号不能为空");
        Preconditions.checkNotNull(user,"用户对象不能为空");

        String userId = user.getUserId();
        // 删除原有角色
        userRoleDao.update("deleteUserRoleByUserId", userId);
        boolean isExist = true;
        for (String roleId : roleIdArry) {
            Role role = roleDao.findUnique("getRoleByRoleId", roleId);
            if (role == null) {
                isExist = false;
                break;
            }
        }
        Preconditions.checkNotNull(user,"用户对象不能为空");
        if (!isExist) {
            response.setMsg("角色信息不存在");
        }

        User model = userDao.findUnique("getByUserId", userId);
        Preconditions.checkNotNull(model,"用户信息不存在");
        for (String roleId : roleIdArry) {
            UserRole userRole = new UserRole();
            userRole.setRoleId(roleId);
            userRole.setIsDelete(BigInteger.ZERO.intValue());
            userRole.setCreateTime(new Date());
            userRole.setUpdateTime(new Date());
            userRole.setUserId(userId);
            userRoleDao.save("addUserRole", userRole);
        }
        String oldPwd = user.getPassword();
        if (model.getPassword().equals(oldPwd)) {
            user.setPassword(oldPwd);
        } else {
            user.setPassword(DigestUtil.sha256().digest(oldPwd));
        }
        Map<String, Object> params = Maps.newHashMap();
        params.put("account", user.getAccount());
        params.put("password", user.getPassword());
        params.put("mobile", user.getMobile());
        params.put("email", user.getEmail());
        params.put("trueName", user.getTrueName());
        params.put("isLock", user.getIsLock());
        params.put("userId", user.getUserId());
        userDao.update("updateUser", params);
    }

    @Override
    public void add(String roleIds, User user) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(roleIds),"角色编号不能为空");
        String[] roleIdsToUse = roleIds.split(",");
        Preconditions.checkArgument(!BeanUtil.isEmpty(roleIdsToUse),"角色编号不能为空");
        Preconditions.checkNotNull(user,"用户信息不能为空");
        boolean isExist = true;
        for (String roleIdToUse : roleIdsToUse) {
            Role role = roleDao.findUnique("getRoleByRoleId", roleIdToUse);
            if (role == null) {
                isExist = false;
                break;
            }
        }

        Preconditions.checkState(isExist,"用户对象不存在");
        String account = user.getAccount();
        User model = userDao.findUnique("getByAccount", account);
        Preconditions.checkState(model!=null,"用户对象已存在");

        String password = user.getPassword();
        password = DigestUtil.sha256().digest(password);
        Date createTime = new Date();
        user.setIsDelete(BigInteger.ZERO.intValue());
        user.setCreateTime(createTime);
        user.setUpdateTime(createTime);
        user.setErrorCount(BigInteger.ZERO.intValue());
        user.setUserId("2");
        user.setPassword(password);
        userDao.save("addUser", user);

        for (String roleId : roleIdsToUse) {
            UserRole userRole = new UserRole();
            userRole.setRoleId(roleId);
            userRole.setIsDelete(BigInteger.ZERO.intValue());
            userRole.setCreateTime(createTime);
            userRole.setUpdateTime(createTime);
            userRole.setUserId(user.getUserId());
            userRoleDao.save("addUserRole", userRole);
        }
    }

    @Override
    public void updatePwd(String oldPwd, String confirmPwd, String newPwd, String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId),"用户编号不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(oldPwd),"旧密码不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(newPwd),"新密码不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(confirmPwd),"确认密码不能为空");
        Preconditions.checkArgument(!newPwd.equals(confirmPwd),"新密码与确认密码不一致");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(newPwd),"新密码不能为空");

        User user = userDao.findUnique("getByUserId", userId);
        Preconditions.checkNotNull(user,"用户对象不存在");
        Preconditions.checkArgument(!user.getPassword().equals(DigestUtil.sha256().digest(oldPwd)),"原密码不正确");

        String newPassword = DigestUtil.sha256().digest(newPwd);
        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("newPassword", newPassword);
        paramMap.put("userId", userId);
        userDao.update("updatePwd", paramMap);
    }

    @Override
    public void delete(String userIds) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userIds),"用户编号不能为空");
        String[] idArray = userIds.split(",");
        for (String userId : idArray) {
            User user = userDao.findUnique("getByUserId", userId);
            Preconditions.checkNotNull(user,"用户对象不存在");
        }
        for (String userId : idArray) {
            userDao.update("deleteByUserId", userId);
            userRoleDao.update("deleteUserRoleByUserId", userId);
        }
    }

    @Override
    public Map getDetail(String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId),"用户编号不能为空");
        Map<String, Object> resultMap = Maps.newHashMap();
        Map userMap = userDao.findOneColumn("getUserDetail", Map.class, userId);
        Preconditions.checkNotNull(userMap,"用户对象不存在");
        List<String> roleIds = userRoleDao.findColumn("getRoleIdByUserId", String.class, userId);
        resultMap.put("user", userMap);
        resultMap.put("roleIds", roleIds);
        return resultMap;
    }

    @Override
    public User getByUserId(String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId),"用户编号不能为空");
        return userDao.findUnique("getByUserId", userId);
    }

    @Override
    public User getByAccount(String account) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(account),"用户编号不能为空");
        return userDao.findUnique("getByAccount", account);
    }

    @Override
    public List<String> getPermission(String account) {
        return Lists.newArrayList();
    }

}
