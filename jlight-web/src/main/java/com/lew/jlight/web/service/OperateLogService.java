package com.lew.jlight.web.service;

import com.lew.jlight.mybatis.BaseService;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.OperateLog;

import java.util.List;

public interface OperateLogService extends BaseService {

     void add(OperateLog operateLog);

    void delete(String[] operateLogIds);

    List<OperateLog> getList(ParamFilter paramFilter);
}
