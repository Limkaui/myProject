package kr.spring.review.dao;

import org.apache.ibatis.annotations.Insert;

import kr.spring.review.vo.ReviewVO;

public interface ReviewMapper {
	//글쓰기
	@Insert("INSERT INTO review (rev_num,rev_title,rev_content,rev_uploadfile,rev_filename,mem_num,acc_num) VALUES (review_seq.nextval,#{rev_title},#{rev_content},#{rev_uploadfile},#{rev_filename},#{mem_num},#{acc_num})")
	public void insertReview(ReviewVO review);
	
}
