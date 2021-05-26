package kr.spring.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import kr.spring.notice.service.NoticeService;
import kr.spring.notice.vo.NoticeVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	//의존 관계 설정
	@Resource
	private NoticeService noticeService;
	
	//자바빈 초기화
	@ModelAttribute
	public NoticeVO initCommand() {
		return new NoticeVO();
	}
	
	//공지사항 리스트
	@RequestMapping("/notice/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		
		//총 레코드 수
		int count = noticeService.selectRowCount();
		
		if(log.isDebugEnabled()) {
			log.debug("<<pageNum>> : " + currentPage);
			log.debug("<<count>> : " + count);
		}
		
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "list.do");
		
		List<NoticeVO> list = null;
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = noticeService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
		
	
	//공지사항 등록폼
	@RequestMapping(value="/notice/write.do",method=RequestMethod.GET)
	public String form() {
		return "noticeWrite";
	}
	//전송된 데이터 처리
	@RequestMapping(value="/notice/write.do",method=RequestMethod.POST)
	public String submit(@Valid NoticeVO noticeVO, BindingResult result, HttpServletRequest request, HttpSession session) { 
		if(result.hasErrors()) {
			return "noticeWrite";
			
		}
		
		noticeService.insertNotice(noticeVO);
		
		return "redirect:/notice/list.do";
	}
	
	//==공지사항 글 상세==//
	@RequestMapping("/notice/detail.do")
	public ModelAndView detail(@RequestParam int not_num) {
		if(log.isDebugEnabled()) {
			log.debug("<<not_num>> : " + not_num);
		}
		
		NoticeVO notice = noticeService.selectNotice(not_num);
		//HTML 태그 불허
		notice.setNot_title(StringUtil.useBrNoHtml(notice.getNot_title()));
		//HTML 태그 불허 및 줄바꿈 처리
		notice.setNot_content(StringUtil.useBrNoHtml(notice.getNot_content()));
		
		return new ModelAndView("noticeView","notice", notice);
	}
	//이미지 출력
	@RequestMapping("/notice/imageView.do")
	public ModelAndView viewImage(@RequestParam int not_num) {
		NoticeVO notice = noticeService.selectNotice(not_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",notice.getNot_uploadfile());
		mav.addObject("filename",notice.getNot_filename());

		return mav;
	}
	
	//==공지사항 글 수정==//
	//수정 폼
	@RequestMapping(value="/notice/update.do",method=RequestMethod.GET)
	public String formUpdate(@RequestParam int not_num,Model model) {
		NoticeVO noticeVO = noticeService.selectNotice(not_num);
		model.addAttribute("noticeVO", noticeVO);
		
		return "noticeModify";
	}
	//수정 폼에서 전송된 데이터 처리
	@RequestMapping(value="/notice/update.do",method=RequestMethod.POST)
	public String submitUpdate(@Valid NoticeVO noticeVO, BindingResult result, HttpServletRequest request) {
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "noticeModify";
		}
		//글 수정
		noticeService.updateNotice(noticeVO);
		
		return "redirect:/notice/list.do";
	}
	
	//==공지사항 글 삭제==//
	@RequestMapping("notice/delete.do")
	public String submitDelete(@RequestParam int not_num) {
		//글삭제
		noticeService.deleteNotice(not_num);
		
		return "redirect:/notice/list.do";
	}

	
	
}




