package kr.spring.accommdation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.accommdation.service.AccommdationService;
import kr.spring.accommdation.service.RoomService;
import kr.spring.accommdation.vo.AccFavVO;
import kr.spring.accommdation.vo.AccommdationVO;
import kr.spring.accommdation.vo.RoomVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class AccommdationController {

	//의존 관계 설정
	@Resource
	private AccommdationService accommdationService;
	@Resource
	private RoomService roomService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//자바빈 초기화
	@ModelAttribute("accommdationVO")
	public AccommdationVO initCommand() {
		return new AccommdationVO();
	}
	
	
	//==숙소정보 등록==//
	//등록 폼
	@RequestMapping(value="/accommdation/write.do", method=RequestMethod.GET)
	public String form() {
		return "accommdation/accommdationWrite";
	}
	
	//전송된 데이터 처리
	@RequestMapping(value="/accommdation/write.do", method=RequestMethod.POST)
	public String submit(@Valid AccommdationVO accommdationVO, 
						  Integer mem_num,
						  HttpSession session) {
		accommdationVO.setMem_num((Integer)session.getAttribute("user_num"));
		
		//글쓰기
		accommdationService.insertAccommdation(accommdationVO);
		
		return "redirect:/accommdation/list.do";
	}
	
	//==숙소 목록==//
	@RequestMapping("/accommdation/list.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1")int currentPage,
								HttpSession session){
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		//총 레코드 수
		int count = accommdationService.selectRowCount(user_num);
		PagingUtil page = new PagingUtil(currentPage, count,10, 10, "list.do");
		List<AccommdationVO> acc_list = null;
		System.out.println("<<user_num>> : " + user_num);
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("user_num", user_num);
			acc_list = accommdationService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/accommdation/accommdationList");
		mav.addObject("count", count);
		mav.addObject("acc_list", acc_list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	//===숙소 정보상세===//
	@RequestMapping("/accommdation/detail.do")
	public ModelAndView detail(@RequestParam int acc_num) {
		
		AccommdationVO accommdation = accommdationService.selectAccommdation(acc_num);
		
		return new ModelAndView("/accommdation/accommdationView", "accommdation", accommdation);
	}
	//이미지 출력
	@RequestMapping("/accommdation/imageView.do")
	public ModelAndView viewImage(@RequestParam int acc_num,
								  @RequestParam int acc_idx) {
		AccommdationVO accommdation = accommdationService.selectAccommdation(acc_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		if(acc_idx==1) {
			mav.addObject("imageFile",accommdation.getAcc_uploadfile1());
			mav.addObject("filename",accommdation.getAcc_filename1());
		} else if(acc_idx == 2) {
			mav.addObject("imageFile",accommdation.getAcc_uploadfile2());
			mav.addObject("filename",accommdation.getAcc_filename2());
		}else if(acc_idx == 3) {
			mav.addObject("imageFile",accommdation.getAcc_uploadfile3());
			mav.addObject("filename",accommdation.getAcc_filename3());
		}else if(acc_idx == 4) {
			mav.addObject("imageFile",accommdation.getAcc_uploadfile4());
			mav.addObject("filename",accommdation.getAcc_filename4());
		}else if(acc_idx == 5) {
			mav.addObject("imageFile",accommdation.getAcc_uploadfile5());
			mav.addObject("filename",accommdation.getAcc_filename5());
		}else if(acc_idx == 6) {
			mav.addObject("imageFile",accommdation.getAcc_uploadfile6());
			mav.addObject("filename",accommdation.getAcc_filename6());
		}
		
		
		return mav;
	}
	
	//==숙소 정보 수정==//
	//수정폼 호출
	@RequestMapping(value="/accommdation/update.do", method=RequestMethod.GET)
	public String formUpdate(@RequestParam int acc_num, Model model) {
		AccommdationVO accommdationVO = accommdationService.selectAccommdation(acc_num);
		
		if(log.isDebugEnabled()) {
			log.debug("<<AccommdationVO>>" + accommdationVO);
		}
		
		model.addAttribute("accommdationVO", accommdationVO);
		
		return "accommdation/accommdationModify";
	}
	
	//수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/accommdation/update.do", method=RequestMethod.POST)
	public String submitUpdate(@Valid AccommdationVO accommdationVO) {
		
		//정보수정
		accommdationService.updateAccommdation(accommdationVO);

		return "redirect:/accommdation/list.do";
	}
	
	//==숙소 정보 삭제==//
	@RequestMapping("/accommdation/delete.do")
	public String submitDelete(@RequestParam int acc_num) {
		//숙소 삭제
		accommdationService.deleteAccommdation(acc_num);
		return "redirect:/accommdation/list.do";
	}
	
	//======================================소비자================================//
		//====숙소&객실 조회===//
		@RequestMapping(value="/accommdation/acc_list.do", method=RequestMethod.GET)
		public ModelAndView list_process(@RequestParam(value="pageNum", defaultValue="1")int currentPage,
										 @RequestParam(defaultValue="acc_name") String keyfield,
										 @RequestParam(defaultValue="") String keyword,
										 @RequestParam(defaultValue="0") int cate,
										 @RequestParam(defaultValue="0") int pr) {
			
			//총 레코드 수
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("cate", cate);
			map.put("pr", pr);
			int count = accommdationService.accListCount(map);
			PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 9,9, "acc_list.do","&cate="+cate+"&pr="+pr);
			
			List<AccommdationVO> acclist=null;
			
			if(count > 0) {
				
				map.put("start", page.getStartCount());
				map.put("end", page.getEndCount());
				acclist = accommdationService.accList(map);
				System.out.println("map : " + map);
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/accommdation/accList");
			mav.addObject("count", count);
			mav.addObject("acclist", acclist);
			mav.addObject("cate", cate);
			mav.addObject("pr", pr);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
		}
		
		//=====숙소 클릭시 객실 상세 조회======//
		@RequestMapping("/accommdation/acc_list/detail.do")
		public ModelAndView accList_detail(@RequestParam int acc_num) {
			System.out.println("<<acc_num>> : "+ acc_num);
			Map<String, Object> map = new HashMap<String, Object>();
			
			AccommdationVO accommdation = accommdationService.accListSelectAccommdation(map, acc_num);
			List<RoomVO> room = roomService.accListSelectRoom(map, acc_num);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/accommdation/accListView");
			mav.addObject("accommdation", accommdation);
			mav.addObject("room", room);
			mav.addObject("acc_num", acc_num);
			
			return mav;
		}
		
	//===============숙소찜=====================//
		//숙소찜 읽기	
		@RequestMapping("/accommdation/acc_list/getFav.do")
		@ResponseBody
		public Map<String,Object> getFav(AccFavVO fav,HttpSession session){

			if(log.isDebugEnabled()) {
				log.debug("<<숙소 찜~!>> : " + fav);
			}

			Map<String,Object> mapJson = 
					new HashMap<String,Object>();

			Integer user_num = (Integer)session.getAttribute("user_num");
			if(user_num==null) {
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
				mapJson.put("count", accommdationService.selectFavCount(fav.getAcc_num()));
			}else {
				//로그인된 아이디 셋팅
				fav.setMem_num(user_num);

				AccFavVO accFav = accommdationService.selectFav(fav);

				if(accFav!=null) {
					mapJson.put("result", "success");
					mapJson.put("status", "yesFav");
					mapJson.put("count", accommdationService.selectFavCount(fav.getAcc_num()));
				}else {
					mapJson.put("result", "success");
					mapJson.put("status", "noFav");
					mapJson.put("count", accommdationService.selectFavCount(fav.getAcc_num()));
				}
			}

			return mapJson;
		}
		//숙소찜 등록
		@RequestMapping("/accommdation/acc_list/writeFav.do")
		@ResponseBody
		public Map<String,Object> writeFav(AccFavVO fav,HttpSession session){

			if(log.isDebugEnabled()) {
				log.debug("<<숙소 찜 등록>> : " + fav);
			}

			Map<String,Object> map = 
					new HashMap<String,Object>();

			Integer user_num = (Integer)session.getAttribute("user_num");
			if(user_num==null) {
				map.put("result", "logout");
			}else {
				//로그인된 회원번호 셋팅
				fav.setMem_num(user_num);

				if(log.isDebugEnabled()) {
					log.debug("<<숙소 찜 등록>> : " + fav);
				}
				
				AccFavVO accFav = accommdationService.selectFav(fav);

				if(accFav!=null) {
					accommdationService.deleteFav(accFav.getAcf_num());

					map.put("result", "success");
					map.put("status", "noFav");
					map.put("count", accommdationService.selectFavCount(fav.getAcc_num()));
				}else {
					accommdationService.insertFav(fav);

					map.put("result", "success");
					map.put("status", "yesFav");
					map.put("count", accommdationService.selectFavCount(fav.getAcc_num()));
				}
			}
			return map;
		}
}
