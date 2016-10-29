package com.lew.jlight.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * 编码过滤器
 * 
 * @author eleven
 * 
 */
public class EncodingFilter implements Filter {

	private String encoding = "UTF-8";
	private String contentType = "text/html;charset=UTF-8";

	/**
	 * 设置请求以及响应编码
	 */
	public void doFilter( ServletRequest req, ServletResponse resp, FilterChain chain ) throws IOException, ServletException {

		HttpServletResponse response = ( HttpServletResponse ) resp;
		req.setCharacterEncoding( encoding );

		response.setCharacterEncoding( encoding );
		response.setContentType( contentType );
		response.setHeader( "Cache-Control", "no-cache" );
		response.setHeader( "Pragma", "no-cache" );
		response.setDateHeader( "Expires", -1 );

		chain.doFilter( req, resp );
	}

	public void init( FilterConfig config ) throws ServletException {
		String newEncoding = config.getInitParameter( "encoding" );
		String newContentType = config.getInitParameter( "contentType" );
		if ( newEncoding != null ) {
			encoding = newEncoding;
		}
		if ( contentType != null ) {
			contentType = newContentType;
		}
	}

	public void destroy( ) {

	}

}
