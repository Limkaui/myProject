package kr.spring.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import kr.spring.review.dao.ReviewMapper;
import kr.spring.review.vo.ReviewReplyVO;
import kr.spring.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewService {
	//의존 관계 설정
	@Resource
	private ReviewMapper reviewMapper;
	
	//글쓰기
	public void insertReview(ReviewVO review) {
		reviewMapper.insertReview(review);
	}
	
	//총 레코드 수
	public int selectRowCount(Map<String,Object> map) {
		return reviewMapper.selectRowCount(map);
	}
	
	//글 목록
	public List<ReviewVO> selectList(Map<String,Object> map){
		return reviewMapper.selectList(map);
	}
	
	//글 상세 페이지
	public ReviewVO selectReview(Integer rev_num) {
		return reviewMapper.selectReview(rev_num);
	}
	
	//조회수 증가
	public void updateHit(Integer rev_num) {
		reviewMapper.updateHit(rev_num);
	}
	
	//글 수정
	public void updateReview(ReviewVO review) {
		reviewMapper.updateReview(review);
	}
	
	//글 삭제
	public void deleteReview(Integer rev_num) {
		//댓글 삭제 먼저
		reviewMapper.deleteReplyByRevNum(rev_num);
		reviewMapper.deleteReview(rev_num);
	}
	
	//==============댓글===============//
	public List<ReviewReplyVO> selectListReply(Map<String,Object> map){
		return reviewMapper.selectListReply(map);
	}
	public int selectRowCountReply(Map<String,Object> map) {
		return reviewMapper.selectRowCountReply(map);
	}
	public void insertReply(ReviewReplyVO boardReply) {
		reviewMapper.insertReply(boardReply);
	}
	
	public void updateReply(ReviewReplyVO boardReply) {
		reviewMapper.updateReply(boardReply);
	}
	
	public void deleteReply(Integer re_num) {
		reviewMapper.deleteReply(re_num);
	}
}
