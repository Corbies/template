package com.lew.jlight.web.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lew.jlight.core.util.JsonUtil;


public class HttpServletUtil {
	
	private static Logger logger = LoggerFactory.getLogger(HttpServletUtil.class);
	
	/**
	 * 判断请求是否异步
	 * @param request
	 * @return
	 */
	public static boolean isAjax(HttpServletRequest request){
		return "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
	}
	
	public static void write(HttpServletResponse response, Map<String,Object> retMap){
		PrintWriter pw = null;
		try {
			response.setContentType("text/html;charset=UTF-8");
			pw = response.getWriter();
			pw.write(JsonUtil.parseObject2Str(retMap));
		} catch (IOException e) {
			logger.error(e.getMessage());
		}finally{
			if(null != pw){
				pw.flush();
				pw.close();
			}
		}
	}
}
