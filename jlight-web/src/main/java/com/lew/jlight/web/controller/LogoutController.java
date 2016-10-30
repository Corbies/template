package com.lew.jlight.web.controller;

import com.lew.jlight.web.util.UserContextUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class LogoutController {

    @RequestMapping("logout")
    public void logout() throws IOException {
        UserContextUtil.clearSessionValueObject();
    }

}
