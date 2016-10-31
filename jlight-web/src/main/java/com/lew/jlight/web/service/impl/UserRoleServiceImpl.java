package com.lew.jlight.web.service.impl;


import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.UserRoleService;

import org.springframework.stereotype.Component;

import java.util.List;

import javax.annotation.Resource;

@Component
public class UserRoleServiceImpl  implements UserRoleService {

    @Resource
    private UserRoleDao userRoleDao;

    @Override
    public List<UserRole> getListByUserId(String userId) {
        return userRoleDao.find("getListByUserId",userId);
    }
}
