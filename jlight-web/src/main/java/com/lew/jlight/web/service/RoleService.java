package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Role;

public interface RoleService {

    Response addRole(Role role);

    Response deleteRole(String roleIds);

    Response editRole(Role role);

    Response listRole(ParamFilter<String, String> param);

    Response detailRole(String roleId);

    Response getRoleMap();
}
