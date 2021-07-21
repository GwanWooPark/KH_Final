package com.kh.bnpp.model.dto;

import java.util.Date;

public class ReplyDto {
	
	private int reply_no;
	private int reply_groupno;
	private int reply_groupseq;
	private int reply_tab;
	private String reply_delflag;
	private String reply_content;
	private Date reply_regdate;
	private int br_num;
	private String reply_member_id;
	
	
	
	public ReplyDto() {
	}



	public ReplyDto(int reply_no, int reply_groupno, int reply_groupseq, int reply_tab, String reply_delflag,
			String reply_content, Date reply_regdate, int br_num, String reply_member_id) {
		this.reply_no = reply_no;
		this.reply_groupno = reply_groupno;
		this.reply_groupseq = reply_groupseq;
		this.reply_tab = reply_tab;
		this.reply_delflag = reply_delflag;
		this.reply_content = reply_content;
		this.reply_regdate = reply_regdate;
		this.br_num = br_num;
		this.reply_member_id = reply_member_id;
	}



	public int getReply_no() {
		return reply_no;
	}



	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}



	public int getReply_groupno() {
		return reply_groupno;
	}



	public void setReply_groupno(int reply_groupno) {
		this.reply_groupno = reply_groupno;
	}



	public int getReply_groupseq() {
		return reply_groupseq;
	}



	public void setReply_groupseq(int reply_groupseq) {
		this.reply_groupseq = reply_groupseq;
	}



	public int getReply_tab() {
		return reply_tab;
	}



	public void setReply_tab(int reply_tab) {
		this.reply_tab = reply_tab;
	}



	public String getReply_delflag() {
		return reply_delflag;
	}



	public void setReply_delflag(String reply_delflag) {
		this.reply_delflag = reply_delflag;
	}



	public String getReply_content() {
		return reply_content;
	}



	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}



	public Date getReply_regdate() {
		return reply_regdate;
	}



	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}



	public int getBr_num() {
		return br_num;
	}



	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}



	public String getReply_member_id() {
		return reply_member_id;
	}



	public void setReply_member_id(String reply_member_id) {
		this.reply_member_id = reply_member_id;
	}
	
	
	
}
