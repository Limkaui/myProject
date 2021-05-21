package kr.spring.accommdation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.accommdation.vo.AccommdationVO;

public interface AccommdationMapper {

	//숙소 등록하기
	//이미지  null처리중';; mem_num은 1로 처리중;;
	@Insert("INSERT INTO accommdation (acc_num, mem_num, acc_category, acc_name, acc_tel, acc_checkin, acc_checkout, acc_address, acc_status, acc_guide, acc_amenity, acc_date) "
			+ "VALUES (accommdation_seq.nextval, 1, #{acc_category}, #{acc_name}, #{acc_tel}, #{acc_checkin}, #{acc_checkout}, #{acc_address}, #{acc_status}, #{acc_guide}, #{acc_amenity,jdbcType=VARCHAR}, SYSDATE)")
	public void insertAccommdation(AccommdationVO accommdation);
	
	//총 레코드 수
	public int selectRowCount();
	
	//숙소 목록
	public List<AccommdationVO> selectList(Map<String, Object> map);
	
	//숙소 상세페이지
	@Select("SELECT * FROM accommdation WHERE acc_num=#{acc_num}")
	public AccommdationVO selectAccommdation(Integer acc_num);
	
	//숙소 정보 수정
	public void updateAccommdation(AccommdationVO accommdation);
	
	//숙소 삭제
	@Delete("DELETE FROM accommdation WHERE acc_num = #{acc_num}")
	public void deleteAccommdation(Integer acc_num);
}
