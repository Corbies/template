package com.lew.jlight.web.controller;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(){
        return "roleList";
    }

    @ResponseBody
    @RequestMapping("list")
    public Response list(@RequestBody String json) {
        ParamFilter<String, String> filter = new ParamFilter<>();
        Map<String, String> param = JsonUtil.parseStringMap(json);
        assert param != null;
        Object queryParam = param.get("param");
        Page page = JsonUtil.parseMapToObj(param.get("page"), Page.class);
        filter.setPage(page);
        if (queryParam != null) {
            filter.putAll(BeanUtil.toMap(queryParam));
        }
        List<Role> roleList=  roleService.getList(filter);
        return new Response(roleList);
    }

    @ResponseBody
    @RequestMapping("add")
    public Object add(@RequestBody String json) {
        Role role = JsonUtil.parseObj(json, Role.class);
        roleService.add(role);
        return new Response();
    }

    @ResponseBody
    @RequestMapping("update")
    public Response update(@RequestBody String json) {
        Role role = JsonUtil.parseObj(json, Role.class);
        roleService.update(role);
        return new Response();
    }

    @ResponseBody
    @RequestMapping("delete")
    public Response delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String roleIds = BeanUtil.isEmpty(param) ? null : param.get("roleIds");
        roleService.delete(roleIds);
        return new Response();
    }


    @ResponseBody
    @RequestMapping("detail")
    public Response detail(@RequestBody String roleId) {
         roleService.getDetail(roleId);
        return new Response();
    }

    @ResponseBody
    @RequestMapping("getRoleMap")
    public Response getRoleMap() {
        return new Response();
    }
}
