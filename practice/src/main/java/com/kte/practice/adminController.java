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
	public String admine(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		int cnt = adao.admincount();
		int icnt = aidao.adminitemcount();
		int icnt2 = aidao.adminitemcount2();
		int ocnt = aodao.adminordercount();
		int onecnt = adao.onetoonecount();
		http.setAttribute("_onecnt", onecnt);
		http.setAttribute("_cnt", cnt);
		http.setAttribute("_icnt", icnt);
		http.setAttribute("_icnt2", icnt2);
		http.setAttribute("_ocnt", ocnt);
		
		//오늘 어제 가입자 현황///////////////
		int chk1,chk2;
		float today = adao.todayinsert();
		float yesterday = adao.yesterdayinsert()-today;
		if(yesterday ==0)yesterday = 1;
		float yesterday2 = adao.yesterday2()-adao.yesterdayinsert();
		if(yesterday2 ==0) yesterday2 = 1;
		
		float todayinsert = today/yesterday *100;
			
		float yesterdayinsert = yesterday/yesterday2*100;
		if(today > yesterday)
			chk1 = 1;
		else if(today <yesterday)
			chk1 = 2;
		else chk1 = 3;
		if(yesterday>yesterday2)
			chk2 = 1;
		else if(yesterday<yesterday2)
			chk2=2;
		else chk2 =3;
		
		model.addAttribute("today", (int)today);
		model.addAttribute("yesterday", (int)yesterday);
		
		model.addAttribute("chk1", chk1);
		model.addAttribute("chk2", chk2);
		
		model.addAttribute("todayinsert", (int)todayinsert);
		model.addAttribute("yesterdayinsert", (int)yesterdayinsert);
		////////////////////////////
		/////월간/////
		int chk3,chk4;
		
		float this_month = adao.thismonth();
			if(this_month == 0) this_month = 1;
		float pre_month = adao.premonth();
			if(pre_month == 0) pre_month = 1;
		float pre_month2 = adao.premonth2();
			if(pre_month2 == 0) pre_month2 = 1;
			
		if(this_month >pre_month)
			chk3 = 1;
		else if(this_month <pre_month)
			chk3 = 2;
		else
			chk3=3;
		
		if(pre_month >pre_month2)
			chk4 = 1;
		else if(pre_month >pre_month2)
			chk4 = 2;
		else
			chk4 = 3;
		
		float i_this_month = this_month/pre_month*100;
		float i_pre_month = pre_month/pre_month2*100;
		
		
		model.addAttribute("this_month", (int)this_month);
		model.addAttribute("pre_month", (int)pre_month);
		model.addAttribute("pre_month2", (int)pre_month2);
		
		model.addAttribute("i_pre_month", (int)i_pre_month);
		model.addAttribute("i_this_month", (int)i_this_month);
		model.addAttribute("chk3", chk3);
		model.addAttribute("chk4", chk4);
		System.out.println("이번달 : " + this_month +"/ "+ i_this_month);
		System.out.println("저번달 : " + pre_month +"/ "+ i_pre_month);
		
		////
		
		
		////////// 판매현황/////////////////
		float icount = aidao.adminitemcount();
		float icount2 = aidao.adminitemcount2();
		float all_count = icount+icount2;
		
		float i_state = icount/all_count * 100;
		float state1=0,state2=0,state3=0,state4 = 0,state5=0,state6=0;
		
		float ocount = adao.order_count();
		
		List<orderVO> ilist = adao.state_count();
		for(int i=0;i<ilist.size();i++) {
			if(ilist.get(i).getState() ==1 ) {
				state1 = (float)ilist.get(i).getState_count();
			}
			if(ilist.get(i).getState() ==2 ) {
				state2 = (float)ilist.get(i).getState_count();			
			}
			if(ilist.get(i).getState() ==3 ) {
				state3 = (float)ilist.get(i).getState_count();
			}
			if(ilist.get(i).getState() ==4 ) {
				state4 = (float)ilist.get(i).getState_count();
			}
			if(ilist.get(i).getState() ==5 ) {
				state5 = (float)ilist.get(i).getState_count();
			}
			if(ilist.get(i).getState() ==6 ) {
				state6 = (float)ilist.get(i).getState_count();
			}
		}
		
		model.addAttribute("all_count", (int)all_count);
		model.addAttribute("i_count", (int)icount);
		model.addAttribute("i_state", (int)i_state);
		model.addAttribute("state1", (int)state1);
		model.addAttribute("state2", (int)state2);
		model.addAttribute("state3", (int)state3);
		model.addAttribute("state4", (int)state4);
		model.addAttribute("state5", (int)state5);
		model.addAttribute("state6", (int)state6);
		model.addAttribute("ocount", (int)ocount);
		model.addAttribute("i_state1", (int)(state1/ocount * 100));
		model.addAttribute("i_state2", (int)(state2/ocount * 100));
		model.addAttribute("i_state3", (int)(state3/ocount * 100));
		model.addAttribute("i_state4", (int)(state4/ocount * 100));
		model.addAttribute("i_state5", (int)(state5/ocount * 100));
		model.addAttribute("i_state6", (int)(state6/ocount * 100));
		/////////////////////
		/////////////////// qna 현황 ///////////////////
			float qcount = adao.onetooneallcount();
			float ncount = adao.onetoonecount();
			float acount = qcount - ncount;
			
			float i_ncount = ncount/qcount*100;
			float i_acount = 100-i_ncount;
			model.addAttribute("q_count", (int)qcount);
			model.addAttribute("n_count", (int)ncount);
			model.addAttribute("a_count", (int)acount);
			model.addAttribute("i_ncount", (int)i_ncount);
			model.addAttribute("i_acount", (int)i_acount);
		////////////////////////////
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
	

	
}
