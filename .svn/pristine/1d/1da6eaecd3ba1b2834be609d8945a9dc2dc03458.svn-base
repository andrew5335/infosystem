package com.eye2web.infosys.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eye2web.infosys.util.CommonUtil;

@Controller
public class DownloadController {

	private static Logger logger = Logger.getLogger(DownloadController.class);

	@Autowired
    private ServletContext context;

	private HttpSession session;

	private CommonUtil commonUtil;

	@RequestMapping("/fileDownload.info")
	public void fileDown(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String path = "/upload/";
		System.out.println("===path : " + path);
		String fileName = req.getParameter("fileName") + ".zip";

		commonUtil = new CommonUtil();
		commonUtil.fileDownload(fileName, path, req, res);

	}
}
