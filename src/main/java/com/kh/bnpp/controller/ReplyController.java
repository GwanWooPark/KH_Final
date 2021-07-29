package com.kh.bnpp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.bnpp.model.biz.ReplyBiz;
import com.kh.bnpp.model.dto.ReplyDto;

@Controller
public class ReplyController {

	@Autowired
	private ReplyBiz rbiz;

	@PostMapping("/replylist.do")
	@ResponseBody
	public List<ReplyDto> replylist(@RequestParam(value = "br_num", required = false) int br_num) {
		List<ReplyDto> replylist = rbiz.reply_selectList(br_num);
		return replylist;
	}

	@PostMapping("/replywrite.do")
	@ResponseBody
	public Map<String, Object> replywrite(@RequestParam(value = "br_num", required = false) int br_num,
			@RequestParam(value = "reply_member_id", required = false) String reply_member_id,
			@RequestParam(value = "reply_content", required = false) String reply_content) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyDto ReplyDto = new ReplyDto();
			ReplyDto.setBr_num(br_num);
			ReplyDto.setReply_member_id(reply_member_id);
			ReplyDto.setReply_content(reply_content);
			if (rbiz.reply_insert(ReplyDto) > 0) {
				map.put("result", "success");
			}

		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

	@PostMapping("/replyupdate.do")
	@ResponseBody
	public Map<String, Object> replyupdate(@RequestParam(value = "reply_no", required = false) int reply_no,
			@RequestParam(value = "reply_content", required = false) String reply_content) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyDto ReplyDto = new ReplyDto();
			ReplyDto.setReply_no(reply_no);
			ReplyDto.setReply_content(reply_content);
			if (rbiz.reply_update(ReplyDto) > 0) {

				map.put("result", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

	@PostMapping("/replydelete.do")
	@ResponseBody
	public Map<String, Object> replydelete(ReplyDto ReplyDto, @RequestParam(value = "reply_no", required = false) int reply_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			
			ReplyDto.setReply_no(reply_no);
			if (rbiz.reply_delete(reply_no)>0) {

			map.put("result", "success");
			}

		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

}
