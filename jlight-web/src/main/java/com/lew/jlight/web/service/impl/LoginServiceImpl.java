package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.web.dao.UserDao;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.service.LoginService;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;

    @Override
    public boolean doLogin(String account, String password, String clientIp) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(account),"帐号不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password),"用户帐号不能为空");

        String accountToUse = account.toUpperCase();
        User user = userDao.findUnique("getByAccount", accountToUse);
        if(user==null){
            //帐号不存在
            throw new UnknownAccountException();
        }
        boolean isLockStatus = user.getIsLock();
        if(isLockStatus){
            //帐号被锁定
            throw new LockedAccountException();
        }
        // 当登录名有效，而密码无效时：
        // 将用户的 error_count 加 1，并且判断加1后,error_count的值是否已达到系统设定的最高值，
        // 若达到，则同时更新 is_lock字段的值
        if (!password.equals(user.getPassword())) {
            int maxErrorCount = 3;
            int errorCount = user.getErrorCount() + 1;
            int isLock = 0;
            if (errorCount >= maxErrorCount) {
                isLock = 1;
            }

            Map<String,String> paramMap = Maps.newHashMap();
            paramMap.put("errorCount", String.valueOf(errorCount));
            paramMap.put("isLock", String.valueOf(isLock));
            paramMap.put("userId", user.getUserId());
            userDao.update("updateUserErrorCount", paramMap);
            //帐号或者密码错误
            throw new IncorrectCredentialsException();
        }
        String userId = user.getUserId();
        Map<String,Object> updateParam =Maps.newHashMap();
        updateParam.put("loginTime", new Date());
        updateParam.put("loginIp", clientIp);
        updateParam.put("errorCount", 0);
        updateParam.put("userId", userId);
        userDao.update("updateLoginInfo", updateParam);
        return true;
    }
}
