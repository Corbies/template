package com.lew.jlight.web.controller;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.aop.annotaion.WebLogger;
import com.lew.jlight.web.entity.WebLog;
import com.lew.jlight.web.service.WebLogService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.annotation.Resource;


@Controller
@RequestMapping("webLog")
public class WebLogController {

    @Resource
    private WebLogService webLogService;

    @GetMapping("list")
    public String list(){
        return "webLogList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody ParamFilter queryFilter){
        List<WebLog> webLogList = webLogService.getList(queryFilter);
        int count = webLogService.getCount(queryFilter);
        Page page = queryFilter.getPage();
        page.setResultCount(count);
        return new Response(webLogList,page);
    }
}
