package kr.spring.reserve.vo;

import java.sql.Date;

public class PaymentVO {
	private int pay_num; //결제정보관리번호
	private int pay_state; //결제상태
	private int pay_money; //결제금액
	private int pay_kind; //결제수단
	private String pay_name; //입금자명
	private Date pay_date; //결제일
	
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getPay_state() {
		return pay_state;
	}
	public void setPay_state(int pay_state) {
		this.pay_state = pay_state;
	}
	public int getPay_money() {
		return pay_money;
	}
	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}
	public int getPay_kind() {
		return pay_kind;
	}
	public void setPay_kind(int pay_kind) {
		this.pay_kind = pay_kind;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	
	

}
