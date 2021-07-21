package com.kh.bnpp.model.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.bnpp.model.dto.KakaoDto;

@Repository
public class KakaoDao {

	String NAMESPACE = "kakao.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getUserInfo(String nickname, String email) {

		KakaoDto dto = new KakaoDto(nickname, email);
		int res = 0;

		try {

			res = sqlSession.insert(NAMESPACE + "insert", dto);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
