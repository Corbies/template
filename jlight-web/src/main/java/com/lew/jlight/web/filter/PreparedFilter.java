package com.lew.jlight.web.filter;

import com.lew.jlight.web.util.ServletUtil;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName="preparedFilter",urlPatterns="/*")
public class PreparedFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化filter");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpResp = (HttpServletResponse) resp;

        ServletUtil.setRequest(httpReq);
        ServletUtil.setResponse(httpResp);
        try {
            chain.doFilter(req, resp);
        } finally {
            ServletUtil.clearServletContext();
        }
    }

    @Override
    public void destroy() {
    }

}
