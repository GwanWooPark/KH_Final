
package com.kh.bnpp.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.kh.bnpp.model.biz.*;
import com.kh.bnpp.model.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bnpp.sms.SMS;

@Controller
public class MypageController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberBiz m_biz;
	
	@Autowired
	private PayBiz p_biz;
	
	@Autowired
	private ClassBiz c_biz;
	
	@Autowired
	private FoodBiz f_biz;
	
	@Autowired
	private BillBiz b_biz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private RtcBiz r_biz;


	@Value("${imgfile.Uploadpath}")
	private String imgUploadPath;	//이거는 로컬에 저장되는거 C:\\Workspaces\\Workspace_final\\SpringProjectBnpp\\src\\main\\webapp\\resources\\img\\
	
	@Autowired
	private FileUploadBiz file_biz;

	@RequestMapping("/receiptupload.do")
	public String receiptupload(Model model, String member_id) {
		List<BillDto> b_list = b_biz.selectList(member_id);
		model.addAttribute("member_id", member_id);
		model.addAttribute("b_list", b_list);
		return "receiptupload";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(String member_id) {
		
		List<FoodDto> foods = f_biz.selectList();
		String f_life, phone, content;
		MemberDto alarm_dto = new MemberDto();

		for (FoodDto f_dto : foods) {
			if (f_dto.getFood_alarm_yn().equals("N")) {
				f_life = f_dto.getFood_life();
				if (!f_life.equals("미설정")) {
					try {
						if (!SMS.compareDate(f_life).equals("0")) {
							alarm_dto = m_biz.selectOne(f_dto.getMember_id());
							phone = alarm_dto.getMember_phone().replace("-", "");
							content = "내 냉장고 안의 " + f_dto.getFood_name() + "의 " + SMS.compareDate(f_life);
							try {
								SMS.sendSMS(phone, content);
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}
							if (f_biz.updateAlarm(f_dto.getFood_num()) > 0) {
								logger.info("알람 수정 완료");
							}
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		MemberDto dto = m_biz.selectOne(member_id);
		
		if (dto.getMember_role().equals("M")) {
			return "redirect:mypage_student.do?member_id="+member_id;
		} else if (dto.getMember_role().equals("T")) {
			return "redirect:mypage_teacher.do?member_id="+member_id;
		} else {
			return "redirect:mypage_admin.do";
		}
	}
	
	@RequestMapping("/mypage_student.do")
	public String mypage_student(Model model, String member_id) {
		MemberDto m_dto = m_biz.selectOne(member_id);
		List<PayDto> p_list = p_biz.selectMyList(member_id);
		List<ClassDto> c_list = new ArrayList<ClassDto>();
		ClassDto c_dto = null;
		for (PayDto p_dto : p_list) {
			c_dto = c_biz.selectOne(p_dto.getClass_num());
			c_list.add(c_dto);
		}
		List<FoodDto> f_list = f_biz.selectMyList(member_id);
		model.addAttribute("c_list", c_list);
		model.addAttribute("f_list", f_list);
		model.addAttribute("m_dto", m_dto);
		model.addAttribute("r_list", r_biz.selectRoomList());
		return "mypage_student";
	}
	
	@RequestMapping("/mypage_teacher.do")
	public String mypage_teacher(Model model, String member_id) {
		MemberDto m_dto = m_biz.selectOne(member_id);
		List<ClassDetailDto> c_list = c_biz.selectList(member_id);
		List<FoodDto> f_list = f_biz.selectMyList(member_id);
		model.addAttribute("c_list", c_list);
		model.addAttribute("f_list", f_list);
		model.addAttribute("m_dto", m_dto);
		return "mypage_teacher";
	}

	@RequestMapping("/mypage_admin.do")
	public String mypage_admin(Model model, PagingDto m_pdto, PagingDto c_pdto,
							   @RequestParam(value = "nowPage", required = false) String m_nowPage,
							   @RequestParam(value = "cntPerPage", required = false) String m_cntPerPage,
							   @RequestParam(value = "nowPage", required = false) String c_nowPage,
							   @RequestParam(value = "cntPerPage", required = false) String c_cntPerPage) {


		int m_total = m_biz.countMember(m_pdto);
		int c_total = c_biz.countClass(c_pdto);

		if (m_nowPage == null && m_cntPerPage == null) {
			m_nowPage = "1";
			m_cntPerPage = "5";
		} else if (m_nowPage == null) {
			m_nowPage = "1";
		} else if (m_cntPerPage == null) {
			m_cntPerPage = "5";
		}


		if (c_nowPage == null && c_cntPerPage == null) {
			c_nowPage = "1";
			c_cntPerPage = "5";
		} else if (c_nowPage == null) {
			c_nowPage = "1";
		} else if (c_cntPerPage == null) {
			c_cntPerPage = "5";
		}

		m_pdto = new PagingDto(m_total, Integer.parseInt(m_nowPage), Integer.parseInt(m_cntPerPage));
		c_pdto = new PagingDto(c_total, Integer.parseInt(c_nowPage), Integer.parseInt(c_cntPerPage));

		System.out.println(m_cntPerPage);
		System.out.println(m_nowPage);
		model.addAttribute("m_paging", m_pdto);
		model.addAttribute("m_list", m_biz.selectMember(m_pdto));
		model.addAttribute("c_paging", c_pdto);
		model.addAttribute("c_list", c_biz.selectClass(c_pdto));

		return "mypage_admin";
	}
	@RequestMapping("/studentupdateres.do")
	public String studentupdateres(MemberDto dto) {
		if (m_biz.updatestudent(dto) > 0) {
			return "redirect:mypage.do?member_id="+dto.getMember_id();
		}
		return "redirect:mypage.do?member_id="+dto.getMember_id();
	}
	
	@RequestMapping("/teacherupdateres.do")
	public String teacherupdateres(MemberDto dto) {
		if (m_biz.updateteacher(dto) > 0) {
			return "redirect:mypage.do?member_id="+dto.getMember_id();
		}
		return "redirect:mypage.do?member_id="+dto.getMember_id();
	}
	
	@RequestMapping(value = "/foodlifeupdateres.do", method = RequestMethod.POST)
	public String lifeupdateres(FoodListDto food_list, String member_id) {
		int num = 0;
		int k;
		List<FoodDto> f_list = food_list.getFood_list();
		for (FoodDto dto : f_list) {
			k = f_biz.updateLife(dto);
			num += k;
		}
			
		if (num > f_list.size()) {
			return "redirect:mypage.do?member_id="+member_id;
		}
		return "redirect:mypage.do?member_id="+member_id;
	}
	
	@RequestMapping("/memberdelete.do")
	public String delete(String member_id, String member_pw) {
		MemberDto dto = m_biz.selectOne(member_id);
		if (passwordEncoder.matches(member_pw, dto.getMember_pw())) {
			if (m_biz.delete(dto) > 0) {
				logger.info("회원 삭제 성공");
				return "index.do";
			}
			logger.info("회원 삭제 실패");
			return "redirect:mypage.do?member_id="+member_id;
		}
		logger.info("비밀번호 불일치");
		return "redirect:mypage.do?member_id="+member_id;
	}

	@RequestMapping("/adminMemberDel.do")
	public String adminMemberDel(String member_id) {
		MemberDto dto = m_biz.selectOne(member_id);

		if (m_biz.delete(dto) > 0) {
			logger.info("회원 삭제 성공");
			return "mypage_admin";
		}
		logger.info("회원 삭제 실패");
		return "mypage_admin";
	}

	@RequestMapping("/adminClassDel.do")
	public String adminClassDel(String class_num) {

		if (c_biz.delete(Integer.parseInt(class_num)) > 0) {
			logger.info("강의 삭제 성공");
			return "redirect:mypage_admin.do";
		}
		logger.info("강의 삭제 실패");

		return "redirect:mypage_admin.do";
	}

	@RequestMapping("/updatepw.do")
	public String updatepw(Model model, String member_id) {
		model.addAttribute("member_id", member_id);
		return "updatepw";
	}
	
	@RequestMapping("/updatepwres.do")
	@ResponseBody
	public int updatepwres(@RequestBody MemberDto dto) {
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		int res = m_biz.updatepw(dto);
		return res;
	}
	
}



