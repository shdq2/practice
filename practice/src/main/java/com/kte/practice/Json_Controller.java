package com.kte.practice;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.cartdao;
import com.kte.practice.dao.memberdao;
import com.kte.practice.dao.shopdao;

@RestController
public class Json_Controller {
	@Autowired
	private memberdao mdao = null;
	
	@Autowired
	private shopdao sdao = null;
	
	@Autowired
	private cartdao cdao = null;

	@RequestMapping(value = "/json_qtyupdate.do",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> searchshop(
			@RequestParam(value="no")int no,@RequestParam(value="qty")int qty) {
		Map<String, Object> map = new HashMap<String,Object>();
		cartVO cvo = new cartVO();
		cvo.setNo(no);
		cvo.setQty(qty);
		int ret = cdao.qtyupdate(cvo);
		if(ret >0) {
			map.put("ret", qty);
		}else {
			map.put("ret", "½ÇÆÐ");
		}
		
		return map;
	}
	
	/*
	@RequestMapping(value = "/json_searchshop.do",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> searchshop(@RequestParam(value="data")String data) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		List<shopVO> list= sdao.searchshop(data);
		if(list.size() != 0) {
			map.put("ret", list);
		}else {
			map.put("ret", 0);
		}
		
		return map;
	}*/
}
