package com.wbs.web.service;


import com.wbs.mybatis.ParamFilter;
import com.wbs.web.entity.Role;

import java.util.List;

public interface RoleService{

    void add(Role role);

    void delete(List<String> roleIds);

    void update(Role role);

    List<Role> getList(ParamFilter param);

    Role getByRoleId(String roleId);

    List getRoleMap();
}
