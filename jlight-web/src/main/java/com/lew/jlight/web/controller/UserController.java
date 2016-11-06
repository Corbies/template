package com.lew.jlight.web.controller;

import com.google.common.base.Preconditions;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.JsonUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import static com.lew.jlight.core.util.BeanUtil.toMap;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list() {
        return "userList";
    }

    @ResponseBody
    @RequestMapping("list")
    public Response list(@RequestBody  String json) {
        ParamFilter<String, String> filter = new ParamFilter<>();
        Map<String, String> param = JsonUtil.parseStringMap(json);
        assert param != null;
        Page page = JsonUtil.parseMapToObj(param.get("page"), Page.class);
        Object queryParam = param.get("param");
        filter.setPage(page);
        if (queryParam != null) {
            filter.putAll(toMap(queryParam));
        }
        List userList = userService.getList(filter);
        return new Response(userList);
    }

    @ResponseBody
    @RequestMapping("add")
    public Response add(@RequestBody User user) {
        Preconditions.checkNotNull(user,"用户不能为空");
        userService.add(user);
        return new Response("添加成功");
    }


    @ResponseBody
    @RequestMapping("edit")
    public Response edit(@RequestBody User user) {
        userService.update( user);
        return new Response("修改成功");
    }

    @ResponseBody
    @RequestMapping("delete")
    public Response delete(@RequestBody String[] userIds) {
        Preconditions.checkArgument((userIds!=null && userIds.length>0),"用户编号不能为空");
        userService.delete(userIds);
        return new Response("删除成功");
    }

    @ResponseBody
    @RequestMapping("resetPwd")
    public Response resetPwd(@RequestBody String[] userIds) {
        Preconditions.checkArgument((userIds!=null && userIds.length>0),"用户编号不能为空");
        userService.updateDefaultPwd(userIds);
        return new Response("重置成功");
    }


    @ResponseBody
    @RequestMapping("changePwd")
    public Response changePwd(@RequestBody String json) {
        Map<String, String> param = JsonUtil.parseStringMap(json);
        assert param != null;
        String oldPwd = param.get("oldPwd");
        String newPwd = param.get("newPwd");
        String confirmPwd = param.get("confirmPwd");

        userService.updatePwd(oldPwd, newPwd, confirmPwd, "");
        return new Response("更改密码成功");
    }

    @ResponseBody
    @RequestMapping("detail")
    public Response detail(@RequestBody String userId) {
        Map user = userService.getDetail(userId);
        return new Response(user);
    }
}
