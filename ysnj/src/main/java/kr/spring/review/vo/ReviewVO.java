package kr.spring.review.vo;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int rev_num;
	private int mem_num;
	private String mem_id;
	private int acc_num;
	private String rev_title;
	private String rev_content;
	private Date rev_date;
	private int rev_hits;
	private byte[] rev_uploadfile;
	private String rev_filename;
	private int rev_star;

	//업로드 파일 처리
	public void setUpload(MultipartFile upload)throws IOException{
		//MultipartFile -> byte[] 변환
		setRev_uploadfile(upload.getBytes());
		//파일명 구하기
		setRev_filename(upload.getOriginalFilename());
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
	public int getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public int getRev_hits() {
		return rev_hits;
	}
	public void setRev_hits(int rev_hits) {
		this.rev_hits = rev_hits;
	}
	public byte[] getRev_uploadfile() {
		return rev_uploadfile;
	}
	public void setRev_uploadfile(byte[] rev_uploadfile) {
		this.rev_uploadfile = rev_uploadfile;
	}
	public String getRev_filename() {
		return rev_filename;
	}
	public void setRev_filename(String rev_filename) {
		this.rev_filename = rev_filename;
	}
	
	public int getRev_star() {
		return rev_star;
	}

	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}

	@Override
	public String toString() {
		return "ReviewVO [rev_num=" + rev_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", acc_num=" + acc_num
				+ ", rev_title=" + rev_title + ", rev_content=" + rev_content + ", rev_date=" + rev_date + ", rev_hits="
				+ rev_hits + ", rev_filename=" + rev_filename + ", rev_star=" + rev_star + "]";
	}
}
