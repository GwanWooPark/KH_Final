package com.kh.bnpp.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bnpp.model.biz.FileUploadBiz;
import com.kh.bnpp.model.biz.MemberBiz;

@PropertySource("classpath:config/config.properties")
@Controller
public class FileUploadController {

	private Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	@Value("${imgfile.Uploadpath}")
	private String imgUploadPath;	//이거는 로컬에 저장되는거 C:\\Workspaces\\Workspace_final\\SpringProjectBnpp\\src\\main\\webapp\\resources\\img\\

	@Autowired
	private MemberBiz mBiz;
	
	@Autowired
	private FileUploadBiz fBiz;

	@RequestMapping("popup.do")
	public String imgPopup(@RequestParam("member_id") String member_id) {

		logger.info("[FileUploadController] : 팝업창 열기");

		System.out.println("팝업창에 유저 아이디 가져옴? : " + member_id);
		//System.out.println("이미지 업로드할 주소 : " + imgUploadPath);
		return "imgpopup";
	}

	@RequestMapping("imgupload.do")
	public ModelAndView imgUpdate(@RequestParam("member_id") String member_id, @RequestParam("file") MultipartFile fm, HttpServletRequest request) {
	
		//파일을 realPath에 저장하기
		String uploadRealPath = request.getSession().getServletContext().getRealPath("/resources/upload/img");
		
		System.out.println("로컬말고 플젝 절대 경로 ㅇㄷ? : " + uploadRealPath);
		
		//위에 설정한 경로의 폴더가 없을 경우 생성
		File dir = new File(uploadRealPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 저장 성공 유무
		int res = 0;
		
		//파일 업로드
		if (!fm.getOriginalFilename().isEmpty()) {
			// 파일명
			String originalFile = fm.getOriginalFilename();
			System.out.println("파일명이 뭔데? : " + originalFile);

			// 파일명 중 확장자만 추출 //lastIndexOt(".") - 뒤에 .위치의 인덱스 번호
			String originalFileExt = originalFile.substring(originalFile.lastIndexOf("."));
			// pen.png
			// lastIndexOf(".") = 3
			// substring(lastIndexOf(".") = 3) = .png

			// UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성, 중복된 이름으로 저장되지 않도록 하기 위해서
			// db에 저장될 file의 이름 + .확장자
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExt;
			System.out.println("DB에 저장될 file의 이름 : " + saveFileName);
			
			//로컬에다도 저장 가능
			//String saveFilePath = imgUploadPath + saveFileName;
			
			String fullPathName = uploadRealPath + "/" + saveFileName;
			
			try {
				fm.transferTo(new File(uploadRealPath + "/" + saveFileName));
				
				res = fBiz.ProfileImgUpload(member_id, saveFileName, fullPathName);
				
				if(res > 0) {
					modelAndView.setViewName("/imgpopup");
					modelAndView.addObject("message", "success");
					modelAndView.addObject("uploadRealPathUrl", uploadRealPath);
				}else {
					modelAndView.setViewName("/imgpopup");
					modelAndView.addObject("message", "fail");
				}
				
				System.out.println("사진 변경 성공은 했니?? res = " + res);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			
		} else {
			modelAndView.setViewName("/imgpopup");
			modelAndView.addObject("message", "empty");
		}
		 
		return modelAndView;
	}

}
