package kr.spring.trvboard.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.trvboard.dao.TrvBoardMapper;
import kr.spring.trvboard.vo.TrvBoardVO;

@Service("TrvboardService")
public class TrvBoardServiceImpl implements TrvBoardService{
		//의존관계설정
		@Resource
		private TrvBoardMapper TrvboardMapper;
		
		//글쓰기
		public void insertTrvBoard(TrvBoardVO Trvboard){
			TrvboardMapper.insertTrvBoard(Trvboard);
		}
		
		//총 레코드 수
		public int selecRowCount(Map<String,Object> map){
			return TrvboardMapper.selectRowCount(map);
		}
		//글 목록
		public List<TrvBoardVO> selectList(Map<String,Object> map){
			return TrvboardMapper.selectList(map);
		}
		
		//글 상세 페이지
		public TrvBoardVO selectBoard(Integer Trvboard_num) {
			return TrvboardMapper.selectTrvBoard(Trvboard_num);
		}
		
		//글 수정
		public void updateBoard(TrvBoardVO Trvboard) {
			TrvboardMapper.updateTrvBoard(Trvboard);
		}
		
		//글삭제
		public void deleteBoard(Integer Trvboard_num) {
			TrvboardMapper.deleteTrvBoard(Trvboard_num);
			
		}
	}