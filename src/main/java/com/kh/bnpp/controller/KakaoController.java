package com.kh.bnpp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bnpp.model.biz.KakaoBiz;

@Controller
public class KakaoController {

	private Logger logger = LoggerFactory.getLogger(KakaoController.class);
	
	
	@Autowired
	private KakaoBiz kakaoBiz;

	@RequestMapping("/kakaologin.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) { 
		
		//1.인가코드 가져오기
		logger.info("[KakaoController] : 카카오로그인 1단계 인가코드 가져오기!");
		System.out.println("카카오 인가code : " + code);
		
		//2.가져온 인가코드로 접근토큰발급받기
		logger.info("[KakaoController] : 카카오로그인 2단계 접근토큰 가져오기!");
		String access_Token = kakaoBiz.getAccessToken(code);
		if(access_Token != null) {
			System.out.println("[KakaoController] : 접근코드 가져오기 성공 : " + access_Token);
		}
		
		//3.접근토큰을 이용해서 사용자 정보 가져오기
		logger.info("[KakaoController] : 카카오로그인 3단계 사용자정보 가져오기!");
		Map<String, Object> userInfo = kakaoBiz.getUserInfo(access_Token);
		System.out.println("사용자 정보 : " + userInfo);
		
		//4.클라이언트의 닉네임이 존재하면 세션에 해당 닉네임과 이메일과 토큰 등록
		if(userInfo.get("nickname") != null) {
			session.setAttribute("userId", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("loginCheck", true);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/kakaologout.do")
	public String kakaoLogout(HttpSession session) {
		
		logger.info("[KakaoController] : kakao아이디 로그아웃 성공! ");
		
		kakaoBiz.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		
		//invlidate는 아예 완전 초기화여서 이렇게 해줘야 회원가입 로그인 버튼이 다시 보임
		session.invalidate();
		
		return "redirect:/";
	}
	
}
