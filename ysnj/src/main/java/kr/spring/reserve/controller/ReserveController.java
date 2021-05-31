package kr.spring.reserve.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.service.RoomService;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.accommdation.vo.RoomVO;
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
	
	@Resource
	private AccommdationService accommdationService;
	
	@Resource
	private RoomService roomService;
	
	//자바빈 초기화
	@ModelAttribute
	public ReserveVO Init() {
		return new ReserveVO();
	}
	
	//예약하기
	//예약 폼 호출
    @RequestMapping(value="/reserve/reserve.do",method=RequestMethod.GET)
	public String reserveForm(@RequestParam int roo_num,@RequestParam String checkin,@RequestParam String checkout,Model model) {
		RoomVO roomVO = roomService.selectRoom(roo_num);
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(reservrService.selectacc_num(roo_num));
		
		model.addAttribute("roominfo", roomVO);
		model.addAttribute("accinfo", accommdationVO);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);

		return "reserveForm";
	}
	
/*	//예약하기
	//예약 폼 호출
	@RequestMapping(value="/reserve/reserve.do")
	public ModelAndView reserveForm(@RequestParam int roo_num,@RequestParam String start,@RequestParam String end) {
		RoomVO roomVO = roomService.selectRoom(roo_num);
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(reservrService.selectacc_num(roo_num));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveForm");
		mav.addObject("room", roo_num);
		mav.addObject("accinfo", accommdationVO);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("roominfo", roomVO);
		return mav;
	}
	*/
	//예약등록 데이터 전송
	@RequestMapping(value="/reserve/reserve.do",method=RequestMethod.POST)
	public String reserveSubmit(@Valid ReserveVO reserveVO, Integer mem_num, BindingResult result, HttpSession session) {
		
		if(result.hasErrors()) {
			return "redirect://main.do";
		}
		reserveVO.setMem_num((Integer)session.getAttribute("user_num"));
		reservrService.insertReserve(reserveVO);
		
		return "redirect:/main/main.do";
	}
	
	//예약 내역 목록
	@RequestMapping("/reserve/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		//총 레코드 수
		int count = reservrService.reserveRowCount();
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "list.do");
		
		List<ReserveVO> rsv_list = null;
		if(count>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("user_num", user_num);
			rsv_list=reservrService.reserveList(map);
		}
		//예약내역 리스트에 각 인덱스의 roo_num을 빼서 acc_num을구하고 acc_name을 보여주려고 하는데?  
		
		//RoomVO roomVO = roomService.selectRoom(roo_num);
		//AccommdationVO accommdationVO = accommdationService.selectAccommdation(reservrService.selectacc_num(roo_num));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveList");
		mav.addObject("count", count);
		mav.addObject("list", rsv_list);

		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	//예약 상세
	@RequestMapping("/reserve/detail.do")
	public ModelAndView detail(@RequestParam int rsv_num) {
		ReserveVO reserve = reservrService.selectReserve(rsv_num);
		RoomVO roomVO = roomService.selectRoom(reservrService.selectroo_num(rsv_num));
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(reservrService.selectacc_num(reservrService.selectroo_num(rsv_num)));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveView");
		mav.addObject("reserve", reserve);
		mav.addObject("room", roomVO);
		mav.addObject("acc", accommdationVO);
		return mav;
	}
	
	//예약취소 폼 호출
	@RequestMapping(value="/reserve/cancel.do", method=RequestMethod.GET)
	public String reserveCancel(@RequestParam int rsv_num, Model model) {
		ReserveVO reserve = reservrService.selectReserve(rsv_num);
		RoomVO roomVO = roomService.selectRoom(reservrService.selectroo_num(rsv_num));
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(reservrService.selectacc_num(reservrService.selectroo_num(rsv_num)));
		
		model.addAttribute("reserve",reserve);
		model.addAttribute("room", roomVO);
		model.addAttribute("acc", accommdationVO);
		
		return "reserve/reserveCancel";
	}
	
	@RequestMapping(value="/reserve/cancel.do", method=RequestMethod.POST)
	public String submitreserveCancel(@Valid ReserveVO reserveVO) {
		
		reservrService.reserveCancel(reserveVO);
		System.out.println(reserveVO.getRsv_state());
		return "redirect:/reserve/list.do";
	}
	
	
	
}