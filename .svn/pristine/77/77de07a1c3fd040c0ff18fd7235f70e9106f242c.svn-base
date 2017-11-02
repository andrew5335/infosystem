package com.eye2web.infosys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eye2web.infosys.dao.InfoDao;

@Service
public class InfoService {

	@Autowired
	private InfoDao infoDao;

	public int getCount(Map<String, Object> infoMap) {
		int cnt = 0;
		cnt = infoDao.getCount(infoMap);

		return cnt;
	}

	public List<Map<String, Object>> getList(Map<String, Object> infoMap) {
		return infoDao.getList(infoMap);
	}

	public List<Map<String, Object>> getList2(Map<String, Object> infoMap) {
		return infoDao.getList2(infoMap);
	}

	public Map<String, Object> getInfoDetail(int idx) {
		return infoDao.getInfoDetail(idx);
	}

	public void insertSolgeInfo(Map<String, Object> infoMap) {
		infoDao.insertSolgeInfo(infoMap);
	}

	public void updateSolgeInfo(Map<String, Object> infoMap) {
		infoDao.updateSolgeInfo(infoMap);
	}

	public String getSmplPoint(int smplIdx) {
		return infoDao.getSmplPoint(smplIdx);
	}

	public String getSmplDate(int smplIdx) {
		return infoDao.getSmplDate(smplIdx);
	}

	public void deleteInfo(int idx) {
		infoDao.deleteInfo(idx);
	}

	public List<Map> getAnalysisList(Map<String, Object> analysisMap) {
		return infoDao.getAnalysisList(analysisMap);
	}

	public List<Map> getColumnName() {
		return infoDao.getColumnName();
	}

	public List getColName() {
		return infoDao.getColName();
	}

	public void updateInfoFile(Map<String, Object> updateMap, String gu) {
		if(gu != null && gu != "") {
			if(!gu.equals("report")) {
				infoDao.updateResultFile(updateMap);
			} else {
				infoDao.updateReportFile(updateMap);
			}
		}
	}

	public Map<String, Object> getInfoFile(Map<String, Object> downMap) {
		return infoDao.getInfoFile(downMap);
	}

}
