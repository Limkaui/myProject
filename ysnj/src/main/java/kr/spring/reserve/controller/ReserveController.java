package kr.spring.reserve.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import kr.spring.point.service.PointService;
import kr.spring.reserve.service.ReserveService;
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
	@Resource
	private PointService pointService;
	
	//자바빈 초기화
	@ModelAttribute
	public ReserveVO Init() {
		return new ReserveVO();
	}
	
	//예약하기
	//예약 폼 호출
    @RequestMapping(value="/reserve/reserve.do",method=RequestMethod.GET)
	public String reserveForm(@RequestParam int roo_num,@RequestParam String checkin,@RequestParam String checkout,Model model, HttpSession session) {
    	Integer user_num = (Integer)session.getAttribute("user_num");
    	RoomVO roomVO = roomService.selectRoom(roo_num);
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(reservrService.selectacc_num(roo_num));
		//포인트
		int total = 0, add, minu;
		try {
			add = pointService.totaladdPoint(user_num);
			minu = pointService.totalminuPoint(user_num);
			
		} catch (Exception e) {
			e.printStackTrace();
			add = 0;
			minu = 0;
		}
		total = add - minu;
		//예약날짜계산
		int payday = roomVO.getRoo_price();
		int totalpay = 0;
		Date indate,outdate;
		try {
			indate =new SimpleDateFormat("yyyy-MM-dd").parse(checkin);
			outdate =new SimpleDateFormat("yyyy-MM-dd").parse(checkout);
			// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화
	        long calDate = outdate.getTime() - indate.getTime(); 
	        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환
	        // 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 출력
	        long result = calDate / ( 24*60*60*1000); 
	        
	        result = Math.abs(result);
	        System.out.println("----------resultere"+result);
	        //예약일수 만큼 방가격 계산
	        totalpay = (int) (payday*result);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("roo_num", roo_num);
		model.addAttribute("roominfo", roomVO);
		model.addAttribute("accinfo", accommdationVO);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("point",total);
		model.addAttribute("totalpay",totalpay);

		return "reserveForm";
	}

	//예약등록 데이터 전송
	@RequestMapping(value="/reserve/reserve.do",method=RequestMethod.POST)
	public String reserveSubmit(@Valid ReserveVO reserveVO, Integer mem_num, BindingResult result, HttpSession session) {
		
		if(result.hasErrors()) {
			return "redirect://main.do";
		}
		reserveVO.setMem_num((Integer)session.getAttribute("user_num"));
		reservrService.insertReserve(reserveVO);
		
		session.setAttribute("rsv_num", reserveVO.getRsv_num());

		//return "redirect:/reserve/list.do";
		return "redirect:/reserve/payment.do";
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
	
}