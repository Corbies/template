package com.lew.jlight.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Ajax过滤器
 * @author Liew
 * Apr 8, 2016
 */
public class AjaxFilter implements Filter {

	public void init( FilterConfig filterConfig ) throws ServletException {

	}

	public void doFilter( ServletRequest servletRequestt, ServletResponse servletResponse, FilterChain chain ) throws IOException, ServletException {
		HttpServletRequest request = ( HttpServletRequest ) servletRequestt;

		String ajaxSubmit = request.getHeader( "X-Requested-With" );
		if ( ajaxSubmit != null && ajaxSubmit.equals( "XMLHttpRequest" ) ) {
			//判断是否超时请求
		}
		chain.doFilter( servletRequestt, servletResponse );
	}

	public void destroy( ) {

	}
}
