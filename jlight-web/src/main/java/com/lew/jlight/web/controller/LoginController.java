package com.lew.jlight.web.controller;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;

import com.lew.jlight.web.service.LoginService;
import com.lew.jlight.web.util.DigestUtil;
import com.lew.jlight.web.util.ServletUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping
public class LoginController {

    @Resource
    private LoginService loginService;

    @RequestMapping("login")
    public String login() {
        return "login";
    }

    @RequestMapping("doLogin")
    public String doLogin( String account, String password) throws Exception {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(account), "account should not be empty or null");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password), "password should not be empty or null");

        password = DigestUtil.sha256().digest(password);
        boolean result = loginService.doLogin(account, password, ServletUtil.getIpAddr());
        if (!result) {
            return "login";
        }
        return "redirect:index";
    }
}
