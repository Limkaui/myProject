package kr.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.point.service.PointService;
import kr.spring.point.vo.PointVO;
import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.PaymentVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.AuthCheckException;
import oracle.net.aso.m;

@Controller
public class MemberController {
	private Logger log = Logger.getLogger(this.getClass());

	//의존관계 설정
	@Resource
	private MemberService memberService;
	@Resource
	private AccommdationService accommdationService;
	@Resource
	private ReserveService reserveService;
	@Resource
	private PointService pointService;
	@Resource
	private MemberMapper memberMapper;

	//자바빈(VO) 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}

	//===회원가입===
	//아이디 중복 체크
	@RequestMapping("/member/confirmId.do")
	@ResponseBody
	public Map<String,String> process(@RequestParam("id") String mem_id){

		if(log.isDebugEnabled()) {
			log.debug("<<id>> : " + mem_id);
		}

		Map<String,String> map = new HashMap<String,String>();

		MemberVO member = memberService.selectCheckMember(mem_id);
		if(member!=null) {
			//아이디 중복
			map.put("result","idDuplicated");			
		}else {
			if(!Pattern.matches("^[A-Za-z0-9+]{6,12}$", mem_id)){
				//패턴 불일치
				map.put("result", "notMatchPattern");
			}else {
				//아이디 미중복
				map.put("result", "idNotFound");
			}
		}
		return map;
	}

	//회원 등록 선택 폼 호출
	@RequestMapping("/member/registerUser.do")
	public String formChoice() {
		return "memberWrite";
	}

	//회원 등록 폼 호출
	@RequestMapping(value="/member/memberCustomer.do",method=RequestMethod.GET)
	public String form() {
		return "memberCustomer";
	}

	//회원 등록 폼 호출
	@RequestMapping(value="/member/memberSeller.do",method=RequestMethod.GET)
	public String formSeller() {
		return "memberSeller";
	}
	//회원 등록 데이터 전송
	@RequestMapping(value="/member/memberRegister.do",method=RequestMethod.POST)
	public String submit(@Valid MemberVO memberVO,
			BindingResult result) {
		if(log.isDebugEnabled()) {
			log.debug("<<회원가입>> : " + memberVO);
		}

		//유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return form();
		}

		//회원가입
		memberService.insertMember(memberVO);
		
		//회원가입 포인트적립
		int mem_num = memberVO.getMem_num();
		PointVO pointVO = new PointVO();
		pointVO.setMem_num(mem_num);
		pointVO.setPoi_add(100000);
		pointVO.setPoi_detail("회원가입 축하 적립");
		pointService.addminuPoint(pointVO);

