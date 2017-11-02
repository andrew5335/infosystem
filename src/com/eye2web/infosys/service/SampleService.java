package com.eye2web.infosys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eye2web.infosys.dao.SampleDao;

@Service
public class SampleService {

	@Autowired
	private SampleDao sampleDao;

	public List<Map> getList() {
		return sampleDao.getList();
	}

	public Map<String, Object> getView(int idx) {
		return sampleDao.getView(idx);
	}

	public void insertItem(Map<String, Object> insertMap){
		sampleDao.insertItem(insertMap);
	}

	public void deleteItem(Map<String, Object> deleteMap){
		sampleDao.deleteItem(deleteMap);
	}

	public void updateItem(Map<String, Object> updateMap){
		sampleDao.updateItem(updateMap);
	}

	public void updateHitCnt(int idx) {
		sampleDao.updateHitCnt(idx);
	}
}
