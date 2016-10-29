package com.lew.jlight.mybatis;

import com.lew.jlight.core.page.Page;

import java.io.Serializable;
import java.util.HashMap;


public class ParamFilter<K, V> extends HashMap<K, V> implements Serializable {
    private static final long serialVersionUID = -2518443973414972543L;

    private Page page;

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
}
