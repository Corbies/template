package com.lew.jlight.web.service;


import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Role;

import java.util.List;
import java.util.Map;

public interface RoleService {

    void add(Role role);

    void delete(String roleIds);

    void update(Role role);

    List<Role> getList(ParamFilter<String, String> param);

    Role getDetail(String roleId);

    Map getRoleMap(String userId);
}
