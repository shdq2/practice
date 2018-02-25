package com.kte.practice;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		String index=null;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg1() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				index= "1,";
			}
			if(list.get(i).getImg2() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "2,";
				else index+="2";
			}
			if(list.get(i).getImg3() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "3,";
				else index+="3";
			}
			if(list.get(i).getImg4() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "4,";
				else index+="4";
			}
			if(list.get(i).getImg5() != null) {
				list.get(i).setTot(list.get(i).getTot()+1);
				if(index == null) index= "5,";
				else index+="5";
			}
		}
		model.addAttribute("list",list);
		model.addAttribute("cvo",vo);
		model.addAttribute("index",index);
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
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		int lastno = sdao.InsertLastNo();
		String email = mvo.getEmail();
		shopVO vo = new shopVO();
		vo.setNo(lastno+1);
		vo.setMember_email(email);
		model.addAttribute("vo", vo);
		return "insert_item";
	}
	
	@RequestMapping(value="/insert_item.do", method=RequestMethod.POST)
	public String insert_item_post(HttpSession http,Model model,@ModelAttribute("vo")shopVO vo,MultipartHttpServletRequest request) {
		try {
		Map<String, MultipartFile> map = request.getFileMap();
		for(int i=0;i<map.size();i++) {
			MultipartFile tmp = map.get("img_"+(i+1));
			if(tmp != null && !tmp.getOriginalFilename().equals("")) {
				if(i==0) vo.setImg1( tmp.getBytes() );
				if(i==1) vo.setImg2( tmp.getBytes() );
				if(i==2) vo.setImg2( tmp.getBytes() );
				if(i==3) vo.setImg2( tmp.getBytes() );
				if(i==4) vo.setImg2( tmp.getBytes() );
			}
			sdao.insertItem(vo);
			model.addAttribute("url", "/practice/");
			model.addAttribute("msg", "물품등록이 완료되었습니다");
			model.addAttribute("ret", "y");
		}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "alert";
	}
	@SuppressWarnings("finally")
	@RequestMapping(value="shop_img.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> shop_img(Model model,@RequestParam("code")String code,HttpServletRequest request,@RequestParam("img")int img,HttpSession http) {
		 ResponseEntity<byte[]> r_data = null;
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.IMAGE_JPEG);
		byte[] imgs=null;
		try {
			 /*InputStream is = request.getSession().getServletContext().getResourceAsStream("/resources/img/default.jpg");
			 imgs = IOUtils.toByteArray(is);*/
			 shopVO vo = sdao.selectBlobImage(code);
			 	if(vo.getImg1() != null && img == 1) {
					imgs = vo.getImg1();
				}
				else if(vo.getImg2() != null && img == 2) {
					imgs = vo.getImg2();
				}
				else if(vo.getImg3() != null && img == 3) {
					imgs = vo.getImg3();
				}
				else if(vo.getImg4() != null && img == 4) {
					imgs = vo.getImg4();
				}
				else if(vo.getImg5() != null && img == 5) {
					imgs = vo.getImg5();
				}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			r_data = new ResponseEntity<byte[]>(imgs,header,HttpStatus.OK);
			model.addAttribute("_count", imgs);

			return r_data;
		}
	}
}
