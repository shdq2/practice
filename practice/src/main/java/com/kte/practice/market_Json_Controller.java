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
import com.kte.practice.VO.replyVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.admin_itemdao;
import com.kte.practice.dao.admin_onetooneDAO;
import com.kte.practice.dao.admin_orderdao;
import com.kte.practice.dao.admindao;
import com.kte.practice.dao.cartdao;
import com.kte.practice.dao.memberdao;
import com.kte.practice.dao.shopdao;

@RestController
public class market_Json_Controller {
	@Autowired
	private admin_itemdao aidao = null;
	@Autowired
	private admin_onetooneDAO odao = null;
	@Autowired
	private shopdao sdao = null;
	
	@RequestMapping(value = "/json_rep.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> json_rep(
			@RequestParam(value="item_no")int item_no,
			@RequestParam(value="content")String content,
			@RequestParam(value="writer")String writer) {
			
			Map<String,Object> map = new HashMap<String,Object>();
			replyVO vo = new replyVO();
			vo.setRep_no(sdao.replylastNo()+1);
			vo.setRep_content(content);
			vo.setRep_item_no(item_no);
			vo.setRep_writer(writer);
			sdao.insertreply(vo);
			
			List<replyVO> list = sdao.replyList(item_no);
			int cnt = sdao.replycount(item_no);
			map.put("data", list);
			map.put("cnt", cnt);
		return map;
	}
	

	@RequestMapping(value = "/json_rep_all.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<replyVO> json_reply_all(
			@RequestParam(value="item_no")int item_no) {
			
			List<replyVO> list = sdao.replyList(item_no);
			
		return list;
	}
	
	@RequestMapping(value = "/json_reply_delete.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> json_reply_delete(
			@RequestParam(value="rep_no")int rep_no,
			@RequestParam(value="item_no")int item_no,
			Model model) {
			
			Map<String,Object> map = new HashMap<String,Object>();
			sdao.deletereply(rep_no);
			List<replyVO> list = sdao.replyList(item_no);
			int cnt = sdao.replycount(item_no);
			
			map.put("data", list);
			map.put("cnt", cnt);
		return map;
	}
}
