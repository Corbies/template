package com.lew.jlight.web.service.impl;

import com.lew.jlight.mybatis.AbstractService;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.DictDao;
import com.lew.jlight.web.entity.Dict;
import com.lew.jlight.web.entity.pojo.JSTree;
import com.lew.jlight.web.service.DictService;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class DictServiceImpl extends AbstractService<Dict> implements DictService {

    @Resource
    private DictDao dictDao;

    @Override
    public void add(Dict dict) {
        if (dict.getParentId() == null) {
            dict.setParentId("#");
        }
        dictDao.save(dict);
    }

    @Override
    public List<Dict> getList(ParamFilter queryFilter) {
        return dictDao.find("getList", queryFilter.getParam(), queryFilter.getPage());
    }

    @Override
    public void update(Dict dict) {
        dictDao.update(dict);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public List<JSTree> getTree() {
        return dictDao.findMap("getTree");
    }

    @Override
    public List<Dict> getListByParentId(String parentId) {
        return dictDao.find("getListByParentId",parentId);
    }

    @Override
    public List<Dict> getCatagory() {
        return dictDao.find("getCatagory");
    }

    @Override
    public void delete(List<String> dicIds) {
        for (String id : dicIds) {
            dictDao.delete("delete", id);
        }
    }


}
