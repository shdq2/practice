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
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.cartdao;
import com.kte.practice.dao.shopdao;

@Controller
public class CartController {
	
	@Autowired
	private cartdao cdao = null;
	
	@Autowired
	private shopdao sdao = null;
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String cart(HttpSession http,Model model,HttpServletRequest request) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		/*if(vo == null) {
			return "redirect:login.do";
		}else {*/
		
		String index=null;
		String email = vo.getEmail();
		List<itemcartVO> list = cdao.itemcart(email);
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
			model.addAttribute("index", index);
		
			List<shopVO> codelist=sdao.selectcode();
			model.addAttribute("clist", codelist);
			int size = list.size();
			model.addAttribute("list", list);
			model.addAttribute("size", size);
			return "cart";
		//}
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart_post(@ModelAttribute("cvo")cartVO cvo,HttpSession http,HttpServletRequest request) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo == null) {
			return "redirect:login.do";
		}else {
			cvo.setMember_email(vo.getEmail());
			cdao.insertcart(cvo);
			return "redirect:cart.do";
		}		
	}
	
	@RequestMapping(value="/cartalldelete.do", method=RequestMethod.GET)
	public String cartdelete(HttpSession http,Model model,HttpServletRequest request) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		String email = vo.getEmail();
		System.out.println(email);
		int ret = cdao.cartalldelete(email);
		if(ret != 1) {
			model.addAttribute("url", "cart.do");
			model.addAttribute("msg", "삭제에 실패하였습니다");
			model.addAttribute("ret", "n");
		}else {
			model.addAttribute("url", "shop.do?frame=1");
			model.addAttribute("msg", "장바구니 전체 삭제에 성공하였습니다");
			model.addAttribute("ret", "y");
		}
		return "alert";
	}
	
	@RequestMapping(value="/selectcartdel.do", method=RequestMethod.POST)
	public String cartselectdelete_post(HttpSession http,@RequestParam("chks")List<Integer> list,Model model) {
		
		int ret = cdao.selectdeletecart(list);	
		System.out.println(ret);
		if(ret == 0) {
			model.addAttribute("url", "cart.do");
			model.addAttribute("msg", "삭제에 실패하였습니다");
			model.addAttribute("ret", "n");
		}else {
			model.addAttribute("url", "cart.do");
			model.addAttribute("msg", "장바구니 물품 삭제에 성공하였습니다");
			model.addAttribute("ret", "y");
		}
		return "alert";
	}
	@RequestMapping(value="/selectcartdel.do", method=RequestMethod.GET)
	public String cartselectdelete(HttpSession http,@RequestParam("no")List<Integer> list,Model model) {
		
		int ret = cdao.selectdeletecart(list);	
		System.out.println(ret);
		if(ret == 0) {
			model.addAttribute("url", "cart.do");
			model.addAttribute("msg", "삭제에 실패하였습니다");
			model.addAttribute("ret", "n");
		}else {
			model.addAttribute("url", "cart.do");
			model.addAttribute("msg", "장바구니 물품 삭제에 성공하였습니다");
			model.addAttribute("ret", "y");
		}
		return "alert";
	}
}
