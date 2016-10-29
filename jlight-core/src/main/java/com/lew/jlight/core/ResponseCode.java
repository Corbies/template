package com.lew.jlight.core;

/**
 * 响应状态
 *
 * @author Liew Jun 5, 2016
 */
interface ResponseCode {

    /**
     * 操作执行成功
     */
    Integer SUCCESS = 0;

    /**
     * 执行操作过程中发生异常
     */
    Integer ERROR = 1;

    /**
     * 参数错误
     */
    Integer INVALID_PARAM = 2;

    /**
     * 对象已存在
     */
    Integer EXSIED = 3;

    /**
     * 帐号锁定
     */
    Integer LOCKED = 4;


    Integer PASSWORD_ERROR = 5;

    /**
     * 需要登录
     */
    int NEED_LOGIN = 6;

    /**
     * 权限不足
     */
    public static final ThreadLocal<Integer> INSUFFICIENT_PRIVILEGES = new ThreadLocal<Integer>() {
        @Override
        protected Integer initialValue() {
            return 7;
        }
    };

    /**
     * 对象不存在
     */
    Integer NOT_FOUND = 404;

}
