package kr.spring.accommdation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import kr.spring.accommdation.dao.AccommdationMapper;
import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.accommdation.vo.AccommdationVO;

public interface AccommdationService {
	
	//숙소 등록하기
	public void insertAccommdation(AccommdationVO accommdation);
	
	//총레코드수
	public int selectRowCount(Integer mem_num);
		
	//숙소목록
	public List<AccommdationVO> selectList(Map<String,Object> map);

	//숙소 상세페이지
	public AccommdationVO selectAccommdation(Integer acc_num);
	
	//숙소 정보 수정
	public void updateAccommdation(AccommdationVO accommdation);

	//숙소 삭제
	public void deleteAccommdation(Integer acc_num);
	
	
	//===소비자 화면===//
	//숙소&객실 목록
	public List<AccommdationVO> accList(Map<String, Object> map);
	//숙소&객실 상세페이지
	public AccommdationVO accListSelectAccommdation(Map<String, Object> map, Integer acc_num);
	//총 레코드 수
	public int accListCount(Map<String,Object> map);
	
	//=====숙소 찜=====//
	public AccFavVO selectFav(AccFavVO fav);
	public int selectFavCount(Integer acc_num);
	public void insertFav(AccFavVO accFav);
	public void deleteFav(Integer acf_num);
	
	//=====소비자 숙소찜한 목록===//
	public List<AccFavVO> memSelectList(Map<String, Object> map);
	
	//====메인페이지===//
	public List<AccommdationVO> mainList(Map<String, Object> map);
	
}
