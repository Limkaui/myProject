package kr.spring.accommdation.vo;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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
	//사진
	private byte[] roo_uploadfile1;//파일1
	private String roo_filename1;//파일명1
	private byte[] roo_uploadfile2;
	private String roo_filename2;
	private byte[] roo_uploadfile3;
	private String roo_filename3;
	private byte[] roo_uploadfile4;
	private String roo_filename4;
	private byte[] roo_uploadfile5;
	private String roo_filename5;
	private byte[] roo_uploadfile6;
	private String roo_filename6;

	//업로드 파일 처리
	public void setUpload1(MultipartFile upload1) throws IOException{
		//MultipartFile -> byte[] 반환
		setRoo_uploadfile1(upload1.getBytes());
		//파일명 구하기
		setRoo_filename1(upload1.getOriginalFilename());
	}
	public void setUpload2(MultipartFile upload2) throws IOException{
		//MultipartFile -> byte[] 반환
		setRoo_uploadfile2(upload2.getBytes());
		//파일명 구하기
		setRoo_filename2(upload2.getOriginalFilename());
	}
	public void setUpload3(MultipartFile upload3) throws IOException{
		//MultipartFile -> byte[] 반환
		setRoo_uploadfile3(upload3.getBytes());
		//파일명 구하기
		setRoo_filename3(upload3.getOriginalFilename());
	}
	public void setUpload4(MultipartFile upload4) throws IOException{
		//MultipartFile -> byte[] 반환
		setRoo_uploadfile4(upload4.getBytes());
		//파일명 구하기
		setRoo_filename4(upload4.getOriginalFilename());
	}
	public void setUpload5(MultipartFile upload5) throws IOException{
		//MultipartFile -> byte[] 반환
		setRoo_uploadfile5(upload5.getBytes());
		//파일명 구하기
		setRoo_filename5(upload5.getOriginalFilename());
	}
	public void setUpload6(MultipartFile upload6) throws IOException{
		//MultipartFile -> byte[] 반환
		setRoo_uploadfile6(upload6.getBytes());
		//파일명 구하기
		setRoo_filename6(upload6.getOriginalFilename());
	}
	
	public byte[] getRoo_uploadfile1() {
		return roo_uploadfile1;
	}
	public void setRoo_uploadfile1(byte[] roo_uploadfile1) {
		this.roo_uploadfile1 = roo_uploadfile1;
	}
	public String getRoo_filename1() {
		return roo_filename1;
	}
	public void setRoo_filename1(String roo_filename1) {
		this.roo_filename1 = roo_filename1;
	}
	public byte[] getRoo_uploadfile2() {
		return roo_uploadfile2;
	}
	public void setRoo_uploadfile2(byte[] roo_uploadfile2) {
		this.roo_uploadfile2 = roo_uploadfile2;
	}
	public String getRoo_filename2() {
		return roo_filename2;
	}
	public void setRoo_filename2(String roo_filename2) {
		this.roo_filename2 = roo_filename2;
	}
	public byte[] getRoo_uploadfile3() {
		return roo_uploadfile3;
	}
	public void setRoo_uploadfile3(byte[] roo_uploadfile3) {
		this.roo_uploadfile3 = roo_uploadfile3;
	}
	public String getRoo_filename3() {
		return roo_filename3;
	}
	public void setRoo_filename3(String roo_filename3) {
		this.roo_filename3 = roo_filename3;
	}
	public byte[] getRoo_uploadfile4() {
		return roo_uploadfile4;
	}
	public void setRoo_uploadfile4(byte[] roo_uploadfile4) {
		this.roo_uploadfile4 = roo_uploadfile4;
	}
	public String getRoo_filename4() {
		return roo_filename4;
	}
	public void setRoo_filename4(String roo_filename4) {
		this.roo_filename4 = roo_filename4;
	}
	public byte[] getRoo_uploadfile5() {
		return roo_uploadfile5;
	}
	public void setRoo_uploadfile5(byte[] roo_uploadfile5) {
		this.roo_uploadfile5 = roo_uploadfile5;
	}
	public String getRoo_filename5() {
		return roo_filename5;
	}
	public void setRoo_filename5(String roo_filename5) {
		this.roo_filename5 = roo_filename5;
	}
	public byte[] getRoo_uploadfile6() {
		return roo_uploadfile6;
	}
	public void setRoo_uploadfile6(byte[] roo_uploadfile6) {
		this.roo_uploadfile6 = roo_uploadfile6;
	}
	public String getRoo_filename6() {
		return roo_filename6;
	}
	public void setRoo_filename6(String roo_filename6) {
		this.roo_filename6 = roo_filename6;
	}
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
