package kr.spring.reserve.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.service.RoomService;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.accommdation.vo.RoomVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.point.service.PointService;
import kr.spring.point.vo.PointVO;
import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.PaymentVO;
import kr.spring.reserve.vo.ReserveVO;

@Controller
public class PaymentController {
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
	@Resource
	private MemberService memberService;
	//자바빈 초기화
	@ModelAttribute
	public PaymentVO Init() {
		return new PaymentVO();
	}
	
	//결제창
	@RequestMapping(value="/reserve/payment.do",method=RequestMethod.GET)
	public String paymentForm(Model model, HttpSession session) {
		//회원번호구하기
	   	Integer user_num = (Integer)session.getAttribute("user_num");
	   	//예약번호구하기
	   	int rsv_num = (Integer) session.getAttribute("rsv_num");
	   	System.out.println("-------rsv"+rsv_num);
	   	int roo_num = reservrService.selectroo_num(rsv_num);
	   	System.out.println("-------roo"+roo_num);
	   	//방정보
	   	RoomVO roomVO = roomService.selectRoom(roo_num);
	   	//예약정보
	   	ReserveVO reserveVO = reservrService.selectReserve(rsv_num);
	   	System.out.println("~~"+reserveVO);
	   	//숙소정보
	   	AccommdationVO accommdationVO = accommdationService.selectAccommdation(roomVO.getAcc_num());
	   	//로그인회원정보
	   	MemberVO memberVO = memberService.selectMember(user_num);
	   	//판매자회원정보
	   	MemberVO memberVO2 = memberService.selectMember(accommdationVO.getMem_num());
	   	String mem_account = memberVO2.getMem_account();
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
	
		String checkin = reserveVO.getRsv_start();
		String checkout = reserveVO.getRsv_end();
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
		    long result = calDate / (24*60*60*1000); 
		    result = Math.abs(result);
		    System.out.println("----------re"+result);
		    //예약일수 만큼 방가격 계산
		    totalpay = (int) (payday*result);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("point",total);
		model.addAttribute("totalpay",totalpay);
	   	model.addAttribute("rsv_num",rsv_num);
	   	model.addAttribute("mem_account",mem_account);
	   	model.addAttribute("member",memberVO);
	   	model.addAttribute("acc",accommdationVO);
		return "paymentForm";
	}
	
	//결제처리 데이터 전송
	@RequestMapping(value="/reserve/payment.do",method=RequestMethod.POST)
	public String paymentSubmit(@Valid PaymentVO paymentVO, BindingResult result, HttpSession session) {
		System.out.println("--------------pay1");
		System.out.println("--------------pay1"+paymentVO);
		Integer user_num = (Integer)session.getAttribute("user_num");
		int rsv_num = (Integer) session.getAttribute("rsv_num");
		System.out.println("user_num"+user_num);
		System.out.println("rsv_num"+rsv_num);
		RoomVO roomVO = roomService.selectRoom(reservrService.selectroo_num(rsv_num));
		if(result.hasErrors()) {
			return "redirect:/main/main.do";
		}
		
		paymentVO.setPay_state(1);
		if(paymentVO.getPay_kind()==3) {
			paymentVO.setPay_name("포인트");
			PointVO pointVO = new PointVO();
			pointVO.setMem_num(user_num);
			pointVO.setPoi_minus(paymentVO.getPay_money());
			pointVO.setPoi_detail(roomVO.getAcc_name()+" 결제");
			pointService.addminuPoint(pointVO);
			reservrService.reserveSuccess(rsv_num);
		}
		if(paymentVO.getPay_kind()==2) {
			paymentVO.setPay_state(0);
			paymentVO.setPay_money(0);
			reservrService.reserveWaite(rsv_num);;
		}
		if(paymentVO.getPay_kind()==1) {
			paymentVO.setPay_name("카카오");
			reservrService.reserveSuccess(rsv_num);
		}
		System.out.println("--------------pay");
		System.out.println("--------------pay"+paymentVO);
		reservrService.insertPayment(paymentVO);
		
		session.removeAttribute("rsv_num");
		return "redirect:/member/myPage.do";
	}
}