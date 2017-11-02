package com.eye2web.infosys.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eye2web.infosys.dao.LoginDao;

@Service
public class LoginService {
	
	@Autowired
	private LoginDao loginDao;
	
	public int getUserCnt(Map<String, Object> userChk) {
		return loginDao.getUserCnt(userChk);
	}
	
	public Map<String, Object> getUserInfo(String userId) {
		return loginDao.getUserInfo(userId);
	}
	
	public void insertUserInfo(Map<String, Object> userInfo) {
		loginDao.insertUserInfo(userInfo);
	}

}
