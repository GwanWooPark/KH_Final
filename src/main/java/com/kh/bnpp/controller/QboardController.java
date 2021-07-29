package com.kh.bnpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bnpp.model.biz.QboardBiz;
import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.QboardDto;

@Controller
public class QboardController {

	@Autowired
	private QboardBiz biz;

	@RequestMapping("/qnalist.do")
	public String boardList(Model model, PagingDto pdto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = biz.countBoard(pdto);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pdto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pdto);
		model.addAttribute("list", biz.selectBoard(pdto));
		
		System.out.println(pdto.toString());
		return "qnaboard";
	}
	

	
	@RequestMapping("/faqboard.do")
	public String faqboard() {
		return "faqboard";
	}
	
	@RequestMapping("/qnainsertform.do")
	public String insertForm() {
		return "qnaboardinsert";
	}

	@RequestMapping("/qnainsert.do")
	public String insertRes(QboardDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:qnalist.do";
		}
		return "redirect:qnainsertform.do";
	}
	
	@RequestMapping("/answerinsertform.do")
	public String answerinsertForm(Model model, int bq_num) {
		
		model.addAttribute("dto", biz.selectOne(bq_num));
		
		return "answerinsertform";
	}

	
	@RequestMapping("/answerinsert.do")
	public String answerinsertRes(QboardDto dto) {
		if (biz.answerinsert(dto) > 0) {
			return "redirect:qnalist.do";
		}
		return "redirect:qnainsertform.do";
	}
	

	@RequestMapping("/qnaselect.do")
	public String selectOne(Model model, int bq_num) {
		model.addAttribute("qdto", biz.selectOne(bq_num));

		return "qboardselect";
	}


	@RequestMapping("/qnaupdateform.do")
	public String updateForm(Model model, int bq_num) {
		
		model.addAttribute("dto", biz.selectOne(bq_num));
		
		return "qnaboardupdate";
	}
	
	
	@RequestMapping("/qnaupdateres.do")
	public String updateRes(QboardDto dto) {
		if (biz.update(dto) > 0) {
			return "redirect:qnalist.do";
		}
		return "redirect:qnaupdateform.do";
	}
	
	
	
	@RequestMapping("/qnadelete.do")
	public String delete(int bq_num) {
		if(biz.delete(bq_num)>0) {
			return "redirect:qnalist.do";
		}
		return "redirect:qnaselect.do?bq_num="+bq_num;
	}

	
	
	
}