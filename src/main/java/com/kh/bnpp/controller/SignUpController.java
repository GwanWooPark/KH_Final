package com.kh.bnpp.controller;



import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.dto.MemberDto;

@Controller
public class SignUpController {

	private Logger logger = LoggerFactory.getLogger(SignUpController.class);
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	String resource = "config/config.properties";
	Properties properties = new Properties();
	
	@Value("")

	@RequestMapping("/signupform.do")
	public String signupform() {
		
		logger.info("[SignUpController] : 회원가입창으로 이동");
		
		return "signupform";
	}
	
	@RequestMapping("/signupres.do")
	public String signupres(MemberDto dto,String member_address) {
		
		logger.info("[SignUpController] : 회원가입 진입");
		
		System.out.println("사진경로 첫 회원가입엔 비어있어야함 : " + dto.getMember_img_path());
		
		logger.info("[SignUpController] : 회원가입 진행res중");
		System.out.println(dto);
		
		System.out.println("member_intro= " + dto.getMember_intro());
		
		//회원가입시 비밀번호 암호화 한 후에 db에 저장
		System.out.println("인코딩 전 pw = " + dto.getMember_pw());
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		System.out.println("인코딩 후 pw(.encode찍은거) = " + passwordEncoder.encode(dto.getMember_pw()));
		System.out.println("인코딩 후 pw(암호화한 후 dto.get찍은거) = " + dto.getMember_pw());
		dto.setMember_img_path(null);
		dto.setMember_img_name(null);
		
		if(biz.insert(dto) > 0) {
			
			logger.info("[SignUpController] : 회원가입 성공");
			
			return "redirect:loginform.do";
		}
		logger.info("[SignUpController] : 회원가입 실패");
		return "redirect:signupform.do";
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(String checkID){
		logger.info("[SignUpController] : 아이디 중복체크");
		System.out.println("컨트롤러로 받은 id ===" + checkID);
		String res = biz.checkId(checkID);
		System.out.println("res= " + res);
		return res;
	}
	
	
}
