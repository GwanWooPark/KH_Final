package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.ReplyDao;
import com.kh.bnpp.model.dto.ReplyDto;

@Service
public class ReplyBizImpl implements ReplyBiz {
	
	
	@Autowired
	private ReplyDao dao;

	@Override
	public List<ReplyDto> reply_selectList(int br_num) {
		return dao.reply_selectList(br_num);
	}

	@Override
	public int reply_insert(ReplyDto Rdto) {
		return dao.reply_insert(Rdto);
	}

	@Override
	public int reply_update(ReplyDto Rdto) {
		return dao.reply_update(Rdto);
	}

	@Override
	public int reply_delete(int reply_no) {
		return dao.reply_delete(reply_no);
	}

	@Override
	public int r_reply_insert(ReplyDto Rdto) {
		return dao.r_reply_insert(Rdto);
	}

	@Override
	public int reply_groupseq_update(int br_num) {
		return dao.reply_groupseq_update(br_num);
	}

	@Override
	public int rboard_delete(int br_num) {
		return dao.rboard_delete(br_num);
	}

	@Override
	public ReplyDto selectOne(int reply_no) {
		return dao.selectOne(reply_no);
	}

}
