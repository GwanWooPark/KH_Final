package com.kh.bnpp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.biz.NaverLoginBiz;
import com.kh.bnpp.model.dto.MemberDto;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberBiz biz;
	@Autowired
	private NaverLoginBiz naverLoginBiz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/toindex.do")
	public String toIndex() {
		return "redirect:/";
	}
	
	@RequestMapping("/loginform.do")
	public String loginmove(Model model, HttpSession session) {
		
		logger.info("[LoginController] : 로그인창으로 이동");
		
		// 네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBiz클래스의 getAuthorization메소드 호출
		String naverAuthUrl = naverLoginBiz.getAuthorizationUrl(session);
		
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c65812
		logger.info("[LoginController] 네이버아이디로 인증 URL 생성 : " + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		
		// index.jsp에서 로그인버튼 누르면 /naverlogin.do 넘어와서 loginform.jsp로 이동하기전 "url"에다가
		// 로그인아이디입력하고 인증하는 주소를 담아서
		// loginform.jsp로 이동해서 "${url}"네아로버튼을 누르면 네이버로그인하는화면이 등장
		
		
		return "loginform";
	}

	
	
	//request바디랑 request파람 차이
	//비동기 통신을 할 때 url은 http://localhost:8080/bnpp 변함없지만 데이터를 전달할 때 body에 담기게 된다
	//request파람은 기본적으로 url상에서 데이터를 찾기 때문에 url: http://localhost:8080/bnpp?name=~&id=~ 이런식으로 쿼리스트링을 추가해줘야함
	//컨트롤러에서 받을때도 데이터를 저장하는 이름으로 메서드의 변수명을 설정해줘야함 리퀘스트바디는 변수명 상관없다. 
	//request바디는 클라이언트가 전송하는 Json(application/json) 형태의 HTTP Body 내용을 Java Object로 변환시켜주는 역할을 한다
		
	@RequestMapping("/ajaxlogin.do")
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(@RequestBody MemberDto dto, HttpSession session){
		
		logger.info("[LoginController] : ajaxlogin 진입");
		System.out.println("MemberDto_id = " + dto.getMember_id());
		System.out.println("MemberDto_pw = " + dto.getMember_pw());
		
		MemberDto dbDto = biz.login(dto);
		boolean check = false;
		 							//방금 가져온pw, db에 저장된 인코딩된pw
		if(passwordEncoder.matches(dto.getMember_pw(), dbDto.getMember_pw())) {
			logger.info("[LoginController] : 비밀번호 비교 성공, 세션에 넣는 중");
			check = true;
			session.setAttribute("loginCheck", true);
			session.setAttribute("dbDto", dbDto);
		} else {
			logger.info("[LoginController] : 비밀번호 비교 실패");
		}
		
		Map <String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	@RequestMapping("/logout.do")
	public String idCheck(HttpSession session) {
		
		session.invalidate();   
		logger.info("[LoginController] : 로그아웃 성공");
		
		return "mainpage";
	}
	

	
}
