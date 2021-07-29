package com.kh.bnpp.model.dto;

public class BillDto {

	private int bill_num;
	private String bill_name;
	private int bill_price;
	private int bill_quantity;
	private int bill_total;
	private String bill_date;
	private String member_id;
	public BillDto() {
	}
	public BillDto(int bill_num, String bill_name, int bill_price, int bill_quantity, int bill_total, String bill_date,
			String member_id) {
		this.bill_num = bill_num;
		this.bill_name = bill_name;
		this.bill_price = bill_price;
		this.bill_quantity = bill_quantity;
		this.bill_total = bill_total;
		this.bill_date = bill_date;
		this.member_id = member_id;
	}
	public int getBill_num() {
		return bill_num;
	}
	public void setBill_num(int bill_num) {
		this.bill_num = bill_num;
	}
	public String getBill_name() {
		return bill_name;
	}
	public void setBill_name(String bill_name) {
		this.bill_name = bill_name;
	}
	public int getBill_price() {
		return bill_price;
	}
	public void setBill_price(int bill_price) {
		this.bill_price = bill_price;
	}
	public int getBill_quantity() {
		return bill_quantity;
	}
	public void setBill_quantity(int bill_quantity) {
		this.bill_quantity = bill_quantity;
	}
	public int getBill_total() {
		return bill_total;
	}
	public void setBill_total(int bill_total) {
		this.bill_total = bill_total;
	}
	public String getBill_date() {
		return bill_date;
	}
	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
