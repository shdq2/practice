package com.kte.practice;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.shopdao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private shopdao sdao = null;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession http) {
		
		List<shopVO> list = sdao.sales_all();
		cartVO vo = new cartVO();
		vo.setNo(sdao.cartLastNo()+1);
		
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
		
		model.addAttribute("list", list);
		model.addAttribute("index", index);
		model.addAttribute("cvo", vo);
		List<shopVO> codelist=sdao.selectcode();
		model.addAttribute("clist", codelist);
		return "home";
	}

}
