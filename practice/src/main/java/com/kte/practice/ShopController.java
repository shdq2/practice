package com.kte.practice;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.shopdao;

@Controller
public class ShopController {
	@Autowired
	private shopdao sdao = null;
	
	@RequestMapping(value="/shop.do", method=RequestMethod.GET)
	public String login(@RequestParam(value="frame",defaultValue="0")int frame,HttpSession http,Model model) {
		List<shopVO> list = new ArrayList<shopVO>();
		list = sdao.selectshop(frame);
		model.addAttribute("list",list);
		return "shop";
	}
	
	@RequestMapping(value="/boardListSearch.do", method=RequestMethod.GET)
	public String boardListSearch(@RequestParam(value="data",defaultValue="0")String search,HttpSession http,Model model) {
		List<shopVO> list = new ArrayList<shopVO>();
		
		list = sdao.searchshop(search);
		
		model.addAttribute("list",list);
		return "shop";
	}
}
