package kr.spring.qna.controller;

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

import kr.spring.qna.vo.QnaVO;
import kr.spring.qna.vo.QnaVO;
import kr.spring.qna.service.QnaService;
import kr.spring.qna.vo.QnaVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class QnaController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private QnaService qnaService;

	@ModelAttribute("qnaVO")
	public QnaVO initCommand() {
		return new QnaVO();
	}

	//====게시판 글 등록=======//
	//등록 폼
	@RequestMapping(value="/qna/write.do",method=RequestMethod.GET)
	public String form() {
		return "qnaWrite";
	}
	//전송된 데이터 처리
	@RequestMapping(value="/qna/write.do",method=RequestMethod.POST)
	public String submit(@Valid QnaVO qnaVO,
			BindingResult result,
			HttpServletRequest request,
			HttpSession session) {

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "qnaWrite";
		}

		//회원 번호 셋팅
		qnaVO.setMem_qnum((Integer)session.getAttribute("user_num"));
		

		//글쓰기
		qnaService.insertQna(qnaVO);

		return "redirect:/qna/list.do";
	}


	@RequestMapping("/qna/list.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) {

		//총 레코드 수

		int count = qnaService.selectRowCount();

		if(log.isDebugEnabled()) {
			log.debug("<<pageNum>> : " + currentPage);
			log.debug("<<count>> : " + count);
		}

		//페이징 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,10,10,"list.do");

		List<QnaVO> list = null;
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = qnaService.selectList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaList");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;

	}

	//====게시판 글 상세======//
	@RequestMapping("/qna/detail.do")
	public ModelAndView detail(@RequestParam int qna_num) {
		if(log.isDebugEnabled()) {
			log.debug("<<qna_num>> : " + qna_num);
		}

		QnaVO qna = qnaService.selectQna(qna_num);
		//HTML 태그 불허
		qna.setQna_title(StringUtil.useNoHtml(qna.getQna_title()));
		//HTML 태그 불허 및 줄바꿈 처리
		qna.setQna_question(StringUtil.useBrNoHtml(qna.getQna_question()));


		return new ModelAndView("qnaView","qna",qna);
	}

	//=====게시판 글 수정======//
	//수정 폼
	@RequestMapping(value="/qna/update.do",method=RequestMethod.GET)
	public String formUpdate(@RequestParam int qna_num,Model model) {
		QnaVO qnaVO = qnaService.selectQna(qna_num);
		model.addAttribute("qnaVO", qnaVO);

		return "qnaModify";
	}
	//수정 폼에서 전송된 데이터 처리
	@RequestMapping(value="/qna/update.do",method=RequestMethod.POST)
	public String submitUpdate(@Valid QnaVO qnaVO,
			BindingResult result,
			HttpServletRequest request) {
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "qnaModify";
		}

		//글 수정
		qnaService.updateQna(qnaVO);

		return "redirect:/qna/list.do";
	}

	//======게시판 글 삭제========//
	@RequestMapping("/qna/delete.do")
	public String submitDelete(@RequestParam int qna_num) {
		//글 삭제
		qnaService.deleteQna(qna_num);

		return "redirect:/qna/list.do";
	}


	@RequestMapping(value="/qna/answer.do",method=RequestMethod.POST)
	public String submitUpdateAnswer(@Valid QnaVO qnaVO,
			BindingResult result,
			HttpServletRequest request) {

		//글 수정
		qnaService.updateQnaAnswer(qnaVO);

		return "redirect:/qna/detail.do?qna_num="+qnaVO.getQna_num();
	}
}














