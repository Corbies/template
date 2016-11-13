package com.lew.jlight.web.entity;

import com.lew.jlight.core.BaseEntity;

import java.util.Date;

public class OperateLog extends BaseEntity{
    private String operateLogId;

    private String loginAccount;

    private String method;

    private String methodArgs;

    private Date operateTime;

    private String operateIp;

    private String status;

    public String getOperateLogId() {
        return operateLogId;
    }

    public void setOperateLogId(String operateLogId) {
        this.operateLogId = operateLogId;
    }

    public String getLoginAccount() {
        return loginAccount;
    }

    public void setLoginAccount(String loginAccount) {
        this.loginAccount = loginAccount;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getOperateIp() {
        return operateIp;
    }

    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMethodArgs() {
        return methodArgs;
    }

    public void setMethodArgs(String methodArgs) {
        this.methodArgs = methodArgs;
    }
}
