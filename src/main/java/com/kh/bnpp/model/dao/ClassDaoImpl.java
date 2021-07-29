package com.kh.bnpp.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.ClassDetailDto;
import com.kh.bnpp.model.dto.ClassDto;

@Repository
public class ClassDaoImpl implements ClassDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ClassDetailDto> selectList(String teacher_id) {
		System.out.println("ClassDaoImpl selectList teacher_id :" + teacher_id);
		List<ClassDetailDto> dto = null;
		
		try {
			dto = sqlSession.selectList(NAMESPACE + "selectList", teacher_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public ClassDto selectOne(int class_num) {
		System.out.println("ClassDaoImpl selectOne class_num ? :" + class_num);
		ClassDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", class_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(ClassDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ClassDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int class_num) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", class_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
