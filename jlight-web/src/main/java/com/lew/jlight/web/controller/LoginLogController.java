package com.lew.jlight.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("loginLog")
public class LoginLogController {

    @GetMapping("list")
    public String list(){
        return "loginLogList";
    }
}
