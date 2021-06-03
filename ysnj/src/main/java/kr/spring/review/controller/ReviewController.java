package kr.spring.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

import kr.spring.review.service.ReviewService;
import kr.spring.review.vo.ReviewVO;
import kr.spring.util.PagingUtil;


@Controller
public class ReviewController {
	private Logger log = Logger.getLogger(this.getClass());

	//의존 관계 설정
	@Resource
	private ReviewService reviewService;
		
	//자바빈(VO) 초기화
	@ModelAttribute("reviewVO")
	public ReviewVO initCommand() {
		return new ReviewVO();
	}
	
	//====게시판 글 등록=======//
	//등록 폼
	@RequestMapping(value="/review/write.do",method=RequestMethod.GET)
	public String form() {
		return "reviewWrite";
	}
	//전송된 데이터 처리
	@RequestMapping(value="/review/write.do",method=RequestMethod.POST)
	public String submit(@Valid ReviewVO reviewVO,
			              BindingResult result,
			              HttpServletRequest request,
			              HttpSession session) {
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "reviewWrite";
		}
		
		//회원 번호 셋팅
		Integer user_num = (Integer)session.getAttribute("user_num");
		reviewVO.setMem_num(user_num);
		
		//글쓰기
		reviewService.insertReview(reviewVO);
		
		return "redirect:/review/list.do";
	}

	//=====게시판 글 목록=====//
	@RequestMapping("/review/list.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		
		//총 레코드 수
		int count = reviewService.selectRowCount();
		
		if(log.isDebugEnabled()) {
			log.debug("<<pageNum>> : " + currentPage);
			log.debug("<<count>> : " + count);
		}
		
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"list.do");
		
		List<ReviewVO> list = null;
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = reviewService.selectList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewList");
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}
	//=====게시판 글 상세=====//
	@RequestMapping("/review/detail.do")
	public ModelAndView detail(@RequestParam int rev_num) {
		if(log.isDebugEnabled()) {
			log.debug("<<rev_num>> : " + rev_num);
		}
		
		//해당 글의 조회수 증가
		reviewService.updateHit(rev_num);
		
		ReviewVO review = reviewService.selectReview(rev_num);
		
		return new ModelAndView("reviewView","review",review);
	}
	//이미지 출력
	@RequestMapping("/review/imageView.do")
	public ModelAndView viewImage(@RequestParam int rev_num) {
		ReviewVO review = reviewService.selectReview(rev_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",review.getRev_uploadfile());
		mav.addObject("filename",review.getRev_filename());
		
		return mav;
	}

}
