package kr.spring.interceptor;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
  
public class AdminLoginCheckInterceptor extends HandlerInterceptorAdapter{
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response,
							 Object handler) throws Exception {
		if(log.isDebugEnabled()) {
			log.debug("=====AdminLoginInterceptor 진입=====");
		}
		
		//로그인 여부 && 판매자 회원 로그인 검사
		HttpSession session = request.getSession();
		//판매자 회원 로그인 검사
		if((Integer)session.getAttribute("user_type") != 4) {
			if(log.isDebugEnabled()) {
				log.debug("<<관리자로 로그인 하지 않음>>");
			}
			
			//포워드 방식으로 view 호출
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/notice.jsp");
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
	
}
