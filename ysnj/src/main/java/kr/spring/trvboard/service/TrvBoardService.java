package kr.spring.trvboard.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.trvboard.dao.TrvBoardMapper;
import kr.spring.trvboard.vo.TrvBoardVO;

public interface TrvBoardService{
		//글쓰기
		public void insertTrvBoard(TrvBoardVO Trvboard);		
		//총 레코드 수
		public int selecRowCount(Map<String,Object> map);
		//글 목록
		public List<TrvBoardVO> selectList(Map<String,Object> map);
		
		//글 상세 페이지
		public TrvBoardVO selectBoard(Integer Trvboard_num);
		
		//글 수정
		public void updateBoard(TrvBoardVO Trvboard);
		
		//글삭제
		public void deleteBoard(Integer Trvboard_num);
	}