package com.lew.jlight.web.controller;

import com.lew.jlight.core.Response;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.LoginLog;
import com.lew.jlight.web.entity.OperateLog;
import com.lew.jlight.web.service.LoginLogService;
import com.lew.jlight.web.service.OperateLogService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.annotation.Resource;


@Controller
@RequestMapping("operateLog")
public class OperateLogController {

    @Resource
    private OperateLogService operateLogService;

    @GetMapping("list")
    public String list(){
        return "operateLogList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody ParamFilter filter){
        List<OperateLog> operateLogList = operateLogService.getList(filter);
        return new Response(operateLogList);
    }
}
