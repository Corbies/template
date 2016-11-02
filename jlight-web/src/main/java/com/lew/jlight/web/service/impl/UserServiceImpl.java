package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.lew.jlight.core.IdGenerator;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.DigestUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.UserDao;
import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.service.UserService;

import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Component
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

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
    public void updateDefaultPwd(String[] userIds) {
        Preconditions.checkArgument((userIds!=null && userIds.length>0),"用户编号不能为空");
        for (String userId : userIds) {
            User user = userDao.findUnique("getByUserId", userId);
            Preconditions.checkNotNull(user,"用户不存在");
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
    public void update( User user) {
        Preconditions.checkNotNull(user,"用户对象不能为空");
        User model = userDao.findUnique("getByUserId", user.getUserId());
        Preconditions.checkNotNull(model,"用户信息不存在");
        String oldPwd = user.getPassword();
        if (model.getPassword().equals(oldPwd)) {
            user.setPassword(oldPwd);
        } else {
            user.setPassword(DigestUtil.sha256().digest(oldPwd));
        }
        userDao.update("updateUser", user);
    }

    @Override
    public void add(User user) {
        Preconditions.checkNotNull(user,"用户不能为空");
        String account = user.getAccount();
        User model = userDao.findUnique("getByAccount", account);
        Preconditions.checkArgument(model==null,"用户已存在");
        String password = user.getPassword();
        password = DigestUtil.sha256().digest(password);
        user.setErrorCount(BigInteger.ZERO.intValue());
        String id = IdGenerator.getInstance().getStringId();
        user.setUserId(id);
        user.setPassword(password);
        userDao.save("addUser", user);
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
    public void delete(String[] userIds) {
       Preconditions.checkArgument((userIds!=null && userIds.length>0),"用户编号不能为空");
        for (String userId : userIds) {
            User user = userDao.findUnique("getByUserId", userId);
            Preconditions.checkNotNull(user,"用户对象不存在");
        }
        for (String userId : userIds) {
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
        resultMap.put("user", userMap);
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
