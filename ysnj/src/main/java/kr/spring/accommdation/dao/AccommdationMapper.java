package kr.spring.accommdation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.accommdation.vo.RoomVO;

public interface AccommdationMapper {

	//숙소 등록하기
	@Insert("INSERT INTO accommdation (acc_num, mem_num, acc_category, acc_name, acc_tel, acc_checkin, acc_checkout, acc_address, acc_status, acc_guide, acc_amenity, acc_date, acc_uploadfile1, acc_filename1,acc_uploadfile2,acc_filename2,acc_uploadfile3,acc_filename3,acc_uploadfile4,acc_filename4,acc_uploadfile5,acc_filename5, acc_uploadfile6,acc_filename6) VALUES (accommdation_seq.nextval, #{mem_num}, #{acc_category}, #{acc_name}, #{acc_tel}, #{acc_checkin}, #{acc_checkout}, #{acc_address}, #{acc_status}, #{acc_guide}, #{acc_amenity,jdbcType=VARCHAR}, SYSDATE, #{acc_uploadfile1},#{acc_filename1}, #{acc_uploadfile2},#{acc_filename2}, #{acc_uploadfile3},#{acc_filename3}, #{acc_uploadfile4},#{acc_filename4}, #{acc_uploadfile5},#{acc_filename5}, #{acc_uploadfile6},#{acc_filename6})")
	public void insertAccommdation(AccommdationVO accommdation);

	//총 레코드 수
	public int selectRowCount(Integer mem_num);

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

	//====소비자===//
	//객실&숙소 목록 
	public List<AccommdationVO> accList(Map<String, Object> map);
	//객실&숙소 상세 페이지
	@Select("SELECT * FROM accommdation WHERE acc_num= #{acc_num}")
	public AccommdationVO accListSelectAccommdation(Map<String, Object> map, @Param("acc_num") Integer acc_num);
	//총 레코드 수
	public int accListCount(Map<String,Object> map);

	//==========숙소 찜 ===============//
	@Select("SELECT * from acc_fav where acc_num=#{acc_num} and mem_num=#{mem_num}")
	public AccFavVO selectFav(AccFavVO fav);
	@Select("SELECT COUNT(*) from acc_fav where acc_num=#{acc_num}")
	public int selectFavCount(Integer acc_num);
	@Insert("INSERT INTO acc_fav (acf_num,acc_num,mem_num) VALUES (acc_fav_seq.nextval,#{acc_num},#{mem_num})")
	public void insertFav(AccFavVO accFav);
	@Delete("DELETE FROM acc_fav WHERE acf_num=#{acf_num}")
	public void deleteFav(Integer acf_num);
	@Delete("DELETE FROM acc_fav WHERE acc_num=#{acc_num}")
	public void deleteFavByAccNum(Integer acc_num);

	//내가 찜한 목록
	public List<AccFavVO> memSelectList(Map<String, Object> map);
	
	//====메인페이지===//
	public List<AccommdationVO> mainList(Map<String, Object> map);
	
	
}
