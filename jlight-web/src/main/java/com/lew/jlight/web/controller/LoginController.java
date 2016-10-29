package com.lew.jlight.web.controller;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;

import com.lew.jlight.core.MessageUtils;
import com.lew.jlight.core.Response;
import com.lew.jlight.web.service.LoginService;
import com.lew.jlight.web.util.DigestUtil;
import com.lew.jlight.web.util.ServletUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("login")
    public Object login(String account, String password) throws Exception {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(account), "account should not be empty or null");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password), "password should not be empty or null");

        password = DigestUtil.sha256().digest(password);
        Response response = loginService.doLogin(account, password, ServletUtil.getIpAddr());
        if (!MessageUtils.isSuccess(response)) {
            response.setCode(response.getCode());
            response.setMsg(response.getMsg());
            return "login";
        }
        return "index";
    }
}
