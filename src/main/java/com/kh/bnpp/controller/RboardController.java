package com.kh.bnpp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bnpp.model.biz.RboardBiz;
import com.kh.bnpp.model.biz.ReplyBiz;
import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.RboardDto;

@Controller
public class RboardController {

	@Autowired
	private RboardBiz biz;
	@Autowired
	private ReplyBiz rbiz;
	

	
	@RequestMapping("/main.do")
	public String main() {
		
		return "mainpage";
	}

	@RequestMapping("/list.do")
	public String selectList(Model model) {
		
		model.addAttribute("list", biz.selectList());
		
		return "rboardlist";
	}
	
	@RequestMapping("/insertform.do") 
	public String insertForm() {
		return "rboardinsert";
	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(RboardDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:boardList.do";
		}
		
		return "redirect:insertform.do";
	}
	
	@RequestMapping("/select.do")
	public String selectOne(Model model, int br_num) {
		
		// 조회수
		biz.readCount(br_num);
		model.addAttribute("dto",biz.selectOne(br_num));
		
		// 댓글조회
		model.addAttribute("replylist",rbiz.reply_selectList(br_num));
		
		
		return "rboardselect";
	}
	
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int br_num) {
		
		model.addAttribute("dto",biz.selectOne(br_num));
		
		return "rboardupdate";
	}
	
	@RequestMapping("/updateres.do")
	public String updateRes(RboardDto dto) {
		
		if(biz.update(dto)>0) {
			return "redirect:select.do?br_num="+dto.getBr_num();
		}
		return "redirect:updateform.do?br_num="+dto.getBr_num();
	}
	
	@RequestMapping("/delete.do")
	public String delete(int br_num) {
		
		if(biz.delete(br_num)>0) {
			return "redirect:boardList.do";
		}
		return "redirect:select.do?br_num="+br_num;
	}
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model, PagingDto pdto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(required = false, defaultValue = "br_title") String searchType
			, @RequestParam(required = false) String keyword) {
		
		
		System.out.println(searchType);
		System.out.println(keyword);

		
		int total = biz.countBoard(pdto);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		pdto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyword, searchType);
		model.addAttribute("paging", pdto);
		model.addAttribute("list", biz.selectBoard(pdto));
		
		System.out.println(pdto.toString());
		
		return "boardPaging";
	}
	
	//게시물 추천
    @RequestMapping("/recommend.do")
    public String recommend (@RequestParam int member_id) {
        
       // memberbiz.recommend(member_id);
    
        return "forward:/boardList.do"; 
    }

	
}
