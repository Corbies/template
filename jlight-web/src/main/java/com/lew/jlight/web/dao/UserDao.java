package com.lew.jlight.web.dao;

import com.lew.jlight.mybatis.dao.BaseDao;
import com.lew.jlight.web.entity.User;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class UserDao extends BaseDao<User> {

}
