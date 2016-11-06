package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Menu;
import com.lew.jlight.web.entity.MenuTitle;

import java.util.List;

public interface MenuService {

	void add(Menu menu);

	void delete(String menuIds);

	void update(Menu menu);

	List<MenuTitle> getListByRoleId(String roleId);
	
	List<Menu> getList(ParamFilter<String, String> param);
	
	Response getResTree(String roleId);
	
	Response getSelectResTree();

	Menu detail(String menuId);

	Response getTree();

}
