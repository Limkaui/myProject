package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.reserve.vo.PaymentVO;
import kr.spring.reserve.vo.ReserveVO;

public interface ReserveMapper {
	//예약번호구하기
	@Select("SELECT reserve_seq.nextval FROM dual")
	public int selectrsv_num();
	
	//예약등록
	@Insert("INSERT INTO reserve (rsv_num,mem_num,roo_num,rsv_state,rsv_visitnum,rsv_iname,rsv_iphone,rsv_start,rsv_end,rsv_date) VALUES (#{rsv_num},#{mem_num},#{roo_num},#{rsv_state},#{rsv_visitnum},#{rsv_iname},#{rsv_iphone},#{rsv_start},#{rsv_end},SYSDATE)")
	public void insertReserve(ReserveVO reserveVO);
	
	//예약등록시 결제정보 등록
	@Insert("INSERT INTO payment (pay_num,rsv_num,pay_state,pay_money,pay_kind,pay_name,pay_date) VALUES (#{pay_num},#{rsv_num},#{pay_state},#{pay_money},#{pay_kind},#{pay_name},#{pay_date})")
	public void insertPayment(PaymentVO paymentVO);

	//예약목록록
	public List<ReserveVO> reserveList(Map<String, Object> map);
	
	//예약COUNT
	public int reserveRowCount();
	
}


//