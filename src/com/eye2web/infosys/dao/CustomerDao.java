package com.eye2web.infosys.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CustomerDao extends SqlMapClientDaoSupport {

	public List<Map<String, Object>> getList() {
		return getSqlMapClientTemplate().queryForList("Customer.getList");
	}

	public List<Map<String, Object>> getList2(Map<String, Object> customerMap) {
		return getSqlMapClientTemplate().queryForList("Customer.getList2", customerMap);
	}

	public void insertCustomerInfo(Map<String, Object> customerMap) {
		getSqlMapClientTemplate().insert("Customer.insertCustomerInfo", customerMap);
	}

	public Map<String, Object> getCustomerInfo(int idx) {
		return (Map<String, Object>)getSqlMapClientTemplate().queryForObject("Customer.getCustomerInfo", idx);
	}

	public void updateCustomerInfo(Map<String, Object> customerMap) {
		getSqlMapClientTemplate().update("Customer.updateCustomerInfo", customerMap);
	}

	public void deleteCustomerInfo(Map<String, Object> customerMap) {
		getSqlMapClientTemplate().delete("Customer.deleteCustomerInfo", customerMap);
	}

	public List<Map> getMachineList(int companyIdx) {
		return getSqlMapClientTemplate().queryForList("Customer.getMachineList", companyIdx);
	}

	public Map<String, Object> getMachineInfo(int idx) {
		return (Map<String, Object>)getSqlMapClientTemplate().queryForObject("Customer.getMachineInfo", idx);
	}

	public void insertMachineInfo(Map<String, Object> machineMap) {
		getSqlMapClientTemplate().insert("Customer.insertMachineInfo", machineMap);
	}

	public void updateMachineInfo(Map<String, Object> machineMap) {
		getSqlMapClientTemplate().update("Customer.updateMachineInfo", machineMap);
	}

	public void machineDelete(int idx) {
		getSqlMapClientTemplate().delete("Customer.machineDelete", idx);
	}

	public void updateSampleNum() {
		getSqlMapClientTemplate().update("Customer.updateSampleNum");
	}

	public String getSampleNum() {
		return (String)getSqlMapClientTemplate().queryForObject("Customer.getSampleNum");
	}

	public void insertSampleInfo(Map<String, Object> sampleMap) {
		getSqlMapClientTemplate().insert("Customer.insertSampleInfo", sampleMap);
	}

	public List<Map> getSampleList(int idx) {
		return getSqlMapClientTemplate().queryForList("Customer.getSampleList", idx);
	}

	public void deleteSampleInfo(int idx) {
		getSqlMapClientTemplate().delete("Customer.deleteSampleInfo", idx);
	}

}
