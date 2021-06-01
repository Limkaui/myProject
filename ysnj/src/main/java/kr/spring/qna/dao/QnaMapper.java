package kr.spring.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.qna.vo.QnaVO;

public interface QnaMapper {
	//글쓰기
	@Insert("INSERT INTO qna (qna_num,qna_title,mem_qnum,qna_cate,qna_question,qna_status) VALUES (qna_seq.nextval,#{qna_title},#{mem_qnum},#{qna_cate},#{qna_question},#{qna_status})")
	public void insertQna(QnaVO qna);	

	//총 레코드 수
	public int selectRowCount();
	
	//글 목록
	public List<QnaVO> selectList(Map<String,Object> map);
	
	//글 상세 페이지
	@Select("SELECT * FROM qna b JOIN member m ON b.mem_qnum=m.mem_num WHERE b.qna_num=#{qna_num}")
	public QnaVO selectQna(Integer qna_num);
	
	//글 수정
	public void updateQna(QnaVO qna);
	
	//글 삭제
	@Delete("DELETE FROM qna WHERE qna_num=#{qna_num}")
	public void deleteQna(Integer qna_num);
	
	//답변
	@Insert("UPDATE qna SET qna_answer= #{qna_answer}, mem_anum = #{mem_anum}  WHERE qna_num=#{qna_num}")
	public void updateQnaAnswer(QnaVO qna);
	
}


