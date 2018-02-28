package com.kte.practice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kte.practice.VO.memberVO;
import com.kte.practice.dao.admindao;
import com.kte.practice.dao.memberdao;

@Controller
public class adminController {
	@Autowired
	private admindao adao = null;
	@RequestMapping(value="/admin.do",method= RequestMethod.GET)
	public String admine(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin";
	}
	
	@RequestMapping(value="/admin_member.do",method= RequestMethod.GET)
	public String admin_member(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		
		List<memberVO> list = adao.adminMemberList();
		model.addAttribute("list", list);
		
		return "admin_member";
	}
	@RequestMapping(value="/admin_member_detail.do",method= RequestMethod.GET)
	public String admin_member_detail(@RequestParam("email")String email, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		memberVO mvo = adao.selectmemberOne(email);
		model.addAttribute("vo", mvo);
		return "admin_member_detail";
	}
	
	@RequestMapping(value="/admin_item.do",method= RequestMethod.GET)
	public String admin_item(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin_item";
	}
	@RequestMapping(value="/admin_qna.do",method= RequestMethod.GET)
	public String admin_qna(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin_qna";
	}
	@RequestMapping(value="/admin_setting.do",method= RequestMethod.GET)
	public String admin_setting(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin_setting";
	}
	
}
