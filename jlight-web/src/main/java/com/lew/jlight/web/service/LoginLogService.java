package com.lew.jlight.web.service;

import com.lew.jlight.mybatis.BaseService;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.LoginLog;

import java.util.List;

public interface LoginLogService extends BaseService{

     void add(LoginLog loginLog);

    void delete(String[] loginLogIds);

    List<LoginLog> getList(ParamFilter paramFilter);
}
