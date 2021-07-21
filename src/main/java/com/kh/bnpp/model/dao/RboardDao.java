package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.RboardDto;

public interface RboardDao {

	String NAMESPACE = "com.board.recipe.";

	public List<RboardDto> selectList();

	public RboardDto selectOne(int br_num);

	public int insert(RboardDto dto);

	public int update(RboardDto dto);

	public int delete(int br_num);

	// 게시물 총 갯수
	public int countBoard(PagingDto pdto);

	// 페이징 처리 게시글 조회
	public List<RboardDto> selectBoard(PagingDto pdto);

	//조회수
	public int readCount(int br_num);
}
