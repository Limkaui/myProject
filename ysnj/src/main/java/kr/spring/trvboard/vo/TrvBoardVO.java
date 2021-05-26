package kr.spring.trvboard.vo;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TrvBoardVO {
	private int trv_num; //회원번호
	private int mem_num; //게시글번호(작성자)
	private int trv_cate;//분류 1.관광명소 2.음식점 3.박물관
	private String trv_local;//장소(지역:광역시)
	private String trv_title;// 제목
	private String trv_intro; // 소개글
	private String trv_place;//장소전체주소
	private Date trv_date;// 수정일
	private String trv_call;// 문의전화
	private byte[] trv_uploadfile1;//파일1
	private String trv_filename1;//파일명1
	private byte[] trv_uploadfile2;
	private String trv_filename2;
	private byte[] trv_uploadfile3;
	private String trv_filename3;
	private byte[] trv_uploadfile4;
	private String trv_filename4;
	private byte[] trv_uploadfile5;
	private String trv_filename5;

	//업로드 파일 처리
	public void setUpload1(MultipartFile upload1)throws IOException{
		//MultipartFile -> byte[] 반환
		setTrv_uploadfile1(upload1.getBytes());
		//파일명 구하기
		setTrv_filename1(upload1.getOriginalFilename());
	}
	public void setUpload2(MultipartFile upload2)throws IOException{
		//MultipartFile -> byte[] 반환
		setTrv_uploadfile2(upload2.getBytes());
		//파일명 구하기
		setTrv_filename2(upload2.getOriginalFilename());
	}
	public void setUpload3(MultipartFile upload3)throws IOException{
		//MultipartFile -> byte[] 반환
		setTrv_uploadfile3(upload3.getBytes());
		//파일명 구하기
		setTrv_filename3(upload3.getOriginalFilename());
	}
	public void setUpload4(MultipartFile upload4)throws IOException{
		//MultipartFile -> byte[] 반환
		setTrv_uploadfile4(upload4.getBytes());
		//파일명 구하기
		setTrv_filename4(upload4.getOriginalFilename());
	}
	public void setUpload5(MultipartFile upload5)throws IOException{
		//MultipartFile -> byte[] 반환
		setTrv_uploadfile5(upload5.getBytes());
		//파일명 구하기
		setTrv_filename5(upload5.getOriginalFilename());
	}


	public int getTrv_num() {
		return trv_num;
	}
	public void setTrv_num(int trv_num) {
		this.trv_num = trv_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getTrv_cate() {
		return trv_cate;
	}
	public void setTrv_cate(int trv_cate) {
		this.trv_cate = trv_cate;
	}
	public String getTrv_local() {
		return trv_local;
	}
	public void setTrv_local(String trv_local) {
		this.trv_local = trv_local;
	}
	public String getTrv_title() {
		return trv_title;
	}
	public void setTrv_title(String trv_title) {
		this.trv_title = trv_title;
	}
	public String getTrv_intro() {
		return trv_intro;
	}
	public void setTrv_intro(String trv_intro) {
		this.trv_intro = trv_intro;
	}
	public String getTrv_place() {
		return trv_place;
	}
	public void setTrv_place(String trv_place) {
		this.trv_place = trv_place;
	}
	public Date getTrv_date() {
		return trv_date;
	}
	public void setTrv_date(Date trv_date) {
		this.trv_date = trv_date;
	}
	public String getTrv_call() {
		return trv_call;
	}
	public void setTrv_call(String trv_call) {
		this.trv_call = trv_call;
	}
	public byte[] getTrv_uploadfile1() {
		return trv_uploadfile1;
	}
	public void setTrv_uploadfile1(byte[] trv_uploadfile1) {
		this.trv_uploadfile1 = trv_uploadfile1;
	}
	public String getTrv_filename1() {
		return trv_filename1;
	}
	public void setTrv_filename1(String trv_filename1) {
		this.trv_filename1 = trv_filename1;
	}
	public byte[] getTrv_uploadfile2() {
		return trv_uploadfile2;
	}
	public void setTrv_uploadfile2(byte[] trv_uploadfile2) {
		this.trv_uploadfile2 = trv_uploadfile2;
	}
	public String getTrv_filename2() {
		return trv_filename2;
	}
	public void setTrv_filename2(String trv_filename2) {
		this.trv_filename2 = trv_filename2;
	}
	public byte[] getTrv_uploadfile3() {
		return trv_uploadfile3;
	}
	public void setTrv_uploadfile3(byte[] trv_uploadfile3) {
		this.trv_uploadfile3 = trv_uploadfile3;
	}
	public String getTrv_filename3() {
		return trv_filename3;
	}
	public void setTrv_filename3(String trv_filename3) {
		this.trv_filename3 = trv_filename3;
	}
	public byte[] getTrv_uploadfile4() {
		return trv_uploadfile4;
	}
	public void setTrv_uploadfile4(byte[] trv_uploadfile4) {
		this.trv_uploadfile4 = trv_uploadfile4;
	}
	public String getTrv_filename4() {
		return trv_filename4;
	}
	public void setTrv_filename4(String trv_filename4) {
		this.trv_filename4 = trv_filename4;
	}
	public byte[] getTrv_uploadfile5() {
		return trv_uploadfile5;
	}
	public void setTrv_uploadfile5(byte[] trv_uploadfile5) {
		this.trv_uploadfile5 = trv_uploadfile5;
	}
	public String getTrv_filename5() {
		return trv_filename5;
	}
	public void setTrv_filename5(String trv_filename5) {
		this.trv_filename5 = trv_filename5;
	}
	@Override
	public String toString() {
		return "TrvBoardVO [trv_num=" + trv_num + ", mem_num=" + mem_num + ", trv_cate=" + trv_cate + ", trv_local="
				+ trv_local + ", trv_title=" + trv_title + ", trv_intro=" + trv_intro + ", trv_place=" + trv_place
				+ ", trv_date=" + trv_date + ", trv_call=" + trv_call + ", trv_filename1=" + trv_filename1
				+ ", trv_filename2=" + trv_filename2 + ", trv_filename3=" + trv_filename3 + ", trv_filename4="
				+ trv_filename4 + ", trv_filename5=" + trv_filename5 + "]";
	}
	
}
