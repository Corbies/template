package com.lew.jlight.web.service.impl;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.RoleResDao;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    private RoleResDao roleResDao;

    @Override
    public Response addRole(Role role) {
        Response response = new Response();
        if (role == null) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色信息不能为空");
            return response;
        }

        String sign = role.getSign();
        Role model = roleDao.findUnique("getRoleBySign", sign);
        if (model != null) {
            response.setCode(Response.EXSIED);
            response.setMsg("角色对象已存在");
            return response;
        }

        Date date = new Date();
        role.setCreateTime(date);
        role.setUpdateTime(date);
        role.setIsDelete(BigInteger.ZERO.intValue());
        role.setRoleId("2");
        roleDao.save("addRole", role);

        return response;
    }

    @Override
    public Response deleteRole(String roleIds) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleIds)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }

        String[] idArray = roleIds.split(",");
        for (String roleId : idArray) {
            Role model = roleDao.findUnique("getRoleByRoleId", roleId);
            if (model == null) {
                response.setCode(Response.NOT_FOUND);
                response.setMsg("角色对象不存在");
                return response;
            }
        }

        for (String roleId : idArray) {
            roleDao.update("deleteByRoleId", roleId);
            roleResDao.update("deleteByRoleId", roleId);
        }

        return response;
    }

    @Override
    public Response editRole(Role role) {
        Response response = new Response();
        if (role == null) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色信息不能为空");
            return response;
        }
        Role model = roleDao.findUnique("getRoleByRoleId", role.getRoleId());
        if (model == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("角色对象不存在");
            return response;
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("sign", role.getSign());
        param.put("roleId", role.getRoleId());
        model = roleDao.findUnique("getRoleBySignAndNoRoleId", param);
        if (model != null && role.getSign().equals(model.getSign())) {
            response.setCode(Response.EXSIED);
            response.setMsg("角色标识已存在");
            return response;
        }

        param = Maps.newHashMap();
        param.put("sign", role.getSign());
        param.put("name", role.getName());
        param.put("remark", role.getRemark());
        param.put("updateTime", new Date());
        param.put("roleId", role.getRoleId());

        roleDao.update("updateRole", param);

        return response;
    }

    @Override
    public Response listRole(ParamFilter<String, String> param) {
        Response response = new Response();
        Page page = param.getPage();
        List<Map<String, Object>> roleList = roleDao.findMap("getRoleList", param, page);
        response.setData(roleList);

        Integer resultCount = roleDao.findOneColumn("getCount", Integer.class, param);
        page.setResultCount(resultCount);

        response.setPage(page);

        return response;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Response detailRole(String roleId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }

        Map<String, Object> detailMap = roleDao.findOneColumn("getRoleDetail", Map.class, roleId);
        if (detailMap == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("角色对象不存在");
            return response;
        }

        response.setData(detailMap);
        return response;
    }

    @Override
    public Response getRoleMap() {
        Response response = new Response();
        List<Map<String, Object>> roleList = roleDao.findMap("getRoleIdAndName", null);
        response.setData(roleList);
        return response;
    }
}
