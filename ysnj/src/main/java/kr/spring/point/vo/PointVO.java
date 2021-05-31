package kr.spring.point.vo;

import java.sql.Date;

public class PointVO {
	private int poi_num;    //가격정보 식별 번호
	private int mem_num;	//회원번호
	private int poi_add;	//포인트 적립금액
	private int poi_minus;	//포인트 차감금액
	private String poi_detail;	//예)회원가입,충전
	private Date poi_date;	//포인트 적립 사용날짜
	
	private String mem_id;
	
	public int getPoi_num() {
		return poi_num;
	}
	public void setPoi_num(int poi_num) {
		this.poi_num = poi_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPoi_add() {
		return poi_add;
	}
	public void setPoi_add(int poi_add) {
		this.poi_add = poi_add;
	}
	public int getPoi_minus() {
		return poi_minus;
	}
	public void setPoi_minus(int poi_minus) {
		this.poi_minus = poi_minus;
	}
	public String getPoi_detail() {
		return poi_detail;
	}
	public void setPoi_detail(String poi_detail) {
		this.poi_detail = poi_detail;
	}
	public Date getPoi_date() {
		return poi_date;
	}
	public void setPoi_date(Date poi_date) {
		this.poi_date = poi_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	

}
