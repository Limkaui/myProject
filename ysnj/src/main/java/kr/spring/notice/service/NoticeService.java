package kr.spring.notice.service;

import java.util.List;
import java.util.Map;

import kr.spring.notice.vo.NoticeVO;
  
public interface NoticeService {
	//공지 글쓰기
	public void insertNotice(NoticeVO notice);
	
	//총 레코드 수
	public int selectRowCount();

	//글 목록
	public List<NoticeVO> selectList(Map<String, Object> map);

	//글 상세 페이지
	public NoticeVO selectNotice(Integer not_num);

	//글 수정
	public void updateNotice(NoticeVO notice);
	//글 삭제
	public void deleteNotice(Integer not_num);
	
}
