package com.lew.jlight.web.aop;

import com.lew.jlight.web.entity.OperateLog;
import com.lew.jlight.web.service.LoginLogService;
import com.lew.jlight.web.service.OperateLogService;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

@Aspect
public class OperateAop {

    private Logger logger = LoggerFactory.getLogger(LoginAop.class);

    @Resource
    private OperateLogService operateLogService;

    @Pointcut(value="execution(* com.lew.jlight.web.controller.LoginController.doLogin(..))))")
    private void operateLog() {
    }
}
