package kr.spring.accommdation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.accommdation.dao.AccommdationMapper;
import kr.spring.accommdation.vo.AccommdationVO;

@Service("accommdationService")
public class AccommdationServiceImpl implements AccommdationService{
		//의존관계 설정
		@Resource
		private AccommdationMapper accommdationMapper;
		
		//숙소 등록하기
		public void insertAccommdation(AccommdationVO accommdation) {
			accommdationMapper.insertAccommdation(accommdation);
		}
		
		//총레코드수
		public int selectRowCount() {
			return accommdationMapper.selectRowCount();
		}
			
		//숙소목록
		public List<AccommdationVO> selectList(Map<String,Object> map){
			return accommdationMapper.selectList(map);
		}

		//숙소 상세페이지
		public AccommdationVO selectAccommdation(Integer acc_num) {
			return accommdationMapper.selectAccommdation(acc_num);
		}
		
		//숙소 정보 수정
		public void updateAccommdation(AccommdationVO accommdation) {
			accommdationMapper.updateAccommdation(accommdation);
		}

		//숙소 삭제
		public void deleteAccommdation(Integer acc_num) {
			accommdationMapper.deleteAccommdation(acc_num);
		}
}
