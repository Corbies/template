package com.lew.jlight.web.controller;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.web.service.RoleResService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("roleRes")
public class RoleResController {

    private RoleResService roleResService;

    /**
     * 角色管理---角色权限列表
     */
    @ResponseBody
    public Object list(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String roleId = param.get("roleId");
        Response response = roleResService.listRoleRes(roleId);
        return response;
    }

    /**
     * 角色管理---权限
     */
    @SuppressWarnings("unchecked")
    public Object save(@RequestBody String json) {
        Map<String, String> paramMap = JsonUtil.parseStringMap(json);
        Object resIdsArray = paramMap.get("resIds");
        String roleId = paramMap.get("roleId");
        List<String> resIds = !BeanUtil.isEmpty(resIdsArray) ? (List<String>) resIdsArray : null;

        Response response = roleResService.editRoleRes(roleId, resIds);
        return response;
    }
}
