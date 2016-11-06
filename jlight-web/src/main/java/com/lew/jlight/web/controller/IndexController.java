package com.lew.jlight.web.controller;

import com.lew.jlight.web.entity.MenuTitle;
import com.lew.jlight.web.service.MenuService;
import com.lew.jlight.web.util.UserContextUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import javax.annotation.Resource;

@Controller
public class IndexController {

    @Autowired
    private MenuService menuService;

    @GetMapping(value ={"/","/index"} )
    public String index(ModelMap modelMap){
        String roleId = (String) UserContextUtil.getAttribute("roleId");
        //获取左边菜单栏
        List<MenuTitle> menuTitleList = menuService.getListByRoleId(roleId);
        modelMap.put("menuList",menuTitleList);
        modelMap.put("roleMap",UserContextUtil.getAttribute("roleMap"));
        return "index";
    }
}
