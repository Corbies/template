package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;

import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.OperateLogDao;
import com.lew.jlight.web.entity.OperateLog;
import com.lew.jlight.web.service.OperateLogService;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class OperateLogServiceImpl implements OperateLogService {

    @Resource
    private OperateLogDao operateLogDao;

    @Override
    public void add(OperateLog operateLog) {
        Preconditions.checkNotNull(operateLog,"操作日志不能为空");
        operateLogDao.save(operateLog);
    }

    @Override
    public void delete(String[] operateLogIds) {
        Preconditions.checkArgument(operateLogIds!=null&& operateLogIds.length>0,"操作日志编号不能为空");
        for(String operateLogId : operateLogIds){
            operateLogDao.delete("delete",operateLogId);
        }
    }

    @Override
    public List<OperateLog> getList(ParamFilter paramFilter) {
        Page page = paramFilter.getPage();
        return operateLogDao.find("getList", paramFilter, page);
    }
}