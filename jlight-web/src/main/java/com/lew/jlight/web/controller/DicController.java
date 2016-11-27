package com.lew.jlight.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Preconditions;
import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Dic;
import com.lew.jlight.web.entity.pojo.JSTree;
import com.lew.jlight.web.service.DicService;
import com.lew.jlight.web.service.RoleService;


@Controller
@RequestMapping("dic")
public class DicController {

    @Resource
    private DicService dicService;
    @Resource
    private RoleService roleService;

    @GetMapping("list")
    public String list() {
        return "dicList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody ParamFilter queryFilter) {
        List<Dic> list = dicService.getList(queryFilter);
        int count = dicService.getCount(queryFilter);
        Page page = queryFilter.getPage();
        page.setResultCount(count);
        return new Response(list, page);
    }

    @ResponseBody
    @PostMapping("save")
    public Object save(@RequestBody Dic dic) {
        Preconditions.checkNotNull(dic, "不能为空");
        Response response = new Response();
        if (dic.getId()==null) {
            dicService.add(dic);
        } else {
            dicService.update(dic);
        }
        response.setMsg("添加成功");
        return response;
    }


    @ResponseBody
    @PostMapping("delete")
    public Response delete(@RequestBody List<String> dicIds) {
        Preconditions.checkArgument((dicIds != null && dicIds.size() > 0), "不能为空");
        dicService.delete(dicIds);
        return new Response();
    }

    @ResponseBody
    @PostMapping("detail")
    public Response detail(@RequestBody  String roleId) {
    	return null;
    }
    
    @GetMapping("getTree")
    public @ResponseBody Object getTree(){
    	List<JSTree> list = dicService.getTree();
    	return list;
    }
    
    @GetMapping("getCatagory")
    public @ResponseBody Response getCatagory(){
    	List<Dic> list = dicService.getCatagory();
    	Response response = new Response();
    	response.setData(list);
    	return response;
    } 
}
