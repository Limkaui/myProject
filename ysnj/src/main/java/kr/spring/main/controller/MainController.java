package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.notice.service.NoticeService;
import kr.spring.notice.vo.NoticeVO;
import kr.spring.trvboard.service.TrvBoardService;
import kr.spring.trvboard.vo.TrvBoardVO;
import kr.spring.util.PagingUtil;

@Controller
public class MainController{

	//의존관계 설정
	@Resource
	private AccommdationService accommdationService;
	@Resource
	private TrvBoardService trvboardService;
	@Resource
	private NoticeService noticeService;

	@RequestMapping("/main/main.do")
	public String main(Model model) {
		//=====숙소 리스트====//
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 4);

		List<AccommdationVO> acc_list = null;
		acc_list = accommdationService.mainList(map);
		//====숙소리스트 끝====//

		//=============예행 정보 시작===========//
		Map<String,Object> trv_map = new HashMap<String, Object>();
		trv_map.put("start", 1);
		trv_map.put("end", 3);
		trv_map.put("keyword", "");
		trv_map.put("trv_cate", 0);
		List<TrvBoardVO> trv_list = null;
		trv_list = trvboardService.selectList(trv_map);

		//===========공지사항 시작 ==================//
		Map<String,Object> notice_map = new HashMap<String,Object>();
		notice_map.put("start", 1);
		notice_map.put("end", 3);
		List<NoticeVO> notice_list = noticeService.selectList(notice_map);
		
		
		//model
		model.addAttribute("acc_list", acc_list);
		model.addAttribute("trv_list",trv_list);
		model.addAttribute("notice_list",notice_list);

		//뷰 이름(타일스 식별자)
		return "main";
	}

}
