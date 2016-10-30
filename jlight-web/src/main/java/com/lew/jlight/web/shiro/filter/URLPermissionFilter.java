package com.lew.jlight.web.shiro.filter;


import com.google.common.base.Strings;
import com.google.common.collect.Sets;

import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.web.service.UserService;

import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

@Component("urlPermissionsFilter")
public class URLPermissionFilter extends PermissionsAuthorizationFilter {

    private Set<String> suffixSet = Sets.newHashSet("js",".css",".html",".jpg",".png",".gif", ".jpeg");

    @Resource
    private UserService userService;

    @Override
    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws IOException {
        return true;
       /* String curUrl = getRequestUrl(request);
        Subject subject = SecurityUtils.getSubject();
        if(subject.getPrincipal() == null || endsWithAny(curUrl,suffixSet) || "/unauthor".equals(curUrl)) {
            return true;
        }
        List<String> urls = userService.getPermission(subject.getPrincipal().toString());
        return urls.contains(curUrl);*/
    }

    private String getRequestUrl(ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest)request;
        String queryString = req.getQueryString();
        queryString = StringUtils.isEmpty(queryString)?"": "?"+queryString;
        return req.getRequestURI()+queryString;
    }

    private  boolean endsWithAny(String string, Set<String> searchStrings) {
        if (Strings.isNullOrEmpty(string) || BeanUtil.isEmpty(searchStrings)) {
            return false;
        }
        for (String str : searchStrings) {
            if (string.endsWith(str)) {
                return true;
            }
        }
        return false;
    }
}
