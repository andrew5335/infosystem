package com.eye2web.infosys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eye2web.infosys.dao.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public List<Map> getList() {
		return memberDao.getList();
	}
	
	public Map<String, Object> getMemberInfo(int idx) {
		return memberDao.getMemberInfo(idx);
	}
	
	public void updateUserInfo(Map<String, Object> memberInfo) {
		memberDao.updateUserInfo(memberInfo);
	}
	
	public void deleteUserInfo(int idx) {
		memberDao.deleteUserInfo(idx);
	}

}
