package com.lew.jlight.web.service;


import com.lew.jlight.web.entity.RoleMenu;

import java.util.List;

public interface RoleMenuService {

    List<RoleMenu> getList(String roleId);

    void update(String roleId, List<String> menuId);
}
