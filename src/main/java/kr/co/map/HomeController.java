package kr.co.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.map.dto.BoardDto;
import kr.co.map.dto.MapDTO;
import kr.co.map.dto.service.MapService;
import kr.co.map.dto.service.MemberService;


@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired MapService service;
	@Autowired MemberService memberService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("hoem");
		logger.info("hoem");
		//문의타입 리스트
		ArrayList<BoardDto> getQnaTypeInfo = memberService.getQnaType();
	
		
		logger.info("문의타입 불러오기 : " +getQnaTypeInfo );	
		model.addAttribute("getQnaTypeInfo", getQnaTypeInfo); //답변여부정보
		
		ArrayList<BoardDto> bestList = service.bestList();
		// iterator로 next() 한개씩 타입 1,2,3,4 를 가져오고 
		// 만약 가져온 값이 1이고 list에서의 값과 같으면
		//c if 로출력하기
		Iterator<BoardDto> iter  = bestList.iterator();
		BoardDto typeIter = null;
		HashMap<String, Object> result = new HashMap<String, Object>();	
		
		while (iter.hasNext()) {
			typeIter  = iter.next();
			logger.info("Type : " + typeIter.getAnswer_type());
			if(typeIter.getAnswer_type().equals("1")) {
				result.put("type : 1 :: ", typeIter.getAnswer_type());
				logger.info("Type : " + typeIter.getAnswer_type());
			}
		} 
		
		
		
		model.addAttribute("bestList", bestList); //답변여부정보
		
		
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		
		logger.info("login페이지");
		return "login";
	}
	
	@RequestMapping(value = "/logindo", method = RequestMethod.POST)
	public String logindo(Model model,
			@RequestParam String userId, 
			@RequestParam String password,
			HttpSession session) {
		logger.info("userId : "+userId);
		logger.info("password : "+password);
		
		String page="redirect:/";
		
		if(service.logindo(userId,password)) {
			page = "redirect:/";
			session.setAttribute("loginId", userId);
			model.addAttribute("msg","반갑습니다");
		}else {
			model.addAttribute("msg","입력하신 내용이 일치하지 않습니다.");
		}
		ArrayList<BoardDto> getQnaTypeInfo = memberService.getQnaType();
		logger.info("문의타입 불러오기 : " +getQnaTypeInfo );	
		model.addAttribute("getQnaTypeInfo", getQnaTypeInfo); //답변여부정보
			
		
		
		logger.info("login페이지");
		return page;
	}
	
	
	
	
	
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String dologin(Model model,
			@RequestParam HashMap<String, String> params, 
			HttpSession session) {
		
		logger.info("dologin");
		logger.info("userId : "+params.get("userId"));
		logger.info("password : "+params.get("password"));
		
		String page = "login";
		String msg = "아이디와 비밀번호를 확인해주세요.";
		MapDTO dto = service.login(params);
		logger.info("아이디 : " + dto.getMem_id());
		logger.info("setSuccess : " + dto.getSuccess());
		
	
			MapDTO r = dto;
			logger.info("r : " + r.getMem_id());
			
			String userId = dto.getMem_id(); 
			String pass = dto.getMem_pw();
			logger.info("userId아이디 : " + userId);
			logger.info("pass비밀번호 : " + pass);
			
			
			if(params.get("userId") != null) {
				page = "index";
				session.setAttribute("userId", dto.getMem_id());
				logger.info("아이디!= null  : " + dto.getMem_id());
				logger.info("mem_grade  : " + dto.getMem_grade());
				
				msg= "어서오세요";
				model.addAttribute("userId",userId);
				
			}
			if(params.get("userId") == null) {
				page = "login";
				logger.info("아이디== null : " + dto.getMem_id());
				msg = "아이디와 비밀번호를 확인해 주세요";
			}
			
		
		model.addAttribute("msg",msg);
		
		return page;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session,Model model) {
		logger.info("로그아웃 요청");
		
		String msg = "회원만 조회가 가능합니다.";
		model.addAttribute("alretMsg",msg);
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	
	
	
	
}
