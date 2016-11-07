package com.lew.jlight.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.RoleService;
import com.lew.jlight.web.service.UserRoleService;


@Controller
@RequestMapping("role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @Resource
    private UserRoleService userRoleService;

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
    @RequestMapping("save")
    public Object save(@RequestBody String json){
    	Response response = new Response();
    	String msg = "";
    	try{
		  Role role = JsonUtil.parseObj(json, Role.class);
	      if(Strings.isNullOrEmpty(role.getRoleId())){
	    	  roleService.add(role);
	    	  msg = "添加成功";
	      }else{
	    	  roleService.update(role);
	    	  msg = "添加成功";
	      }
    	}catch (Exception e) {
    		response.setCode(Response.ERROR);
    		msg = "操作失败";
		}  
    	response.setMsg(msg);
	    return response;
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
    public Response detail(String roleId) {
        Role role = roleService.getByRoleId(roleId);
        return new Response(role);
    }

    @ResponseBody
    @RequestMapping("getRoleMap")
    public Response getRoleMap(@RequestBody String userId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(userId),"用户编号不能为空");
        Response response = new Response();
        List list = roleService.getRoleMap();
        Map resultMap = Maps.newHashMap();
        List< String > roleIds = userRoleService.getRoleIdsByUserId(userId);
        resultMap.put("roleIds",roleIds);
        resultMap.put("roleList",list);
        response.setData(resultMap);
        return response;
    }
}
