package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.MenuDao;
import com.lew.jlight.web.entity.Menu;
import com.lew.jlight.web.service.MenuService;
import com.lew.jlight.web.util.ResourceTreeUtil;

import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Component
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuDao menuDao;

    @Override
    public void add(Menu menu) {
        Preconditions.checkNotNull(menu,"资源信息不能为空");
        if (Strings.isNullOrEmpty(menu.getParentId())) {
            menu.setParentId(String.valueOf(BigInteger.ZERO.intValue()));
        } else {
            Menu parentRes = menuDao.findUnique("getResourceByResId", menu.getParentId());
            menu.setParentName(parentRes != null ? parentRes.getName() : null);
        }
        Date createTime = new Date();
        menu.setCreateTime(createTime);
        menu.setUpdateTime(createTime);
        menu.setIsDelete(BigInteger.ZERO.intValue());
        menu.setMenuId("14");
        menuDao.save("addMenu", menu);
    }

    @Override
    public void delete(String menuIds) {
        Preconditions.checkArgument(Strings.isNullOrEmpty(menuIds),"菜单编号不能为空");

        String[] idArray = menuIds.split(",");
        for (String resId : idArray) {
            Menu menu = menuDao.findUnique("getResourceByResId", resId);
            Preconditions.checkNotNull(menu,"菜单不存在");
        }
        for (String menuId : idArray) {
            menuDao.delete("deleteByResId", menuId);
        }
    }

    @Override
    public void update(Menu menu) {
        Preconditions.checkNotNull(menu,"菜单不能为空");
        Menu model = menuDao.findUnique("getResourceByResId", menu.getMenuId());
        Preconditions.checkNotNull(model,"菜单不存在");

        Map<String, Object> paramMap = Maps.newHashMap();
        paramMap.put("resId", menu.getMenuId());
        paramMap.put("name", menu.getName());
        paramMap.put("url", menu.getUrl());
        paramMap.put("isShow", menu.getIsShow());
        paramMap.put("remark", menu.getRemark());
        paramMap.put("parentId", menu.getParentId());
        paramMap.put("type", menu.getType());
        menuDao.update("updateResource", paramMap);
    }

    @Override
    public List<Menu> getList(ParamFilter<String, String> param) {
        Page page = param.getPage();
        return menuDao.find("getResourceList", param, page);
    }

    @Override
    public Response getResTree(String roleId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }
        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("roleId", roleId);
        List<Map<String, Object>> resList;
        resList = menuDao.findMap("getResourcesTree", paramMap);
        response.setData(ResourceTreeUtil.generateJSTree(resList));
        return response;
    }

    @Override
    public Response getSelectResTree() {
        Response response = new Response();
        List<Map<String, Object>> parentList = menuDao.findMap("getResourceIdAndName", BigInteger.ZERO.toString());
        List<Map<String, Object>> resList = new LinkedList<>();
        for (Map<String, Object> res : parentList) {
            List<Menu> subRes = menuDao.find("getResourcesByParentId", res.get("resId"));
            Map<String, Object> subMap;
            resList.add(res);
            for (Menu menu : subRes) {
                subMap = Maps.newHashMap();
                String subName = menu.getName();
                subName = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + subName;
                subMap.put("resId", menu.getMenuId());
                subMap.put("name", subName);
                resList.add(subMap);
            }
        }
        response.setData(resList);
        return response;
    }

    @Override
    public Menu detail(String resId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(resId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("资源编号不能为空");
        }
        return menuDao.findUnique("getResourceByResId", resId);
    }
}
