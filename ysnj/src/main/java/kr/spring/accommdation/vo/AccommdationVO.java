package kr.spring.accommdation.vo;

import java.io.IOException;
import java.sql.Date;

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
	
	
	//이미지 파일
	/*private int aci_num;
	private byte[] aci_uploadfile;
	
	public void setAci_uploadfile(MultipartFile upload) throws IOException{
		//MultipartFile -> byte[] 변환
		setAci_uploadfile(upload.getBytes());
	}

	public int getAci_num() {
		return aci_num;
	}

	public void setAci_num(int aci_num) {
		this.aci_num = aci_num;
	}

	public byte[] getAci_uploadfile() {
		return aci_uploadfile;
	}

	public void setAci_uploadfile(byte[] aci_uploadfile) {
		this.aci_uploadfile = aci_uploadfile;
	}*/

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
				+ acc_guide + ", acc_amenity=" + acc_amenity + ", acc_date=" + acc_date + "]";
	}
	
}
