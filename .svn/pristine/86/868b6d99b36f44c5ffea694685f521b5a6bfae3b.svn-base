package com.eye2web.infosys.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class InfoDao extends SqlMapClientDaoSupport {

	public int getCount(Map<String, Object> infoMap) {
		List<Map<String, Object>> cntList = new ArrayList();
		Map<String, Object> cntMap = new HashMap<String, Object>();
		int cnt = 0;
		cntList = getSqlMapClientTemplate().queryForList("Info.getCount", infoMap);

		if(cntList != null && cntList.size() > 0) {
			cntMap = cntList.get(0);
			cnt = Integer.parseInt(cntMap.get("CNT").toString());
		}

		return cnt;
	}

	public List<Map<String, Object>> getList(Map<String, Object> infoMap) {
		return getSqlMapClientTemplate().queryForList("Info.getList", infoMap	);
	}

	public List<Map<String, Object>> getList2(Map<String, Object> infoMap) {
		return getSqlMapClientTemplate().queryForList("Info.getList2", infoMap);
	}

	public Map<String, Object> getInfoDetail(int idx) {
		return (Map<String, Object>)getSqlMapClientTemplate().queryForObject("Info.getInfoDetail", idx);
	}

	public void insertSolgeInfo(Map<String, Object> infoMap) {
		getSqlMapClientTemplate().insert("Info.insertSolgeInfo", infoMap);
	}

	public void updateSolgeInfo(Map<String, Object> infoMap) {
		getSqlMapClientTemplate().update("Info.updateSolgeInfo", infoMap);
	}

	public String getSmplPoint(int smplIdx) {
		return (String)getSqlMapClientTemplate().queryForObject("Info.getSmplPoint", smplIdx);
	}

	public String getSmplDate(int smplIdx) {
		return (String)getSqlMapClientTemplate().queryForObject("Info.getSmplDate", smplIdx);
	}

	public void deleteInfo(int idx) {
		getSqlMapClientTemplate().delete("Info.deleteInfo", idx);
	}

	public List<Map> getAnalysisList(Map<String, Object> analysisMap) {
		return getSqlMapClientTemplate().queryForList("Info.getAnalysisList", analysisMap);
	}

	public List<Map> getColumnName() {
		return getSqlMapClientTemplate().queryForList("Info.getColumnName");
	}

	public List getColName() {
		return getSqlMapClientTemplate().queryForList("Info.getColName");
	}

	public void updateResultFile(Map<String, Object> updateMap) {
		getSqlMapClientTemplate().update("Info.updateResult", updateMap);
	}

	public void updateReportFile(Map<String, Object> updateMap) {
		getSqlMapClientTemplate().update("Info.updateReport", updateMap);
	}

	public Map<String, Object> getInfoFile(Map<String, Object> downMap) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Info.getInfoFile", downMap);
	}

}
