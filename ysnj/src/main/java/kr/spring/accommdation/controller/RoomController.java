package kr.spring.accommdation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.accommdation.service.RoomService;
import kr.spring.accommdation.vo.RoomVO;
import kr.spring.util.PagingUtil;

@Controller
public class RoomController {
	
	//의존 관계 설정
	@Resource
	private RoomService roomService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//자바빈 초기화
	@ModelAttribute("roomVO")
	public RoomVO initCommand() {
		return new RoomVO();
	}
	
	//==객실 정보 등록==//
	//등록폼
	@RequestMapping(value="/accommdation/room/write.do", method=RequestMethod.GET)
	public String form(@RequestParam int acc_num) {

		if(log.isDebugEnabled()) {
			log.debug("<<acc_num>> : " + acc_num);
		}
		return "room/roomWrite";
	}
	
	//전송된 데이터 처리
	@RequestMapping(value="/accommdation/room/write.do", method=RequestMethod.POST)
	public String submit(@Valid RoomVO roomVO) throws UnsupportedEncodingException {
	
		System.out.println("acc_num" + roomVO.getAcc_num());
		System.out.println("acc_name" + roomVO.getAcc_name());
		
		//객실 글 쓰기
		roomService.insertRoom(roomVO);
		
		return "redirect:/accommdation/room/list.do?acc_num=" + roomVO.getAcc_num() + "&acc_name=" + URLEncoder.encode(roomVO.getAcc_name(),"UTF-8");
	}
	
	//==객실 목록==//
	@RequestMapping("/accommdation/room/list.do")
	public ModelAndView process(@Valid RoomVO roomVO,
								@RequestParam(value="pageNum", defaultValue="1")int currentPage,
								@RequestParam int acc_num, @RequestParam String acc_name) {
		
		//총 레코드 수
		int count = roomService.selectRowCount();
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "list.do","&acc_num="+acc_num+"&acc_name="+acc_name);
		List<RoomVO> roo_list = null;
		
		if(count >0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("acc_num", acc_num);
			roo_list = roomService.selectList(map);
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/room/roomList");
		mav.addObject("count", count);
		mav.addObject("acc_num", acc_num);
		mav.addObject("roo_list", roo_list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	//==객실 정보 상세==//
	@RequestMapping("/accommdation/room/detail.do")
	public ModelAndView detail(@RequestParam int roo_num) {
		RoomVO room = roomService.selectRoom(roo_num);
		
		return new ModelAndView("/room/roomView", "room", room);
	}
	
	
	//==객실 정보 수정==//
	//수정 폼 호출
	@RequestMapping(value="accommdation/room/update.do", method=RequestMethod.GET)
	public String formUpdate(@RequestParam int roo_num, Model model) {
		RoomVO roomVO = roomService.selectRoom(roo_num);
		model.addAttribute("roomVO", roomVO);
		
		return "room/roomModify";
	}
	
	//수정 폼에서 전송된 데이터 처리
	@RequestMapping(value="accommdation/room/update.do", method=RequestMethod.POST)
	public String submitUpdate(@Valid RoomVO roomVO) throws UnsupportedEncodingException {
		
		if(log.isDebugEnabled()) {
			log.debug("<<RoomVO>> : " + roomVO);
		}
		
		//정보 수정
		roomService.updateRoom(roomVO);
		System.out.println("<<roomVO.getAcc_num>> " + roomVO.getAcc_num());
		return "redirect:/accommdation/room/list.do?acc_num=" + roomVO.getAcc_num() + "&acc_name=" + URLEncoder.encode(roomVO.getAcc_name(),"UTF-8");
	}
	
	//==객실 정보 삭제==//
	@RequestMapping("accommdation/room/delete.do")
	public String submitDelete(@RequestParam int roo_num, @Valid RoomVO roomVO) throws UnsupportedEncodingException {
		//객실 삭제
		roomService.deleteRoom(roo_num);
		return "redirect:/accommdation/room/list.do?acc_num=" + roomVO.getAcc_num() + "&acc_name=" + URLEncoder.encode(roomVO.getAcc_name(),"UTF-8");
	}
	
	
	
}
