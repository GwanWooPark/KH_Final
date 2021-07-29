package com.kh.bnpp.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.biz.NaverLoginBiz;
import com.kh.bnpp.model.dto.MemberDto;

@Controller
public class NaverController {

	private Logger logger = LoggerFactory.getLogger(NaverController.class);

	/* NaverLoginBiz */
	@Autowired
	private NaverLoginBiz naverLoginBiz;
	private String apiResult = null;
	
	@Autowired
	private MemberBiz mBiz;

	/* NaverLoginBiz */
	//@Autowired
	//private void setNaverLoginBiz(NaverLoginBiz naverLoginBiz) {
	//	this.naverLoginBiz = naverLoginBiz;
	//}
	
	// 참고
	// index.jsp에서 인증URL을 전달해줄 때 ${URL}에 담아서 넘겨줘야해서 LoginController에서 넘겨주기로 함
	// 
	/*
	// '네이버 아이디로 로그인'버튼을 클릭하면 로그인 첫 화면 요청하는 메소드
	@RequestMapping(value = "/naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		// 네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBiz클래스의 getAuthorization메소드 호출
		String naverAuthUrl = naverLoginBiz.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c65812
		logger.info("[NaverController] 네이버아이디로 인증 URL 생성 : " + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		// index.jsp에서 로그인버튼 누르면 /naverlogin.do 넘어와서 loginform.jsp로 이동하기전 "url"에다가
		// 로그인아이디입력하고 인증하는 주소를 담아서
		// loginform.jsp로 이동해서

		return "loginform";
	}
	*/
	
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {

		logger.info("[NaverController] 네이버 로그인 성공 후 callback메소드 도착");
		OAuth2AccessToken oauthToken;
		logger.info("[NaverController] callback메소드로 code파라미터 가져옴?? : " + code);
		logger.info(String.format("%s \n %s \t %s", session, code, state));
		oauthToken = naverLoginBiz.getAccessToken(session, code, state);
		
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBiz.getUserProfile(oauthToken); // String형식의 json데이터

		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String형식인 apiResult를 json형태로 바꾸기
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(apiResult);
		JsonObject jsonObj = (JsonObject) obj;
		
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JsonObject response_obj = (JsonObject) jsonObj.get("response");
		System.out.println(response_obj);
		// response의 name값 파싱
		String nickname = response_obj.get("name").getAsString();
		System.out.println(nickname);
		System.out.println("nickname 가져왔음?? : " + nickname);
		//String email = response_obj.get("email").getAsString();
		String NaverId = nickname + "Na";
		//String randId = UUID.randomUUID().toString().replaceAll("-","")+nickname;
		
		MemberDto dbDto = new MemberDto(NaverId, "naver", nickname, "naver.com", "", "", "M", "", "", "", "", null, "", "");
		
		if(mBiz.login(dbDto) == null) {
			int res = mBiz.insert(dbDto);
			
			System.out.println("네이버로 첫 로그인이라 db에 저장함");
			
			if(res > 0) {
				System.out.println("네이버 db저장 성공");
			}else {
				System.out.println("네이버 db저장 실패");
			}
			
			// 4.파싱 닉네임 세션으로 저장
			session.setAttribute("dbDto", dbDto);
			session.setAttribute("loginCheck", true);
			model.addAttribute("result", apiResult);
			
		} else {
			System.out.println("네이버로 로그인한 적 있어서 그냥 dto꺼내옴");
			MemberDto dto = mBiz.login(dbDto);
			session.setAttribute("dbDto", dto);
		}
		
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/naverlogout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		logger.info("[NaverController] 네이버 로그아웃");
		session.invalidate();
		
		return "redirect:/";
	}

}