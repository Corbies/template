package com.lew.jlight.web.controller;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private UserService userService;

    @GetMapping("listPage")
    public String list() {
        return "userList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody  ParamFilter queryFilter) {
        List userList = userService.getList(queryFilter);
        int count = userService.getCount(queryFilter);
        Page page = queryFilter.getPage();
        page.setResultCount(count);
        return new Response(userList,page);
    }

    @ResponseBody
    @PostMapping("add")
    public Response add(@RequestBody User user) {
        checkNotNull(user, "用户不能为空");
        userService.add(user);
        return new Response("添加成功");
    }


    @ResponseBody
    @PostMapping("edit")
    public Response edit(@RequestBody User user) {
        userService.update(user);
        return new Response("修改成功");
    }

    @ResponseBody
    @PostMapping("delete")
    public Response delete(@RequestBody List<String> userIds) {
        checkArgument((userIds != null && userIds.size() > 0), "用户编号不能为空");
        userService.delete(userIds);
        return new Response("删除成功");
    }

    @ResponseBody
    @PostMapping("resetPwd")
    public Response resetPwd(@RequestBody List<String> userIds) {
        checkArgument((userIds != null && userIds.size() > 0), "用户编号不能为空");
        userService.updateDefaultPwd(userIds);
        return new Response("重置成功");
    }


    @ResponseBody
    @PostMapping("changePwd")
    public Response changePwd(String originPwd, String confirmPwd, String newPwd) {
        userService.updatePwd(originPwd, newPwd, confirmPwd);
        return new Response("更改密码成功");
    }

    @ResponseBody
    @PostMapping("detail")
    public Response detail(@RequestBody String userId) {
        Map user = userService.getDetail(userId);
        return new Response(user);
    }
}
