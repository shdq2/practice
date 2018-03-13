package com.kte.practice;

import java.util.List;

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

import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.onetooneVO;
import com.kte.practice.VO.qnaVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.board_qnaDAO;
import com.kte.practice.dao.onetooneDAO;
import com.kte.practice.dao.shopdao;

@Controller
public class BoardController {
	@Autowired
	private onetooneDAO odao = null;
	@Autowired
	private shopdao sdao = null;
	@Autowired
	private board_qnaDAO qdao = null;
	
	@RequestMapping(value="onetoone.do",method=RequestMethod.GET)
	public String onetoone(HttpSession http,Model model) {
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		List<onetooneVO> list = odao.OnetooneList(mvo.getEmail());
		model.addAttribute("list", list);
		List<shopVO> codelist=sdao.selectcode();
		model.addAttribute("clist", codelist);
		return "onetoone";
	}
	@RequestMapping(value="onetoonew.do",method=RequestMethod.GET)
	public String onetoonew(Model model,HttpSession http) {
		List<shopVO> codelist=sdao.selectcode();
		model.addAttribute("clist", codelist);
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		onetooneVO ovo = new onetooneVO();
		ovo.setOne_writer(mvo.getEmail());
		ovo.setWriter_name(mvo.getName());
		int last = odao.onetooneLastNo();
		ovo.setOne_no(last+1);
		model.addAttribute("ovo", ovo);
		
		return "onetoonew";
	}
	
	@RequestMapping(value="onetoonew.do",method=RequestMethod.POST)
	public String onetoonew_p(Model model,HttpSession http,@ModelAttribute("ovo")onetooneVO ovo,MultipartHttpServletRequest request) {
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		try {
			MultipartFile tmp= request.getFile("img");
			if(tmp !=null && !tmp.getOriginalFilename().equals("")) {
				ovo.setOne_img1(tmp.getBytes());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		int ret = odao.InsertOnetoone(ovo);
		if( ret == 1) {
			model.addAttribute("url", "onetoone.do");
			model.addAttribute("msg", "문의가 등록되었습니다");
			model.addAttribute("ret", "y");
		}
		else {
			model.addAttribute("url", "onetoonew.do");
			model.addAttribute("msg", "문의가 등록되지 않았습니다");
			model.addAttribute("ret", "y");
		}
		return "alert";
	}
	
	@RequestMapping(value="	onetooneanswer.do",method=RequestMethod.GET)
	public String onetooneanswer(HttpSession http,Model model,@RequestParam("no")int no) {
		memberVO mvo = (memberVO)http.getAttribute("_mvo");
		List<shopVO> codelist=sdao.selectcode();
		model.addAttribute("clist", codelist);
		
		onetooneVO vo = new onetooneVO();
		vo.setOne_no(no);
		vo.setOne_writer(mvo.getEmail());
		
		onetooneVO ovo = odao.selectOnetoone(vo);
		model.addAttribute("ovo", ovo);
		return "onetooneanswer";
	}
	
	@RequestMapping(value="boardqna.do",method=RequestMethod.GET)
	public String boardqna(Model model) {
		List<shopVO> codelist=sdao.selectcode();
		model.addAttribute("clist", codelist);
		List<qnaVO> qlist = qdao.qna_list();
		model.addAttribute("qlist", qlist);
		return "boardqna";
	}
	

			
	@RequestMapping(value="qna_detail.do",method=RequestMethod.GET)
	public String qna_detail(@RequestParam("no")int no,Model model) {
		List<shopVO> codelist=sdao.selectcode();
		model.addAttribute("clist", codelist);
		qnaVO vo = qdao.selectqna(no);
		model.addAttribute("vo", vo);
		int maxno=qdao.maxqna(no);
		int minno=qdao.minqna(no);
		model.addAttribute("max", maxno);
		model.addAttribute("min", minno);
		return "boardqnadetail";
	}
	
}
