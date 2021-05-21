package kr.spring.accommdation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.util.PagingUtil;

@Controller
public class AccommdationController {

	//의존 관계 설정
	@Resource
	private AccommdationService accommdationService;
	private Logger log = Logger.getLogger(this.getClass());
	
	//자바빈 초기화
	@ModelAttribute("accommdationVO")
	public AccommdationVO initCommand() {
		return new AccommdationVO();
	}
	
	//==숙소정보 등록==//
	//등록 폼
	@RequestMapping(value="/accommdation/write.do", method=RequestMethod.GET)
	public String form() {
		return "accommdation/accommdationWrite";
	}
	
	//전송된 데이터 처리
	@RequestMapping(value="/accommdation/write.do", method=RequestMethod.POST)
	public String submit(@Valid AccommdationVO accommdationVO) {
		
		//글쓰기
		accommdationService.insertAccommdation(accommdationVO);
		
		return "redirect:/accommdation/list.do";
	}
	
	//==숙소 목록==//
	@RequestMapping("/accommdation/list.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1")int currentPage){
		
		//총 레코드 수
		int count = accommdationService.selectRowCount();
		PagingUtil page = new PagingUtil(currentPage, count,10, 10, "list.do");
		List<AccommdationVO> acc_list = null;
		
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			acc_list = accommdationService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/accommdation/accommdationList");
		mav.addObject("count", count);
		mav.addObject("acc_list", acc_list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	//===숙소 정보상세===//
	@RequestMapping("/accommdation/detail.do")
	public ModelAndView detail(@RequestParam int acc_num) {
		
		AccommdationVO accommdation = accommdationService.selectAccommdation(acc_num);
		
		return new ModelAndView("/accommdation/accommdationView", "accommdation", accommdation);
	}
	
	//==숙소 정보 수정==//
	//수정폼 호출
	@RequestMapping(value="/accommdation/update.do", method=RequestMethod.GET)
	public String formUpdate(@RequestParam int acc_num, Model model) {
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(acc_num);
		
		if(log.isDebugEnabled()) {
			log.debug("<<AccommdationVO>>" + accommdationVO);
		}
		
		model.addAttribute("accommdationVO", accommdationVO);
		
		return "accommdation/accommdationModify";
	}
	
	//수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/accommdation/update.do", method=RequestMethod.POST)
	public String submitUpdate(@Valid AccommdationVO accommdationVO) {
		
		//정보수정
		accommdationService.updateAccommdation(accommdationVO);

		return "redirect:/accommdation/list.do";
	}
	
	//==숙소 정보 삭제==//
	@RequestMapping("/accommdation/delete.do")
	public String submitDelete(@RequestParam int acc_num) {
		//숙소 삭제
		accommdationService.deleteAccommdation(acc_num);
		return "redirect:/accommdation/list.do";
	}
	
}
