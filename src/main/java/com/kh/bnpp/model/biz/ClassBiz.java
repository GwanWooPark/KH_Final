package com.kh.bnpp.model.biz;

import java.util.List;

import com.kh.bnpp.model.dto.ClassDetailDto;
import com.kh.bnpp.model.dto.ClassDto;
import com.kh.bnpp.model.dto.PagingDto;

public interface ClassBiz {


	public List<ClassDetailDto> selectList(String teacher_id);	// 해당 강사의 클래스들 전체 조회할 때 (classdetail페이지)
	public ClassDto selectOne(int class_num);
	public int insert(ClassDto dto);							// 강사가 강의를 등록할 때
	public int update(ClassDto dto);							// class_num같이 넘겨줘야함
	public int delete(int class_num);

	public int countClass(PagingDto pdto);
	public List<ClassDto> selectClass(PagingDto pdto);
	
}
