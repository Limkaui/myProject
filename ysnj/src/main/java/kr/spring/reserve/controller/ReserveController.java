package kr.spring.reserve.controller;

import java.text.Normalizer.Form;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.PaymentVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.PagingUtil;

@Controller
public class ReserveController {
	private Logger log = Logger.getLogger(this.getClass());
	
	//의존관계설정
	@Resource
	private ReserveService reservrService;
	
	//자바빈 초기화
	@ModelAttribute
	public ReserveVO Init() {
		return new ReserveVO();
	}
	
	
	//예약하기
	//예약 폼 호출
	@RequestMapping(value="/reserve/reserve.do",method=RequestMethod.GET)
	public String reserveForm() {
		//타일스 식별자
		return "reserveForm";
	}
	
	//예약등록 데이터 전송
	@RequestMapping(value="/reserve/reserve.do",method=RequestMethod.POST)
	public String reserveSubmit(@Valid ReserveVO reserveVO, PaymentVO paymentVO, BindingResult result) {
		
		if(result.hasErrors()) {
			return reserveForm();
		}
		
		reservrService.insertReserve(reserveVO);
		
		return "redirect:/main/main.do";
	}
	
	//예약 내역 목록
	@RequestMapping("/reserve/reservelist.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		//총 레코드 수
		int count = reservrService.reserveRowCount();
		
		if(log.isDebugEnabled()) {
			log.debug("----pageNum---- : " + currentPage);
			log.debug("----count---- : " + count);
		}
		
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "list.do");
		
		List<ReserveVO> list = null;
		if(count>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list=reservrService.reserveList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
}