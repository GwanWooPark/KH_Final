package com.kh.bnpp.model.dto;

import java.util.Date;

public class PayDto {

	private int pay_num;
	private Date pay_date;
	private int class_price;
	private String pay_step;
	private String member_id;
	private int class_num;
	private String class_title;
	private String class_category;
	private String pay_method;
	public PayDto() {
	}
	
	public PayDto(int class_price, String member_id, String class_title, String pay_method) {
		super();
		this.class_price = class_price;
		this.member_id = member_id;
		this.class_title = class_title;
		this.pay_method = pay_method;
	}
	
	public PayDto(int class_price, String member_id, int class_num, String class_title, String class_category) {
		super();
		this.class_price = class_price;
		this.member_id = member_id;
		this.class_num = class_num;
		this.class_title = class_title;
		this.class_category = class_category;
	}

	public PayDto(int pay_num, Date pay_date, int class_price, String pay_step, String member_id, int class_num,
			String class_title, String class_category) {
		this.pay_num = pay_num;
		this.pay_date = pay_date;
		this.class_price = class_price;
		this.pay_step = pay_step;
		this.member_id = member_id;
		this.class_num = class_num;
		this.class_title = class_title;
		this.class_category = class_category;
	}
	
	public PayDto(int pay_num, Date pay_date, int class_price, String pay_step, String member_id, int class_num,
			String class_title, String class_category, String pay_method) {
		super();
		this.pay_num = pay_num;
		this.pay_date = pay_date;
		this.class_price = class_price;
		this.pay_step = pay_step;
		this.member_id = member_id;
		this.class_num = class_num;
		this.class_title = class_title;
		this.class_category = class_category;
		this.pay_method = pay_method;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public String getPay_step() {
		return pay_step;
	}
	public void setPay_step(String pay_step) {
		this.pay_step = pay_step;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getClass_num() {
		return class_num;
	}
	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}
	public String getClass_title() {
		return class_title;
	}
	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}
	public String getClass_category() {
		return class_category;
	}
	public void setClass_category(String class_category) {
		this.class_category = class_category;
	}
	
}


