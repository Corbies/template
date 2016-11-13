package com.lew.jlight.web.dao;

import com.lew.jlight.mybatis.dao.BaseDao;
import com.lew.jlight.web.entity.OperateLog;

import org.springframework.stereotype.Repository;

@Repository
public class OperateLogDao extends BaseDao<OperateLog> {
    @Override
    protected Class<OperateLog> getEntityClass() {
        return OperateLog.class;
    }
}
