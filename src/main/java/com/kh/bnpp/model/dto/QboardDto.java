package com.kh.bnpp.model.dto;

import java.util.Date;

public class QboardDto {

	
		private int bq_num;
		private String bq_title;
		private String bq_content;
		private Date bq_regdate;
		private String bq_complete;
		private String bq_answer;
		private String member_id;
		private int bq_groupno; 
		private int bq_groupseq;
		private int bq_titletab;
		
		
		public QboardDto() {
		}


		public QboardDto(int bq_num, String bq_title, String bq_content, Date bq_regdate, String bq_complete,
				String bq_answer, String member_id, int bq_groupno, int bq_groupseq, int bq_titletab) {
			this.bq_num = bq_num;
			this.bq_title = bq_title;
			this.bq_content = bq_content;
			this.bq_regdate = bq_regdate;
			this.bq_complete = bq_complete;
			this.bq_answer = bq_answer;
			this.member_id = member_id;
			this.bq_groupno = bq_groupno;
			this.bq_groupseq = bq_groupseq;
			this.bq_titletab = bq_titletab;
		}


		public int getBq_num() {
			return bq_num;
		}


		public void setBq_num(int bq_num) {
			this.bq_num = bq_num;
		}


		public String getBq_title() {
			return bq_title;
		}


		public void setBq_title(String bq_title) {
			this.bq_title = bq_title;
		}


		public String getBq_content() {
			return bq_content;
		}


		public void setBq_content(String bq_content) {
			this.bq_content = bq_content;
		}


		public Date getBq_regdate() {
			return bq_regdate;
		}


		public void setBq_regdate(Date bq_regdate) {
			this.bq_regdate = bq_regdate;
		}


		public String getBq_complete() {
			return bq_complete;
		}


		public void setBq_complete(String bq_complete) {
			this.bq_complete = bq_complete;
		}


		public String getBq_answer() {
			return bq_answer;
		}


		public void setBq_answer(String bq_answer) {
			this.bq_answer = bq_answer;
		}


		public String getMember_id() {
			return member_id;
		}


		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}


		public int getBq_groupno() {
			return bq_groupno;
		}


		public void setBq_groupno(int bq_groupno) {
			this.bq_groupno = bq_groupno;
		}


		public int getBq_groupseq() {
			return bq_groupseq;
		}


		public void setBq_groupseq(int bq_groupseq) {
			this.bq_groupseq = bq_groupseq;
		}


		public int getBq_titletab() {
			return bq_titletab;
		}


		public void setBq_titletab(int bq_titletab) {
			this.bq_titletab = bq_titletab;
		} 
	
	
}