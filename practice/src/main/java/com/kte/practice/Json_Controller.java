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
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.admin_itemdao;
import com.kte.practice.dao.admin_orderdao;
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
	
	@Autowired
	private admin_itemdao aidao = null;
	
	@Autowired
	private admin_orderdao aodao = null;
	
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
	
	@RequestMapping(value = "/json_sales_item.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> json_sales_item(
			@RequestParam(value="item_no", defaultValue="0")int no,
			@RequestParam(value="sales", defaultValue="0")int sale,
			@RequestParam(value="code", defaultValue="0")int code) {
		Map<String,Object> map = new HashMap<String,Object>();
		shopVO vo = new shopVO();
		vo.setNo(no);
		vo.setSales(sale);
		sdao.sales_shop(vo);
		
		String index=null;
		List<shopVO> list = aidao.adminItemList(code);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg1() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				index= "1,";
			}
			if(list.get(i).getImg2() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "2,";
				else index+="2,";
			}
			if(list.get(i).getImg3() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "3,";
				else index+="3,";
			}
			if(list.get(i).getImg4() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "4,";
				else index+="4,";
			}
			if(list.get(i).getImg5() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "5,";
				else index+="5";
			}
		}
		if(index == null) {
			index = "1";
		}else {
			String[] idx = index.split(",");
			index = idx[0];
		}
		map.put("idx", index);
		map.put("ret", list);
		
		return map;
	}
	
	@RequestMapping(value = "/json_member_search.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<memberVO> json_member_search(
			@RequestParam(value="txt", defaultValue="")String txt,
			@RequestParam(value="type", defaultValue="1")int type) {
		shopVO vo = new shopVO();
		vo.setTxt(txt);
		vo.setType(type);
		
		List<memberVO> ret = adao.admin_member_search(vo);
		
		return ret;
	}
	
	@RequestMapping(value = "/json_member_block.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int member_block(
			@RequestParam(value="email")String email,@RequestParam(value="block")int block) {
		memberVO mvo = new memberVO();
		mvo.setEmail(email);
		mvo.setBlock(block);
		int ret = adao.memberblockupdate(mvo);
		
		return ret;
	}
	
	@RequestMapping(value = "/json_item.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> admin_item(
			@RequestParam(value="code", defaultValue="1")int code) {
		Map<String, Object> map = new HashMap<String, Object>();
		String index=null;
		List<shopVO> list = aidao.adminItemList(code);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg1() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				index= "1,";
			}
			if(list.get(i).getImg2() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "2,";
				else index+="2,";
			}
			if(list.get(i).getImg3() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "3,";
				else index+="3,";
			}
			if(list.get(i).getImg4() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "4,";
				else index+="4,";
			}
			if(list.get(i).getImg5() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "5,";
				else index+="5";
			}
		}
		if(index == null) {
			index = "1";
		}else {
			String[] idx = index.split(",");
			index = idx[0];
		}
		map.put("idx", index);
		map.put("ret", list);
		return map;
	}
	
	@RequestMapping(value = "/json_search.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> admin_search(
			@RequestParam(value="txt", defaultValue="")String txt,
			@RequestParam(value="type", defaultValue="1")int type
			) {	
		shopVO vo = new shopVO();
		vo.setType(type);
		vo.setTxt(txt);
		List<shopVO> list = aidao.adminsearch(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		String index=null;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg1() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				index= "1,";
			}
			if(list.get(i).getImg2() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "2,";
				else index+="2,";
			}
			if(list.get(i).getImg3() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "3,";
				else index+="3,";
			}
			if(list.get(i).getImg4() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "4,";
				else index+="4,";
			}
			if(list.get(i).getImg5() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "5,";
				else index+="5";
			}
		}
		if(index == null) {
			index = "1";
		}else {
			String[] idx = index.split(",");
			index = idx[0];
		}
		map.put("idx", index);
		map.put("ret", list);
		return map;
	}
	

	@RequestMapping(value = "/json_search_complete.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> admin_search_complete(
			@RequestParam(value="txt", defaultValue="")String txt,
			@RequestParam(value="type", defaultValue="1")int type
			) {	
		shopVO vo = new shopVO();
		vo.setType(type);
		vo.setTxt(txt);
		List<shopVO> list = aidao.adminsearchcomplete(vo);	
		Map<String, Object> map = new HashMap<String, Object>();
		String index=null;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg1() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				index= "1,";
			}
			if(list.get(i).getImg2() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "2,";
				else index+="2,";
			}
			if(list.get(i).getImg3() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "3,";
				else index+="3,";
			}
			if(list.get(i).getImg4() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "4,";
				else index+="4,";
			}
			if(list.get(i).getImg5() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "5,";
				else index+="5";
			}
		}
		if(index == null) {
			index = "1";
		}else {
			String[] idx = index.split(",");
			index = idx[0];
		}
		map.put("idx", index);
		map.put("ret", list);
		return map;
	}
	
	@RequestMapping(value = "/json_order.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<orderVO> admin_order(
			@RequestParam(value="code", defaultValue="1")int code) {		
		List<orderVO> ret = aodao.adminorderlist(code);	
		return ret;
	}
	
	@RequestMapping(value = "/json_order_search.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<orderVO> admin_order_search(
			@RequestParam(value="txt", defaultValue="")String txt,
			@RequestParam(value="type", defaultValue="1")int type
			) {	
		shopVO vo = new shopVO();
		vo.setType(type);
		vo.setTxt(txt);
		List<orderVO> ret = aodao.adminsearchorder(vo);			
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
		return list;
	}
	
	@RequestMapping(value = "/json_graph.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<Map<String,Object>> paging(@RequestParam(value="email")String email) {
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		List<Map<String,Object>> list_map = new ArrayList<Map<String,Object>>();
		List<orderVO> list = adao.graph(email);
		for(int i=0;i<list.size();i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("date1", list.get(i).getDate1());
			map.put("qty", list.get(i).getQty());
			map.put("price",Integer.parseInt(list.get(i).getPrice()));
			
			list_map.add(map);
		}
		
		return list_map;
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
