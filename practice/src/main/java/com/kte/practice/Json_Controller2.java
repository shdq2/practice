package com.kte.practice;

import java.text.DateFormat;
import java.util.ArrayList;
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
import com.kte.practice.VO.onetooneVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.admin_itemdao;
import com.kte.practice.dao.admin_onetooneDAO;
import com.kte.practice.dao.admin_orderdao;
import com.kte.practice.dao.admindao;
import com.kte.practice.dao.cartdao;
import com.kte.practice.dao.memberdao;
import com.kte.practice.dao.shopdao;

@RestController
public class Json_Controller2 {
	@Autowired
	private admin_itemdao aidao = null;
	@Autowired
	private admin_onetooneDAO odao = null;
	
	@RequestMapping(value = "/json_onetoone.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<onetooneVO> admin_item(
			@RequestParam(value="code", defaultValue="2")int code) {		
		List<onetooneVO> list = odao.adminonetooneList(code);
		return list;
	}
	
	@RequestMapping(value = "/json_onetoone_search.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<onetooneVO> admin_search(
			@RequestParam(value="txt", defaultValue="")String txt,
			@RequestParam(value="type", defaultValue="1")int type
			) {	
		shopVO vo = new shopVO();
		vo.setType(type);
		vo.setTxt(txt);
		List<onetooneVO> list = odao.adminonetooneSearch(vo);
		
		return list;
	}
	
}
