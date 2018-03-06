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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.admin_itemdao;
import com.kte.practice.dao.admin_orderdao;
import com.kte.practice.dao.admindao;
import com.kte.practice.dao.memberdao;
import com.kte.practice.dao.shopdao;

@Controller
public class adminController {
	@Autowired
	private admindao adao = null;
	@Autowired
	private admin_itemdao aidao = null;
	@Autowired
	private admin_orderdao aodao = null;
	@Autowired
	private shopdao sdao = null;
	
	@RequestMapping(value="/admin.do",method= RequestMethod.GET)
	public String admine(HttpServletRequest request, HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		int cnt = adao.admincount();
		int icnt = aidao.adminitemcount();
		int icnt2 = aidao.adminitemcount2();
		int ocnt = aodao.adminordercount();
		http.setAttribute("_cnt", cnt);
		http.setAttribute("_icnt", icnt);
		http.setAttribute("_icnt2", icnt2);
		http.setAttribute("_ocnt", ocnt);
		return "admin";
	}
	
	@RequestMapping(value="/admin_member.do",method= RequestMethod.GET)
	public String admin_member(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		
		List<memberVO> list = adao.adminMemberList();
		for(int i=0;i<list.size();i++) {
			try {
				int sell = adao.adminsellcnt(list.get(i).getEmail());
				list.get(i).setSell_cnt(sell);
			}catch(Exception e) {
				list.get(i).setSell_cnt(0);
			}
		}
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
		for(int i=0;i<item_detail.size();i++) {
			total_price+=item_detail.get(i).getQty()*Integer.parseInt(item_detail.get(i).getPrice());
		}
		
		model.addAttribute("vo", mvo);
		model.addAttribute("item_detail", item_detail);
		model.addAttribute("tot", tot);
		model.addAttribute("totalprice", total_price);
		
		return "admin_member_detail";
	}
	
	@RequestMapping(value="/admin_insert_item.do", method=RequestMethod.GET)
	public String insert_item(HttpSession http,Model model) {
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		if(mvo.getCode() != 999) {
			return "redirect:/";
		}
		int lastno = sdao.InsertLastNo();
		String email = mvo.getEmail();
		shopVO vo = new shopVO();
		vo.setNo(lastno+1);
		vo.setMember_email(email);
		model.addAttribute("vo", vo);
		return "admin_insert_item";
	}
	
	@RequestMapping(value="/admin_insert_item.do", method=RequestMethod.POST)
	public String insert_item_post(HttpSession http,Model model,@ModelAttribute("vo")shopVO vo,MultipartHttpServletRequest request) {
		try {
		Map<String, MultipartFile> map = request.getFileMap();
		for(int i=0;i<map.size();i++) {
			MultipartFile tmp = map.get("img_"+(i+1));
			if(tmp != null && !tmp.getOriginalFilename().equals("")) {
				if(i==0) vo.setImg1( tmp.getBytes() );
				if(i==1) vo.setImg2( tmp.getBytes() );
				if(i==2) vo.setImg3( tmp.getBytes() );
				if(i==3) vo.setImg4( tmp.getBytes() );
				if(i==4) vo.setImg5( tmp.getBytes() );
			}
		}
			sdao.insertItem(vo);
			model.addAttribute("url", "admin.do");
			model.addAttribute("msg", "물품등록이 완료되었습니다");
			model.addAttribute("ret", "y");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			
		}
		return "alert";
	}
	
	@RequestMapping(value="/admin_edit_item.do", method=RequestMethod.GET)
	public String edit_item(HttpSession http,Model model,@RequestParam("no")int no) {
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		if(mvo.getCode() != 999) {
			return "redirect:/";
		}
		shopVO vo= aidao.adminselectItemOne(no);
		model.addAttribute("vo", vo);
		return "admin_edit_item";
	}
	
	
	@RequestMapping(value="/admin_edit_item.do", method=RequestMethod.POST)
	public String edit_item_post(HttpSession http,Model model,@ModelAttribute("vo")shopVO vo,MultipartHttpServletRequest request) {
		try {
			shopVO svo= aidao.adminselectItemOne(vo.getNo());
			System.out.println("texet = "+ svo.getImg2());
		Map<String, MultipartFile> map = request.getFileMap();
		for(int i=0;i<map.size();i++) {
			MultipartFile tmp = map.get("img_"+(i+1));
			if(tmp.getSize() == 0) {
				if(i==0) {
					vo.setImg1(svo.getImg1());
				}
				if(i==1) {
					vo.setImg2(svo.getImg2());		
				}
				if(i==2) {
					vo.setImg3(svo.getImg3());		
				}
				if(i==3) {
					vo.setImg4(svo.getImg4());	
				}
				if(i==4) {
					vo.setImg5(svo.getImg5());		
				}
			}
			if(tmp != null && !tmp.getOriginalFilename().equals("")) {
				if(i==0) {
						vo.setImg1( tmp.getBytes() );
				}
				if(i==1) {
						vo.setImg2( tmp.getBytes() );
				}
				if(i==2) {
						vo.setImg3( tmp.getBytes() );
				}
				if(i==3) {
						vo.setImg4( tmp.getBytes() );
				}
				if(i==4) {
						vo.setImg5( tmp.getBytes() );	
				}
			}
		}
			aidao.admineditItem(vo);
			model.addAttribute("url", "admin.do");
			model.addAttribute("msg", "물품수정이 완료되었습니다");
			model.addAttribute("ret", "y");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			
		}
		return "alert";
	}
	
	@RequestMapping(value="/admin_item.do",method= RequestMethod.GET)
	public String admin_item(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		
		String index=null;
		List<shopVO> list = aidao.adminItemList(1);
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
		model.addAttribute("index", index);
		System.out.println("testt = " + index);
		List<shopVO> clist = sdao.selectcode();
		model.addAttribute("clist", clist);
		model.addAttribute("ilist", list);
		
		return "admin_item";
	}
	
	@RequestMapping(value="/admin_item_complete.do",method= RequestMethod.GET)
	public String admin_item_complete(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		List<shopVO> list = aidao.admincompleteItemList();
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
		model.addAttribute("index", index);
		model.addAttribute("ilist", list);
		return "admin_item_complete";
	}
	
	@RequestMapping(value="/admin_order_list.do",method= RequestMethod.GET)
	public String admin_order_list(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		List<orderVO> ilist = aodao.adminorderlist(1);
		List<shopVO> clist = sdao.selectcode();
		List<orderVO> slist = aodao.adminstatelist();
		
		model.addAttribute("clist", clist);
		model.addAttribute("ilist", ilist);
		model.addAttribute("slist", slist);
		return "admin_order_list";
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
