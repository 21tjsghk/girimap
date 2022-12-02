package kr.co.map.dto;

import java.sql.Date;

public class BoardDto {
	
	// 게시글 타입 Start
	private int idx;
	private int u_idx;
	private String typename;
	private int use_flg;
	private Date regdate;
	
	
	// 게시글 타입 end
	
	public int getBoarDidx() {
	return boarDidx;
}
public void setBoarDidx(int boarDidx) {
	this.boarDidx = boarDidx;
}
	//게시글 페이지 저장
	private int boarDidx;
	private int qnaNum;
	private int boardType;
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	
	
	// 게시글페이지저장
	
	private int view_cnt;	
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	private int b_idx;
	
	private int r_idx;
	private String subject;
	private String content;
	private String userId;
	
	private int del_flg;
	private String product_name;
	private String managerId;
	private String answer_type;
	private String answer_flg;
	
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getDel_flg() {
		return del_flg;
	}
	public void setDel_flg(int del_flg) {
		this.del_flg = del_flg;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getAnswer_type() {
		return answer_type;
	}
	public void setAnswer_type(String answer_type) {
		this.answer_type = answer_type;
	}
	public String getAnswer_flg() {
		return answer_flg;
	}
	public void setAnswer_flg(String answer_flg) {
		this.answer_flg = answer_flg;
	}
	public String getAnswername() {
		return answername;
	}
	public void setAnswername(String answername) {
		this.answername = answername;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBag_type() {
		return bag_type;
	}
	public void setBag_type(String bag_type) {
		this.bag_type = bag_type;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	private String answername;
	private String brand_name;
	private String bag_type;
	private String product_code;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getUse_flg() {
		return use_flg;
	}
	public void setUse_flg(int use_flg) {
		this.use_flg = use_flg;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
