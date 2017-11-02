package com.eye2web.infosys.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class MemberDao extends SqlMapClientDaoSupport {
	
	public List<Map> getList() {
		return getSqlMapClientTemplate().queryForList("Member.getList");
	}
	
	public Map<String, Object> getMemberInfo(int idx) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Member.getMemberInfo", idx);
	}
	
	public void updateUserInfo(Map<String, Object> memberInfo) {
		getSqlMapClientTemplate().update("Member.updateUserInfo", memberInfo);
	}
	
	public void deleteUserInfo(int idx) {
		getSqlMapClientTemplate().delete("Member.deleteUserInfo", idx);
	}

}
