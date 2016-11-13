package com.lew.jlight.web.shiro.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.lew.jlight.core.Response;
import com.lew.jlight.web.util.HttpServletUtil;


public class ResourceCheckFilter extends AccessControlFilter {
	
	private String errorUrl;
	
	public String getErrorUrl() {
		return errorUrl;
	}

	public void setErrorUrl(String errorUrl) {
		this.errorUrl = errorUrl;
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		Subject subject = getSubject(request, response);
		String url = getPathWithinApplication(request);
		System.out.println("请求的链接====》"+url);
		if("admin".equals(subject.getPrincipal())){
			return true;
		}
		return subject.isPermitted(url);
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpServletRequest req = (HttpServletRequest)request;
		if(HttpServletUtil.isAjax(WebUtils.toHttp(request))){
			Map<String, Object> retMap = new HashMap<String, Object>();
			retMap.put("status", Response.ERROR);
			retMap.put("msg", "没有过访问权限");
    		HttpServletUtil.write(WebUtils.toHttp(response), retMap);
		}else{
			resp.sendRedirect(this.errorUrl);
		}
		return false;
	}

}
