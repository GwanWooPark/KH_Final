package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.RboardDto;

@Repository
public class RboardDaoImpl implements RboardDao {
	

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RboardDto> selectList() {
		List<RboardDto> list = new ArrayList<RboardDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public RboardDto selectOne(int br_num) {
		RboardDto dto = null;
		try {
		dto = sqlSession.selectOne(NAMESPACE+"selectOne", br_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(RboardDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(RboardDto dto) {

		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int br_num)  {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "delete", br_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countBoard(PagingDto pdto) {
		int res = 0;
		try {
			return sqlSession.selectOne(NAMESPACE+ "countBoard",pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
		
	}

	@Override
	public List<RboardDto> selectBoard(PagingDto pdto) {
		List<RboardDto> list = new ArrayList<RboardDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectBoard", pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int readCount(int br_num) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "readcount",br_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	@Override
	public int recommend(int br_num)  {
		int res = 0;
		try {
			sqlSession.insert(NAMESPACE + "recommend",br_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
