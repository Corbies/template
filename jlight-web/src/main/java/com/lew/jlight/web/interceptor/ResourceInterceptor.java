package com.lew.jlight.web.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 资源拦截器
 * @author Liew
 * Apr 8, 2016
 */
public class ResourceInterceptor extends AbstractInterceptor implements HandlerInterceptor {

	private List< String > excludedUrls;

	@Override
	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler ) throws Exception {

		String requestURI = request.getRequestURI( );
		String contextPath = request.getContextPath( );
		String requestUrl = requestURI.substring( contextPath.length( ) );

		// 对excludeUrls不进行拦截
		if ( excludedUrls.contains( requestUrl ) ) {
			return true;
		} else {

		}
		return false;
	}

	public boolean isAccessResource( HttpServletRequest request, HttpServletResponse response, String requestUrl, Integer roleId ) throws Exception {
		return false;
	}

	@Override
	public void postHandle( HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView ) throws Exception {

	}

	@Override
	public void afterCompletion( HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex ) throws Exception {

	}

	public void setExcludedUrls( List< String > excludedUrls ) {
		this.excludedUrls = excludedUrls;
	}

}