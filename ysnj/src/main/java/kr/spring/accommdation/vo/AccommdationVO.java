package kr.spring.accommdation.vo;

import java.io.IOException;
import java.sql.Date;

import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;


public class AccommdationVO {
	//숙소 등록정보
	private int acc_num;
	private String mem_num;
	private int acc_category;
	private String acc_name;
	private String acc_tel;
	private String acc_checkin;
	private String acc_checkout;
	private String acc_address;
	private int acc_status;
	private String acc_guide;
	private String acc_amenity;
	private Date acc_date;
	//최저가 비교
	private int acc_rowprice;
	//사진
	private byte[] acc_uploadfile1;//파일1
	private String acc_filename1;//파일명1
	private byte[] acc_uploadfile2;
	private String acc_filename2;
	private byte[] acc_uploadfile3;
	private String acc_filename3;
	private byte[] acc_uploadfile4;
	private String acc_filename4;
	private byte[] acc_uploadfile5;
	private String acc_filename5;
	private byte[] acc_uploadfile6;
	private String acc_filename6;	
	
	//업로드 파일 처리
	public void setUpload1(MultipartFile upload1) throws IOException{
		//MultipartFile -> byte[] 반환
		setAcc_uploadfile1(upload1.getBytes());
		//파일명 구하기
		setAcc_filename1(upload1.getOriginalFilename());
	}
	public void setUpload2(MultipartFile upload2) throws IOException{
		//MultipartFile -> byte[] 반환
		setAcc_uploadfile2(upload2.getBytes());
		//파일명 구하기
		setAcc_filename2(upload2.getOriginalFilename());
	}
	public void setUpload3(MultipartFile upload3) throws IOException{
		//MultipartFile -> byte[] 반환
		setAcc_uploadfile3(upload3.getBytes());
		//파일명 구하기
		setAcc_filename3(upload3.getOriginalFilename());
	}
	public void setUpload4(MultipartFile upload4) throws IOException{
		//MultipartFile -> byte[] 반환
		setAcc_uploadfile4(upload4.getBytes());
		//파일명 구하기
		setAcc_filename4(upload4.getOriginalFilename());
	}
	public void setUpload5(MultipartFile upload5) throws IOException{
		//MultipartFile -> byte[] 반환
		setAcc_uploadfile5(upload5.getBytes());
		//파일명 구하기
		setAcc_filename5(upload5.getOriginalFilename());
	}
	public void setUpload6(MultipartFile upload6) throws IOException{
		//MultipartFile -> byte[] 반환
		setAcc_uploadfile6(upload6.getBytes());
		//파일명 구하기
		setAcc_filename6(upload6.getOriginalFilename());
	}
	
	
	public byte[] getAcc_uploadfile1() {
		return acc_uploadfile1;
	}
	public void setAcc_uploadfile1(byte[] acc_uploadfile1) {
		this.acc_uploadfile1 = acc_uploadfile1;
	}
	public String getAcc_filename1() {
		return acc_filename1;
	}
	public void setAcc_filename1(String acc_filename1) {
		this.acc_filename1 = acc_filename1;
	}
	public byte[] getAcc_uploadfile2() {
		return acc_uploadfile2;
	}
	public void setAcc_uploadfile2(byte[] acc_uploadfile2) {
		this.acc_uploadfile2 = acc_uploadfile2;
	}
	public String getAcc_filename2() {
		return acc_filename2;
	}
	public void setAcc_filename2(String acc_filename2) {
		this.acc_filename2 = acc_filename2;
	}
	public byte[] getAcc_uploadfile3() {
		return acc_uploadfile3;
	}
	public void setAcc_uploadfile3(byte[] acc_uploadfile3) {
		this.acc_uploadfile3 = acc_uploadfile3;
	}
	public String getAcc_filename3() {
		return acc_filename3;
	}
	public void setAcc_filename3(String acc_filename3) {
		this.acc_filename3 = acc_filename3;
	}
	public byte[] getAcc_uploadfile4() {
		return acc_uploadfile4;
	}
	public void setAcc_uploadfile4(byte[] acc_uploadfile4) {
		this.acc_uploadfile4 = acc_uploadfile4;
	}
	public String getAcc_filename4() {
		return acc_filename4;
	}
	public void setAcc_filename4(String acc_filename4) {
		this.acc_filename4 = acc_filename4;
	}
	public byte[] getAcc_uploadfile5() {
		return acc_uploadfile5;
	}
	public void setAcc_uploadfile5(byte[] acc_uploadfile5) {
		this.acc_uploadfile5 = acc_uploadfile5;
	}
	public String getAcc_filename5() {
		return acc_filename5;
	}
	public void setAcc_filename5(String acc_filename5) {
		this.acc_filename5 = acc_filename5;
	}
	public byte[] getAcc_uploadfile6() {
		return acc_uploadfile6;
	}
	public void setAcc_uploadfile6(byte[] acc_uploadfile6) {
		this.acc_uploadfile6 = acc_uploadfile6;
	}
	public String getAcc_filename6() {
		return acc_filename6;
	}
	public void setAcc_filename6(String acc_filename6) {
		this.acc_filename6 = acc_filename6;
	}
	
	
	//체크박스 처리
	public String[] getFacc_amenity() {
		String[] facc_amenity = null;
		if(acc_amenity != null) facc_amenity = acc_amenity.split(",");
		return facc_amenity;
 	}
	public void setFacc_amenity(String[] facc_amenity) {
		if(facc_amenity != null) {
			this.acc_amenity = "";
			for(int i=0;i<facc_amenity.length;i++) {
				if(i>0) this.acc_amenity += ",";
				this.acc_amenity += facc_amenity[i];
			}
		}
	}
	
	
	//최저가 비교
	public int getAcc_rowprice() {
		return acc_rowprice;
	}
	public void setAcc_rowprice(int acc_rowprice) {
		this.acc_rowprice = acc_rowprice;
	}
	public int getAcc_num() {
		return acc_num;
	}

	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}

	public String getMem_num() {
		return mem_num;
	}

	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}

	public int getAcc_category() {
		return acc_category;
	}

	public void setAcc_category(int acc_category) {
		this.acc_category = acc_category;
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

	public String getAcc_checkin() {
		return acc_checkin;
	}

	public void setAcc_checkin(String acc_checkin) {
		this.acc_checkin = acc_checkin;
	}

	public String getAcc_checkout() {
		return acc_checkout;
	}

	public void setAcc_checkout(String acc_checkout) {
		this.acc_checkout = acc_checkout;
	}

	public String getAcc_address() {
		return acc_address;
	}

	public void setAcc_address(String acc_address) {
		this.acc_address = acc_address;
	}

	public int getAcc_status() {
		return acc_status;
	}

	public void setAcc_status(int acc_status) {
		this.acc_status = acc_status;
	}

	public String getAcc_guide() {
		return acc_guide;
	}

	public void setAcc_guide(String acc_guide) {
		this.acc_guide = acc_guide;
	}

	public String getAcc_amenity() {
		return acc_amenity;
	}

	public void setAcc_amenity(String acc_amenity) {
		this.acc_amenity = acc_amenity;
	}

	public Date getAcc_date() {
		return acc_date;
	}

	public void setAcc_date(Date acc_date) {
		this.acc_date = acc_date;
	}
	
	@Override
	public String toString() {
		return "AccommdationVO [acc_num=" + acc_num + ", mem_num=" + mem_num + ", acc_category=" + acc_category
				+ ", acc_name=" + acc_name + ", acc_tel=" + acc_tel + ", acc_checkin=" + acc_checkin + ", acc_checkout="
				+ acc_checkout + ", acc_address=" + acc_address + ", acc_status=" + acc_status + ", acc_guide="
				+ acc_guide + ", acc_amenity=" + acc_amenity + ", acc_date=" + acc_date + ", acc_rowprice="
				+ acc_rowprice + "]";
	}


	
	
}
