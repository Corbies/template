package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.RoleMenuDao;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.service.RoleService;

import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Component
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;
    @Resource
    private RoleMenuDao roleMenuDao;

    @Override
    public void add(Role role) {
        Preconditions.checkNotNull(role,"角色信息不能为空");
        String sign = role.getSign();
        Role model = roleDao.findUnique("getRoleBySign", sign);
        Preconditions.checkArgument(model!=null,"角色信息不能为空");

        Date date = new Date();
        role.setCreateTime(date);
        role.setUpdateTime(date);
        role.setIsDelete(BigInteger.ZERO.intValue());
        role.setRoleId("2");
        roleDao.save("addRole", role);
    }

    @Override
    public void delete(String roleIds) {
        Preconditions.checkArgument(Strings.isNullOrEmpty(roleIds),"角色编号不能为空");
        String[] idArray = roleIds.split(",");
        for (String roleId : idArray) {
            Role model = roleDao.findUnique("getRoleByRoleId", roleId);
            Preconditions.checkNotNull(model,"角色对象不存在");
        }
        for (String roleId : idArray) {
            roleDao.update("deleteByRoleId", roleId);
            roleMenuDao.update("deleteByRoleId", roleId);
        }
    }

    @Override
    public void update(Role role) {
        Preconditions.checkNotNull(role,"角色信息不能为空");

        Role model = roleDao.findUnique("getRoleByRoleId", role.getRoleId());
        Preconditions.checkNotNull(model,"角色对象不存在");

        Map<String, Object> param = Maps.newHashMap();
        param.put("sign", role.getSign());
        param.put("roleId", role.getRoleId());
        model = roleDao.findUnique("getRoleBySignAndNoRoleId", param);
        Preconditions.checkNotNull(model,"角色对象不存在");
        Preconditions.checkArgument(!role.getSign().equals(model.getSign()),"角色标识已存在");

        param = Maps.newHashMap();
        param.put("sign", role.getSign());
        param.put("name", role.getName());
        param.put("remark", role.getRemark());
        param.put("updateTime", new Date());
        param.put("roleId", role.getRoleId());
        roleDao.update("updateRole", param);
    }

    @Override
    public List<Role> getList(ParamFilter<String, String> param) {
        Page page = param.getPage();
         roleDao.findMap("getRoleList", param, page);
        return null;
    }

    @Override
    public Role getDetail(String roleId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(roleId),"角色编号不能为空");
        Role role = roleDao.findUnique("getRoleByRoleId", roleId);
        Preconditions.checkNotNull(role,"角色对象不存在");
        return role;
    }

    @Override
    public Map getRoleMap(String userId) {
        return null;
    }
}
