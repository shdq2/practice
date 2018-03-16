package com.kte.practice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.shopVO;
import com.kte.practice.dao.memberdao;
import com.kte.practice.dao.shopdao;

@Controller
public class memberController {
	
	@Autowired
	private memberdao mdao = null;
	@Autowired
	private shopdao sdao = null;
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join(Model model) {
		memberVO vo = new memberVO();
		List<shopVO> clist = sdao.selectcode();
		model.addAttribute("clist", clist);
		model.addAttribute("vo", vo);
		return "join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute("vo") memberVO vo,HttpSession http,Model model) {
		String url = (String)http.getAttribute("_url");
		mdao.memberinsert(vo);
		model.addAttribute("url", url);
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		model.addAttribute("ret", "y");
		return "alert";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(Model model) {
		memberVO vo = new memberVO();
		List<shopVO> clist = sdao.selectcode();
		model.addAttribute("clist", clist);
		model.addAttribute("vo", vo);
		return "login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_p(@ModelAttribute("id")String id,
			@ModelAttribute("pw")String pw,
			Model model,
			HttpSession http) {
		String url = (String)http.getAttribute("_url");
		memberVO vo = new memberVO();
		vo.setEmail(id);
		vo.setPw(pw);
		memberVO mvo = mdao.memberLogin(vo);
		if(mvo == null) {
			model.addAttribute("url", "login.do");
			model.addAttribute("msg", "회원정보가 일치하지 않습니다");
			model.addAttribute("ret", "n");
			return "alert";
		}else {
			if(mvo.getCode()==1) {
				if(mvo.getBlock() == 1) {
					http.setAttribute("_mvo", mvo);
					model.addAttribute("url", url);
					model.addAttribute("msg", "로그인에 성공하였습니다");
					model.addAttribute("ret", "y");
				}else {
					model.addAttribute("url", "/practice/");
					model.addAttribute("msg", "차단된 아이디 입니다.");
					model.addAttribute("ret", "n");
				}
				return "alert";
			}
			else {
				http.setAttribute("_mvo", mvo);
					
				return "redirect:admin.do";
			}
		}
		
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit(Model model,HttpSession http) {
		memberVO vo = (memberVO)http.getAttribute("_mvo");
		List<shopVO> clist = sdao.selectcode();
		model.addAttribute("clist", clist);
		model.addAttribute("vo", vo);
		return "edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String edit_post(Model model,HttpSession http,@ModelAttribute("vo")memberVO vo) {
		mdao.memberUpdate(vo);
		model.addAttribute("msg", "회원정보 수정이 완료되었습니다.");
		model.addAttribute("url", "/practice/");
		return "alert";
	}
	
	@RequestMapping(value="/memberdelete.do", method=RequestMethod.GET)
	public String delete(Model model,HttpSession http) {
		memberVO rvo = new memberVO();
		model.addAttribute("vo", rvo);
		return "memberdelete";
	}
	
	@RequestMapping(value="/memberdelete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute("vo")memberVO vo,HttpSession http,Model model) {
		memberVO hvo = (memberVO)http.getAttribute("_mvo");
		hvo.setPw(vo.getPw());
		mdao.memberdelete(hvo);
		http.invalidate();
		model.addAttribute("msg", "회원탈퇴에 성공하였습니다");
		model.addAttribute("ret", "y");
		model.addAttribute("url", "/practice/");
		return "alert";
	}
	
	@RequestMapping(value="/changepw.do", method=RequestMethod.GET)
	public String changepw(Model model,HttpSession http) {
		String chcode = (String)http.getAttribute("_changecode");
		if(chcode == null) {
			http.setAttribute("_changecode", "0");
		}
		memberVO rvo = (memberVO)http.getAttribute("_mvo");
		rvo.setPw("");
		List<shopVO> clist = sdao.selectcode();
		model.addAttribute("clist", clist);
		model.addAttribute("vo", rvo);
		return "changepw";
	}
	
	@RequestMapping(value="/changepw.do", method=RequestMethod.POST)
	public String changepw_post(Model model,HttpSession http,@ModelAttribute("vo")memberVO vo) {
		String chcode = (String)http.getAttribute("_changecode");
		
		if(chcode=="0") {
			memberVO rvo = mdao.memberLogin(vo);
			if(rvo == null) {
				http.setAttribute("_changecode", "0");
				model.addAttribute("url", "changepw.do");
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다");
				model.addAttribute("ret", "n");
				return "alert";
			}else {
				http.setAttribute("_changecode", "1");
				return "redirect:changepw.do";
			}
		}else {			
			mdao.changepw(vo);
			http.setAttribute("_changecode", "0");
			model.addAttribute("url", "/practice/");
			model.addAttribute("msg", "비밀번호가 정상적으로 수정되었습니다.");
			model.addAttribute("ret", "y");
			return "alert";
		}		
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(Model model,HttpSession http) {
		String url = (String)http.getAttribute("_url");
		http.invalidate();
		model.addAttribute("url", "/practice/");
		model.addAttribute("msg", "정상적으로 로그아웃 되었습니다.");
		model.addAttribute("ret", "y");
		return "alert";
	}
	
	@RequestMapping(value="/idcheck.do",method= RequestMethod.GET)
	public @ResponseBody boolean idcheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("email");
		int ret = mdao.memberidcheck(id);
		if(ret == 1) {return false; }
		return true;
	}
}
