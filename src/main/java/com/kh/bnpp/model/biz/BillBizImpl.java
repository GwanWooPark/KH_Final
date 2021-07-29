package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.BillDao;
import com.kh.bnpp.model.dto.BillDto;

@Service
public class BillBizImpl implements BillBiz {

	@Autowired
	private BillDao dao;
	
	@Override
	public List<BillDto> selectList(String member_id) {
		return dao.selectList(member_id);
	}

	@Override
	public BillDto selectOne(int bill_num) {
		return dao.selectOne(bill_num);
	}

	@Override
	public int insert(BillDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(BillDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int bill_num) {
		return dao.delete(bill_num);
	}

}
