package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;

import java.util.List;

public interface RoleResService {

    Response listRoleRes(String roleId);

    Response editRoleRes(String roleId, List<String> resIds);
}
