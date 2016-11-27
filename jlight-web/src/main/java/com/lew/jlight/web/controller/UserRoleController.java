package com.lew.jlight.web.controller;

import com.google.common.base.Strings;
import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
import com.lew.jlight.core.Response;
import com.lew.jlight.web.service.UserRoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("userRole")
public class UserRoleController {

    @Resource
    private UserRoleService userRoleService;

    @ResponseBody
    @PostMapping("add")
    public Response add( String[] roleIds,String userId){
        checkNotNull(roleIds,"角色信息不能为空");
        checkArgument(!Strings.isNullOrEmpty(userId),"用户编号不能为空");
        userRoleService.add(roleIds,userId);
        return new Response("保存成功");
    }
}
