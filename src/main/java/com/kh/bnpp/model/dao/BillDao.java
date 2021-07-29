package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.BillDto;

public interface BillDao {

	String NAMESPACE = "kh.bnpp.bill.";
	
	public List<BillDto> selectList(String member_id);
	public BillDto selectOne(int bill_num);
	public int insert(BillDto dto);
	public int update(BillDto dto);
	public int delete(int bill_num);
	
}
