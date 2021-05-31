package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.reserve.dao.ReserveMapper;
import kr.spring.reserve.vo.PaymentVO;
import kr.spring.reserve.vo.ReserveVO;

@Service("reserveService")
public class ReserveService {
	@Resource ReserveMapper reserveMapper;
	
	//예약등록
	public void insertReserve(ReserveVO reserveVO) {
		//예약관리번호 생성
		reserveVO.setRsv_num(reserveMapper.selectrsv_num());
		reserveMapper.insertReserve(reserveVO);
		//reserveMapper.insertPayment(paymentVO);
	}
	
	//숙소번호 구하기
	public int selectacc_num(Integer roo_num) {
		return reserveMapper.selectacc_num(roo_num);
	}
	
	//객실번호 구하기
	public int selectroo_num(Integer rsv_num) {
		return reserveMapper.selectroo_num(rsv_num);
	}
	
	//예약내역 목록
	public List<ReserveVO> reserveList(Map<String, Object> map) {
		return reserveMapper.reserveList(map);
	}
	
	//예약COUNT
	public int reserveRowCount() {
		return reserveMapper.reserveRowCount();
	}
	
	//예약 상세정보
	public ReserveVO selectReserve(Integer rsv_num) {
		return reserveMapper.selectReserve(rsv_num);
	}
	
	//예약 취소
	public void reserveCancel(ReserveVO reserveVO) {
		reserveMapper.reserveCancel(reserveVO);
	}
	
	//=====소비자 예약 목록===//
	public List<ReserveVO> memReserveList(Map<String, Object> map){
		return reserveMapper.memReserveList(map);
	}
	
	
	
	
	
}
