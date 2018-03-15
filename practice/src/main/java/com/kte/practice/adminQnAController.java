package com.kte.practice;

import java.io.InputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.onetooneVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.qnaVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.admin_itemdao;
import com.kte.practice.dao.admin_onetooneDAO;
import com.kte.practice.dao.admin_orderdao;
import com.kte.practice.dao.admindao;
import com.kte.practice.dao.board_qnaDAO;
import com.kte.practice.dao.memberdao;
import com.kte.practice.dao.onetooneDAO;
import com.kte.practice.dao.shopdao;

@Controller
public class adminQnAController {
	@Autowired
	private admindao adao = null;
	@Autowired
	private admin_itemdao aidao = null;
	@Autowired
	private admin_orderdao aodao = null;
	@Autowired
	private shopdao sdao = null;
	@Autowired
	private admin_onetooneDAO odao = null;
	@Autowired
	private onetooneDAO odao2 = null;
	@Autowired
	private board_qnaDAO qdao = null;
	

	
	@RequestMapping(value="/admin_qna_detail.do",method= RequestMethod.GET)
	public String admin_qnadetail(HttpServletRequest request, HttpSession http,Model model,
			@RequestParam("no")int no) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		qnaVO qvo = qdao.selectqna(no);
		model.addAttribute("qvo", qvo);
		return "admin_qnadetail";
	}
	
	@RequestMapping(value="/qna_write.do",method= RequestMethod.GET)
	public String qnaw(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		qnaVO qvo = new qnaVO();
		int last = qdao.qnalast()+1;
		qvo.setQna_no(last);
		model.addAttribute("qvo", qvo);
		return "qna_write";
	}
	
	@RequestMapping(value="/qna_write.do",method= RequestMethod.POST)
	public String qnaw_p(HttpServletRequest request, HttpSession http,Model model,
			@ModelAttribute("qvo")qnaVO qvo) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		int ret = qdao.insertqna(qvo);
		if(ret == 1) {
			model.addAttribute("url", "admin_qna.do");
			model.addAttribute("msg", "QnA 등록에 성공하였습니다");
			model.addAttribute("ret", "y");
		}
		else {
			model.addAttribute("url", "qna_write.do?no="+qvo.getQna_no());
			model.addAttribute("msg", "QnA 등록에 실패하였습니다");
			model.addAttribute("ret", "n");
		}
		return "redirect:admin_qna.do";
	}
	
	
	@RequestMapping(value="/qna_edit.do",method= RequestMethod.GET)
	public String qnae(HttpServletRequest request, HttpSession http,Model model,@RequestParam("no")int no) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		qnaVO qvo = qdao.selectqna(no);
		model.addAttribute("qvo", qvo);
		return "qna_edit";
	}
	
	@RequestMapping(value="/qna_edit.do",method= RequestMethod.POST)
	public String qnae_p(HttpServletRequest request, HttpSession http,Model model,
			@ModelAttribute("qvo")qnaVO qvo) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		int ret = qdao.updateqna(qvo);
		if(ret == 1) {
			model.addAttribute("url", "admin_qna.do");
			model.addAttribute("msg", "QnA를 수정하는데 성공하였습니다");
			model.addAttribute("ret", "y");
		}
		else {
			model.addAttribute("url", "qna_edit.do?no="+qvo.getQna_no());
			model.addAttribute("msg", "QnA를 수정하는데 실패하였습니다");
			model.addAttribute("ret", "n");
		}
		return "alert";
	}
	
	
	@RequestMapping(value="/admin_qna.do",method= RequestMethod.GET)
	public String admin_qna(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		List<qnaVO> qlist = qdao.qna_list();
		model.addAttribute("qlist", qlist);
		return "admin_qna";
	}
	
	@RequestMapping(value="/admin_answer_info.do",method= RequestMethod.GET)
	public String admin_answer_info(HttpServletRequest request,Model model ,HttpSession http,
			@RequestParam("no")int no,
			@RequestParam("email")String email) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		
		onetooneVO ovo =new onetooneVO();
		ovo.setOne_writer(email);
		ovo.setOne_no(no);
		ovo = odao2.selectOnetoone(ovo);
		
		model.addAttribute("ovo", ovo);
		return "admin_answer_info";
	}
	
	@RequestMapping(value="/admin_onetoone.do",method= RequestMethod.GET)
	public String admin_setting(HttpServletRequest request, HttpSession http,Model model) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		List<onetooneVO> olist = odao.adminonetooneList(2);
		model.addAttribute("olist", olist);
		return "admin_onetoone";
	}
	
	@RequestMapping(value="/admin_answer.do",method= RequestMethod.GET)
	public String admin_answer(HttpServletRequest request,Model model ,HttpSession http,@RequestParam("no")int no) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		onetooneVO ovo = odao.selectOnetoone(no);
		model.addAttribute("ovo", ovo);
		return "admin_answer";
	}
	
	@RequestMapping(value="/admin_answer.do",method= RequestMethod.POST)
	public String admin_answer_p(@ModelAttribute("ovo")onetooneVO ovo,Model model ,HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		if(vo.getCode() != 999) {
			return "redirect:/";
		}
		
		try {
			odao.admin_answer_insert(ovo);
			model.addAttribute("url", "admin_onetoone.do");
			model.addAttribute("msg", "1:1문의 답변이 등록되었습니다");
			model.addAttribute("ret", "y");
		} catch (Exception e) {
			model.addAttribute("url", "admin_answer.do");
			model.addAttribute("msg", "1:1문의 답변 등록을 실패하였습니다");
			model.addAttribute("ret", "n");
		}		
		int onecnt = adao.onetoonecount();
		http.setAttribute("_onecnt", onecnt);
		return "alert";
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping(value="onetoone_img.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> shop_img(Model model,@RequestParam("code")String code,HttpServletRequest request,@RequestParam(value="img",defaultValue="1")int img,HttpSession http) {
		 ResponseEntity<byte[]> r_data = null;
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.IMAGE_JPEG);
		byte[] imgs=null;
		try {
			 InputStream is = request.getSession().getServletContext().getResourceAsStream("/resources/img/default.jpg");
			 imgs = IOUtils.toByteArray(is);
			 onetooneVO vo = odao.selectBlob(code);
			 	if(vo.getOne_img1() != null && img == 1) {
					imgs = vo.getOne_img1();
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
