package com.lew.jlight.web.shiro.config;

import com.google.common.collect.Maps;

import com.lew.jlight.web.shiro.UserRealm;
import com.lew.jlight.web.shiro.filter.URLPermissionFilter;

import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.AnonymousFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.DelegatingFilterProxy;

import java.util.Map;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;

@Component
public class ShiroConfig {

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        filterRegistration.setFilter(new DelegatingFilterProxy("shiroFilter"));
        filterRegistration.setEnabled(true);
        filterRegistration.addUrlPatterns("/*");
        filterRegistration.setDispatcherTypes(DispatcherType.REQUEST);
        return filterRegistration;
    }


    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilter() {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setSecurityManager(securityManager());
        bean.setLoginUrl("/login");
        bean.setSuccessUrl("/index");
        bean.setUnauthorizedUrl("/unauthor");

        Map<String, Filter> filters = Maps.newHashMap();
        filters.put("perms", urlPermissionsFilter());
        filters.put("anon", new AnonymousFilter());
        bean.setFilters(filters);

        Map<String, String> chains = Maps.newHashMap();
        chains.put("/login", "anon");
        chains.put("/doLogin", "anon");
        chains.put("/unauthor", "anon");
        chains.put("/logout", "logout");
        //静态资源过滤
        chains.put("/assets/**", "anon");
        chains.put("/css/**", "anon");
        chains.put("/images/**", "anon");
        chains.put("/js/**", "anon");

        //错误页面过滤
        chains.put("/401.html", "anon");
        chains.put("/404.html", "anon");

        chains.put("/**", "authc,perms");
        bean.setFilterChainDefinitionMap(chains);
        return bean;
    }

    @Bean
    public URLPermissionFilter urlPermissionsFilter() {
        return new URLPermissionFilter();
    }


    @Bean(name = "securityManager")
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        manager.setRealm(userRealm());
        manager.setSessionManager(defaultWebSessionManager());
        return manager;
    }

    /**
     * @see DefaultWebSessionManager
     */
    @Bean(name = "sessionManager")
    public DefaultWebSessionManager defaultWebSessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setGlobalSessionTimeout(1800000);
        sessionManager.setDeleteInvalidSessions(true);
        sessionManager.setSessionValidationSchedulerEnabled(true);
        sessionManager.setDeleteInvalidSessions(true);
        return sessionManager;
    }


    @Bean
    @DependsOn(value = "lifecycleBeanPostProcessor")
    public UserRealm userRealm() {
        UserRealm userRealm = new UserRealm();
        return userRealm;
    }

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }
}
