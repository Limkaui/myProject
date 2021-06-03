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
}
