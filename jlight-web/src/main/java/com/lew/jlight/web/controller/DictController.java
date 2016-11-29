package com.lew.jlight.web.controller;

import com.google.common.base.Preconditions;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Dict;
import com.lew.jlight.web.service.DictService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.annotation.Resource;


@Controller
@RequestMapping("dict")
public class DictController {

    @Resource
    private DictService dicService;

    @GetMapping("list")
    public String list() {
        return "dictList";
    }

    @ResponseBody
    @PostMapping("list")
    public Response list(@RequestBody ParamFilter queryFilter) {
        List<Dict> list = dicService.getList(queryFilter);
        int count = dicService.getCount(queryFilter);
        Page page = queryFilter.getPage();
        page.setResultCount(count);
        return new Response(list, page);
    }

    @ResponseBody
    @PostMapping("save")
    public Object save(@RequestBody Dict dict) {
        Preconditions.checkNotNull(dict, "不能为空");
        Response response = new Response();
        if (dict.getId()==null) {
            dicService.add(dict);
        } else {
            dicService.update(dict);
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
    @GetMapping("getTree")
    public Object getTree(){
        return dicService.getTree();
    }
    @ResponseBody
    @GetMapping("getByParentId")
    public Response getByParentId(String parentId){
        List<Dict> dictList = dicService.getListByParentId(parentId);
        return new Response(dictList);
    }

    @ResponseBody
    @GetMapping("getCatagory")
    public Response getCatagory(){
    	List<Dict> list = dicService.getCatagory();
    	Response response = new Response();
    	response.setData(list);
    	return response;
    } 
}
