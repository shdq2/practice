package com.kte.practice.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kte.practice.dao.admindao;
import com.kte.practice.dao.shopdao;

public class MainInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession http = request.getSession();
		String root = request.getContextPath();
		String path = request.getServletPath();
		String query = request.getQueryString();
		http.setAttribute("_path", path);
		if(query == null) {
			http.setAttribute("_url", root+path);
		}
		else {
			http.setAttribute("_url", root+path+"?"+query);
		}
		
		
		return true;
	}
	
}
