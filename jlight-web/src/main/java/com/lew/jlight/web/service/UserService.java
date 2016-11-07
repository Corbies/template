package com.lew.jlight.web.service;


import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    List getList(ParamFilter<String, String> param);

    void updateDefaultPwd(String[] userIds);

    void update(User user);

    void add(User user);

    void updatePwd(String originPwd,String confirmPwd,String newPwd);

    void delete(String[] userIds);

    Map getDetail(String userId);

    User getByAccount(String account);

    User getByUserId(String userId);

    List<String> getPermission(String account);
}
