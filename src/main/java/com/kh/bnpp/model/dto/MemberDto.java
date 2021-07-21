package com.kh.bnpp.model.dto;

import java.util.Date;

public class MemberDto {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_address;
	private String member_role;		// M : 일반회원, T : 강사회원, A : 관리자
	private String member_category;	// 분야
	private String member_certi;	// 자격증
	private String member_career;	// 경력
	private Date member_regdate;
	
	public MemberDto() {
	}
	
	public MemberDto(String member_id, String member_pw, String member_name, String member_email, String member_phone,
			String member_address, String member_role, String member_category, String member_certi,
			String member_career, Date member_regdate) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_role = member_role;
		this.member_category = member_category;
		this.member_certi = member_certi;
		this.member_career = member_career;
		this.member_regdate = member_regdate;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_category() {
		return member_category;
	}
	public void setMember_category(String member_category) {
		this.member_category = member_category;
	}
	public String getMember_certi() {
		return member_certi;
	}
	public void setMember_certi(String member_certi) {
		this.member_certi = member_certi;
	}
	public String getMember_career() {
		return member_career;
	}
	public void setMember_career(String member_career) {
		this.member_career = member_career;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_address="
				+ member_address + ", member_role=" + member_role + ", member_category=" + member_category
				+ ", member_certi=" + member_certi + ", member_career=" + member_career + ", member_regdate="
				+ member_regdate + "]";
	}
	
	
	
}
