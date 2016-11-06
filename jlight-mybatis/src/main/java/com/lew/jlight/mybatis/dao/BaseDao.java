package com.lew.jlight.mybatis.dao;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.lew.jlight.core.BaseEntity;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;


public abstract class BaseDao<T extends BaseEntity> implements GenericDao<T> {

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public Serializable save(T entity) {
        String statements = getMapperNamespace() + ".insert";
        if (entity != null) {
            entity.setCreateTime(new Date());
            entity.setUpdateTime(new Date());
            entity.setIsDelete(BigInteger.ZERO.intValue());
        }
        return this.sqlSessionTemplate.insert(statements, entity);
    }


    @Override
    public Serializable save(String key, Object param) {
        String statements = getMapperNamespace() + "." + key;
        BaseEntity entity = null;
        if (param != null && param instanceof BaseEntity) {
            entity = (BaseEntity) param;
            entity.setCreateTime(new Date());
            entity.setUpdateTime(new Date());
            entity.setIsDelete(BigInteger.ZERO.intValue());
        }
        return this.sqlSessionTemplate.insert(statements, entity);
    }


    @Override
    public void delete(String key, Object param) {
        String statement = getMapperNamespace() + "." + key;
        this.sqlSessionTemplate.delete(statement, param);
    }

    @Override
    public void delete(T entity) {
        String statement = getMapperNamespace() + ".delete";
        this.sqlSessionTemplate.delete(statement, entity);
    }

    /**
     * 批量删除entity
     */
    @Override
    public void delete(T[] entities) {
        for (T entity : entities)
            this.delete(entity);
    }

    @Override
    public void update(T entity) {
        String statement = getMapperNamespace() + ".update";
        if (entity != null) {
            entity.setUpdateTime(new Date());
        }
        this.sqlSessionTemplate.update(statement, entity);
    }


    @Override
    public void update(String key, Object param) {
        String statements = getMapperNamespace() + "." + key;
        this.sqlSessionTemplate.update(statements, param);
    }

    @Override
    public void update(T[] entities) {
        for (T entity : entities) {
            this.update(entity);
        }
    }


    @Override
    public T findUnique(String key, Object param) {
        String statement = getMapperNamespace() + "." + key;
        return this.sqlSessionTemplate.selectOne(statement, param);
    }

    @Override
    public <R> List<R> findColumn(String key, Class<R> returnClass, Object param) {
        String statement = getMapperNamespace() + "." + key;
        return this.sqlSessionTemplate.selectList(statement, param);
    }

    @Override
    public <R> R findOneColumn(String key, Class<R> returnClass, Object param) {
        String statement = getMapperNamespace() + "." + key;
        return this.sqlSessionTemplate.selectOne(statement, param);
    }

    @Override
    public <R> List<R> findColumn(String key, Class<R> returnClass) {
        String statement = getMapperNamespace() + "." + key;
        return this.sqlSessionTemplate.selectList(statement);
    }
    
    @Override
    public List findMap(String key) {
        return this.findMap(key, null, null);
    }

    @Override
    public List findMap(String key, Object param) {
        return this.findMap(key, param, null);
    }

    @Override
    public List findMap(String key, Object param, Page page) {
        String statement = getMapperNamespace() + "." + key;
        Map<String, Object> filters = new HashMap<>();
        if (param != null) {
            if (param instanceof Map) {
                filters.putAll((Map) param);
            } else if (param.getClass().isArray()) {
                Map parameterObject = BeanUtil.toMap(param);
                filters.putAll(parameterObject);
            }
        }
        if (page != null) {
            filters.put("page", page);
        }
        return this.sqlSessionTemplate.selectList(statement, filters.size() == 0 ? param : filters);
    }

    @Override
    public List<T> find(String key) {
        String statement = getMapperNamespace() + "." + key;
        return this.sqlSessionTemplate.selectList(statement);
    }


    @Override
    public List<T> find(String key, Object param, Page page) {
        String statements = getMapperNamespace() + "." + key;
        Map<String, Object> filters = new HashMap<>();
        if (param != null) {
            if (param instanceof Map) {
                filters.putAll((Map) param);
            } else if (param.getClass().isArray()) {
                Map parameterObject = BeanUtil.toMap(param);
                filters.putAll(parameterObject);
            }
        }
        if (page != null) {
            filters.put("page", page);
        }
        return this.sqlSessionTemplate.selectList(statements, filters.size() == 0 ? param : filters);
    }

    @Override
    public List<T> find(String key, Object param) {
        return this.find(key, param, null);
    }


    private String getMapperNamespace() {
        Class clazz = this.getEntityClass();
        return clazz.getName();
    }

    protected abstract Class<T> getEntityClass();
}
