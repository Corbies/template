package com.lew.jlight.core;


import com.lew.jlight.core.page.Page;

public class Response implements ResponseCode {

    private Object data;

    private Page page;

    private int code = 0;

    private String msg;

    public Response() {
    }

    public Response(Object data) {
        this.data = data;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return this.data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
}
