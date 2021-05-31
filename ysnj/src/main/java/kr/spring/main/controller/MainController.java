package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.vo.AccommdationVO;

@Controller
public class MainController{
	
	//의존관계 설정
	@Resource
	private AccommdationService accommdationService;
	
	
	
	
	@RequestMapping("/main/main.do")
	public String main(Model model) {
		//=====숙소 리스트====//
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 4);
		
		List<AccommdationVO> acc_list = null;
		acc_list = accommdationService.mainList(map);
		//====숙소리스트 끝====//
		
		
		
		//model
		model.addAttribute("acc_list", acc_list);
		       //뷰 이름(타일스 식별자)
		return "main";
	}
	
}
