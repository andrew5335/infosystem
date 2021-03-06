package com.eye2web.infosys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eye2web.infosys.bean.LoginBean;
import com.eye2web.infosys.service.CustomerService;
import com.eye2web.infosys.service.InfoService;
import com.eye2web.infosys.util.CommonUtil;
/**
 *
 * @author andrew5335
 * @Description : 관리자 화면 컨트롤러
 *
 */
@Controller
public class ManagerController {

	private static Logger logger = Logger.getLogger(ManagerController.class);

	@Autowired
	private InfoService infoService;

	@Autowired
	private CustomerService customerService;

	private LoginBean loginBean;

	private CommonUtil commonUtil;

	private HttpSession session;

	private String userId;
	private String membGb;
	private String membGrade;

	@RequestMapping("/manager/main.info")
	public ModelAndView managerMain(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		int page = 0;
		Map<String, Object> infoMap = new HashMap<String, Object>();

		ModelAndView mav = new ModelAndView();

		// 로그인하지 않은 경우 접근 불가
		if(userId != null && userId != "") {

			// 관리자 등급이 아닐 경우 접근 불가
			if(membGb.equals("99") || membGb.equals("88")) {
				infoMap.put("page", page);
				List<Map<String, Object>> infoList = infoService.getList(infoMap);
				List<Map<String, Object>> customerList = customerService.getList();

				mav.addObject("infoList", infoList);
				mav.addObject("customerList", customerList);
			    mav.setViewName("/manager/managerMain");
			} else {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "관리자만 접근이 가능합니다.");
				errorMap.put("url", "/info/infoMain.info");
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
			}
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
		}

		return mav;
	}
}
