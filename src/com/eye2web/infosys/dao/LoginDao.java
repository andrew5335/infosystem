package com.eye2web.infosys.dao;

import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class LoginDao extends SqlMapClientDaoSupport {

	public int getUserCnt(Map<String, Object> userChk) {
		return (Integer)getSqlMapClientTemplate().queryForObject("Login.getUserCnt", userChk);
	}

	public Map<String, Object> getUserInfo(String userId) {
		return (Map<String, Object>)getSqlMapClientTemplate().queryForObject("Login.getUserInfo", userId);
	}

	public void insertUserInfo(Map<String, Object> userInfo) {
		getSqlMapClientTemplate().insert("Login.insertUserInfo", userInfo);
	}

}
