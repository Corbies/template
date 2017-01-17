package com.wbs.web.service;


import com.wbs.mybatis.ParamFilter;
import com.wbs.web.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    List getList(ParamFilter param);

    void updateDefaultPwd(List<String> userIds);

    void update(User user);

    void add(User user);

    void updatePwd(String originPwd,String confirmPwd,String newPwd);

    void delete(List<String> userIds);

    Map getDetail(String userId);

    User getByUserId(String userId);

    List<String> getPermission(String account);
}
