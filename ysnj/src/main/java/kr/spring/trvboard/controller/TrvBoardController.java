package kr.spring.trvboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.trvboard.service.TrvBoardService;
import kr.spring.trvboard.vo.TrvBoardVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class TrvBoardController {
	private Logger log = Logger.getLogger(this.getClass());
	//의존관계설정
	@Resource
	private TrvBoardService trvboardService;
	
	//자바빈(VO)초기화  
	@ModelAttribute 
	public TrvBoardVO initCommand(){
		return new TrvBoardVO();
	}
	
	//======게시판  목록 ======//
	@RequestMapping("/travel/list.do")
	public ModelAndView getList(@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword,
			@RequestParam(value="trv_cate",defaultValue="0")int trv_cate){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("trv_cate", trv_cate);
		//총 레코드 수
		int count = trvboardService.selecRowCount(map);
		
		/*		
		 * 로그 레벨		
		 * FATAL : 가장 심각한 오류		 
		 * ERROR : 일방적인 오류		
		 * WARN : 주의를 요하는 경우		
		 * INFO : 런타임시 관심있는 내용		
		 * DEBUG : 시스템 흐름과 관련된 상세 정보		
		 * TRACE : 가장 상세한 정보		
		 */		
		
		if(log.isDebugEnabled()){  		
			log.debug("<<count>> : "+currentPage);
			log.debug("<<count>> : "+count);
		}
		/*
		 * 페이징 처리
		 * currentPage : 선택한 현재 번호
		 * count : 총 게시물 수
		 * rowCount : 한 페이지의 게시물의 수
		 * pageCount : 한 화면에 보여줄 페이지 수
		 * pageUrl : 호출 페이지 URL
		 */ 
		//페이징 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,16,16,"list.do","&trv_cate="+trv_cate);
		
		List<TrvBoardVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = trvboardService.selectList(map);
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("trvboardList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("trv_cate", trv_cate);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
		
	//======게시판 글 등록======//
	//등록폼
	@RequestMapping(value="/travel/write.do", method=RequestMethod.GET)
	public String form(){ 
	
		return "trvboardWrite";
	}
	//전송된 데이터 처리
	@RequestMapping(value="/travel/write.do", method=RequestMethod.POST)
	public String submit(@Valid TrvBoardVO trvboardVO,
						  BindingResult result,
						  HttpServletRequest request,
						  HttpSession session){
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "trvboardWrite";
		}
		
		//회원 번호 셋팅
		trvboardVO.setMem_num((Integer)session.getAttribute("mem_num"));
		
		trvboardService.insertTrvBoard(trvboardVO);
		
		return "redirect:/travel/list.do";
	}
	
	//======게시판 글 상세======//
	@RequestMapping("/travel/detail.do")
	public ModelAndView detail(@RequestParam int board_num){
		
		if(log.isDebugEnabled()) {
			log.debug("<<board_num>> : "+board_num);

		}
		
		
		TrvBoardVO trvboard = trvboardService.selectBoard(board_num);
		
		//						,${테이블명지정}
		return new ModelAndView("trvboardView","trv_board",trvboard);
		
	}
	//이미지 출력
		@RequestMapping("/travel/imageView.do")
		public ModelAndView viewImage(@RequestParam int trv_num, @RequestParam int trv_idx) {
			TrvBoardVO board = trvboardService.selectBoard(trv_num);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("imageView");
			
			if(trv_idx==1) {
				mav.addObject("imageFile",board.getTrv_uploadfile1());
				mav.addObject("filename",board.getTrv_filename1());
			}else if(trv_idx==2) {
				mav.addObject("imageFile",board.getTrv_uploadfile2());
				mav.addObject("filename",board.getTrv_filename2());
			}else if(trv_idx==3) {
				mav.addObject("imageFile",board.getTrv_uploadfile3());
				mav.addObject("filename",board.getTrv_filename3());
			}else if(trv_idx==4) {
				mav.addObject("imageFile",board.getTrv_uploadfile4());
				mav.addObject("filename",board.getTrv_filename4());
			}else if(trv_idx==5) {
				mav.addObject("imageFile",board.getTrv_uploadfile5());
				mav.addObject("filename",board.getTrv_filename5());
			}
			return mav;
		}
	
		
	//======게시판 글  수정 ======//
		//수정 폼
		@RequestMapping(value="/travel/update.do", method=RequestMethod.GET)
		public String formUpdate(@RequestParam int trv_num,Model model) {
			TrvBoardVO trvBoardVO = trvboardService.selectBoard(trv_num);
			model.addAttribute("trvBoardVO",trvBoardVO);
			
			
			return "trvboardModify";
		}
		
		//수정 폼에서전송된 데이터 처리
		@RequestMapping(value="/travel/update.do",method=RequestMethod.POST)
		public String submitUpdate(@Valid TrvBoardVO trvboardVO,
									BindingResult result,
									HttpServletRequest request,
									HttpSession session) {
			
			if(log.isDebugEnabled()){  		
				log.debug("<<TrvBoardVO>> : "+trvboardVO);
			}
			
			//유효성 체크 결고 오류가 있으면 폼 호출
			if(result.hasErrors()){
				return "trvboardModify";
			}
			
			//회원 번호 셋팅
			trvboardVO.setMem_num((Integer)session.getAttribute("mem_num"));
			//trvboardVO.setMem_num(1);

			//글수정
			trvboardService.updateBoard(trvboardVO);
			
			
			return "redirect:/travel/list.do";
		}
		
		//========게시판 글 삭제=========//
		@RequestMapping("/travel/delete.do")
		public String submitDelete(@RequestParam int trv_num) {
			//글 삭제
			trvboardService.deleteBoard(trv_num);
			
			return "redirect:/travel/list.do";
		}
	
	}
