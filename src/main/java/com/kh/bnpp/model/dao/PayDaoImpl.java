
package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.PayDto;

@Repository
public class PayDaoImpl implements PayDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PayDto> selectList() {
		List<PayDto> list = new ArrayList<PayDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<PayDto> selectMyList(String member_id) {
		System.out.println(member_id);
		List<PayDto> list = new ArrayList<PayDto>();
		PayDto dto = new PayDto();
		dto.setMember_id(member_id);
		try {
			list = sqlSession.selectList(NAMESPACE + "selectMyList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PayDto selectOne(int pay_num) {
		PayDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", pay_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(PayDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(PayDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int pay_num) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", pay_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}

