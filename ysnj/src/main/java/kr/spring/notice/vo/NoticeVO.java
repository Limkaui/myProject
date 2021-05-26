package kr.spring.notice.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int mem_num;
	private int not_num;
	private int not_type;
	@NotEmpty
	private String not_title;
	private byte[] not_uploadfile;
	private String not_filename;
	@NotEmpty
	private String not_content;
	private Date not_date;
	
	//업로드 파일 처리
	public void setNot_upload(MultipartFile not_upload)throws IOException{
		setNot_uploadfile(not_upload.getBytes());
		setNot_filename(not_upload.getOriginalFilename());
	}
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getNot_num() {
		return not_num;
	}
	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}
	public int getNot_type() {
		return not_type;
	}
	public void setNot_type(int not_type) {
		this.not_type = not_type;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public byte[] getNot_uploadfile() {
		return not_uploadfile;
	}
	public void setNot_uploadfile(byte[] not_uploadfile) {
		this.not_uploadfile = not_uploadfile;
	}
	
	public String getNot_filename() {
		return not_filename;
	}

	public void setNot_filename(String not_filename) {
		this.not_filename = not_filename;
	}

	public String getNot_content() {
		return not_content;
	}

	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}

	public Date getNot_date() {
		return not_date;
	}
	public void setNot_date(Date not_date) {
		this.not_date = not_date;
	}
	
	
}
