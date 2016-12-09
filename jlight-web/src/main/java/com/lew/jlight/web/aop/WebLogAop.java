package com.lew.jlight.web.aop;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;

import com.lew.jlight.core.IdGenerator;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.web.aop.annotaion.WebLogger;
import com.lew.jlight.web.entity.WebLog;
import com.lew.jlight.web.service.WebLogService;
import com.lew.jlight.web.util.ServletUtil;
import com.lew.jlight.web.util.UserContextUtil;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestAttribute;

import java.lang.reflect.Method;
import java.util.Date;

import javax.annotation.Resource;


@Aspect
@Component
public class WebLogAop {

    private Logger logger = LoggerFactory.getLogger(WebLog.class);

    @Resource
    private WebLogService webLogService;

    @Pointcut(value = "execution(public * com.lew.jlight.web.controller.*.*(..))) ")
    private void webLog() {

    }

    @Around("webLog()")
    public Object doWebLog(ProceedingJoinPoint joinPoint) throws Throwable {
        Object returnVal;
        Object target = joinPoint.getTarget();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        Class[] parameterTypes = ((MethodSignature) joinPoint.getSignature()).getMethod().getParameterTypes();
        Method method;
        //通过反射获得拦截的method
        method = target.getClass().getMethod(methodName, parameterTypes);
        String id = null;
        try {
            if (method == null) {
                return joinPoint.proceed();
            }
            WebLogger annotation = method.getAnnotation(WebLogger.class);
            //如果方法上没有注解@Action，返回
            if (annotation == null) {
                return joinPoint.proceed();
            }
            ServletUtil.getRequest().getRequestURI();
            logger.info("request uri:",ServletUtil.getRequest().getRequestURI());
            logger.info("request param ;",JsonUtil.parseObject2Str(args));
            id = doWebLog(methodName,annotation.value(), JsonUtil.parseObject2Str(args), null);
            returnVal = joinPoint.proceed();
            updateWebLog(id,"成功","操作成功");
            logger.info("response data : ",JsonUtil.parseObject2Str(returnVal));
        } catch (Exception e) {
            updateWebLog(id,"失败",e.getMessage());
            throw new RuntimeException(e);
        }
        return returnVal;
    }

    private String  doWebLog(String method, String methodDesc,Object args, String remark) {
        String account = (String) UserContextUtil.getAttribute("account");
        String id = IdGenerator.getInstance().nextId();
        WebLog webLog = new WebLog();
        if (!Strings.isNullOrEmpty(remark)) {
            webLog.setRemark(remark);
        }
        if(!Strings.isNullOrEmpty(methodDesc)){
            webLog.setMethodDesc(methodDesc);
        }
        webLog.setLoginAccount(account);
        webLog.setMethodArgs(args.toString());
        webLog.setWebLogId(id);
        webLog.setMethod(method);
        webLog.setOperateTime(new Date());
        webLog.setOperateIp(ServletUtil.getIpAddr());

        webLogService.add(webLog);
        return id;
    }

    private void  updateWebLog(String id ,String status, String remark) {
        WebLog webLog = new WebLog();
        webLog.setWebLogId(id);
        webLog.setRemark(remark);
        webLog.setStatus(status);
        webLog.setOperateTime(new Date());
        webLogService.update(webLog);
    }

}
