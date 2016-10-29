package com.lew.jlight.web.dao;


import com.lew.jlight.mybatis.dao.BaseDao;
import com.lew.jlight.web.entity.RoleRes;

import org.springframework.stereotype.Repository;

@Repository
public class RoleResDao extends BaseDao<RoleRes> {

	@Override
	public Class< RoleRes > getEntityClass( ) {
		return RoleRes.class;
	}

}
