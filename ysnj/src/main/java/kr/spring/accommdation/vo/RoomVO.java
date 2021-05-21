package kr.spring.accommdation.vo;

import java.sql.Date;

public class RoomVO {
	//객실 등록 정보
	private String acc_name;
	private int roo_num;
	private int acc_num;
	private String roo_name;
	private int roo_price;
	private int roo_status;
	private String roo_guide;
	private int roo_capacity;
	private Date roo_date;

	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public int getRoo_num() {
		return roo_num;
	}
	public void setRoo_num(int roo_num) {
		this.roo_num = roo_num;
	}
	public int getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}
	public String getRoo_name() {
		return roo_name;
	}
	public void setRoo_name(String roo_name) {
		this.roo_name = roo_name;
	}
	public int getRoo_price() {
		return roo_price;
	}
	public void setRoo_price(int roo_price) {
		this.roo_price = roo_price;
	}
	public int getRoo_status() {
		return roo_status;
	}
	public void setRoo_status(int roo_status) {
		this.roo_status = roo_status;
	}
	public String getRoo_guide() {
		return roo_guide;
	}
	public void setRoo_guide(String roo_guide) {
		this.roo_guide = roo_guide;
	}
	public int getRoo_capacity() {
		return roo_capacity;
	}
	public void setRoo_capacity(int roo_capacity) {
		this.roo_capacity = roo_capacity;
	}
	public Date getRoo_date() {
		return roo_date;
	}
	public void setRoo_date(Date roo_date) {
		this.roo_date = roo_date;
	}
	@Override
	public String toString() {
		return "RoomVO [acc_name=" + acc_name + ", roo_num=" + roo_num + ", acc_num=" + acc_num + ", roo_name="
				+ roo_name + ", roo_price=" + roo_price + ", roo_status=" + roo_status + ", roo_guide=" + roo_guide
				+ ", roo_capacity=" + roo_capacity + ", roo_date=" + roo_date + "]";
	}

	
	
	
	
}
