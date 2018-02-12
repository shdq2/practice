package com.kte.practice;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kte.practice.VO.memberVO;
import com.kte.practice.dao.memberdao;

@RestController
public class Json_Controller {
	@Autowired
	private memberdao mdao = null;
	
	@RequestMapping(value = "/json_idcheck.do",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody int idcheck(@RequestParam(value="email")String email) {
		
		int ret = mdao.memberidcheck(email); 
		return ret;
	}
	
	@RequestMapping(value = "/json_login.do",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody int login(@RequestParam(value="email")String email,@RequestParam(value="pw")String pw,HttpSession http) {
		String url = (String)http.getAttribute("_url");
		memberVO vo = new memberVO();
		vo.setEmail(email);
		vo.setPw(pw);
		memberVO mvo = mdao.memberLogin(vo);
		int ret;
		if(mvo == null) ret = 0;
		else {
			ret=1;
			http.setAttribute("_mvo", mvo);
		}
		return ret;
	}
}
