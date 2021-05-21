package kr.spring.accommdation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.accommdation.dao.RoomMapper;
import kr.spring.accommdation.vo.RoomVO;

public interface RoomService {
	
	//객실 등록하기
	public void insertRoom(RoomVO room);
	
	//총레코드수
	public int selectRowCount();
	
	//객실 목록
	public List<RoomVO> selectList(Map<String, Object> map);
	
	//객실 상세페이지
	public RoomVO selectRoom(Integer roo_num);
	
	//객실 정보 수정
	public void updateRoom(RoomVO room);
	
	//객실 삭제
	public void deleteRoom(Integer roo_num);
	
}
