package com.kh.bnpp.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.biz.RboardBiz;
import com.kh.bnpp.model.biz.ReplyBiz;
import com.kh.bnpp.model.dto.PagingDto;
import com.kh.bnpp.model.dto.RboardDto;
import com.kh.bnpp.model.dto.ReplyDto;

@Controller
public class RboardController {

	@Autowired
	private RboardBiz biz;

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
		model.addAttribute("dto", biz.selectOne(br_num));

		// 댓글조회
		model.addAttribute("reply", new ReplyDto());

		return "rboardselect";
	}

	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int br_num) {

		model.addAttribute("dto", biz.selectOne(br_num));

		return "rboardupdate";
	}

	@RequestMapping("/updateres.do")
	public String updateRes(RboardDto dto) {

		if (biz.update(dto) > 0) {
			return "redirect:select.do?br_num=" + dto.getBr_num();
		}
		return "redirect:updateform.do?br_num=" + dto.getBr_num();
	}

	@RequestMapping("/delete.do")
	public String delete(int br_num) {

		if (biz.delete(br_num) > 0) {
			return "redirect:boardList.do";
		}
		return "redirect:select.do?br_num=" + br_num;
	}

	@RequestMapping("/boardList.do")
	public String boardList(Model model, PagingDto pdto,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(required = false, defaultValue = "br_title") String searchType,
			@RequestParam(required = false) String keyword) {

		int total = biz.countBoard(pdto);
;
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

	// 게시물 추천
	@RequestMapping("/recommend.do")
	public String recommend(@RequestParam int br_num) {

		System.out.println(br_num);
		if (biz.recommend(br_num) > 0) {
			return "forward:/select.do";
		}

		return "forward:/select.do";
	}

	@ResponseBody
	@PostMapping("/profileImage")
	public void summer_image(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String uploadPath = "/Users/melody/Documents/upload/";
		PrintWriter out = response.getWriter();
		String originalFileExtension = file.getOriginalFilename();
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");
		// + originalFileExtension 
		System.out.println("storedFileName : " + storedFileName);
		file.transferTo(new File(uploadPath + storedFileName));
		out.println("/imfind/upload/" + storedFileName);
		out.close();

	}
}
