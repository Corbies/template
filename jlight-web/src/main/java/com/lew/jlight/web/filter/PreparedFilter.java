package com.lew.jlight.web.filter;

import com.google.common.base.Strings;

import com.lew.jlight.web.util.ServletUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
 * 设置ThreadLocal变量的值
 *
 * @author eleven
 */
public class PreparedFilter implements Filter {
    private static final Logger logger = LoggerFactory.getLogger(PreparedFilter.class);
    private String contextPath;

    /**
     * 设置请求到对应的线程变量中
     */
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpResp = (HttpServletResponse) resp;

        String ctx = !Strings.isNullOrEmpty(contextPath) ? contextPath : httpReq.getContextPath();
        req.setAttribute("ctx", ctx);

        ServletUtil.setRequest(httpReq);
        ServletUtil.setResponse(httpResp);
        try {

            chain.doFilter(req, resp);
        } finally {
            ServletUtil.clearServletContext();
        }

    }

    public void init(FilterConfig config) throws ServletException {
        contextPath = config.getInitParameter("context-path");
        logger.info("contextPath: {}", contextPath);
    }

    public void destroy() {

    }

}
