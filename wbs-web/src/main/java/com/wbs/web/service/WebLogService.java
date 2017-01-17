package com.wbs.web.service;

import com.wbs.mybatis.ParamFilter;
import com.wbs.web.entity.WebLog;

import java.util.List;

public interface WebLogService {

     void add(WebLog webLog);

    void delete(String[] webLogIds);

    void update(WebLog webLog);

    List<WebLog> getList(ParamFilter paramFilter);
}
