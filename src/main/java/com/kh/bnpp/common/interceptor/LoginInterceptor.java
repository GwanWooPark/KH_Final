package com.kh.bnpp.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	//spring 3.2 이상부터는 servlet-context.xml에서 <exclude-mapping-path>를 통해 설정 가능!
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("[Interceptor] : preHandle");
		
		//요기 if안에 *.do에 속하는 view로 갈때 세션에 로그인한 회원의 값이 없어도 view로 이동가능
		/*if(request.getRequestURI().contains("/loginform.do") ||
		   request.getRequestURI().contains("/ajaxlogin.do") || 
		   request.getSession().getAttribute("login") != null 	||
		   request.getRequestURI().contains("/test.do")			||
		   request.getRequestURI().contains("/signupform.do")	||
		   request.getRequestURI().contains("/signupres.do")	||
		   request.getRequestURI().contains("/home.do")			||
		   request.getRequestURI().contains("/idCheck.do")		||
		   request.getRequestURI().contains("/findIdPw.do")		||
		   request.getRequestURI().contains("/logout.do")		||
		   request.getRequestURI().contains("/toindex.do")		||
		   request.getRequestURI().contains("/findId.do")		||
		   request.getRequestURI().contains("/findPw.do")		||
		   request.getRequestURI().contains("/kakaologin.do")		||
		   request.getRequestURI().contains("/kakaologout.do")		||
		   request.getRequestURI().contains("/naverlogin.do")		||
		   request.getRequestURI().contains("/callback")		||
		   request.getRequestURI().contains("/naverlogout.do")		||
<<<<<<< HEAD
		   request.getRequestURI().contains("/ajaxlogin.do")
		   request.getRequestURI().contains("/registerform.do")	||
		   request.getRequestURI().contains("/register.do")		||
		   request.getRequestURI().contains("/home.do")	  ||
		   request.getRequestURI().contains("/machine.do")     ||    // 로그인 없이 티처블 머신으로 바로 갈 때 잡아주는 intercepter
		   request.getRequestURI().contains("/chatlogin.do")	        // chat 에서 아직 로그인 연동 안됐을 경우 chatlogin 통해들어가도록 잡음


=======
		   request.getRequestURI().contains("/ajaxlogin.do")   ||
			request.getRequestURI().contains("/recipe.do")
>>>>>>> origin/gwanwoo
			) {
			
		return true;
		
		}
		
<<<<<<< HEAD
		if(request.getSession().getAttribute("login") == null) {	
=======
		//요청의 세션에 login 즉 컨트롤러에서 session.setAttribute("login",res); 해준 적 없으면 로그인으로 돌아가라
		/*if(request.getSession().getAttribute("login") == null) {
			System.out.println("인터셉터 확인해라!!!!!!");
>>>>>>> origin/gwanwoo
			response.sendRedirect("loginform.do");
		}
		*/
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("[Interceptor] : postHandle");

		if(modelAndView != null) {											
			logger.info("Target View : " + modelAndView.getViewName());
		}
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("[Interceptor] : afterCompletion");

	}
}