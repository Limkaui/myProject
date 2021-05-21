package kr.spring.accommdation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.accommdation.vo.RoomVO;

public interface RoomMapper {
	//객실 등록하기
	//일단 acc_num은 1로 처리중
	@Insert("INSERT INTO room (roo_num, acc_num, roo_name, roo_price, roo_status, roo_guide, roo_capacity, roo_date)"
			+ "VALUES (room_seq.nextval, #{acc_num}, #{roo_name}, #{roo_price}, #{roo_status}, #{roo_guide}, #{roo_capacity,jdbcType=VARCHAR}, SYSDATE)")
	public void insertRoom(RoomVO room);
	
	//총레코드 수
	public int selectRowCount();
	
	//객실 목록
	public List<RoomVO> selectList(Map<String, Object> map);
		
	//객실 상세 페이지
	@Select("SELECT * FROM room roo JOIN accommdation acc ON acc.acc_num=roo.acc_num WHERE roo.roo_num=#{roo_num}")
	public RoomVO selectRoom(Integer roo_num);
	
	//객실 정보 수정
	public void updateRoom(RoomVO room);
	
	//객실 삭제
	@Delete("DELETE FROM room WHERE roo_num = #{roo_num}")
	public void deleteRoom(Integer roo_num);
	
}
