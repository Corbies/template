package com.wbs.web.service;

import com.wbs.web.entity.User;

public interface LoginService {

	User doLogin(String account, String clientIp);
	
}
