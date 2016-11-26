package com.lew.jlight.mybatis;

import com.google.common.base.Strings;

import com.lew.jlight.core.BaseEntity;

import org.mybatis.spring.SqlSessionTemplate;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import javax.annotation.Resource;

public abstract  class AbstractService<T extends BaseEntity> {

    private String entityClassName;

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int getCount(ParamFilter paramFilter) {
        String statement = this.getEntityClass()+".getCount";
        return this.sqlSessionTemplate.selectOne(statement, paramFilter.getParam());
    }

    private  String getEntityClass(){
        if(!Strings.isNullOrEmpty(entityClassName)){
            return entityClassName;
        }
        Type cls = super.getClass().getGenericSuperclass();
        if (cls instanceof ParameterizedType) {
            ParameterizedType pt = (ParameterizedType) cls;
            // 获取所有放到泛型里面的类型
            Type[] types = pt.getActualTypeArguments();
            try {
                //获取第一个注解
                entityClassName =  types[0].getTypeName();
            } catch (Exception e) {
                throw new RuntimeException("fail to get entity anotation", e);
            }
        }
        return entityClassName;
    }

}
