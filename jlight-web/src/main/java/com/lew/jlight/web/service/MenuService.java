package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Menu;

import java.util.List;

public interface MenuService {

	void add(Menu menu);

	void delete(String menuIds);

	void update(Menu menu);
	
	List<Menu> getList(ParamFilter<String, String> param);
	
	Response getResTree(String roleId);
	
	Response getSelectResTree();

	Menu detail(String menuId);

}
