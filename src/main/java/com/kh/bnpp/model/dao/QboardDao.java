package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.QboardDto;


public interface QboardDao {

	
	String NAMESPACE = "com.board.qna.";

	public List<QboardDto> selectList();

	public QboardDto selectOne(int bq_num);

	public int insert(QboardDto dto);

	public int answerinsert(QboardDto dto);
	
	public int update(QboardDto dto);

	public int delete(int bq_num);

	// 게시물 총 갯수
	public int countBoard(PagingDto pdto);

	// 페이징 처리 게시글 조회
	public List<QboardDto> selectBoard(PagingDto pdto);
}