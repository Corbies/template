package com.lew.jlight.web.controller;

import com.lew.jlight.web.util.UserContextUtil;

import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
public class LogoutController {

    // 系统退出
    public void logout() throws IOException {
        UserContextUtil.clearSessionValueObject();
    }

}
