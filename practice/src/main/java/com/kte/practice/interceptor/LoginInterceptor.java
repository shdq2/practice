package com.kte.practice.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kte.practice.VO.memberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession http = request.getSession();
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo == null) {
			response.sendRedirect("login.do");
			return false;
		}		
		return true;
	}

}
