package com.lew.jlight.web.controller;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.RoleService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;



@Controller
@RequestMapping("role")
public class RoleController {

    private RoleService roleService;

    /**
     * 角色管理---角色列表
     */
    @ResponseBody
    public Object list(@RequestBody String json) {
        ParamFilter<String, String> filter = new ParamFilter<String, String>();

        Map<String, String> param = JsonUtil.parseStringMap(json);
        Object queryParam = param.get("param");
        Page page = JsonUtil.parseMapToObj(param.get("page"), Page.class);
        filter.setPage(page);
        if (queryParam != null) {
            filter.putAll(BeanUtil.toMap(queryParam));
        }

        Response response = roleService.listRole(filter);
        return response;
    }

    /**
     * 角色管理--角色添加
     */
    @ResponseBody
    public Object add(@RequestBody String json) {
        Role role = JsonUtil.parseObj(json, Role.class);
        Response response = roleService.addRole(role);
        return response;
    }

    /**
     * 角色管理--角色编辑
     */
    @ResponseBody
    public Object edit(@RequestBody String json) {
        Role role = JsonUtil.parseObj(json, Role.class);
        Response response = roleService.editRole(role);
        return response;
    }

    public Object delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String roleIds = BeanUtil.isEmpty(param) ? null : param.get("roleIds");

        Response response = roleService.deleteRole(roleIds);
        return response;
    }

    /**
     * 角色管理---角色详细
     */
    public Object detail(@RequestBody String roleId) {
        Response response = roleService.detailRole(roleId);
        return response;
    }

    /**
     * 角色名称映射
     */
    public Object getRoleMap() {
        Response response = roleService.getRoleMap();
        return response;
    }
}
