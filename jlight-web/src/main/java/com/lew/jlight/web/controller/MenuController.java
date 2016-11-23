package com.lew.jlight.web.controller;

import com.alibaba.druid.util.StringUtils;
import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Menu;
import com.lew.jlight.web.service.MenuService;

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
@RequestMapping("menu")
public class MenuController {

    @Resource
    private MenuService menuService;

    @GetMapping("listPage")
    public String list() {
        return "menuList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody String json) {
        ParamFilter<String, String> filter = new ParamFilter<>();
        Map<String, String> param = JsonUtil.parseStringMap(json);
        Page page = JsonUtil.parseMapToObj(param.get("page"), Page.class);
        Object queryParam = param.get("param");
        filter.setPage(page);
        if (queryParam != null) {
            filter.putAll(BeanUtil.toMap(queryParam));
        }
        List<Menu> menuList = menuService.getList(filter);
        return new Response(menuList);
    }
    
    @ResponseBody
    @PostMapping("add")
    public Response add(@RequestBody String json) {
        Menu menu = JsonUtil.parseObj(json, Menu.class);
        Response response = new Response();
        try{
    	  if( StringUtils.isEmpty(menu.getMenuId())){
			menuService.add(menu);
          	response.setMsg("添加成功");
          }else{
        	menuService.update(menu);
            response.setMsg("更新成功");
          }
        }catch(Exception e){
        	response.setCode(1);
        	response.setMsg("操作失败");
        }
        return response;
    }

    @ResponseBody
    @PostMapping("edit")
    public  Response edit(@RequestBody String json) {
        Menu menu = JsonUtil.parseObj(json, Menu.class);
        menuService.update(menu);
        return new Response("修改成功");
    }

    @ResponseBody
    @PostMapping("detail")
    public Response detail(String menuId) {
        Menu menu = menuService.detail(menuId);
        return new Response(menu);
    }


    @ResponseBody
    @GetMapping("getByParentId")
    public Response getByParentId(String parentId) {
        List<Menu> menuList = menuService.getByParentId(parentId);
        return new Response(menuList);
    }

    @ResponseBody
    @PostMapping("delete")
    public Response delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String resIds = BeanUtil.isEmpty(param) ? null : param.get("menuIds");
        menuService.delete(resIds);
        return new Response("删除成功");
    }


    @ResponseBody
    @PostMapping("listTree")
    public Object listTree(String roleId) {
        Response response = menuService.getResTree(roleId);
        return response.getData();
    }

    @ResponseBody
    @PostMapping("get")
    public Response getSelectResTree() {
        menuService.getSelectResTree();
        return null;
    }

    @ResponseBody
    @GetMapping("getTree")
    public  Object getTree() {
        Response response = menuService.getTree();
        return response.getData();
    }

}
