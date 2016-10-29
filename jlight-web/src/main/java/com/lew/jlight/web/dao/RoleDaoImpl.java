package com.lew.jlight.web.dao;


import com.lew.jlight.mybatis.dao.BaseDao;
import com.lew.jlight.web.entity.Role;

import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl extends BaseDao<Role> {

	@Override
	public Class< Role > getEntityClass( ) {
		return Role.class;
	}

}
