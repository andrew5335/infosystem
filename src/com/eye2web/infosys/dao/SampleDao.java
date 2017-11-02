package com.eye2web.infosys.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class SampleDao extends SqlMapClientDaoSupport {

	public List<Map> getList() {
		return getSqlMapClientTemplate().queryForList("Sample.getList");
	}

	public Map<String, Object> getView(int idx){
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Sample.getView", idx);
	}

	public void insertItem(Map<String, Object> insertMap){
		getSqlMapClientTemplate().insert("Sample.insertItem", insertMap);
	}

	public void deleteItem(Map<String, Object> deleteMap){
		getSqlMapClientTemplate().delete("Sample.deleteItem", deleteMap);
	}

	public void updateItem(Map<String, Object> updateMap){
		getSqlMapClientTemplate().update("Sample.updateItem", updateMap);
	}

	public void updateHitCnt(int idx) {
		getSqlMapClientTemplate().update("Sample.updateHitCnt", idx);
	}
}

