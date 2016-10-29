package com.lew.jlight.web.dao;


import com.lew.jlight.mybatis.dao.BaseDao;
import com.lew.jlight.web.entity.Resources;

import org.springframework.stereotype.Repository;

@Repository
public class ResourcesDao extends BaseDao<Resources> {

	@Override
	public Class< Resources > getEntityClass( ) {
		return Resources.class;
	}

}
