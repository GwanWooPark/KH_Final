package com.kh.bnpp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bnpp.model.biz.ReplyBiz;
import com.kh.bnpp.model.dto.ReplyDto;

@Controller
public class ReplyController {

	@Autowired
	private ReplyBiz rbiz;

	@RequestMapping("/replylist.do")
	public String replylistRes(Model model,int br_num) {
		model.addAttribute("replylist",rbiz.reply_selectList(br_num));
		
		return "rboardselect";
	}
	
	@RequestMapping("/replyinsert.do")
	public String replyinsertRes(ReplyDto rdto) {

		if (rbiz.reply_insert(rdto) > 0) {
			return "redirect:select.do?br_num=" + rdto.getBr_num();
		}

		return "redirect:select.do?br_num=" + rdto.getBr_num();
	}

	
	@ResponseBody
	@RequestMapping("/replyupdateres.do")
	public Map<String,Object> replyupdateRes(ReplyDto rdto) {

		if (rbiz.reply_update(rdto) > 0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("isSuccess", true );
			return map;
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("isSuccess", false );
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/replydelete.do")
	public Map<String,Object> replydeleteRes(int reply_no) {

		if (rbiz.reply_delete(reply_no) > 0) {
			System.out.println("댓글번호 : " + reply_no);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("isSuccess", true );
			return map;
		}

		System.out.println("댓글번호 : " + reply_no);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("isSuccess", false );
		return map;
	}
	
}
