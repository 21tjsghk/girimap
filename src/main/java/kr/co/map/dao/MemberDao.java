package kr.co.map.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.map.dto.BoardDto;
import kr.co.map.dto.MemberDto;
import kr.co.map.dto.PageDto;
import kr.co.map.dto.ReviewPageDto;
import kr.co.map.dto.ReviewQnaDto;

public interface MemberDao {

	void write(MemberDto dto);

	String idCheck(String userId);

	ArrayList<BoardDto> getQnaType();

	MemberDto findInfo(String string);

	int doRegistQna(BoardDto dto);

	ArrayList<BoardDto> qnaInfo(PageDto dto);

	int qnaSearchCount(PageDto dto);

	ArrayList<BoardDto> qnaInfoAll(PageDto dto);

	int qnaSearchCountType(PageDto dto);

	BoardDto getQnaDetail(String idx);

	PageDto TgetqnaDetail(String idx);

	int viewCount(String idx);

	ArrayList<BoardDto> bestList();

	int deleteQna(String idx);

	BoardDto getupdateQna(String idx);

	ArrayList<BoardDto> getQnaType_update(String idx);

	int doUpdateQna(BoardDto dto);

	int searchReviewCount(String idx);

	ArrayList<ReviewQnaDto> reviewlist(ReviewPageDto dto);

	int reviewupdate(ReviewQnaDto dto);

}
