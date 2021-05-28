package kr.spring.accommdation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.accommdation.dao.AccommdationMapper;
import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.accommdation.vo.AccommdationVO;

@Service("accommdationService")
public class AccommdationServiceImpl implements AccommdationService{
	//의존관계 설정
	@Resource
	private AccommdationMapper accommdationMapper;

	//숙소 등록하기
	public void insertAccommdation(AccommdationVO accommdation) {
		accommdationMapper.insertAccommdation(accommdation);
	}

	//총레코드수
	public int selectRowCount(Integer mem_num) {
		return accommdationMapper.selectRowCount(mem_num);
	}

	//숙소목록
	public List<AccommdationVO> selectList(Map<String,Object> map){
		return accommdationMapper.selectList(map);
	}

	//숙소 상세페이지
	public AccommdationVO selectAccommdation(Integer acc_num) {
		return accommdationMapper.selectAccommdation(acc_num);
	}

	//숙소 정보 수정
	public void updateAccommdation(AccommdationVO accommdation) {
		accommdationMapper.updateAccommdation(accommdation);
	}

	//숙소 삭제
	public void deleteAccommdation(Integer acc_num) {
		//숙소 찜 삭제 먼저
		accommdationMapper.deleteFavByAccNum(acc_num);
		accommdationMapper.deleteAccommdation(acc_num);
	}


	//=====소비자====//
	//숙소&객실 목록
	public List<AccommdationVO> accList(Map<String, Object> map){
		return accommdationMapper.accList(map);
	}

	//숙소&객실 상세 조회
	public AccommdationVO accListSelectAccommdation( Map<String, Object> map, Integer acc_num) {
		return accommdationMapper.accListSelectAccommdation( map, acc_num);
	}

	//총 레코드 수 
	public int accListCount(Map<String,Object> map) {
		return accommdationMapper.accListCount(map);
	}

	//============숙소 찜=============//
	@Override
	public AccFavVO selectFav(AccFavVO fav) { 
		return accommdationMapper.selectFav(fav);
	}

	@Override
	public int selectFavCount(Integer acc_num) {
		return accommdationMapper.selectFavCount(acc_num);
	}

	@Override
	public void insertFav(AccFavVO accFav) {
		accommdationMapper.insertFav(accFav);
	}

	@Override
	public void deleteFav(Integer acf_num) {
		accommdationMapper.deleteFav(acf_num);
	}

	//내가 찜한 목록
	@Override
	public List<AccFavVO> memSelectList(Integer mem_num) {
		return accommdationMapper.memSelectList(mem_num);
	}
	


}
