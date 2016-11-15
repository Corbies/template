package com.lew.jlight.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Menu;
import com.lew.jlight.web.service.MenuService;

@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("listPage")
    public String list() {
        return "menuList";
    }

    @ResponseBody
    @RequestMapping("list")
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
    
    /**
     * 添加和更新
     * @param json
     * @return
     */
    @ResponseBody
    @RequestMapping("add")
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
    
    @PostMapping("edit")
    public @ResponseBody Response edit(@RequestBody String json) {
        Menu menu = JsonUtil.parseObj(json, Menu.class);
        menuService.update(menu);
        return new Response("修改成功");
    }

    @GetMapping("detail")
    @ResponseBody
    public Response detail(String menuId) {
        Menu menu = menuService.detail(menuId);
        return new Response(menu);
    }

    @ResponseBody
    @RequestMapping("delete")
    public Response delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String resIds = BeanUtil.isEmpty(param) ? null : param.get("menuIds");
        menuService.delete(resIds);
        return new Response("删除成功");
    }


    @ResponseBody
    @RequestMapping("listTree")
    public Object listTree(String roleId) {
        Response response = menuService.getResTree(roleId);
        return response.getData();
    }

    @ResponseBody
    @RequestMapping("get")
    public Response getSelectResTree() {
        menuService.getSelectResTree();
        return null;
    }
    
    /**
     * 获取菜单资源
     * @return
     */
    @RequestMapping("getTree")
    public @ResponseBody Object getTree() {
        Response response = menuService.getTree();
        return response.getData();
    }

}
