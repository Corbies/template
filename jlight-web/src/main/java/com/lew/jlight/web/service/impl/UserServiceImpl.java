package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.lew.jlight.core.IdGenerator;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.DigestUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.UserDao;
import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.UserService;
import com.lew.jlight.web.util.Constants;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public UserServiceImpl(){
        boolean isAop = AopUtils.isAopProxy(sqlSessionTemplate);
        boolean isaa = AopUtils.isCglibProxy(sqlSessionTemplate);
        boolean isJdk = AopUtils.isJdkDynamicProxy(sqlSessionTemplate);
    }

    @Override
    public List getList(ParamFilter<String, String> param) {
        Page page = param.getPage();
        return userDao.findMap("getList", param, page);
    }

    @Override
    public void updateDefaultPwd(String[] userIds) {
        Preconditions.checkArgument((userIds != null && userIds.length > 0), "用户编号不能为空");
        for (String userId : userIds) {
            User user = userDao.findUnique("getByUserId", userId);
            Preconditions.checkNotNull(user, "用户不存在");
        }
        for (String userId : userIds) {
            String defaultPwd = DigestUtil.sha256().digest("123456");
            Map<String, String> paramMap = Maps.newHashMap();
            paramMap.put("defaultPwd", defaultPwd);
            paramMap.put("userId", userId);
            userDao.update("updateDefaultPwd", paramMap);
        }
    }

    @Override
    public void update(User user) {
        Preconditions.checkNotNull(user, "用户对象不能为空");
        User model = userDao.findUnique("getByUserId", user.getUserId());
        Preconditions.checkNotNull(model, "用户信息不存在");
        String oldPwd = user.getPassword();
        if (model.getPassword().equals(oldPwd)) {
            user.setPassword(oldPwd);
        } else {
            user.setPassword(DigestUtil.sha256().digest(oldPwd));
        }
        userDao.update("updateUser", user);
    }

    @Override
    @Transactional
    public void add(User user) {
        Preconditions.checkNotNull(user, "用户不能为空");
        String account = user.getAccount();
        User model = userDao.findUnique("getByAccount", account);
        Preconditions.checkArgument(model == null, "用户已存在");
        String password = user.getPassword();
        password = DigestUtil.sha256().digest(password);
        user.setErrorCount(BigInteger.ZERO.intValue());
        String userId = IdGenerator.getInstance().nextId();
        user.setUserId(userId);
        user.setPassword(password);
        user.setIsDelete(0);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        sqlSessionTemplate.insert("com.lew.jlight.web.entity.User.addUser", user);

        //默认角色为普通用户
        Role role = roleDao.findUnique("getRoleBySign", Constants.MEMBER);
        Preconditions.checkNotNull(role, "默认角色不能为空");
        if(role!=null){
            throw new IllegalArgumentException("");
        }
        UserRole userRole = new UserRole();
        userRole.setRoleId(role.getRoleId());
        userRole.setUserId(userId);
        userRoleDao.save(userRole);
    }

    @Override
    public void updatePwd(String oldPwd, String confirmPwd, String newPwd, String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId), "用户编号不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(oldPwd), "旧密码不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(newPwd), "新密码不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(confirmPwd), "确认密码不能为空");
        Preconditions.checkArgument(!newPwd.equals(confirmPwd), "新密码与确认密码不一致");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(newPwd), "新密码不能为空");

        User user = userDao.findUnique("getByUserId", userId);
        Preconditions.checkNotNull(user, "用户对象不存在");
        Preconditions.checkArgument(!user.getPassword().equals(DigestUtil.sha256().digest(oldPwd)), "原密码不正确");

        String newPassword = DigestUtil.sha256().digest(newPwd);
        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("newPassword", newPassword);
        paramMap.put("userId", userId);
        userDao.update("updatePwd", paramMap);
    }

    @Override
    public void delete(String[] userIds) {
        Preconditions.checkArgument((userIds != null && userIds.length > 0), "用户编号不能为空");
        for (String userId : userIds) {
            User user = userDao.findUnique("getByUserId", userId);
            Preconditions.checkNotNull(user, "用户对象不存在");
        }
        for (String userId : userIds) {
            userDao.update("deleteByUserId", userId);
            userRoleDao.update("deleteUserRoleByUserId", userId);
        }
    }

    @Override
    public Map getDetail(String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId), "用户编号不能为空");
        Map<String, Object> resultMap = Maps.newHashMap();
        Map userMap = userDao.findOneColumn("getUserDetail", Map.class, userId);
        Preconditions.checkNotNull(userMap, "用户对象不存在");
        resultMap.put("user", userMap);
        return resultMap;
    }

    @Override
    public User getByUserId(String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId), "用户编号不能为空");
        return userDao.findUnique("getByUserId", userId);
    }

    @Override
    public User getByAccount(String account) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(account), "用户编号不能为空");
        return userDao.findUnique("getByAccount", account);
    }

    @Override
    public List<String> getPermission(String account) {
        return Lists.newArrayList();
    }

}
