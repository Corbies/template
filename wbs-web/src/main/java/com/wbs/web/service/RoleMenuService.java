package com.wbs.web.service;


import com.wbs.web.entity.RoleMenu;

import java.util.List;

public interface RoleMenuService {

    List<RoleMenu> getList(String roleId);

    void update(String roleId, String[] menuIds);

	List<String> getMenuByRole(String roleId);
}
