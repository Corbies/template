package com.lew.jlight.web.controller;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.RoleService;
import com.lew.jlight.web.service.UserRoleService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


@Controller
@RequestMapping("role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @Resource
    private UserRoleService userRoleService;

    @GetMapping("listPage")
    public String list() {
        return "roleList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody ParamFilter queryFilter) {
        List<Role> roleList = roleService.getList(queryFilter);
        int count = roleService.getCount(queryFilter);
        Page page = queryFilter.getPage();
        page.setResultCount(count);
        return new Response(roleList, page);
    }

    @ResponseBody
    @PostMapping("save")
    public Object save(@RequestBody Role role) {
        Preconditions.checkNotNull(role, "角色信息不能为空");
        Response response = new Response();
        if (Strings.isNullOrEmpty(role.getRoleId())) {
            roleService.add(role);
        } else {
            roleService.update(role);
        }
        response.setMsg("添加成功");
        return response;
    }

    @ResponseBody
    @PostMapping("add")
    public Object add(@RequestBody Role role) {
        Preconditions.checkNotNull(role, "角色信息不能为空");
        roleService.add(role);
        return new Response("添加成功");
    }

    @ResponseBody
    @RequestMapping("update")
    public Response update(@RequestBody Role role) {
        Preconditions.checkNotNull(role, "角色信息不能为空");
        roleService.update(role);
        return new Response();
    }

    @ResponseBody
    @PostMapping("delete")
    public Response delete(@RequestBody List<String> roleIds) {
        Preconditions.checkArgument((roleIds != null && roleIds.size() > 0), "不能为空");
        roleService.delete(roleIds);
        return new Response();
    }


    @ResponseBody
    @PostMapping("detail")
    public Response detail(@RequestBody  String roleId) {
        Role role = roleService.getByRoleId(roleId);
        return new Response(role);
    }

    @ResponseBody
    @PostMapping("getRoleMap")
    public Response getRoleMap(@RequestBody String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId), "用户编号不能为空");
        Response response = new Response();
        List list = roleService.getRoleMap();
        Map<String, Object> resultMap = Maps.newHashMap();
        List<String> roleIds = userRoleService.getRoleIdsByUserId(userId);
        resultMap.put("roleIds", roleIds);
        resultMap.put("roleList", list);
        response.setData(resultMap);
        return response;
    }
}
