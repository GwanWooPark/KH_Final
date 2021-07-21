package com.kh.bnpp.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	 
	@Override
	public MemberDto login(MemberDto dto) {
		
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insert(MemberDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(MemberDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public String checkId(String checkID) {
		
		String res = "false";
		System.out.println("id 가져옴? ====" + checkID);
		System.out.println("="+sqlSession.selectOne(NAMESPACE + "checkId", checkID));   //0
		try {
			if(sqlSession.selectOne(NAMESPACE + "checkId", checkID).equals("0")) {
				res = "true"; //res가 true이다 = DB에 중복되는 ID가 없다.
				System.out.println("try문 안에 :" + res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("try문 밖 : " + res);
		return res;
	}

	@Override
	public String findId(MemberDto dto) {
		
		
		//MemberDto dto = new MemberDto();
		//dto.setMember_name(name);
		//dto.setMember_email(email);
		//나머지 dto요소들의 값을 set안해줘도 에러가 안나는 이유는 modelAtt하면
		//값이 전달되지 않은 파라미터들은 자동적으로 null이 채워져서 온다.
		
		String member_id = "";
		
		try {
			member_id = sqlSession.selectOne(NAMESPACE + "findId", dto);
			
			if(member_id != null) {
				System.out.println("아이디 찾음 : " + member_id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member_id;
	}

	@Override
	public String findPw(MemberDto dto) {
		
		String member_pw = "";
		
		try {
			member_pw = sqlSession.selectOne(NAMESPACE + "findPw", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member_pw;
	}
	
}
