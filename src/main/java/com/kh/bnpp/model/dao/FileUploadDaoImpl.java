package com.kh.bnpp.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileUploadDaoImpl implements FileUploadDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int ProfileImgUpload(String userId, String imgName, String imgPath) {
		
		String member_id = userId;
		String member_img_name = imgName;
		String member_img_path = imgPath;
		
		Map<String, String> img = new HashMap<String, String>();
		img.put("member_img_name", imgName);
		img.put("member_img_path", imgPath);
		img.put("member_id", userId);

		int res = 0;
		
		try {
			
			res = sqlSession.update(NAMESPACE + "img", img);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
