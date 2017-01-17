package com.wbs.web.controller;

import com.wbs.core.Response;
import com.wbs.core.page.Page;
import com.wbs.mybatis.ParamFilter;
import com.wbs.web.aop.annotaion.WebLogger;
import com.wbs.web.entity.LoginLog;
import com.wbs.web.service.LoginLogService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.annotation.Resource;


@Controller
@RequestMapping("loginLog")
public class LoginLogController {

    @Resource
    private LoginLogService loginLogService;

    @GetMapping("listPage")
    public String list(){
        return "loginLogList";
    }

    @ResponseBody
    @PostMapping("list")
    @WebLogger("查询登录日志列表")
    public Response list(@RequestBody ParamFilter queryFilter){
        List<LoginLog> loginLogList = loginLogService.getList(queryFilter);
        Page page = queryFilter.getPage();
        return new Response(loginLogList,page);
    }
}
