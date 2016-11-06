package com.lew.jlight.web.service.impl;


import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.UserRoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class UserRoleServiceImpl  implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Override
    public List<UserRole> getListByUserId(String userId) {
        return userRoleDao.find("getListByUserId",userId);
    }
}
