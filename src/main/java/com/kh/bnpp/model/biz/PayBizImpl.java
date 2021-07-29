package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.PayDao;
import com.kh.bnpp.model.dto.PayDto;

@Service
public class PayBizImpl implements PayBiz {

	@Autowired
	private PayDao dao;
	
	@Override
	public List<PayDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public List<PayDto> selectMyList(String member_id) {
		return dao.selectMyList(member_id);
	}

	@Override
	public PayDto selectOne(int pay_num) {
		return dao.selectOne(pay_num);
	}

	@Override
	public int insert(PayDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(PayDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int pay_num) {
		return dao.delete(pay_num);
	}

}
