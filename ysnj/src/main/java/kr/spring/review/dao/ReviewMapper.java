package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.review.vo.ReviewVO;

public interface ReviewMapper {
	//글쓰기
	@Insert("INSERT INTO review (rev_num,rev_title,rev_content,rev_uploadfile,rev_filename,mem_num,acc_num) VALUES (review_seq.nextval,#{rev_title},#{rev_content},#{rev_uploadfile},#{rev_filename},#{mem_num},#{acc_num})")
	public void insertReview(ReviewVO review);
	
	//총 레코드 수
	public int selectRowCount();
	
	//글 목록
	public List<ReviewVO> selectList(Map<String,Object> map);
	
	//글 상세 페이지
	@Select("SELECT * FROM review r JOIN member m ON r.mem_num=m.mem_num WHERE r.rev_num=#{rev_num}")
	public ReviewVO selectReview(Integer review_num);
	
	//조회수 증가
	@Update("UPDATE review SET rev_hits=rev_hits+1 WHERE rev_num=#{rev_num}")
	public void updateHit(Integer rev_num);
	
	
}
