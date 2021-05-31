package kr.spring.point.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.point.service.PointService;
import kr.spring.point.vo.PointVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.PagingUtil;


@Controller
public class PointController {
	//의존관계설정
	@Resource
	private PointService pointService;
	
	//자바빈 초기화
	@ModelAttribute
	public PointVO Init() {
		return new PointVO();
	}
	
	//포인트 등록/차감 폼 호출
	@RequestMapping(value="/point/point.do",method=RequestMethod.GET)
	public String pointForm() {
		return "pointForm";
	}
	
	//포인트 등록/차감 데이터 전송
	@RequestMapping(value="/point/point.do",method=RequestMethod.POST)
	public String pointSubmit(@Valid PointVO pointVO, Integer mem_num, BindingResult result, HttpSession session) {
		
		if(result.hasErrors()) {
			return "redirect://main.do";
		}
		pointService.addminuPoint(pointVO);
		
		return "redirect:/main/main.do";
	}
	
	//포인트 내역 목록
	@RequestMapping("/point/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		//총 레코드 수
		int count = pointService.pointRowCount();
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "list.do");
		
		List<PointVO> point_list = null;
		if(count>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("user_num", user_num);
			point_list=pointService.pointList(map);
		}
		
		int total= pointService.totaladdPoint(user_num)-pointService.totalminuPoint(user_num);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pointList");
		mav.addObject("count", count);
		mav.addObject("list", point_list);
		mav.addObject("total", total);

		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
}
