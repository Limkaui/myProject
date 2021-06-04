package kr.spring.review.vo;

import kr.spring.util.DurationFromNow;

public class ReviewReplyVO {
	private int re_num;
	private String re_content;
	private String re_date;
	private String re_mdate;
	private String re_ip;
	private int rev_num;
	private int mem_num;
	private String mem_id;
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public String getRe_mdate() {
		return re_mdate;
	}
	public void setRe_mdate(String re_mdate) {
		this.re_mdate = re_mdate;
	}
	public String getRe_ip() {
		return re_ip;
	}
	public void setRe_ip(String re_ip) {
		this.re_ip = re_ip;
	}
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
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
	@Override
	public String toString() {
		return "ReviewReplyVO [re_num=" + re_num + ", re_content=" + re_content + ", re_date=" + re_date + ", re_mdate="
				+ re_mdate + ", re_ip=" + re_ip + ", rev_num=" + rev_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id
				+ "]";
	}
}
