package kr.spring.point.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.point.dao.PointMapper;
import kr.spring.point.vo.PointVO;
import kr.spring.reserve.vo.ReserveVO;

@Service("pointService")
public class PointService {
	@Resource PointMapper pointMapper;
	
	//포인트 적립 및 차감
	public void addminuPoint(PointVO pointVO) {
		//포인트관리번호 생성
		pointVO.setPoi_num(pointMapper.selectpoi_num());
		pointMapper.addminuPoint(pointVO);
		
	}
	
	//포인트COUNT
	public int pointRowCount() {
		return pointMapper.pointRowCount();
	}
	
	//포인트 내역 목록
	public List<PointVO> pointList(Map<String, Object> map) {
		return pointMapper.pointList(map);
	}
	
	//총 포인트 적립금
	public int totaladdPoint(Integer mem_num) {
		return pointMapper.totaladdPoint(mem_num);
	}
	
	//총 포인트 차감금
	public int totalminuPoint(Integer mem_num) {
		return pointMapper.totalaminuPoint(mem_num);
	}
	
	//=====소비자 포인트 목록===//
	public List<PointVO> memPointList(Map<String, Object> map){
		return pointMapper.memPointList(map);
	}
	

}
