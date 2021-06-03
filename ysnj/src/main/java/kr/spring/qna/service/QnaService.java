package kr.spring.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.qna.dao.QnaMapper;
import kr.spring.qna.vo.QnaVO;

@Service("qnaService")
public class QnaService {
	//의존 관계 설정
	@Resource
	private QnaMapper qnaMapper;
	
	//글쓰기
	public void insertQna(QnaVO qna) {
		qnaMapper.insertQna(qna);
	}
	
	//총 레코드 수
	public int selectRowCount() {
		return qnaMapper.selectRowCount();
	}
	
	//글 목록
	public List<QnaVO> selectList(Map<String,Object> map){
		return qnaMapper.selectList(map);
	}
	
	//글 상세 페이지
	public QnaVO selectQna(Integer qna_num) {
		return qnaMapper.selectQna(qna_num);
	}
	
	
	//글 수정
	public void updateQna(QnaVO qna) {
		qnaMapper.updateQna(qna);
	}
	
	//글 삭제
	public void deleteQna(Integer board_num) {
		qnaMapper.deleteQna(board_num);
	}
	//답변
	public void updateQnaAnswer(QnaVO qna) {
		qnaMapper.updateQnaAnswer(qna);
	}
	
}







