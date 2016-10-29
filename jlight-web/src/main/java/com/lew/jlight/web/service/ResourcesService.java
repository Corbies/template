package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Resources;

public interface ResourcesService {

	Response addResources(Resources resource);
	
	Response deleteResources(String resIds);
	
	Response editResources(Resources resources);
	
	Response listResources(ParamFilter<String, String> param);
	
	Response listLeftResources(String roleId);
	
	Response getResTree(String roleId);
	
	Response getSelectResTree();

	Response detailResource(String resId);
	
	Response getResourcesByRoleId(String roleId);
	
	Response getResourcesByAccount(String account);
}
