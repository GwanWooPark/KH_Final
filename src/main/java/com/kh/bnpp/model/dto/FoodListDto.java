package com.kh.bnpp.model.dto;

import java.util.List;

public class FoodListDto {

	private List<FoodDto> food_list;

	public FoodListDto() {
	}

	public FoodListDto(List<FoodDto> food_list) {
		this.food_list = food_list;
	}

	public List<FoodDto> getFood_list() {
		return food_list;
	}

	public void setFood_list(List<FoodDto> food_list) {
		this.food_list = food_list;
	}
}
