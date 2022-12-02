package kr.co.map.dto.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.map.dao.MemberDao;
import kr.co.map.dto.BoardDto;
import kr.co.map.dto.MemberDto;
import kr.co.map.dto.PageDto;
import kr.co.map.dto.ReviewPageDto;
import kr.co.map.dto.ReviewQnaDto;

@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberDao dao;
	
	public void write(HashMap<String, String> params) {
		
		MemberDto dto = new MemberDto();
		dto.setUserId(params.get("userId"));
		dto.setPassword(params.get("password"));
		dto.setUsername(params.get("username"));
		dto.setPhone(params.get("phone"));
		dto.setEmail(params.get("email"));
		dto.setZipcode(params.get("zipcode"));
		dto.setAddress(params.get("address"));
		dto.setAddress_detail(params.get("address_detail"));
		dto.setBirthday(params.get("birthday"));
		dto.setGender(params.get("gender"));
		dto.setMem_flg(1);
		logger.info("회원가입 정보 : {}"
				, params.get("userId")+"/"+params.get("password")+"/"+params.get("username")+"/"+params.get("email")
				+"/"+params.get("zipcode")+"/"+params.get("address")+"/"+params.get("address_detail")
				+"/"+params.get("birthday")+"/"+params.get("gender")+"/"+params.get("personInfo_flg")+"/"+params.get("marketing_flg"));
			
		dao.write(dto);
		
	}

	public HashMap<String, Object> idCheck(String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String result = dao.idCheck(userId);
		boolean check = result == null? false:true;
		map.put("result", check);
		
		return map;
	}

	public ArrayList<BoardDto> getQnaType() {
		// TODO Auto-generated method stub
		return dao.getQnaType();
	}

	public int doRegistQna(HashMap<String, String> params, HttpSession session) {
		BoardDto dto = new BoardDto();		
		MemberDto udto = dao.findInfo((String)session.getAttribute("loginId"));
		
		dto.setSubject(params.get("subject"));
		dto.setContent(params.get("content"));
		dto.setAnswer_type(params.get("answer_type"));
		logger.info("service answer_type : "+ params.get("answer_type"));
		dto.setUserId((String)session.getAttribute("loginId"));
		dto.setU_idx(udto.getIdx());
		
		return dao.doRegistQna(dto);
		
	}

	public ArrayList<BoardDto> qnaInfo(int displayPost, int postNum, int boardType) {
		
		PageDto dto = new PageDto();
		dto.setPostNum(postNum);
		dto.setDisplayPost(displayPost);
		dto.setBoardType(boardType);
		logger.info("displayPost : {}", displayPost);	
		logger.info("postNum : {}", postNum);
		logger.info("getPostNum : {}", dto.getPostNum());
		logger.info("getEndPageNum : {}", dto.getEndPageNum());
		logger.info("getStartPageNum : {}", dto.getStartPageNum());
		
		return dao.qnaInfo(dto);
		
	}

	public int qnaSearchCount() {
		
		PageDto dto = new PageDto();
		 
		
		return dao.qnaSearchCount(dto);
	}

	public ArrayList<BoardDto> qnaInfoAll(int displayPost, int postNum) {
		PageDto dto = new PageDto();
		dto.setPostNum(postNum);
		dto.setDisplayPost(displayPost);	logger.info("displayPost : {}", displayPost);	
		logger.info("postNum : {}", postNum);
		
		return dao.qnaInfoAll(dto);
	}

	public int qnaSearchCountType(int boardType) {
		PageDto dto = new PageDto();
		dto.setBoardType(boardType);
		
		return dao.qnaSearchCountType(dto);
	}

	public BoardDto getqnaDetail(String idx) {
		BoardDto dto = new BoardDto();
		return dao.getQnaDetail(idx);
	}

	public PageDto TgetqnaDetail(String idx) {
		// TODO Auto-generated method stub
		return dao.TgetqnaDetail(idx);
	}

	public int viewCount(String idx) {
		// TODO Auto-generated method stub
		return dao.viewCount(idx);
	}

	public int deleteQna(String idx) {
		// TODO Auto-generated method stub
		return dao.deleteQna(idx);
	}

	public BoardDto getupdateQna(String idx) {
		// TODO Auto-generated method stub
		return dao.getupdateQna(idx);
	}

	public ArrayList<BoardDto> getQnaType_update(String idx) {
		// TODO Auto-generated method stub
		return dao.getQnaType_update(idx);
	}

	public int doUpdateQna(HashMap<String, String> params) {
		
		BoardDto dto = new BoardDto();
		dto.setContent(params.get("content"));
		dto.setIdx(Integer.parseInt(params.get("idx")));
		dto.setSubject(params.get("subject"));
		
		return dao.doUpdateQna(dto);
	}

	public int searchReviewCount(String idx) {
		// TODO Auto-generated method stub
		return dao.searchReviewCount(idx);
	}

	public ArrayList<ReviewQnaDto> reviewlist(String idx, int displayPost, int postNum) {
		
		ReviewPageDto dto = new ReviewPageDto();
		dto.setDisplayPost(displayPost);
		dto.setPostNum(postNum);
		dto.setIdx(Integer .parseInt(idx));
		return dao.reviewlist(dto);
	}

	public int reviewupdate(ReviewQnaDto dto,int idx) {

		dto.setIdx(idx);
		
		return dao.reviewupdate(dto);
	}

	

}
