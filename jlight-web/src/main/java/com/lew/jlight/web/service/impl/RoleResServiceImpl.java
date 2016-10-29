package com.lew.jlight.web.service.impl;

import com.google.common.base.Strings;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.web.dao.ResourcesDao;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.RoleResDao;
import com.lew.jlight.web.entity.ResourceTitle;
import com.lew.jlight.web.entity.Resources;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.RoleRes;
import com.lew.jlight.web.service.RoleResService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class RoleResServiceImpl implements RoleResService {

    private static final Comparator<Resources> resourceComparator = new Comparator<Resources>() {
        @Override
        public int compare(Resources o1, Resources o2) {
            int seq1 = o1.getSeq() != null ? o1.getSeq() : Integer.MAX_VALUE;
            int seq2 = o2.getSeq() != null ? o2.getSeq() : Integer.MAX_VALUE;
            return (seq1 < seq2 ? -1 : (seq1 == seq2 ? 0 : 1));
        }
    };
    @Autowired
    private ResourcesDao resourcesDao;
    @Autowired
    private RoleResDao roleResDao;
    @Autowired
    private RoleDao roleDao;

    @Override
    public Response listRoleRes(String roleId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }

        Map<String, Object> resultMap = new HashMap<>();
        List<ResourceTitle> titleList = new ArrayList<>();
        List<String> titleIds = resourcesDao.findColumn("getParentIds", String.class);
        for (String resId : titleIds) {
            Resources parentResource = resourcesDao.findUnique("getResourceByResId", resId);
            if (parentResource == null) {
                continue;
            }
            ResourceTitle title = new ResourceTitle();
            List<Resources> resources = resourcesDao.find("getResourcesByParentId", resId);
            if (resources != null && resources.size() > 0) {
                Collections.sort(resources, resourceComparator);
            }
            title.setResources(resources);
            title.setName(parentResource.getName());
            title.setSeq(parentResource.getSeq());
            title.setTitleId(parentResource.getResId());

            titleList.add(title);
        }

        List<String> resIds = roleResDao.findColumn("getResIdsByRoleId", String.class, roleId);
        resultMap.put("titleList", titleList);
        resultMap.put("resIds", resIds);

        response.setData(resultMap);
        return response;
    }

    @Override
    public Response editRoleRes(String roleId, List<String> resIds) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }


        Role model = roleDao.findUnique("getRoleByRoleId", roleId);

        if (model == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("角色对象不存在");
            return response;
        }

        if (BeanUtil.isEmpty(resIds)) {
            // 删除所有的角色-菜单数据
            roleResDao.update("deleteByRoleId", roleId);
        } else {
            // 先删除原来的角色-菜单,再批量插入
            roleResDao.update("deleteByRoleId", roleId);
            Set<String> resIdsSet = new HashSet<>();
            resIdsSet.addAll(resIds);
            for (String resId : resIdsSet) {
                Resources resModel = resourcesDao.findUnique("getResourceByResId", resId);
                if (resModel == null) {
                    response.setCode(Response.NOT_FOUND);
                    response.setMsg("资源编号:" + resId + "不存在");
                    return response;
                }
                RoleRes roleRes = new RoleRes();
                roleRes.setResId(resId);
                roleRes.setRoleId(roleId);
                roleRes.setIsDelete(BigInteger.ZERO.intValue());
                roleRes.setUpdateTime(new Date());
                roleRes.setCreateTime(new Date());
                roleResDao.save("addRoleRes", roleRes);
            }
        }
        return response;
    }
}
