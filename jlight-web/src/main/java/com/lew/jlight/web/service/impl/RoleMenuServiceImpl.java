package com.lew.jlight.web.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.web.dao.MenuDao;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.RoleMenuDao;
import com.lew.jlight.web.entity.Menu;
import com.lew.jlight.web.entity.MenuTitle;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.RoleMenu;
import com.lew.jlight.web.service.RoleMenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {

    private static final Comparator<Menu> resourceComparator = (o1, o2) -> {
        int seq1 = o1.getSeq() != null ? o1.getSeq() : Integer.MAX_VALUE;
        int seq2 = o2.getSeq() != null ? o2.getSeq() : Integer.MAX_VALUE;
        return (seq1 < seq2 ? -1 : (seq1 == seq2 ? 0 : 1));
    };
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private RoleMenuDao roleMenuDao;
    @Autowired
    private RoleDao roleDao;

    @Override
    public List<RoleMenu> getList(String roleId) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(roleId),"角色编号不能为空");
        Map<String, Object> resultMap = Maps.newHashMap();
        List<MenuTitle> titleList = new ArrayList<>();
        List<String> titleIds = menuDao.findColumn("getParentIds", String.class);
        for (String resId : titleIds) {
            Menu parentResource = menuDao.findUnique("getResourceByResId", resId);
            if (parentResource == null) {
                continue;
            }
            MenuTitle title = new MenuTitle();
            List<Menu> resources = menuDao.find("getResourcesByParentId", resId);
            if (resources != null && resources.size() > 0) {
                Collections.sort(resources, resourceComparator);
            }
            title.setMenuList(resources);
            title.setName(parentResource.getName());
            title.setSeq(parentResource.getSeq());
            title.setTitleId(parentResource.getMenuId());
            titleList.add(title);
        }

        List<String> resIds = roleMenuDao.findColumn("getResIdsByRoleId", String.class, roleId);
        resultMap.put("titleList", titleList);
        resultMap.put("resIds", resIds);
        return null;
    }

    @Override
    public void update(String roleId, List<String> resIds) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(roleId),"菜单编号不能为空");

        Role model = roleDao.findUnique("getRoleByRoleId", roleId);
        Preconditions.checkNotNull(model,"角色对象不存在");
        if (BeanUtil.isEmpty(resIds)) {
            // 删除所有的角色-菜单数据
            roleMenuDao.update("deleteByRoleId", roleId);
        } else {
            // 先删除原来的角色-菜单,再批量插入
            roleMenuDao.update("deleteByRoleId", roleId);
            Set<String> resIdsSet = new HashSet<>();
            resIdsSet.addAll(resIds);
            for (String menuId : resIdsSet) {
                Menu resModel = menuDao.findUnique("getMenuById", menuId);
                Preconditions.checkNotNull(resModel,"菜单不存在");

                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setMenuId(menuId);
                roleMenu.setRoleId(roleId);
                roleMenu.setIsDelete(BigInteger.ZERO.intValue());
                roleMenu.setUpdateTime(new Date());
                roleMenu.setCreateTime(new Date());
                roleMenuDao.save("addRoleRes", roleMenu);
            }
        }
    }

	@Override
	public List<String> getMenuByRole(String roleId) {
		Preconditions.checkArgument(!Strings.isNullOrEmpty(roleId),"角色不能为空");
		return roleMenuDao.findColumn("getMenuByRole", String.class, roleId);
	}
}
