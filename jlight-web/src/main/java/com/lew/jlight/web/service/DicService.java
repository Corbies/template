package com.lew.jlight.web.service;


import java.util.List;

import com.lew.jlight.mybatis.BaseService;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.entity.Dic;
import com.lew.jlight.web.entity.pojo.JSTree;

public interface DicService extends BaseService {

	void add(Dic dic);

	List<Dic> getList(ParamFilter queryFilter);

	void update(Dic dic);

	List<JSTree> getTree();

	List<Dic> getCatagory();

	void delete(List<String> dicIds);

}
