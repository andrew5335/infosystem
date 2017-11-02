package com.eye2web.infosys.dao;

import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class DeviceDao extends SqlMapClientDaoSupport {

	public void insertISOResult(Map<String, Object> resultMap) {
		getSqlMapClientTemplate().insert("Device.insertISOResult", resultMap);
	}

	public void insertNASResult(Map<String, Object> resultMap) {
		getSqlMapClientTemplate().insert("Device.insertNASResult", resultMap);
	}

	public void insertSAEResult(Map<String, Object> resultMap) {
		getSqlMapClientTemplate().insert("Device.insertSAEResult", resultMap);
	}
}
