package com.wbs.web.service;


import com.wbs.core.Response;
import com.wbs.mybatis.ParamFilter;
import com.wbs.web.entity.Menu;
import com.wbs.web.entity.pojo.MenuTitle;

import java.util.List;

public interface MenuService {

	void add(Menu menu);

	void delete(List<String> menuIds);

	void update(Menu menu);

	List<MenuTitle> getListByRoleId(String roleId);
	
	List<Menu> getList(ParamFilter param);

	List<Menu> getByParentId(String menuId);
	
	Response getResTree(String roleId);
	
	Response getSelectResTree();

	Menu detail(String menuId);

	Response getTree();

}
