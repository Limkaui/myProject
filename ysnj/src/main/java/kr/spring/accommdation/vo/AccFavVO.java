package kr.spring.accommdation.vo;

import java.sql.Date;

public class AccFavVO {
	private int acf_num;
	private Date acf_date;
	private int acc_num;
	private int mem_num;
	
	//data
	private String acc_name;
	private String acc_tel;
	private String acc_address;
	
	
	public int getAcf_num() {
		return acf_num;
	}
	public void setAcf_num(int acf_num) {
		this.acf_num = acf_num;
	}
	public Date getAcf_date() {
		return acf_date;
	}
	public void setAcf_date(Date acf_date) {
		this.acf_date = acf_date;
	}
	public int getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public String getAcc_tel() {
		return acc_tel;
	}
	public void setAcc_tel(String acc_tel) {
		this.acc_tel = acc_tel;
	}
	public String getAcc_address() {
		return acc_address;
	}
	public void setAcc_address(String acc_address) {
		this.acc_address = acc_address;
	}
	
	
}
