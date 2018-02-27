package com.kte.practice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kte.practice.VO.memberVO;
import com.kte.practice.dao.memberdao;

@Controller
public class adminController {
	
	@RequestMapping(value="/admin.do",method= RequestMethod.GET)
	public String admine(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin";
	}
	
	@RequestMapping(value="/admin_member.do",method= RequestMethod.GET)
	public String admin_member(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin_member";
	}
}
