package com.eye2web.infosys.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eye2web.infosys.dao.ExamDao;

@Service
public class ExamService {

	@Autowired
	private ExamDao examDao;

	public void insertExamResult(Map<String, Object> examMap) throws Exception {
		examDao.insertExamResult(examMap);
	}

	public Map<String, Object> getExamResult(int companyIdx) throws Exception {
		Map<String, Object> examMap = new HashMap<String, Object>();
		examMap = examDao.getExamResult(companyIdx);
		return examMap;
	}

	public void deleteExamResult(int idx) throws Exception {
		examDao.deleteExamResult(idx);
	}

	public void updateExamResult(Map<String, Object> examMap) throws Exception {
		examDao.updateExamResult(examMap);
	}
}
