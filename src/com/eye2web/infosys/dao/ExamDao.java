package com.eye2web.infosys.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class ExamDao extends SqlMapClientDaoSupport {

	public void insertExamResult(Map<String, Object> examMap) throws Exception {
		getSqlMapClientTemplate().insert("Exam.insertExamResult", examMap);
	}

	public Map<String, Object> getExamResult(int infoIdx) throws Exception {
		List<Map<String, Object>> examMap = new ArrayList<Map<String, Object>>();
		examMap = getSqlMapClientTemplate().queryForList("Exam.getExamResult", infoIdx);
		if(examMap != null && examMap.size() > 0) {
			return examMap.get(0);
		}
		return null;
	}

	public void deleteExamResult(int idx) throws Exception {
		getSqlMapClientTemplate().delete("Exam.deleteExamResult", idx);
	}

	public void updateExamResult(Map<String, Object> examMap) throws Exception {
		getSqlMapClientTemplate().update("Exam.updateExamResult", examMap);
	}
}
