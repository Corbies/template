package com.lew.jlight.web.service.impl;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.ResourcesDao;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.RoleResDao;
import com.lew.jlight.web.entity.ResourceTitle;
import com.lew.jlight.web.entity.Resources;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.ResourcesService;
import com.lew.jlight.web.util.ResourceTreeUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Component
public class ResourcesServiceImpl implements ResourcesService {

    private static final String key = com.lew.jlight.web.service.ResourcesService.class.getName();
    private static final Comparator<Resources> resourceComparator = new Comparator<Resources>() {
        @Override
        public int compare(Resources o1, Resources o2) {
            int seq1 = o1.getSeq() != null ? o1.getSeq() : Integer.MAX_VALUE;
            int seq2 = o2.getSeq() != null ? o2.getSeq() : Integer.MAX_VALUE;
            return (seq1 < seq2 ? -1 : (seq1 == seq2 ? 0 : 1));
        }
    };
    private static final Comparator<ResourceTitle> titleComparator = (o1, o2) -> {
        int seq1 = o1.getSeq() != null ? o1.getSeq() : Integer.MAX_VALUE;
        int seq2 = o2.getSeq() != null ? o2.getSeq() : Integer.MAX_VALUE;
        return (seq1 < seq2 ? -1 : (seq1 == seq2 ? 0 : 1));
    };
    @Autowired
    private ResourcesDao resourcesDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private RoleResDao roleResDao;

    @Override
    public Response addResources(Resources resource) {
        Response response = new Response();
        if (resource == null) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("资源信息不能为空");
            return response;
        }

        if (Strings.isNullOrEmpty(resource.getParentId())) {
            resource.setParentId(String.valueOf(BigInteger.ZERO.intValue()));
        } else {
            Resources parentRes = resourcesDao.findUnique("getResourceByResId", resource.getParentId());
            resource.setParentName(parentRes != null ? parentRes.getName() : null);
        }

        Date createTime = new Date();
        resource.setCreateTime(createTime);
        resource.setUpdateTime(createTime);
        resource.setIsDelete(BigInteger.ZERO.intValue());
        resource.setResId("14");

