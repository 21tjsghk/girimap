package kr.co.map.dto.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.map.dao.MapDAO;
import kr.co.map.dao.MemberDao;
import kr.co.map.dto.BoardDto;
import kr.co.map.dto.MapDTO;

@Service
public class MapService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MapDAO dao;
	
	@Autowired MemberDao memberDao;
	
	public MapDTO login(HashMap<String, String> params) {
		logger.info("아이디/비밀번호 : {}",params.get("userId")+"/"+params.get("password"));
		MapDTO ms = new MapDTO();
		ms.setMem_id(params.get("userId"));
		ms.setMem_pw(params.get("password"));
		logger.info("ms : "+ ms);
		MapDTO dto = dao.toLogin(ms);
		logger.info("dto : "+ dto);
	
		return dto;
	}


	public boolean logindo(String userId, String password) {
		String Db_pw = dao.logindo(userId);
		Boolean success = false;
		if(Db_pw != null){
			success = true;
			
		}
		return success;
	}


	public ArrayList<BoardDto> bestList() {
	
		return memberDao.bestList();
	}


	

	

}
