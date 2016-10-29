package com.lew.jlight.web.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 抽象拦截器
 * @author Liew
 * Apr 8, 2016
 */
public abstract class AbstractInterceptor implements HandlerInterceptor {

	protected final static String LOGIN_URL = null;

	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler ) throws Exception {
		return false;
	}

	public void postHandle( HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView ) throws Exception {

	}

	public void afterCompletion( HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex ) throws Exception {

	}

	protected void doForwardToView( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.getRequestDispatcher( LOGIN_URL ).forward( request, response );
	}

	protected void doRedirectToView( HttpServletRequest request, HttpServletResponse response ) throws IOException {
		response.sendRedirect( null );
	}

	protected void addErrorField( String name, String msg ) {
	}
}