package com.lew.jlight.web.util;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet工具类
 *
 * @author liew
 */
public class ServletUtil {

    /**
     * Constant for the HTTP request object.
     */
    private static final String HTTP_REQUEST = "org.framework.web.ServletConstants.HttpServletRequest";

    /**
     * Constant for the HTTP response object.
     */
    private static final String HTTP_RESPONSE = "org.framework.web.ServletConstants.HttpServletResponse";

    /**
     * Constant for the HTTP session object.
     */
    private static final String HTTP_SESSION = "org.framework.web.ServletConstants.HttpSession";

    /**
     * Constant for the HTTP request ip address.
     */
    private static final String HTTP_REMOTE_ADDR = "org.framework.web.ServletConstants.RemoteAddr";


    @SuppressWarnings("rawtypes")
    private static ThreadLocal<Map> servletContext = new ThreadLocal<Map>() {
        @Override
        protected Map initialValue() {
            return new HashMap();
        }
    };
    /**
     * 获得当前的 HttpServletRequest
     */
    @SuppressWarnings("rawtypes")
    public static HttpServletRequest getRequest() {
        return (HttpServletRequest) ((Map) servletContext.get()).get(HTTP_REQUEST);
    }

    /**
     * 设置当前的 HttpServletRequest 为 request
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void setRequest(HttpServletRequest request) {
        ((Map) servletContext.get()).put(HTTP_REQUEST, request);
    }

    /**
     * 获得当前的 HttpServletResponse
     */
    @SuppressWarnings("rawtypes")
    public static HttpServletResponse getResponse() {
        return (HttpServletResponse) ((Map) servletContext.get()).get(HTTP_RESPONSE);
    }

    /**
     * 设置当前的 HttpServletResponse 为 response
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void setResponse(HttpServletResponse response) {
        ((Map) servletContext.get()).put(HTTP_RESPONSE, response);
    }

    /**
     * 设置当前的 HttpSession 为 session
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void setSession(HttpSession session) {
        ((Map) servletContext.get()).put(HTTP_SESSION, session);
    }

    /**
     * 获得当前的 HttpSession
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static HttpSession getSession(boolean create) {
        HttpServletRequest request = getRequest();
        HttpSession session = request != null ? request.getSession(create) : null;
        if ((session != null)) {
            ((Map) servletContext.get()).put(HTTP_SESSION, session);
            return session;
        }
        return null;
    }

    /**
     * 获得客户端端的session id
     */
    public static String getSessionId() {
        HttpSession httpSession = getSession(false);
        return (httpSession != null ? httpSession.getId() : "null");
    }

    /**
     * 获得客户端端的真实IP
     */
    @SuppressWarnings({"rawtypes"})
    public static String getRemoteAddr() {
        String ip = (String) ((Map) servletContext.get()).get(HTTP_REMOTE_ADDR);
        if (ip != null) {
            return ip;
        }
        return ip;

    }

    public static void clearServletContext() {
        ((Map) servletContext.get()).clear();
    }


    /**
     * 获取IP地址
     */
    public static String getIpAddr() {
        HttpServletRequest request = getRequest();
        if (request == null) {
            return "127.0.0.1";
        }
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Cdn-Src-Ip");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 获取http端口
     */
    public static int getHttpPort(HttpServletRequest req) {
        try {
            return new URL(req.getRequestURL().toString()).getPort();
        } catch (MalformedURLException excp) {
            return 80;
        }
    }

}
