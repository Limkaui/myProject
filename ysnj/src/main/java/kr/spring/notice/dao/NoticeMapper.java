package kr.spring.notice.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.notice.vo.NoticeVO;

public interface NoticeMapper {
	//공지 글쓰기
	@Insert("INSERT INTO notice (mem_num,not_num,not_type,not_title,not_uploadfile,not_filename,not_content) VALUES (1,notice_seq.nextval,#{not_type},#{not_title},#{not_uploadfile},#{not_filename},#{not_content})")
	public void insertNotice(NoticeVO notice);

	//총 레코드 수
	public int selectRowCount();
	
	//글 목록
	public List<NoticeVO> selectList(Map<String,Object> map);
	
	//글상세 페이지
	@Select("SELECT * FROM notice n JOIN member m ON n.mem_num=m.mem_num WHERE n.not_num=#{not_num}")
	public NoticeVO selectNotice(Integer not_num);

	//글 수정
	public void updateNotice(NoticeVO notice);
	
	//글 삭제
	@Delete("DELETE FROM notice WHERE not_num=#{not_num}")
	public void deleteNotice(Integer not_num);

}
