package com.kh.bnpp.model.dto;

public class FoodDto {

	private int food_num;
	private String food_name;
	private String food_life;
	private String food_alarm_yn;
	private String member_id;
	
	public FoodDto() {
	}
	public FoodDto(int food_num, String food_name, String food_life) {
		this.food_num = food_num;
		this.food_name = food_name;
		this.food_life = food_life;
	}
	public FoodDto(int food_num, String food_name, String food_alarm_yn, String member_id) {
		this.food_num = food_num;
		this.food_name = food_name;
		this.food_alarm_yn = food_alarm_yn;
		this.member_id = member_id;
	}
	public FoodDto(int food_num, String food_name, String food_life, String food_alarm_yn, String member_id) {
		this.food_num = food_num;
		this.food_name = food_name;
		this.food_life = food_life;
		this.food_alarm_yn = food_alarm_yn;
		this.member_id = member_id;
	}
	
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getFood_life() {
		return food_life;
	}
	
	public void setFood_life(String food_life) {
		this.food_life = food_life;
	}

	public String getFood_alarm_yn() {
		return food_alarm_yn;
	}
	public void setFood_alarm_yn(String food_alarm_yn) {
		this.food_alarm_yn = food_alarm_yn;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
