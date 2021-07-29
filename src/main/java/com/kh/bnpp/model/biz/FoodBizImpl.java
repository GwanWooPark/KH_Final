package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.FoodDao;
import com.kh.bnpp.model.dto.FoodDto;

@Service
public class FoodBizImpl implements FoodBiz {

	@Autowired
	private FoodDao dao;
	
	@Override
	public List<FoodDto> selectList() {
		return dao.selectList();
	}

	@Override
	public List<FoodDto> selectMyList(String member_id) {
		return dao.selectMyList(member_id);
	}

	@Override
	public FoodDto selectOne(int food_num) {
		return dao.selectOne(food_num);
	}

	@Override
	public int insert(FoodDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int updateLife(FoodDto dto) {
		return dao.updateLife(dto);
	}

	@Override
	public int updateAlarm(int food_num) {
		return dao.updateAlarm(food_num);
	}

	@Override
	public int delete(int food_num) {
		return dao.delete(food_num);
	}

}
