package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.review.vo.ReviewReplyVO;
import kr.spring.review.vo.ReviewVO;

public interface ReviewMapper {
	//글쓰기
	@Insert("INSERT INTO review (rev_num,rev_title,rev_content,rev_uploadfile,rev_filename,mem_num,acc_num,rev_star) VALUES (review_seq.nextval,#{rev_title},#{rev_content},#{rev_uploadfile},#{rev_filename},#{mem_num},#{acc_num},#{rev_star})")
	public void insertReview(ReviewVO review);

	//총 레코드 수
	public int selectRowCount(Map<String,Object> map);

	//글 목록
	public List<ReviewVO> selectList(Map<String,Object> map);

	//글 상세 페이지
	@Select("SELECT * FROM review r JOIN member m ON r.mem_num=m.mem_num WHERE r.rev_num=#{rev_num}")
	public ReviewVO selectReview(Integer review_num);

	//조회수 증가
	@Update("UPDATE review SET rev_hits=rev_hits+1 WHERE rev_num=#{rev_num}")
	public void updateHit(Integer rev_num);

	//글 수정
	public void updateReview(ReviewVO review);

	//글 삭제
	@Delete("DELETE FROM review WHERE rev_num=#{rev_nem}")
	public void deleteReview(Integer rev_num);

	//==============리뷰 댓글===============//
	//댓글
	public List<ReviewReplyVO> selectListReply(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM review_reply WHERE rev_num=#{rev_num}")
	public int selectRowCountReply(Map<String,Object> map);
	@Insert("INSERT INTO review_reply (re_num,re_content,re_ip,rev_num,mem_num) VALUES (review_reply_seq.nextval,#{re_content},#{re_ip},#{rev_num},#{mem_num})")
	public void insertReply(ReviewReplyVO boardReply);
	@Update("UPDATE review_reply SET re_content=#{re_content},re_ip=#{re_ip} WHERE re_num=#{re_num}")
	public void updateReply(ReviewReplyVO boardReply);
	@Delete("DELETE FROM review_reply WHERE re_num=#{re_num}")
	public void deleteReply(Integer re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM review_reply WHERE rev_num=#{rev_num}")
	public void deleteReplyByRevNum(Integer rev_num);
}
