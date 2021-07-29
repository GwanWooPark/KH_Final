
package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.FoodDto;

@Repository
public class FoodDaoImpl implements FoodDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FoodDto> selectList() {
		List<FoodDto> list = new ArrayList<FoodDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FoodDto> selectMyList(String member_id) {
		
		List<FoodDto> list = new ArrayList<FoodDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectMyList", new FoodDto(0, null, null, null, member_id));
		} catch (Exception e) {
			System.out.println("======1========");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public FoodDto selectOne(int food_num) {
		FoodDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", food_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(FoodDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateLife(FoodDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updateLife", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateAlarm(int food_num) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updateAlarm", food_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int food_num) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", food_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}

