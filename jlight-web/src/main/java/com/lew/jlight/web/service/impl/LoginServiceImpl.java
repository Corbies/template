package com.lew.jlight.web.service.impl;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.UserDao;
import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public Response doLogin(String account, String password, String clientIp) throws Exception {
        Response response = new Response();
        if (Strings.isNullOrEmpty(account)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("帐号不能为空");
            return response;
        }
        if (Strings.isNullOrEmpty(password)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户帐号不能为空");
            return response;
        }

        String accountToUse = account.toUpperCase();
        User user = userDao.findUnique("getByAccount", accountToUse);
        if (user == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("帐号或者密码错误");
            return response;
        }

        boolean isLockStatus = user.getIsLock().booleanValue();
        if (isLockStatus) {
            response.setCode(Response.LOCKED);
            response.setMsg("帐号已被锁定");
            return response;
        }
        // 当登录名有效，而密码无效时：
        // 将用户的 error_count 加 1，并且判断加1后,error_count的值是否已达到系统设定的最高值，
        // 若达到，则同时更新 is_lock字段的值
        if (!password.equals(user.getPassword())) {
            int maxErrorCount = 3;
            int errorCount = user.getErrorCount().intValue() + 1;
            int isLock = 0;
            if (errorCount >= maxErrorCount) {
                isLock = 1;
            }

            Map<String, String> paramMap = Maps.newHashMap();
            paramMap.put("errorCount", String.valueOf(errorCount));
            paramMap.put("isLock", String.valueOf(isLock));
            paramMap.put("userId", user.getUserId());
            userDao.update("updateUserErrorCount", paramMap);

            response.setCode(Response.PASSWORD_ERROR);
            response.setMsg("用户或者密码错误");
            return response;
        }
        String userId = user.getUserId();

        // set login information
        Map<String, Object> updateParam = new HashMap<>();
        updateParam.put("loginTime", new Date());
        updateParam.put("loginIp", clientIp);
        updateParam.put("errorCount", 0);
        updateParam.put("userId", userId);
        userDao.update("updateLoginInfo", updateParam);

        List<String> roleIds = userRoleDao.findColumn("getRoleIdByUserId",
                String.class, userId);
        StringBuilder buidler = new StringBuilder();
        for (int i = 0, size = roleIds.size(); i < size; i++) {
            String roleName = roleDao.findOneColumn("getRoleNameByRoleId",
                    String.class, roleIds.get(i));
            if (i == size - 1) {
                buidler.append(roleName);
            } else {
                buidler.append(roleName + "、");
            }
        }

        Map<String, String> userInfo = new HashMap<String, String>();
        userInfo.put("roleName", buidler.toString());
        userInfo.put("roleId", roleIds.get(0));
        userInfo.put("userId", userId);
        response.setData(userInfo);

        return response;
    }

}
