package com.lew.jlight.web.controller;

import com.google.common.base.Strings;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Resources;
import com.lew.jlight.web.service.ResourcesService;
import com.lew.jlight.web.util.UserContextUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("resources")
public class ResourcesController {

    private ResourcesService resourcesService;

    /**
     * 菜单管理---获取菜单列表
     */
    @SuppressWarnings("unchecked")
    public Object list(@RequestBody String json) {
        ParamFilter<String, String> filter = new ParamFilter<String, String>();
        Map<String, String> param = JsonUtil.parseStringMap(json);
        Page page = JsonUtil.parseMapToObj(param.get("page"), Page.class);
        Object queryParam = param.get("param");
        filter.setPage(page);
        if (queryParam != null) {
            filter.putAll(BeanUtil.toMap(queryParam));
        }
        Response response = resourcesService.listResources(filter);
        return response;
    }

    /**
     * 菜单管理---添加菜单
     */
    public Object add(@RequestBody String json) {
        Resources resources = JsonUtil.parseObj(json, Resources.class);
        Response response = resourcesService.addResources(resources);
        return response;
    }

    /**
     * 菜单管理---编辑菜单
     */
    public Object edit(@RequestBody String json) {
        Resources resources = JsonUtil.parseObj(json, Resources.class);
        Response response = resourcesService.editResources(resources);
        return response;
    }

    /**
     * 菜单管理---菜单详细
     */
    public Object detail(@RequestBody String resId) {
        Response response = resourcesService.detailResource(resId);
        return response;
    }

    /**
     * 菜单管理-删除菜单
     */
    public Object delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String resIds = BeanUtil.isEmpty(param) ? null : param.get("resIds");
        Response response = resourcesService.deleteResources(resIds);
        return response;
    }

    /**
     * 主页侧边栏菜单
     */
    public Object left() {
        Response response = resourcesService.listLeftResources("");
        return response;
    }

    /**
     * 角色--权限 菜单树
     */
    @ResponseBody
    public Object listTree(String roleId) {
        String roleIdToUse = roleId;
        if (Strings.isNullOrEmpty(roleId)) {
        }
        Response response = resourcesService.getResTree(roleIdToUse);
        return response.getData();
    }

    /**
     * 菜单下拉选择
     */
    public Object getSelectResTree() {
        Response response = resourcesService.getSelectResTree();
        return response;
    }

}
