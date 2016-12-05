package com.lew.jlight.web.service;

import com.lew.jlight.mybatis.BaseService;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.WebLog;

import java.util.List;

public interface WebLogService extends BaseService {

     void add(WebLog webLog);

    void delete(String[] webLogIds);

    void update(WebLog webLog);

    List<WebLog> getList(ParamFilter paramFilter);
}
