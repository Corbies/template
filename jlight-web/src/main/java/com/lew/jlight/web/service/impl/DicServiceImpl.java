package com.lew.jlight.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lew.jlight.mybatis.AbstractService;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.DicDao;
import com.lew.jlight.web.entity.Dic;
import com.lew.jlight.web.entity.pojo.JSTree;
import com.lew.jlight.web.service.DicService;

@Service
public class DicServiceImpl extends AbstractService<Dic> implements DicService {

	@Resource
	private DicDao dicDao;
	
	@Override
	public void add(Dic dic) {
		if(dic.getParentId()==null){
			dic.setParentId("#");
		}
		dicDao.save(dic);
	}

	@Override
	public List<Dic> getList(ParamFilter queryFilter) {
		return dicDao.find("getList", queryFilter.getParam(), queryFilter.getPage());
	}

	@Override
	public void update(Dic dic) {
		dicDao.update(dic);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<JSTree> getTree() {
		List list =  dicDao.findMap("getTree");
		return list;
	}

	@Override
	public List<Dic> getCatagory() {
		return dicDao.find("getCatagory");
	}

	@Override
	public void delete(List<String> dicIds) {
	   for (String id : dicIds) {
		   dicDao.delete("delete", id);
        }
	}

  
}
