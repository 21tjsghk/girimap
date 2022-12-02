package kr.co.map.dto;

public class MapDTO {

	private String mapName;		
	private String mapLoc;
	private String mem_id;
	private String mem_name_kr;
	private String mem_pw;
	private String mem_grade;
	private int success;
	
	public String getMapName() {
		return mapName;
	}
	public void setMapName(String mapName) {
		this.mapName = mapName;
	}
	public String getMapLoc() {
		return mapLoc;
	}
	public void setMapLoc(String mapLoc) {
		this.mapLoc = mapLoc;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name_kr() {
		return mem_name_kr;
	}
	public void setMem_name_kr(String mem_name_kr) {
		this.mem_name_kr = mem_name_kr;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public int getSuccess() {
		return success;
	}
	public void setSuccess(int success) {
		this.success = success;
	}
	
}
