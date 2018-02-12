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
public class memberController {
	
	@Autowired
	private memberdao mdao = null;
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join(Model model) {
		memberVO vo = new memberVO();
		model.addAttribute("vo", vo);
		return "join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute("vo") memberVO vo,HttpSession http) {
		String url = (String)http.getAttribute("_url");
		mdao.memberinsert(vo);
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(Model model) {
		memberVO vo = new memberVO();
		model.addAttribute("vo", vo);
		return "login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_p(@ModelAttribute("vo") memberVO vo,HttpSession http) {
		String url = (String)http.getAttribute("_url");
		memberVO mvo = mdao.memberLogin(vo);
		if(mvo == null) {
			return "redirect:login.do";
		}else {
			http.setAttribute("_mvo", mvo);
			return "redirect:"+url;
		}
		
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(Model model,HttpSession http) {
		String url = (String)http.getAttribute("_url");
		http.invalidate();
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/idcheck.do",method= RequestMethod.GET)
	public @ResponseBody boolean idcheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("email");
		
		int ret = mdao.memberidcheck(id); 
		if(ret == 1) {return false; }
		return true;
	}
}
