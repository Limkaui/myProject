package kr.spring.member.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class MemberVO {
	private int mem_num;
	@Pattern(regexp="^[A-Za-z0-9+]{6,12}$")
	private String mem_id;
	private int auth;
	@Pattern(regexp="^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%])([A-Za-z\\d!@#$%]){6,15}$")
	private String mem_pw;
	@NotEmpty
	private String mem_name;
	private String mem_birth;
	private String mem_conum;
	private String mem_account;
	@NotEmpty
	private String mem_cell;
	@Email
	@NotEmpty
	private String mem_email;
	@Size(min=5,max=5)
	private String mem_zipcode;
	@NotEmpty
	private String mem_address1;
	@NotEmpty
	private String mem_address2;
	private Date mem_date;
	@Pattern(regexp="^[A-Za-z0-9+]{6,15}$")
	private String now_passwd;
	
	//===비밀번호 일치여부 체크===
	public boolean isCheckedPassword(String userPasswd) {
		if(auth > 1 && mem_pw.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}
	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_conum() {
		return mem_conum;
	}

	public void setMem_conum(String mem_conum) {
		this.mem_conum = mem_conum;
	}

	public String getNem_Account() {
		return mem_account;
	}

	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}

	public String getMem_cell() {
		return mem_cell;
	}

	public void setMem_cell(String mem_cell) {
		this.mem_cell = mem_cell;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String email) {
		this.mem_email = mem_email;
	}

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public Date getMem_date() {
		return mem_date;
	}

	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}

	public String getNow_passwd() {
		return now_passwd;
	}

	public void setNow_passwd(String now_passwd) {
		this.now_passwd = now_passwd;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_birth="
				+ mem_birth + ", mem_conum=" + mem_conum + ", mem_account=" + mem_account + ", mem_cell=" + mem_cell + ", mem_email=" + mem_email
				+ ", mem_zipcode=" + mem_zipcode + ", mem_address1=" + mem_address1 + ", mem_address2=" + mem_address2 + ", mem_date="
				+ mem_date + ", now_passwd=" + now_passwd + "]";
	}
	
	
}
