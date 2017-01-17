package com.wbs.web.service;

import com.wbs.mybatis.ParamFilter;
import com.wbs.web.entity.LoginLog;

import java.util.List;

public interface LoginLogService{

     void add(LoginLog loginLog);

    void delete(String[] loginLogIds);

    List<LoginLog> getList(ParamFilter paramFilter);
}
