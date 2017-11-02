package com.eye2web.infosys.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eye2web.infosys.dao.DeviceDao;

@Service
public class DeviceService {

	@Autowired
	private DeviceDao deviceDao;

	public void insertISOResult(Map<String, Object> resultMap) {
		deviceDao.insertISOResult(resultMap);
	}

	public void insertNASResult(Map<String, Object> resultMap) {
		deviceDao.insertNASResult(resultMap);
	}

	public void insertSAEResult(Map<String, Object> resultMap) {
		deviceDao.insertSAEResult(resultMap);
	}

}
