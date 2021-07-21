package com.kh.bnpp.model.dto;

public class KakaoDto {

	private String nickname;
	private String email;
	
	public KakaoDto() {
	}
	
	public KakaoDto(String nickname, String email) {
		this.nickname = nickname;
		this.email = email;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
