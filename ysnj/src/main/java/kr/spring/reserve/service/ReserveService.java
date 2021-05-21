package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	
	//예약내역
	public List<ReserveVO> reserveList(Map<String, Object> map) {
		return reserveMapper.reserveList(map);
	}
	
	//예약COUNT
	public int reserveRowCount() {
		return reserveMapper.reserveRowCount();
	}
	
}
