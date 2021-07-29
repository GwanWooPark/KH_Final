package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.BillDto;

@Repository
public class BillDaoImpl implements BillDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BillDto> selectList(String member_id) {
		List<BillDto> list = new ArrayList<BillDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BillDto selectOne(int bill_num) {
		BillDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", bill_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(BillDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(BillDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int bill_num) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", bill_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
