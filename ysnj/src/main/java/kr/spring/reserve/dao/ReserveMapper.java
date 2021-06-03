package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.accommdation.vo.RoomVO;
import kr.spring.reserve.vo.PaymentVO;
import kr.spring.reserve.vo.ReserveVO;

public interface ReserveMapper {
	//예약번호구하기
	@Select("SELECT reserve_seq.nextval FROM dual")
	public int selectrsv_num();
	
	//결제번호구하기
	@Select("SELECT payment_seq.nextval FROM dual")
	public int selectpay_num();
	
	//객실번호 구하기
	@Select("SELECT roo_num FROM reserve WHERE rsv_num=#{rsv_num}")
	public int selectroo_num(Integer rsv_num); 
	
	//숙소번호 구하기
	@Select("SELECT acc_num FROM room WHERE roo_num=#{roo_num}")
	public int selectacc_num(Integer roo_num); 
	
	//예약등록
	@Insert("INSERT INTO reserve (rsv_num,mem_num,roo_num,rsv_state,rsv_visitnum,rsv_iname,rsv_iphone,rsv_start,rsv_end,rsv_date) VALUES (#{rsv_num},#{mem_num},#{roo_num},#{rsv_state},#{rsv_visitnum},#{rsv_iname},#{rsv_iphone},#{rsv_start},#{rsv_end},SYSDATE)")
	public void insertReserve(ReserveVO reserveVO);
	
	//결제정보 등록
	@Insert("INSERT INTO payment (pay_num,rsv_num,pay_state,pay_money,pay_kind,pay_name,pay_date) VALUES (#{pay_num},#{rsv_num},#{pay_state},#{pay_money},#{pay_kind},#{pay_name},SYSDATE)")
	public void insertPayment(PaymentVO paymentVO);

	//예약목록
	public List<ReserveVO> reserveList(Map<String, Object> map);
	
	//예약COUNT
	public int reserveRowCount();
	
	//예약 상세 페이지
	@Select("SELECT * FROM reserve r JOIN member m ON r.mem_num=m.mem_num WHERE r.rsv_num=#{rsv_num}")
	public ReserveVO selectReserve(Integer rsv_num);
	
	//예약취소 정보 수정
	public void reserveCancel(ReserveVO reserveVO);
	
	//내가 예약한 목록(mypage)
	public List<ReserveVO> memReserveList(Map<String, Object> map);
	
	//내가 결제한 목록(mypage)
	public List<PaymentVO> memPaymentList(Map<String, Object> map);

	
}


//