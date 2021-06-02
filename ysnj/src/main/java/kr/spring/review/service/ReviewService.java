package kr.spring.review.service;

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
}
