package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
	@Select("SELECT ")
	public ReviewVO selectReview(Integer review_num);
	
	
}
