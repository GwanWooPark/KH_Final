package com.kh.bnpp.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
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
	
	
	@RequestMapping("/signupform.do")
	public String signupform() {
		
		logger.info("[SignUpController] : 회원가입창으로 이동");
		
		return "signupform";
	}
	
	@RequestMapping("/signupres.do")
	public String signupres(MemberDto dto,String member_address) {
		System.out.println(dto.getMember_role());
		System.out.println(dto.getMember_category());
		logger.info("[SignUpController] : 회원가입 진행res중");
		
		System.out.println("dto.getMember_id()= " + dto.getMember_id());
		System.out.println("dto.getMember_address()= " + dto.getMember_address());
		System.out.println("member_address= " + member_address);
		
		//회원가입시 비밀번호 암호화 한 후에 db에 저장
		System.out.println("인코딩 전 pw = " + dto.getMember_pw());
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		System.out.println("인코딩 후 pw(.encode찍은거) = " + passwordEncoder.encode(dto.getMember_pw()));
		System.out.println("인코딩 후 pw(암호화한 후 dto.get찍은거) = " + dto.getMember_pw());
		
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
