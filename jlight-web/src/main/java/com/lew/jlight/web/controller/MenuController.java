package com.lew.jlight.web.controller;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Menu;
import com.lew.jlight.web.service.MenuService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Controller
@RequestMapping("resources")
public class MenuController {

    @Resource
    private MenuService menuService;

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


    @ResponseBody
    @RequestMapping("add")
    public Response add(@RequestBody String json) {
        Menu menu = JsonUtil.parseObj(json, Menu.class);
       menuService.add(menu);
        return new Response("添加成功");
    }

    @ResponseBody
    @RequestMapping("edit")
    public Response edit(@RequestBody String json) {
        Menu menu = JsonUtil.parseObj(json, Menu.class);
        menuService.update(menu);
        return new Response("修改成功");
    }

    @ResponseBody
    @RequestMapping("detail")
    public Response detail(@RequestBody String resId) {
        Menu menu = menuService.detail(resId);
        return new Response(menu);
    }

    @ResponseBody
    @RequestMapping("delete")
    public Response delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String resIds = BeanUtil.isEmpty(param) ? null : param.get("resIds");
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

}
