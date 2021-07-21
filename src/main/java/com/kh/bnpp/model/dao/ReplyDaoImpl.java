package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReplyDto> reply_selectList(int br_num) {
		List<ReplyDto> list = new ArrayList<ReplyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "reply_selectList" , br_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int reply_insert(ReplyDto Rdto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "reply_insert", Rdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reply_update(ReplyDto Rdto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "reply_update", Rdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reply_delete(int reply_no) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "reply_delete", reply_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int r_reply_insert(ReplyDto Rdto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "r_reply_insert", Rdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reply_groupseq_update(int br_num) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "reply_groupseq_update", br_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int rboard_delete(int br_num) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "rboard_delete", br_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ReplyDto selectOne(int reply_no) {

		ReplyDto dto = null;
		try {
		dto = sqlSession.selectOne(NAMESPACE+"reply_select", reply_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
