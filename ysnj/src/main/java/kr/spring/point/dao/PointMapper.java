package kr.spring.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.point.vo.PointVO;
import kr.spring.reserve.vo.ReserveVO;

public interface PointMapper {
	//포인트번호구하기
	@Select("SELECT point_seq.nextval FROM dual")
	public int selectpoi_num();
	//포인트 적립/차감
	@Insert("INSERT INTO point (poi_num,mem_num,poi_add,poi_minus,poi_detail,poi_date) VALUES (#{poi_num},#{mem_num},#{poi_add},#{poi_minus},#{poi_detail},SYSDATE)")
	public void addminuPoint(PointVO pointVO);
	//포인트COUNT
	public int pointRowCount();
	//포인트 관리 목록
	public List<PointVO> pointList(Map<String, Object> map);
	//적립 총 포인트 계산
	@Select("SELECT SUM(poi_add) FROM point WHERE mem_num=#{mem_num}")
	public int totaladdPoint(Integer mem_num);
	//차감 총 포인트 계산
	@Select("SELECT SUM(poi_minus) FROM point WHERE mem_num=#{mem_num}")
	public int totalaminuPoint(Integer mem_num);
	//내 포인트 목록(mypage)
	public List<PointVO> memPointList(Map<String, Object> map);		
}
