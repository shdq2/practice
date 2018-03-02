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
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.admindao;
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
	
	@Autowired
	private admindao adao = null;
	
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
	
	@RequestMapping(value = "/json_member_block.do",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody int member_block(
			@RequestParam(value="email")String email,@RequestParam(value="block")int block) {
		memberVO mvo = new memberVO();
		mvo.setEmail(email);
		mvo.setBlock(block);
		int ret = adao.memberblockupdate(mvo);
		
		return ret;
	}
	
	@RequestMapping(value = "/json_paging.do",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody List<orderVO> paging(
			@RequestParam(value="page",defaultValue="1")int page,@RequestParam(value="email")String email) {
		page = (page-1)*10;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("page", page);
		List<orderVO> list = adao.adminmemberorder(map);
		System.out.println(list.get(0).getCart_no());
		return list;
	}
	
	@RequestMapping(value = "/json_delete.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> delete(@RequestParam(value="pw")String pw,HttpSession http) {
		Map<String, Object> map = new HashMap<String,Object>();
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		vo.setPw(pw);
		System.out.println(vo.getEmail()+"/"+vo.getPw());

		memberVO rvo = mdao.memberLogin(vo);
		if(rvo == null) {
			map.put("ret", 0);
		}else {
			map.put("ret", 1);
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
