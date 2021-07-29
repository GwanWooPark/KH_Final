package com.kh.bnpp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.model.biz.ClassBiz;
import com.kh.bnpp.model.biz.PayBiz;
import com.kh.bnpp.model.dto.ClassDto;
import com.kh.bnpp.model.dto.PayDto;

@Controller
public class PayController {

	private Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private PayBiz biz;
	
	@Autowired
	private ClassBiz c_biz;
	
	@RequestMapping("/paytest.do")
	public String paytest(Model model, PayDto dto) {
		model.addAttribute("dto", dto);
		return "payment";
	}
	
	@RequestMapping("/paysuccess.do")
	public String paysuccess(Model model, String member_id, int class_num) {
		ClassDto c_dto = c_biz.selectOne(class_num);
		PayDto p_dto = new PayDto(c_dto.getClass_price(), member_id, c_dto.getClass_num(),
									c_dto.getClass_title(), c_dto.getMember_category());
		
		if (biz.insert(p_dto) > 0) {
			logger.info("결제 내역 추가 성공");
			return "redirect:classdetailteacher.do?teacher_id="+c_dto.getTeacher_id();
		}
		logger.info("결제 내역 추가 실패");
		return "redirect:classdetailteacher.do?teacher_id="+c_dto.getTeacher_id();
	}
	
	@RequestMapping("/mypaylist.do")
	public String selectMyList(Model model, String member_id) {
		model.addAttribute("list", biz.selectMyList(member_id));	
		return "mypaylist";
	}
	
	@RequestMapping("/paylist.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());	
		return "paylist";
	}
	
	@RequestMapping("/payselect.do")
	public String selectOne(Model model, int pay_num) {
		
		model.addAttribute("dto", biz.selectOne(pay_num));
		return "payselect";
	}
	
	@RequestMapping("/payinsert.do")
	public String insert() {
		return "payinsert";
	}
	
	@RequestMapping("/payinsertres.do")
	public String insertres(PayDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:paylist.do";
		}
		
		return "redirect:payinsert.do";
	}
	
	@RequestMapping("/payupdate.do")
	public String update(Model model, int pay_num) {
		
		model.addAttribute("dto", biz.selectOne(pay_num));
		
		return "payupdate";
	}
	
	@RequestMapping("/payupdateres.do")
	public String updateres(PayDto dto) {
		
		if (biz.update(dto) > 0) {
			return "redirect:payselect.do?pay_num="+dto.getPay_num();
		}
		
		return "redirect:payupdate.do?pay_num="+dto.getPay_num();
	}
	
	@RequestMapping("/paydelete.do")
	public String delete(int pay_num) {
		
		if (biz.delete(pay_num) > 0) {
			return "redirect:paylist.do";
		}
		
		return "redirect:payselect.do?pay_num="+pay_num;
	}
	
}
