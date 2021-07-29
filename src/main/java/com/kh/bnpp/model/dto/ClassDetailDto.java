package com.kh.bnpp.model.dto;

import java.util.Date;

public class ClassDetailDto {

	private String member_name;  //강사이름
	private String member_category;
	private int	class_num;
	private String teacher_id;
	private String class_title;
	private String class_intro;
	private int class_price;
	private String class_how;
	private String class_where;
	private String class_ingred;
	private String class_content;
	private Date class_regdate;
	private String class_media_name;
	private String class_media_path;
	
	public ClassDetailDto() {
	}

	public ClassDetailDto(String member_name, int class_num, String teacher_id, String class_title, String class_intro,
			int class_price, String class_how, String class_where, String class_ingred, String class_content,
			Date class_regdate, String class_media_name, String class_media_path) {
		super();
		this.member_name = member_name;
		this.class_num = class_num;
		this.teacher_id = teacher_id;
		this.class_title = class_title;
		this.class_intro = class_intro;
		this.class_price = class_price;
		this.class_how = class_how;
		this.class_where = class_where;
		this.class_ingred = class_ingred;
		this.class_content = class_content;
		this.class_regdate = class_regdate;
		this.class_media_name = class_media_name;
		this.class_media_path = class_media_path;
	}
	
	public ClassDetailDto(String member_name, String member_category, int class_num, String teacher_id,
			String class_title, String class_intro, int class_price, String class_how, String class_where,
			String class_ingred, String class_content, Date class_regdate, String class_media_name,
			String class_media_path) {
		super();
		this.member_name = member_name;
		this.member_category = member_category;
		this.class_num = class_num;
		this.teacher_id = teacher_id;
		this.class_title = class_title;
		this.class_intro = class_intro;
		this.class_price = class_price;
		this.class_how = class_how;
		this.class_where = class_where;
		this.class_ingred = class_ingred;
		this.class_content = class_content;
		this.class_regdate = class_regdate;
		this.class_media_name = class_media_name;
		this.class_media_path = class_media_path;
	}

	public String getMember_category() {
		return member_category;
	}

	public void setMember_category(String member_category) {
		this.member_category = member_category;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public String getClass_intro() {
		return class_intro;
	}

	public void setClass_intro(String class_intro) {
		this.class_intro = class_intro;
	}

	public int getClass_price() {
		return class_price;
	}

	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}

	public String getClass_how() {
		return class_how;
	}

	public void setClass_how(String class_how) {
		this.class_how = class_how;
	}

	public String getClass_where() {
		return class_where;
	}

	public void setClass_where(String class_where) {
		this.class_where = class_where;
	}

	public String getClass_ingred() {
		return class_ingred;
	}

	public void setClass_ingred(String class_ingred) {
		this.class_ingred = class_ingred;
	}

	public String getClass_content() {
		return class_content;
	}

	public void setClass_content(String class_content) {
		this.class_content = class_content;
	}

	public Date getClass_regdate() {
		return class_regdate;
	}

	public void setClass_regdate(Date class_regdate) {
		this.class_regdate = class_regdate;
	}

	public String getClass_media_name() {
		return class_media_name;
	}

	public void setClass_media_name(String class_media_name) {
		this.class_media_name = class_media_name;
	}

	public String getClass_media_path() {
		return class_media_path;
	}

	public void setClass_media_path(String class_media_path) {
		this.class_media_path = class_media_path;
	}

}
