package com.kte.practice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.cartdao;
import com.kte.practice.dao.orderdao;
import com.kte.practice.dao.shopdao;

@Controller
public class OrderController {
	
	@Autowired
	private orderdao odao = null;
	@Autowired
	private shopdao sdao = null;
	@RequestMapping(value="/order.do", method=RequestMethod.POST)
	public String order_post(HttpSession http,
			@RequestParam("chks")List<Integer> no_list,
			@RequestParam("item_no")List<Integer> item_no,
			@RequestParam("qty")List<Integer> qty,
			@RequestParam("price")List<String> price,
			Model model) {

		
		if(no_list.size() == 0) {
			model.addAttribute("url", "cart.do");
			model.addAttribute("msg", "선택된 항목이 없습니다.");
			model.addAttribute("ret", "n");
		}else {
			for(int i=0;i<no_list.size();i++) {
				
				orderVO vo = new orderVO();
				int no = odao.lastOrderNo();
				vo.setNo(no+1);
				vo.setCart_no(no_list.get(i));
				vo.setQty(qty.get(i));
				vo.setItem_no(item_no.get(i));
				vo.setOrder_price(price.get(i));
				odao.insertorder(vo);
			}
			
			model.addAttribute("url", "order.do");
			model.addAttribute("msg", "주문이 완료되었습니다.");
			model.addAttribute("ret", "y");
		}
		return "alert";
	}
	@RequestMapping(value="/order.do", method=RequestMethod.GET)
	public String order(HttpSession http,Model model) {
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		List<orderVO> list = odao.orderlist(mvo.getEmail());
		
		String index=null;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg1() != null) {
				index= "1,";
			}
			if(list.get(i).getImg2() != null) {
				if(index == null) index= "2,";
				else index+="2,";
			}
			if(list.get(i).getImg3() != null) {
				if(index == null) index= "3,";
				else index+="3,";
			}
			if(list.get(i).getImg4() != null) {
				if(index == null) index= "4,";
				else index+="4,";
			}
			if(list.get(i).getImg5() != null) {
				if(index == null) index= "5,";
				else index+="5";
			}
		}
		List<shopVO> clist = sdao.selectcode();
		model.addAttribute("clist", clist);
		model.addAttribute("index",index);		
		model.addAttribute("list", list);
		
		return "order";
	}
}
