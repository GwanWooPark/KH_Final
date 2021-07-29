package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.FoodDto;

public interface FoodDao {

	String NAMESPACE = "kh.bnpp.food.";
	
	public List<FoodDto> selectList();
	public List<FoodDto> selectMyList(String member_id);
	public FoodDto selectOne(int food_num);
	public int insert(FoodDto dto);
	public int updateLife(FoodDto dto);
	public int updateAlarm(int food_num);
	public int delete(int food_num);
	
}
