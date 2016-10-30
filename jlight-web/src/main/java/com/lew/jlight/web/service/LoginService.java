package com.lew.jlight.web.service;


import com.lew.jlight.core.Response;

public interface LoginService {

	boolean doLogin(String account, String password, String clientIp);
	
}