        resourcesDao.save("addResource", resource);
        return response;
    }

    @Override
    public Response deleteResources(String resIds) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(resIds)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("资源编号不能为空");
            return response;
        }

        String[] idArray = resIds.split(",");
        for (String resId : idArray) {
            Resources resource = resourcesDao.findUnique("getResourceByResId", resId);
            if (resource == null) {
                response.setCode(Response.NOT_FOUND);
                response.setMsg("资源对象不存在");
                return response;
            }
        }

        for (String resId : idArray) {
            resourcesDao.delete("deleteByResId", resId);
        }
        return response;
    }

    @Override
    public Response editResources(Resources resources) {
        Response response = new Response();
        if (resources == null) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("资源信息不能为空");
            return response;
        }

        Resources model = resourcesDao.findUnique("getResourceByResId", resources.getResId());
        if (model == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("资源对象不存在");
            return response;
        }
        Map<String, Object> paramMap = Maps.newHashMap();
        paramMap.put("resId", resources.getResId());
        paramMap.put("name", resources.getName());
        paramMap.put("url", resources.getUrl());
        paramMap.put("isShow", resources.getIsShow());
        paramMap.put("remark", resources.getRemark());
        paramMap.put("parentId", resources.getParentId());
        paramMap.put("type", resources.getType());
        resourcesDao.update("updateResource", paramMap);

        return response;
    }

    @Override
    public Response listResources(ParamFilter<String, String> param) {
        Response response = new Response();
        Page page = param.getPage();
        List<Resources> list = resourcesDao.find("getResourceList", param, page);

        if (page != null) {
            Integer resultCount = resourcesDao.findOneColumn("getCount", Integer.class, param);
            page.setResultCount(resultCount);
        }

        response.setPage(page);
        response.setData(list);
        return response;
    }

    @Override
    public Response listLeftResources(String roleId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }

        Role model = roleDao.findUnique("getRoleByRoleId", roleId);
        if (model == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("角色信息不能为空");
            return response;
        }

        List<ResourceTitle> list = loadResources(roleId);
        response.setData(list);
        return response;
    }

    private List<ResourceTitle> loadResources(String roleId) {
        Map<String, List<ResourceTitle>> roleResMap = null;
//		roleResMap = cacheManager.get( key, Map.class, cacheCallback );
        assert roleResMap != null;
        List<ResourceTitle> list = roleResMap.get(roleId);
        if (list != null) {
            return list;
        }

        List<String> reIds = roleResDao.findColumn("getResIdsByRoleId", String.class, roleId);
        Map<String, List<Resources>> map = new HashMap<>();
        list = new ArrayList<>(8);
        for (String resId : reIds) {
            Resources resource = resourcesDao.findUnique("getResourceByResId", resId);
            if (resource == null || BigInteger.ONE.intValue() == resource.getType()) {
                continue;
            }

            String titleId = resource.getParentId();
            List<Resources> resourceList = map.get(titleId);
            if (resourceList == null) {
                resourceList = new ArrayList<>(8);

                ResourceTitle title = new ResourceTitle();
                Resources parentResource = resourcesDao.findUnique("getResourceByResId", titleId);

                if (parentResource == null) {
                    boolean isEmpty = BeanUtil.isEmpty(map.get(resource.getResId()));
                    title.setName(resource.getName());
                    title.setSeq(resource.getSeq());
                    title.setResources(resourceList);
                    title.setTitleId(resource.getResId());
                    if (isEmpty) {
                        list.add(title);
                        map.put(title.getTitleId(), resourceList);
                    }
                    continue;
                }

                title.setResources(resourceList);
                title.setName(parentResource.getName());
                title.setSeq(parentResource.getSeq());
                list.add(title);

                map.put(titleId, resourceList);
            }
            resourceList.add(resource);
        }

        for (List<Resources> resources : map.values()) {
            Collections.sort(resources, resourceComparator);
        }
        Collections.sort(list, titleComparator);

        if (roleResMap != null) {
            roleResMap.put(roleId, list);
        }

        return list;
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
        resList = resourcesDao.findMap("getResourcesTree", paramMap);
        response.setData(ResourceTreeUtil.generateJSTree(resList));
        return response;
    }

    @Override
    public Response getSelectResTree() {
        Response response = new Response();
        List<Map<String, Object>> parentList = resourcesDao.findMap("getResourceIdAndName", BigInteger.ZERO.toString());
        List<Map<String, Object>> resList = new LinkedList<Map<String, Object>>();
        for (Map<String, Object> res : parentList) {
            List<Resources> subRes = resourcesDao.find("getResourcesByParentId", res.get("resId"));
            Map<String, Object> subMap = null;
            resList.add(res);
            for (Resources resource : subRes) {
                subMap = Maps.newHashMap();
                String subName = resource.getName();
                subName = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + subName;
                subMap.put("resId", resource.getResId());
                subMap.put("name", subName);
                resList.add(subMap);
            }
        }
        response.setData(resList);
        return response;
    }

    @Override
    public Response detailResource(String resId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(resId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("资源编号不能为空");
            return response;
        }
        Resources resource = resourcesDao.findUnique("getResourceByResId", resId);
        response.setData(resource);
        return response;
    }

    @Override
    public Response getResourcesByRoleId(String roleId) {
        Response response = new Response();
        List<String> resIds = roleResDao.findColumn("getResIdsByRoleId", String.class, roleId);
        List<String> list = new ArrayList<>();
        for (String resId : resIds) {
            Resources res = resourcesDao.findUnique("getResourceByResId", resId);
            list.add(res.getUrl());
        }
        response.setData(list);
        return response;
    }

    @Override
    public Response getResourcesByAccount(String account) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(account)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户编号不能为空");
            return response;
        }
        List<Resources> list = resourcesDao.find("getResourcesByAccount", account);
        response.setData(list);
        return response;
    }

}
