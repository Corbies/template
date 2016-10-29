package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;

public interface LoginService {

	/**
	 * 用户登录
	 * @return
	 */
	public Response doLogin(String account, String password, String clientIp)  throws Exception;
	
}
