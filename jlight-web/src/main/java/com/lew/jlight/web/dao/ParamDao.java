package com.lew.jlight.web.dao;


import com.lew.jlight.mybatis.dao.BaseDao;
import com.lew.jlight.web.entity.Param;

import org.springframework.stereotype.Repository;

@Repository
public class ParamDao extends BaseDao<Param> {
    @Override
    public Class<Param> getEntityClass() {
        return Param.class;
    }
}
