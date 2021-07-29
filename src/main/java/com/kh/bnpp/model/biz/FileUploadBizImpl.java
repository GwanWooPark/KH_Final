package com.kh.bnpp.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.FileUploadDao;

@Service
public class FileUploadBizImpl implements FileUploadBiz {

	@Autowired
	private FileUploadDao dao;
	
	@Override
	public int ProfileImgUpload(String userId, String imgName, String imgPath) {
		return dao.ProfileImgUpload(userId, imgName, imgPath);
	}

}
