package com.lew.jlight.web.filter;

import com.google.common.base.Strings;

import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.web.util.UserContextUtil;

import org.springframework.util.PatternMatchUtils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * token校验过滤器
 * 
 * @author Liew Apr 29, 2016
 */
public class LoginAuthFilter implements Filter {

	private String loginUrl;

	private String[] excludeUrl;

	@Override
	public void init( FilterConfig filterConfig ) throws ServletException {

	}

	@Override
	public void doFilter( ServletRequest request, ServletResponse response, FilterChain chain ) throws IOException, ServletException {
		HttpServletRequest httpRequest = ( HttpServletRequest ) request;
		HttpServletResponse httpResponse = ( HttpServletResponse ) response;
		String requestUri = httpRequest.getRequestURI( );
		if ( !BeanUtil.isEmpty( excludeUrl ) ) {
			String requestUrl = this.removeCtx( requestUri, httpRequest.getContextPath( ) );
			boolean isMatch = PatternMatchUtils.simpleMatch( excludeUrl, requestUrl );
			if ( isMatch ) {
				chain.doFilter( request, response );
				return;
			}
		}

		httpResponse.sendRedirect( httpRequest.getContextPath( ) + this.loginUrl );
		return;
	}

	@Override
	public void destroy( ) {

	}

	public void setLoginUrl( String loginUrl ) {
		this.loginUrl = loginUrl;
	}

	public void setExcludeUrl( String[] excludeUrl ) {
		this.excludeUrl = excludeUrl;
	}

	/**
	 * 获取当前请求URL
	 * 
	 * @param url
	 * @param contextPath
	 * @return
	 */
	private String removeCtx( String url, String contextPath ) {
		url = url.trim( );
		if (Strings.isNullOrEmpty( contextPath ) )
			return url;
		if ( Strings.isNullOrEmpty( url ) )
			return "";
		if ( url.startsWith( contextPath ) ) {
			url = url.replaceFirst( contextPath, "" );
		}
		return url;
	}

}