		return "redirect:/main/main.do";
	}



	//===회원 로그인===
	//로그인 폼 호출
	@RequestMapping(value="/member/login.do",method=RequestMethod.GET)
	public String formLogin() {
		return "memberLogin";
	}
	//로그인 폼에서 전송된 데이터 처리
	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public String submitLogin(@Valid MemberVO memberVO,
			BindingResult result,
			HttpSession session) {
		if(log.isDebugEnabled()) {
			log.debug("<<회원 로그인>> : " + memberVO);
		}

		//유효성 체크 결과 오류가 있으면 폼 호출
		//id와 passwd 필드만 체크
		if(result.hasFieldErrors("mem_id") || 
				result.hasFieldErrors("mem_pw")) {
			return formLogin();
		}

		//로그인 체크(입력한 id와 비밀번호가 DB에 저장된 id와 비밀번호와 일치하는지 여부)
		try {
			MemberVO member = memberService.selectCheckMember(memberVO.getMem_id());

			boolean check = false;

			if(member!=null) {
				//비밀번호 일치 여부 체크
				check = member.isCheckedPassword(memberVO.getMem_pw());
			}
			if(check) {//인증 성공, 로그인 처리
				//회원번호 저장
				session.setAttribute("user_num", member.getMem_num());
				//회원 아이디 저장
				session.setAttribute("user_id", member.getMem_id());
				//회원 유형 저장
				session.setAttribute("user_type", member.getMem_type());
				
				return "redirect:/main/main.do";

			}else {//인증 실패
				throw new AuthCheckException();
			}		
		}catch(AuthCheckException e) {
			//에러 메시지 처리
			result.reject("invalidIdOrPassword");
			//인증 실패로 로그인 폼 호출
			return formLogin();
		}
	}

	//===회원 로그아웃===
	@RequestMapping("/member/logout.do")
	public String processLogout(HttpSession session) {
		//로그아웃
		session.invalidate();

		return "redirect:/main/main.do";
	}

	//===회원 상세정보===
	@RequestMapping("/member/myPage.do")
	public String process(HttpSession session, Model model) {
		Integer user_num = (Integer)session.getAttribute("user_num");

		MemberVO member = memberService.selectMember(user_num);
		
		System.out.println("<<user_num>> : " + user_num);
		
		//내가 찜한 목록
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mem_num", user_num);
		map.put("start", 1);
		map.put("end", 20);
		
		List<AccFavVO> acf_list = null;
		acf_list = accommdationService.memSelectList(map);
		
		//내가 예약한 목록
		Map<String,Object> rsv_map = new HashMap<String,Object>();
		rsv_map.put("mem_num", user_num);
		rsv_map.put("start", 1);
		rsv_map.put("end", 20);
		
		List<ReserveVO> rsv_list = null;
		rsv_list = reserveService.memReserveList(rsv_map);
		//내가 예약한 목록 끝
		
		//포인트 적립/차감 목록
		Map<String,Object> poi_map = new HashMap<String,Object>();
		poi_map.put("mem_num", user_num);
		poi_map.put("start", 1);
		poi_map.put("end", 20);
		
		List<PointVO> poi_list = null;
		poi_list = pointService.memPointList(poi_map);
		//포인트 총합 계산
		int total = 0, add =0, minu=0;
		try {
			add = pointService.totaladdPoint(user_num);
			minu = pointService.totalminuPoint(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			add = 0;
			minu = 0;
		}
		total = add - minu;
		//포인트 적립/차감 목록 끝
		
		//내가 결제한 목록
		Map<String,Object> pay_map = new HashMap<String,Object>();
		pay_map.put("mem_num", user_num);
		pay_map.put("start", 1);
		pay_map.put("end", 20);
		
		List<PaymentVO> pay_list = null;
		pay_list = reserveService.memPaymentList(pay_map);
		//내가 결제한 목록 끝
		
		model.addAttribute("acf_list", acf_list);	
		model.addAttribute("member", member);
		model.addAttribute("totalpoi", total);
		model.addAttribute("rsv_list", rsv_list);
		model.addAttribute("pay_list", pay_list);
		model.addAttribute("poi_list", poi_list);

		return "memberView";
	}

	//===회원정보수정===
	//수정 폼
	@RequestMapping(value="/member/update.do",method=RequestMethod.GET)
	public String formUpdate(HttpSession session, Model model) {
		Integer user_num = (Integer)session.getAttribute("user_num");

		MemberVO memberVO = memberService.selectMember(user_num);

		model.addAttribute("memberVO", memberVO);

		return "memberModify";
	}

	//수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/member/update.do",method=RequestMethod.POST)
	public String submitUpdate(@Valid MemberVO memberVO,
			BindingResult result,
			HttpSession session) {

		if(log.isDebugEnabled()) {
			log.debug("<<회원 정보 수정>> : " + memberVO);
		}

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "memberModify";
		}

		//회원 정보 수정
		memberService.updateMember(memberVO);

		return "redirect:/member/myPage.do";
	}

	//===비밀번호 수정===
	//비밀번호 수정 폼
	@RequestMapping(value="/member/changePassword.do",method=RequestMethod.GET)
	public String formChangePassword() {
		return "memberChangePassword";
	}

	//비밀번호 수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/member/changePassword.do",method=RequestMethod.POST)
	public String submitChangePassword(@Valid MemberVO memberVO,
			BindingResult result,
			HttpSession session) {
		if(log.isDebugEnabled()) {
			log.debug("<<비밀번호 변경 처리>> : " + memberVO);
		}

		//유효성 체크 결과 오류가 있으면 폼 호출
		//now_passwd와 passwd만 체크
		if(result.hasFieldErrors("now_passwd") ||
				result.hasFieldErrors("mem_pw")) {
			return formChangePassword();
		}

		//비밀번호 일치여부 체크
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num);
		//폼에서 전송한 현재 비밀번호와 DB에서 받아온 현재 비밀번호 일치 여부 체크
		if(!member.getMem_pw().equals(memberVO.getNow_passwd())) {
			//인증실패시
			result.rejectValue("now_passwd", "invalidPasswd");
			return formChangePassword();
		}

		//비밀번호 변경
		memberVO.setMem_num(user_num);
		memberService.updatePassword(memberVO);

		return "redirect:/member/myPage.do";
	}

	//===회원 정보 삭제(회원 탈퇴)===
	//회원정보삭제 폼
	@RequestMapping(value="/member/delete.do",method=RequestMethod.GET)
	public String formDelete() {
		return "memberDelete";
	}
	//회원 정보 삭제를 위한 데이터 처리
	@RequestMapping(value="/member/delete.do",method=RequestMethod.POST)
	public String submitDelete(@Valid MemberVO memberVO,
			BindingResult result,
			HttpSession session) {
		if(log.isDebugEnabled()) {
			log.debug("<<회원 탈퇴>> : " + memberVO);
		}

		//유효성 체크 결과 오류가 있으면 폼을 호출
		//id와 passwd만 체크
		if(result.hasFieldErrors("mem_id") ||
				result.hasFieldErrors("mem_pw")) {
			return "memberDelete";
		}

		Integer user_num = (Integer)session.getAttribute("user_num");
		//아이디와 비밀번호 인증
		try {
			MemberVO member = memberService.selectMember(user_num);
			boolean check = false;

			if(member!=null && memberVO.getMem_id().equals(member.getMem_id())) {
				//비밀번호 일치 여부 체크
				check = member.isCheckedPassword(memberVO.getMem_pw());
			}
			if(check) {
				//인증 성공, 회원 정보 삭제
				memberService.deleteMember(user_num);
				//로그아웃
				session.invalidate();

				return "redirect:/main/main.do";	
			}else {
				//인증 실패
				throw new AuthCheckException();
			}

		}catch(AuthCheckException e) {
			result.reject("invalidIdOrPassword");
			return formDelete();
		}
	}
}


