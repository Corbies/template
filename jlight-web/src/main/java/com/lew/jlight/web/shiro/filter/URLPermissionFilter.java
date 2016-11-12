package com.lew.jlight.web.shiro.filter;


import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.SystemPropertyUtils;

@Component("urlPermissionsFilter")
public class URLPermissionFilter extends PermissionsAuthorizationFilter {

    @Override
    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws IOException {
    	buildPermissions(request);
    	Subject subject = SecurityUtils.getSubject();
    	System.out.println("是否已经登录：" + subject.isAuthenticated());
    	if(!subject.isAuthenticated()) return true;
    	System.out.println("登录名称： " + SecurityUtils.getSubject().getPrincipal());
    	if("admin".equals(SecurityUtils.getSubject().getPrincipal())){
    		return true;
    	}
    	return super.isAccessAllowed(request, response, buildPermissions(request));
    }

    /** 
     * 根据请求URL产生权限字符串，这里只产生，而比对的事交给Realm 
     * @param request 
     * @return 
     */  
    protected String[] buildPermissions(ServletRequest request) {  
        String[] perms = new String[1];  
        HttpServletRequest req = (HttpServletRequest) request;  
        String path = WebUtils.getRequestUri(req);  
        perms[0] = path;//path直接作为权限字符串  
        System.out.println("根据请求的路径产生权限字符串===》" + path);
        return perms;  
    }  
}
