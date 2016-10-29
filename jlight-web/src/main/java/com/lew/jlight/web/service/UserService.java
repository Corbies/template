package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.User;

public interface UserService {

    Response listUser(ParamFilter<String, String> param);


    Response updateDefaultPwd(String userIds);


    Response updateUser(String roleIds, User user);


    Response addUser(String roleIds, User user);


    Response updatePwd(String oldPwd, String confirmPwd, String newPwd, String userId);

    Response deleteUser(String userIds);


    Response getUserDetail(String userId);

    Response getUserByUserId(String userId);

    Response getUserByAccount(String account);

}
