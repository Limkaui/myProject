package kr.spring.notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.notice.dao.NoticeMapper;
import kr.spring.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeService {
	//의존 관계 설정
	@Resource
	private NoticeMapper noticeMapper;
	
	//공지 글쓰기
	public void insertNotice(NoticeVO notice) {
		noticeMapper.insertNotice(notice);
	}
	
	//총 레코드 수
	public int selectRowCount() {
		return noticeMapper.selectRowCount();
	}

	//글 목록
	public List<NoticeVO> selectList(Map<String, Object> map) {
		return noticeMapper.selectList(map);
	}

	//글 상세 페이지
	public NoticeVO selectNotice(Integer not_num) {
		return noticeMapper.selectNotice(not_num);
	}

	//글 수정
	public void updateNotice(NoticeVO notice) {
		noticeMapper.updateNotice(notice);
		
	}
	//글 삭제
	public void deleteNotice(Integer not_num) {
		noticeMapper.deleteNotice(not_num);
		
	}
	
}
