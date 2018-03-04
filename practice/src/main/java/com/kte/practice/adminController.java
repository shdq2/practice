package com.kte.practice;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.dao.admindao;
import com.kte.practice.dao.memberdao;

@Controller
public class adminController {
	@Autowired
	private admindao adao = null;
	@RequestMapping(value="/admin.do",method= RequestMethod.GET)
	public String admine(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin";
	}
	
	@RequestMapping(value="/admin_member.do",method= RequestMethod.GET)
	public String admin_member(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		
		List<memberVO> list = adao.adminMemberList();
		model.addAttribute("list", list);
		
		return "admin_member";
	}
	@SuppressWarnings("null")
	@RequestMapping(value="/admin_member_detail.do",method= RequestMethod.GET)
	public String admin_member_detail(@RequestParam("email")String email,@RequestParam(value="page",defaultValue="1")int page, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		page=(page-1)*10;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("page", page);
		memberVO mvo = adao.selectmemberOne(email);
		List<orderVO> item_detail = adao.adminmemberorder(map);
		int tot = ((adao.totalpage(email)-1)/10)+1;
		int total_price = 0;
		List<orderVO> item_l = adao.graph(email);
		for(int i=0;i<item_detail.size();i++) {
			total_price+=item_detail.get(i).getQty()*Integer.parseInt(item_detail.get(i).getPrice());			
		}
		int size = item_l.size();
		/*List<String> ar = new ArrayList<String>();*/
		String msg="[";
		for(int i=0;i<size;i++) {
			if(i<size-1)
				msg += "{"+item_l.get(i).getPrice()+","+item_l.get(i).getQty()+","+item_l.get(i).getDate1()+"}"+",";
			else{
				msg += "{"+item_l.get(i).getPrice()+","+item_l.get(i).getQty()+","+item_l.get(i).getDate1()+"}";
			}
		}
		model.addAttribute("vo", mvo);
		model.addAttribute("item_detail", item_detail);
		model.addAttribute("tot", tot);
		model.addAttribute("totalprice", total_price);
		model.addAttribute("msg", msg);

		model.addAttribute("size", size);
		return "admin_member_detail";
	}
	
	@RequestMapping(value="/admin_item.do",method= RequestMethod.GET)
	public String admin_item(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin_item";
	}
	@RequestMapping(value="/admin_qna.do",method= RequestMethod.GET)
	public String admin_qna(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin_qna";
	}
	@RequestMapping(value="/admin_setting.do",method= RequestMethod.GET)
	public String admin_setting(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		return "admin_setting";
	}
	
}
