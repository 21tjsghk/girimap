package kr.co.map.dao;

import kr.co.map.dto.MapDTO;

public interface MapDAO {

	MapDTO toLogin(MapDTO ms);

	String logindo(String userId);

}
