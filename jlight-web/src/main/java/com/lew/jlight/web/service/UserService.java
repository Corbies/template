package com.lew.jlight.web.service;


import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    List getList(ParamFilter<String, String> param);

    void updateDefaultPwd(String userIds);

    void update(String roleIds, User user);

    void add(String roleIds, User user);

    void updatePwd(String oldPwd, String confirmPwd, String newPwd, String userId);

    void delete(String userIds);

    Map getDetail(String userId);

    User getByUserId(String userId);

    User getByAccount(String account);

    List<String> getPermission(String account);
}
