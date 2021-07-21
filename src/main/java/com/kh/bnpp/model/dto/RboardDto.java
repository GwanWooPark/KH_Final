package com.kh.bnpp.model.dto;

import java.util.Date;

public class RboardDto {
	
	

	private int br_num;
	private String br_title;
	private String br_content;
	private Date br_regdate;
	private int br_readcount;
	private int br_reccount;
	private String br_delflag;
	private String br_category;
	private String member_id;
	
	
	
	public RboardDto() {
	}



	public RboardDto(int br_num, String br_title, String br_content, Date br_regdate, int br_readcount, int br_reccount,
			String br_delflag, String br_category, String member_id) {
		this.br_num = br_num;
		this.br_title = br_title;
		this.br_content = br_content;
		this.br_regdate = br_regdate;
		this.br_readcount = br_readcount;
		this.br_reccount = br_reccount;
		this.br_delflag = br_delflag;
		this.br_category = br_category;
		this.member_id = member_id;
	}



	public int getBr_num() {
		return br_num;
	}



	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}



	public String getBr_title() {
		return br_title;
	}



	public void setBr_title(String br_title) {
		this.br_title = br_title;
	}



	public String getBr_content() {
		return br_content;
	}



	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}



	public Date getBr_regdate() {
		return br_regdate;
	}



	public void setBr_regdate(Date br_regdate) {
		this.br_regdate = br_regdate;
	}



	public int getBr_readcount() {
		return br_readcount;
	}



	public void setBr_readcount(int br_readcount) {
		this.br_readcount = br_readcount;
	}



	public int getBr_reccount() {
		return br_reccount;
	}



	public void setBr_reccount(int br_reccount) {
		this.br_reccount = br_reccount;
	}



	public String getBr_delflag() {
		return br_delflag;
	}



	public void setBr_delflag(String br_delflag) {
		this.br_delflag = br_delflag;
	}



	public String getBr_category() {
		return br_category;
	}



	public void setBr_category(String br_category) {
		this.br_category = br_category;
	}



	public String getMember_id() {
		return member_id;
	}



	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	

	

}
