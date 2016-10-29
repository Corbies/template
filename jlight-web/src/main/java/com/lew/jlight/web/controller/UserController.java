package com.lew.jlight.web.controller;

import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.service.UserService;
import com.lew.jlight.web.util.UserContextUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


/**
 * 用户控制器
 *
 * @author Liew May 11, 2016
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("list")
    public Object list(String json) {
        ParamFilter<String, String> filter = new ParamFilter<>();
        Map<String, String> param = JsonUtil.parseStringMap(json);
        Page page = JsonUtil.parseMapToObj(param.get("page"), Page.class);
        Object queryParam = param.get("param");
        filter.setPage(page);
        if (queryParam != null) {
            filter.putAll(BeanUtil.toMap(queryParam));
        }

        Response response = userService.listUser(filter);
        return response;
    }

    /**
     * 用户管理--添加用户
     */
    @ResponseBody
    public Object add(@RequestBody Map<String, String> param) {
        String roleIds = !BeanUtil.isEmpty(param) ? param.get("roleIds") : null;
        Object userObj = param.get("user");
        String userJson = userObj == null ? null : userObj.toString();
        User user = JsonUtil.parseObj(userJson, User.class);

        Response response = userService.addUser(roleIds, user);
        return response;
    }

    /**
     * 用户管理---编辑用户
     */
    @ResponseBody
    public Object edit(@RequestBody Map<String, String> param) {
        String roleIds = !BeanUtil.isEmpty(param) ? param.get("roleIds") : null;
        Object userObj = param.get("user");
        String userJson = userObj == null ? null : userObj.toString();
        User user = JsonUtil.parseObj(userJson, User.class);

        Response response = userService.updateUser(roleIds, user);
        return response;
    }

    /**
     * 用户管理---删除用户
     */
    public Object delete(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String userIds = BeanUtil.isEmpty(param) ? null : param.get("userIds");
        Response response = userService.deleteUser(userIds);
        return response;
    }

    /**
     * 用户管理---重置密码
     */
    public Object resetPwd(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String userIds = BeanUtil.isEmpty(param) ? null : param.get("userIds");
        Response response = userService.updateDefaultPwd(userIds);
        return response;
    }

    /**
     * 修改当前登录帐号密码
     */
    public Object changePwd(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        String oldPwd = param.get("oldPwd");
        String newPwd = param.get("newPwd");
        String confirmPwd = param.get("confirmPwd");

        Response response = userService.updatePwd(oldPwd, newPwd, confirmPwd,
                "");
        return response;
    }

    /**
     * 用户管理---用户详细
     */
    public Object detail(@RequestBody String userId) {
        Response response = userService.getUserDetail(userId);
        return response;
    }
}
