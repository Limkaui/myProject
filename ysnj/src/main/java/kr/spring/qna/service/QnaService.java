package kr.spring.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.qna.dao.QnaMapper;
import kr.spring.qna.vo.QnaVO;

public interface QnaService {
	//글쓰기
	public void insertQna(QnaVO qna);
	
	//총 레코드 수
	public int selectRowCount();
	
	//글 목록
	public List<QnaVO> selectList(Map<String,Object> map);
	
	//글 상세 페이지
	public QnaVO selectQna(Integer qna_num);
	
	//글 수정
	public void updateQna(QnaVO qna);
	
	//글 삭제
	public void deleteQna(Integer board_num);
	//답변
	public void updateQnaAnswer(QnaVO qna);
	
}







