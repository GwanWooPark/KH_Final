package com.kh.bnpp.model.dao;

import com.kh.bnpp.model.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);	//로그인
	public int insert(MemberDto dto);		//회원가입
	public int delete(MemberDto dto);		//회원탈퇴
	public String checkId(String checkID);	//아이디 중복확인
	public String findId(MemberDto dto); //아이디 찾기
	public String findPw(MemberDto dto); //비밀번호 찾기
}
