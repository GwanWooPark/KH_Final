package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.PayDto;

public interface PayDao {

	String NAMESPACE = "kh.bnpp.pay.";
	
	public List<PayDto> selectList();
	public List<PayDto> selectMyList(String member_id);
	public PayDto selectOne(int pay_num);
	public int insert(PayDto dto);
	public int update(PayDto dto);
	public int delete(int pay_num);
	
}
