package kr.co.map.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/map_s1", method = RequestMethod.GET)
	public String map_s1(Model model) {
		
		logger.info("회원가입 페이지 ");
		
	
		return "map/map_s1";
	}
	@RequestMapping(value = "/map_s2", method = RequestMethod.GET)
	public String map_s2(Model model) {
		
		logger.info("map_s2 ");
		
	
		return "map/map_s2";
	}
	@RequestMapping(value = "/map_s3", method = RequestMethod.GET)
	public String map_s3(Model model) {
		
		logger.info("map_s3");
		
	
		return "map/map_s3";
	}
	
}
