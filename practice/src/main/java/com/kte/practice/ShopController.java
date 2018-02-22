package com.kte.practice;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.shopdao;

@Controller
public class ShopController {
	@Autowired
	private shopdao sdao = null;
	
	@RequestMapping(value="/shop.do", method=RequestMethod.GET)
	public String shop(@RequestParam(value="frame",defaultValue="0")int frame,HttpSession http,Model model) {
		List<shopVO> list = new ArrayList<shopVO>();
		list = sdao.selectshop(frame);
		cartVO vo = new cartVO();
		int no = sdao.cartLastNo();
		vo.setNo(no+1);
		model.addAttribute("list",list);
		model.addAttribute("cvo",vo);
		return "shop";
	}
	
	@RequestMapping(value="/boardListSearch.do", method=RequestMethod.GET)
	public String boardListSearch(@RequestParam(value="data",defaultValue="0")String search,HttpSession http,Model model) {
		List<shopVO> list = new ArrayList<shopVO>();
		cartVO vo = new cartVO();
		model.addAttribute("cvo",vo);
		list = sdao.searchshop(search);		
		model.addAttribute("list",list);		 
		
		return "shop";
	}
	
	@RequestMapping(value="/insert_item.do", method=RequestMethod.GET)
	public String insert_item(HttpSession http,Model model) {
		shopVO vo = new shopVO();
		model.addAttribute("vo", vo);
		return "insert_item";
	}
	
	@RequestMapping(value="/insert_item.do", method=RequestMethod.POST)
	public String insert_item_post(HttpSession http,Model model,@ModelAttribute("vo")shopVO vo,MultipartHttpServletRequest request) {
		try {
		Map<String, MultipartFile> map = request.getFileMap();
		for(int i=0;i<map.size();i++) {
			MultipartFile tmp = map.get("img"+(i+1));
			if(tmp != null && !tmp.getOriginalFilename().equals("")) {
				System.out.println("i="+tmp.getBytes());
				if(i==0) vo.setImg1( tmp.getBytes() );
				if(i==1) vo.setImg2( tmp.getBytes() );

			}
		}
		}catch(Exception e) {
			
		}
		return "redirect:insert_item.do";
	}
}
