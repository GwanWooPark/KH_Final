package com.kh.bnpp.model.biz;

import java.util.List;

import com.kh.bnpp.model.dto.PagingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.ClassDao;
import com.kh.bnpp.model.dto.ClassDetailDto;
import com.kh.bnpp.model.dto.ClassDto;

@Service
public class ClassBizImpl implements ClassBiz { 
	
	@Autowired
	private ClassDao dao;
	
	@Override
	public List<ClassDetailDto> selectList(String teacher_id) {
		return dao.selectList(teacher_id);
	}

	@Override
	public ClassDto selectOne(int class_num) {
		return dao.selectOne(class_num);
	}

	@Override
	public int insert(ClassDto dto) {
		System.out.println("dto.getClass_how() : " + dto.getClass_how());
		if(dto.getClass_how() == "N") {
			dto.setClass_where("온라인강의 입니다.");
			System.out.println("dto.setClass_where : " + dto.getClass_where());
		}
		
		return dao.insert(dto);
	}

	@Override
	public int update(ClassDto dto) {
		//강의 신청시 온라인강의로 신청했을 시 class_where컬럼에 "온라인강의입니다." 넣어주기
		if(dto.getClass_where().trim() == ",,") {
			dto.setClass_where("온라인강의입니다.");
		}
		return dao.update(dto);
	}

	@Override
	public int delete(int class_num) {
		return dao.delete(class_num);
	}

	@Override
	public int countClass(PagingDto pdto) {
		return dao.countClass(pdto);
	}

	@Override
	public List<ClassDto> selectClass(PagingDto pdto) {
		return dao.selectClass(pdto);
	}
}
