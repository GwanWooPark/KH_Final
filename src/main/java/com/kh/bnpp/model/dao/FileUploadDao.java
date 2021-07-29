package com.kh.bnpp.model.dao;

public interface FileUploadDao {

	String NAMESPACE = "member.";
	
	public int ProfileImgUpload(String userId, String imgName, String imgPath);
	
}
