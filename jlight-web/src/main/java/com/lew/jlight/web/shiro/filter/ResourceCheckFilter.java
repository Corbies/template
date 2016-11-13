package com.lew.jlight.web.shiro.filter;

import com.lew.jlight.core.Response;
import com.lew.jlight.web.util.HttpServletUtil;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


public class ResourceCheckFilter extends AccessControlFilter {

	private Logger logger = LoggerFactory.getLogger(ResourceCheckFilter.class);

	private String errorUrl;

	public void setErrorUrl(String errorUrl) {
		this.errorUrl = errorUrl;
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		Subject subject = getSubject(request, response);
		String url = getPathWithinApplication(request);
		logger.debug("请求的地址："+url);
		return "admin".equals(subject.getPrincipal()) || subject.isPermitted(url);
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		HttpServletResponse resp = (HttpServletResponse)response;
		if(HttpServletUtil.isAjax(WebUtils.toHttp(request))){
			Map<String, Object> retMap = new HashMap<>();
			retMap.put("status", Response.ERROR);
			retMap.put("msg", "没有过访问权限");
    		HttpServletUtil.write(WebUtils.toHttp(response), retMap);
		}else{
			resp.sendRedirect(this.errorUrl);
		}
		return false;
	}

}
