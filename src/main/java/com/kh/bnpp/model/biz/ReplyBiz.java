package com.kh.bnpp.model.biz;

import java.util.List;


import com.kh.bnpp.model.dto.ReplyDto;


public interface ReplyBiz {
	
	

	public List<ReplyDto> reply_selectList(int br_num);
	public int reply_insert(ReplyDto Rdto);
	public int reply_update(ReplyDto Rdto);
	public int reply_delete(int reply_no);
	public int r_reply_insert(ReplyDto Rdto);
	public int reply_groupseq_update(int br_num);
	public int rboard_delete(int br_num);
	public ReplyDto selectOne(int reply_no);
}
