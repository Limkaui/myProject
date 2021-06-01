package kr.spring.qna.vo;

import java.sql.Date;

public class QnaVO {
	
	private int qna_num;//QNA 번호
	private int mem_qnum;//질문자 회원번호
	private int mem_anum;//답변자 회원번호
	private int qna_cate;//질문 유형
	private int qna_status;//표시상태
	private int qna_reply;//답변여부 
	
	private String qna_title;//제목
	private String qna_question;//질문
	private String qna_answer;//답변 
	private Date qna_qdate;//질문날짜
	private Date qna_adate;//답변날짜
	
	
	public int getQna_reply() {
		return qna_reply;
	}
	private String mem_id;//작성자 id
	private int mem_num;
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getMem_qnum() {
		return mem_qnum;
	}
	public void setMem_qnum(int mem_qnum) {
		this.mem_qnum = mem_qnum;
	}
	public int getMem_anum() {
		return mem_anum;
	}
	public void setMem_anum(int mem_anum) {
		this.mem_anum = mem_anum;
	}
	public int getQna_cate() {
		return qna_cate;
	}
	public void setQna_cate(int qna_cate) {
		this.qna_cate = qna_cate;
	}
	public int getQna_status() {
		return qna_status;
	}
	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_question() {
		return qna_question;
	}
	
	public void setQna_reply(int qna_reply) {
		this.qna_reply = qna_reply;
	}
	public void setQna_question(String qna_question) {
		this.qna_question = qna_question;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public Date getQna_qdate() {
		return qna_qdate;
	}
	public void setQna_qdate(Date qna_qdate) {
		this.qna_qdate = qna_qdate;
	}
	public Date getQna_adate() {
		return qna_adate;
	}
	public void setQna_adate(Date qna_adate) {
		this.qna_adate = qna_adate;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
