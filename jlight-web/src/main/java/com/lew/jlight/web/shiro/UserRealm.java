package com.lew.jlight.web.shiro;

import com.google.common.collect.Sets;

import com.lew.jlight.web.service.UserService;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    public UserRealm() {
        setName("UserRealm");
    }

    //权限资源角色
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //add Permission Menu
        info.setStringPermissions(Sets.newHashSet(userService.getPermission(username)));
        //add Roles String[Set<String> roles]
        //info.setRoles(roles);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken upt = (UsernamePasswordToken) token;
        String account = upt.getUsername();
        return new SimpleAuthenticationInfo(account, upt.getPassword(), getName());
    }
}





