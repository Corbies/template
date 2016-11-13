package com.lew.jlight.web.aop;

import com.lew.jlight.core.IdGenerator;
import com.lew.jlight.web.entity.OperateLog;
import com.lew.jlight.web.service.OperateLogService;
import com.lew.jlight.web.util.ServletUtil;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Date;

import javax.annotation.Resource;

@Aspect
public class OperateAop {
    private Logger logger = LoggerFactory.getLogger(LoginAop.class);

    @Resource
    private OperateLogService operateLogService;

    @Pointcut(value = "execution(public * com.lew.jlight.web.controller.*.*(..))) && !execution(public * com.lew" +
            ".jlight.web.controller.*.*(..)))")
    private void operateLog() {

    }

    @Before("operateLog()")
    public void doBefore(JoinPoint joinPoint) {
        String requestMehtod = joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName();
        String account = (String) ServletUtil.getRequest().getAttribute("account");
        this.writeOperateLog(requestMehtod, Arrays.toString(joinPoint.getArgs()),account);
        logger.debug("success to save operate log with account="+account);
    }

    private void writeOperateLog(String method, String args,String account) {
        String id = IdGenerator.getInstance().nextId();
        OperateLog operateLog = new OperateLog();
        operateLog.setLoginAccount(account);
        operateLog.setMethodArgs(args);
        operateLog.setOperateLogId(id);
        operateLog.setMethod(method);
        operateLog.setOperateTime(new Date());
        operateLog.setOperateIp(ServletUtil.getIpAddr());
        operateLogService.add(operateLog);
    }

    private void updateExceptionLog() {

    }
}
