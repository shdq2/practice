package com.kte.practice;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kte.practice.VO.memberVO;

@Controller
public class ShopController {

	@RequestMapping(value="/shop.do", method=RequestMethod.GET)
	public String login(@RequestParam(value="frame",defaultValue="0")int frame,HttpSession http) {
		if(frame == 1) {
			System.out.println("tset1");
			http.setAttribute("_frame", 1);
		}else if(frame == 2) {
			System.out.println("tset2");
			http.setAttribute("_frame", 2);
		}if(frame == 3) {
			System.out.println("tset3");
			http.setAttribute("_frame", 3);
		}
		return "shop";
	}
}
