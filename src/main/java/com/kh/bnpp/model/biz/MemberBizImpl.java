
package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.MemberDao;
import com.kh.bnpp.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{

	@Autowired
	private MemberDao dao;

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public int insert(MemberDto dto) {
		
		if(dto.getMember_role() == null) {
			dto.setMember_role("M");
		}
		return dao.insert(dto);
	}

	@Override
	public int delete(MemberDto dto) {
		return dao.delete(dto);
	}
	
	@Override
	public String checkId(String checkID) {
		return dao.checkId(checkID);
	}

	@Override
	public String findId(MemberDto dto) {
		return dao.findId(dto);
	}

	@Override
	public String findPw(MemberDto dto) {
		return dao.findPw(dto);
	}
	
	@Override
	public List<MemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberDto selectOne(String member_id) {
		return dao.selectOne(member_id);
	}
	
	@Override
	public int updatestudent(MemberDto dto) {
		return dao.updatestudent(dto);
	}
	
	@Override
	public int updateteacher(MemberDto dto) {
		return dao.updateteacher(dto);
	}

	@Override
	public List<MemberDto> findAllT(String category) {
		return dao.findAllT(category);
	}

	@Override
	public int updatepw(MemberDto dto) {
		return dao.updatepw(dto);
	}
}

