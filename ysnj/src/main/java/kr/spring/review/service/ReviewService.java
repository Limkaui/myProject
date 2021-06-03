package kr.spring.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.review.dao.ReviewMapper;
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
	public int selectRowCount() {
		return reviewMapper.selectRowCount();
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
		reviewMapper.deleteReview(rev_num);
	}
}
