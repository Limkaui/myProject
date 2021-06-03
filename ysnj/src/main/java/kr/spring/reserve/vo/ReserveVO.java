package kr.spring.reserve.vo;

import java.sql.Date;

public class ReserveVO {
	
	private int rsv_num; //예약관리번호
	private int mem_num;
	private int roo_num;
	private int rsv_state; //예약상태(1 예약대기, 2 예약확정 , 3 예약취소
	private int rsv_visitnum; //입실인원정보
	private String rsv_iname; //입실자 이름
	private String rsv_iphone; //입실자 번호
	private String rsv_start; //예약 시작일
	private String rsv_end; //예약 종료일
	private Date rsv_date; //예약날짜
	
	private String acc_name;
	private int pay_money;
	
	public int getPay_money() {
		return pay_money;
	}
	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getRoo_num() {
		return roo_num;
	}
	public void setRoo_num(int roo_num) {
		this.roo_num = roo_num;
	}
	public int getRsv_num() {
		return rsv_num;
	}
	public void setRsv_num(int rsv_num) {
		this.rsv_num = rsv_num;
	}
	public int getRsv_state() {
		return rsv_state;
	}
	public void setRsv_state(int rsv_state) {
		this.rsv_state = rsv_state;
	}
	public int getRsv_visitnum() {
		return rsv_visitnum;
	}
	public void setRsv_visitnum(int rsv_visitnum) {
		this.rsv_visitnum = rsv_visitnum;
	}
	public String getRsv_iname() {
		return rsv_iname;
	}
	public void setRsv_iname(String rsv_iname) {
		this.rsv_iname = rsv_iname;
	}
	public String getRsv_iphone() {
		return rsv_iphone;
	}
	public void setRsv_iphone(String rsv_iphone) {
		this.rsv_iphone = rsv_iphone;
	}
	public String getRsv_start() {
		return rsv_start;
	}
	public void setRsv_start(String rsv_start) {
		this.rsv_start = rsv_start;
	}
	public String getRsv_end() {
		return rsv_end;
	}
	@Override
	public String toString() {
		return "ReserveVO [rsv_num=" + rsv_num + ", mem_num=" + mem_num + ", roo_num=" + roo_num + ", rsv_state="
				+ rsv_state + ", rsv_visitnum=" + rsv_visitnum + ", rsv_iname=" + rsv_iname + ", rsv_iphone="
				+ rsv_iphone + ", rsv_start=" + rsv_start + ", rsv_end=" + rsv_end + ", rsv_date=" + rsv_date
				+ ", acc_name=" + acc_name + ", pay_money=" + pay_money + "]";
	}
	public void setRsv_end(String rsv_end) {
		this.rsv_end = rsv_end;
	}
	public Date getRsv_date() {
		return rsv_date;
	}
	public void setRsv_date(Date rsv_date) {
		this.rsv_date = rsv_date;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	
	
}
