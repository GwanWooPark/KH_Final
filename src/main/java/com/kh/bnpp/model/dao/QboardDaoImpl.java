package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.QboardDto;

@Repository
public class QboardDaoImpl implements QboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<QboardDto> selectList() {
		List<QboardDto> list = new ArrayList<QboardDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public QboardDto selectOne(int bq_num) {
		QboardDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne",bq_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(QboardDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(QboardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"update",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int bq_num) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"delete",bq_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int countBoard(PagingDto pdto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"countBoard",pdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<QboardDto> selectBoard(PagingDto pdto) {
		List<QboardDto> list = new ArrayList<QboardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectBoard",pdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int answerinsert(QboardDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"answerinsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}


}