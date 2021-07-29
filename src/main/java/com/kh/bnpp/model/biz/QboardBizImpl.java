package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.QboardDao;
import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.QboardDto;

@Service
public class QboardBizImpl implements QboardBiz {
	
	@Autowired
	private QboardDao dao;

	@Override
	public List<QboardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public QboardDto selectOne(int bq_num) {
		return dao.selectOne(bq_num);
	}

	@Override
	public int insert(QboardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(QboardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int bq_num) {
		return dao.delete(bq_num);
	}

	@Override
	public int countBoard(PagingDto pdto) {
		return dao.countBoard(pdto);
	}

	@Override
	public List<QboardDto> selectBoard(PagingDto pdto) {
		return dao.selectBoard(pdto);
	}

	@Override
	public int answerinsert(QboardDto dto) {
		return dao.answerinsert(dto);
	}

}