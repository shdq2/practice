package com.kte.practice.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MainInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession http = request.getSession();
		
		String path = request.getServletPath();
		String query = request.getQueryString();
		
		if(query == null) {
			http.setAttribute("_url", path);
		}
		else {
			http.setAttribute("_url", path+"?"+query);
		}
		
		
		return true;
	}

}
