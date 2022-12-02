package kr.co.map.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.map.dto.BoardDto;
import kr.co.map.dto.PageDto;
import kr.co.map.dto.ReviewPageDto;
import kr.co.map.dto.ReviewQnaDto;
import kr.co.map.dto.service.MemberService;

@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;
	
	@RequestMapping(value = "/memberWrite", method = RequestMethod.GET)
	public String memberWrite(Model model) {
		
		logger.info("회원가입 페이지 ");
		
	
		return "member/memberWrite";
	}
	@RequestMapping(value = "/doMemberWrite", method = RequestMethod.POST)
	public String doMemberWrite(Model model, 
			@RequestParam HashMap<String, String> params) {		
		
		logger.info("doMemberWrite 요청");
		
		service.write(params);
		
		return "login";
	}	
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> idCheck(Model model, @RequestParam String userId) {		
		
		logger.info("idCheck 요청");
		
		return service.idCheck(userId);
	}
	
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model,
			HttpSession session) {
		
		logger.info("form페이지");
		//문의타입 리스트
		ArrayList<BoardDto> getQnaTypeInfo = service.getQnaType();
		logger.info("문의타입 불러오기 : " +getQnaTypeInfo );	
		model.addAttribute("getQnaTypeInfo", getQnaTypeInfo); //답변여부정보
				
		return "form";
	}
	@RequestMapping(value = "/doRegistQna", method = RequestMethod.POST)
	public String doRegistQna(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {		
		
		logger.info("doRegistQna 요청");
		String answer_type = params.get("answer_type");
		logger.info("answer_type : " + answer_type);
		logger.info("subject : " + params.get("subject"));
		logger.info("content : " + params.get("content"));
		service.doRegistQna(params, session);		
		model.addAttribute("answer_type",answer_type);
		
		
		return "redirect:/qnaPage?qnaNum=1&reviewNum=1&boardType="+answer_type;
	}
	
	
	// 게시글 조회 페이지
	@RequestMapping(value = "/qnaPage", method = RequestMethod.GET)
	public String qnaPage(Model model,
			@RequestParam("qnaNum") int qnaNum,
			@RequestParam(value="boardType",
			required=false,defaultValue="")int boardType,
			HttpSession session) throws Exception {
		logger.info("qnaPage 요청");		
		PageDto qnaPage = new PageDto();
		qnaPage.setNum(qnaNum);
		qnaPage.setCount(service.qnaSearchCountType(boardType));	
		
		session.setAttribute("qnaNum", qnaNum);
		session.setAttribute("boardType", boardType);
		
		
		logger.info("qnaNum : " +  qnaNum);	
		
		logger.info("회원가입 페이지 ");
		ArrayList<BoardDto> qnaList = service.qnaInfo(qnaPage.getDisplayPost(), qnaPage.getPostNum(),boardType);
		model.addAttribute("qnaList", qnaList); //리스트 보내기
		model.addAttribute("qnaPage", qnaPage); //페이징처리
		model.addAttribute("qnaSelect", qnaNum);//페이징처리	
		
		logger.info("boardType : " +  boardType);	
		logger.info("qnaNum : " +  qnaNum);	
		
		model.addAttribute("boardType", boardType);//페이징처리	
		model.addAttribute("qnaNum", qnaNum);//페이징처리	
		
		
		
		
		logger.info("qnaPage.getPostNum : {}", qnaPage.getPostNum());
		logger.info("qnaPage.getEndPageNum : {}", qnaPage.getEndPageNum());
		logger.info("qnaPage.getStartPageNum : {}", qnaPage.getStartPageNum());
		logger.info("qnaPage.getCount : {}", qnaPage.getCount());
		
		return "member/qnaPage";
	}
	
	
	@RequestMapping(value = "/qnaPageAll", method = RequestMethod.GET)
	public String qnaPageAll(Model model,
			@RequestParam("qnaNum") int qnaNum,
			HttpSession session
			) throws Exception {
		
		session.setAttribute("qnaNum", qnaNum);
		
		
		logger.info("qnaPage 요청");		
		PageDto qnaPage = new PageDto();
		qnaPage.setNum(qnaNum);
		qnaPage.setCount(service.qnaSearchCount());	
		
		logger.info("qnaNum : " +  qnaNum);	
		
		logger.info("회원가입 페이지 ");
		ArrayList<BoardDto> qnaList = service.qnaInfoAll(qnaPage.getDisplayPost(), qnaPage.getPostNum());
		model.addAttribute("qnaList", qnaList); //리스트 보내기
		model.addAttribute("qnaPage", qnaPage); //페이징처리
		model.addAttribute("qnaSelect", qnaNum);//페이징처리	
		
		
		logger.info("qnaNum : " +  qnaNum);	
			
		model.addAttribute("qnaNum", qnaNum);//페이징처리	
		
		
		logger.info("qnaPage.getPostNum : {}", qnaPage.getPostNum());
		logger.info("qnaPage.getEndPageNum : {}", qnaPage.getEndPageNum());
		logger.info("qnaPage.getStartPageNum : {}", qnaPage.getStartPageNum());

		session.removeAttribute("qnaNum");
		session.removeAttribute("boardType");
		
		
		return "member/qnaPage";
	}

	@RequestMapping(value = "/qnaDetail",  method = RequestMethod.GET)
	public String qnaDetail(Model model,
			RedirectAttributes rttr,
			@RequestParam(value="idx", required=false) String idx, /* 게시글 idx */
			@RequestParam(value="qnaNum", required=false) String qnaNum,
			@RequestParam(value="boardType", required=false) String boardType,
			@RequestParam int reviewNum,
			HttpSession session
			) throws Exception {
		
		String  loginId  =  (String) session.getAttribute("loginId");
		logger.info("qnaDetail loginId : {}",loginId);
		String msg = "회원만 조회가 가능합니다.";
		model.addAttribute("alretMsg",msg);

		logger.info("qnaDetail idx 요청999 idx : {}",idx);
		logger.info("qnaDetail qnaNum 요청999 qnaNum : {}",qnaNum);
		logger.info("qnaDetail boardType 요청999 boardType : {}",boardType);
		model.addAttribute("qnaNum",qnaNum);//뒤로가기 페이징 처리
		model.addAttribute("boardType",boardType);//뒤로가기 페이징 처리
		
		
		// qnaNum session으로 받아오기
		if(session.getAttribute("qnaNum") != null) {
			int qnaNumSession1 =  (int) session.getAttribute("qnaNum");
			logger.info("qnaDetail 요청1 qnaNumSession : {}",qnaNumSession1);
			model.addAttribute("qnaNumSession",qnaNumSession1);
			
		}
		if(session.getAttribute("boardType") != null && session.getAttribute("qnaNum") != null) {
			int qnaNumSession2 =  (int) session.getAttribute("qnaNum");
			logger.info("qnaDetail 요청2 qnaNumSession2 : {}",qnaNumSession2);
		
			int boardTypeSession2 = (int) session.getAttribute("boardType");
			logger.info("qnaDetail 요청3 boardTypeSession2 : {}",boardTypeSession2);
			
		}
		BoardDto dto = service.getqnaDetail(idx);
		//조회수 
		
		int viewCnt = 0;
		
		if(session.getAttribute("loginId") != null) { //새로고침시 올라가지 않게 수정할것
			viewCnt = service.viewCount(idx);
		}
		
		ArrayList<BoardDto> getQnaTypeInfo = service.getQnaType();
		int type = Integer.parseInt(dto.getAnswer_type());
		for (int i = 0; i < getQnaTypeInfo.size(); i++) {
			if (getQnaTypeInfo.get(i).getIdx()==type) {
				dto.setAnswer_type(getQnaTypeInfo.get(i).getTypename());
			}
		}	
		PageDto qnaPage = new PageDto();
		PageDto Tdto = service.TgetqnaDetail(idx);
		
		Tdto.getAnswer_type();
		
		// 댓글  Start
		
		ReviewPageDto Rpagedto = new ReviewPageDto(); // 리뷰 페이징 
		Rpagedto.setNum(reviewNum); 
		Rpagedto.setCount(service.searchReviewCount(idx));	// 해당 게시글의 댓글 총수만 가져옴
		
		ArrayList<ReviewQnaDto>reviewlist = service.reviewlist(idx, Rpagedto.getDisplayPost(),Rpagedto.getPostNum());//리뷰호출
		//리뷰 제목이 안들어와서 컨트롤러에 오는지 확인하기
		ReviewQnaDto ddd = new ReviewQnaDto();
		logger.info("getQ_content : "+	ddd.getQ_content());
		
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("reviewNum", reviewNum);
		model.addAttribute("page", Rpagedto);
		model.addAttribute("idx", idx);
		logger.info("qnaDetail reviewNum : {}",reviewNum);
		logger.info("qnaDetail idx 요청999 boardType : {}",idx);
		// 댓글 End	
		model.addAttribute("qnaSelect", qnaPage.getQnaType());//페이징처리	
		
		model.addAttribute("detailInfo", dto);
		model.addAttribute("Answer_type_num", Tdto.getAnswer_type());
		model.addAttribute("viewCnt", viewCnt);
		
		
		
		return "member/qnaDetail";
	}
	
	
	@RequestMapping(value = "/deleteQna", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> deleteQna(
			@RequestParam String idx,
			@RequestParam HashMap<String, String> params) {
		
		logger.info("deleteQna 요청");
		logger.info("idx 요청 :{}",idx);
		logger.info("qnaDetail 요청 qnaNum : {}",params.get("qnaNum"));
		logger.info("qnaDetail 요청 boardType : {}",params.get("boardType"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = service.deleteQna(idx);
		if (result>0) {
			map.put("result", result);		
		}else {
			map.put("result", 0);		
		}		
		return map;
	}
	
	

	@RequestMapping(value = "/updateQna", method = RequestMethod.GET)
	public String updateQna(
			@RequestParam String idx,
			@RequestParam HashMap<String, String> params,
			Model model ) {
		
		BoardDto dto = service.getupdateQna(idx);

		ArrayList<BoardDto> getQnaTypeInfo = service.getQnaType();
		int type = Integer.parseInt(dto.getAnswer_type());
		for (int i = 0; i < getQnaTypeInfo.size(); i++) {
			if (getQnaTypeInfo.get(i).getIdx()==type) {
				dto.setAnswer_type(getQnaTypeInfo.get(i).getTypename());
			}
		}	
		model.addAttribute("updateInfo", dto);
		model.addAttribute("getQnaTypeInfo", getQnaTypeInfo);
		
		return "member/updateQna";
	}
	
	@RequestMapping(value = "/doUpdateQna", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> doUpdateQna(
			@RequestParam String idx,
			@RequestParam HashMap<String, String> params,
			
			HttpSession session) {
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			String sessionloginId =  (String) session.getAttribute("loginId"); 
			String paramsuserId =  params.get("userId");
			logger.info("doUpdateQna 요청1");
			logger.info("sessionloginId :  " +sessionloginId);
			logger.info("paramsuserId : "+paramsuserId);
			
			String msg = "수정은 글 쓴 회원만 가능합니다";
			
				logger.info("doUpdateQna 요청2");
				int result = service.doUpdateQna(params);
				map.put("result", result);		
		
				map.put("msg", msg);		
				
			
			// qnaNum session으로 받아오기
			if(session.getAttribute("qnaNum") != null) {
				int qnaNumSession =  (int) session.getAttribute("qnaNum");
				logger.info("qnaDetail 요청 qnaNumSession : {}",qnaNumSession);
				
			}else if(session.getAttribute("boardType") != null && session.getAttribute("qnaNum") != null) {
				int qnaNumSession =  (int) session.getAttribute("qnaNum");
				logger.info("qnaDetail 요청 qnaNumSession : {}",qnaNumSession);
			
				int boardTypeSession = (int) session.getAttribute("boardType");
				logger.info("qnaDetail 요청 boardTypeSession : {}",boardTypeSession);
				
			}
			
		return map;
	}
	
	
	@RequestMapping(value = "/reviewupdate", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> reviewupdate(HttpSession session,
			@RequestParam String reviewsubject,
			@RequestParam String reviewcontent,
			@RequestParam int idx) {
		
		String userId = (String) session.getAttribute("loginId");
		logger.info("reviewupdate 도착");
		
		logger.info(" int userId reviewsubject reviewcontent : "+userId,reviewsubject,reviewcontent);
		ReviewQnaDto dto = new ReviewQnaDto();
		dto.setB_idx(idx);
		dto.setSubject(reviewsubject);
		dto.setContent(reviewcontent);
		dto.setUserId(userId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = service.reviewupdate(dto,idx);
		map.put("success", result);
		logger.info(" int result : "+result);
		
		return map;
	}
	
	
	
}
