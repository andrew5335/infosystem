package com.eye2web.infosys.controller;

import java.util.HashMap;
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
import com.eye2web.infosys.service.LoginService;
import com.eye2web.infosys.util.PropertyUtil;

/**
 * @author HJKim
 * @Description : 회원가입 및 로그인 컨트롤러
 */
@Controller
public class LoginController {

	private static Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	private LoginBean loginBean;

	private HttpSession session;

	/**
	 * @Description 로그인 페이지
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login/login.info")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/login");

		return mav;
	}

	/**
	 * @Description 로그인 처리
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login/loginProcess.info")
	public ModelAndView loginProcesss(HttpServletRequest req, HttpServletResponse res) {

		ModelAndView mav = new ModelAndView();

		String userId = req.getParameter("userId").toString();
		String password = req.getParameter("password").toString();

		Map<String, Object> userChk = new HashMap<String, Object>();
		userChk.put("userId", userId);
		userChk.put("password", password);

		int cnt = loginService.getUserCnt(userChk);

		if(cnt > 0) {
			Map<String, Object> userInfo = new HashMap<String, Object>();
			session = req.getSession();

			userInfo = loginService.getUserInfo(userId);

			if(userInfo != null) {
				loginBean = new LoginBean();
				loginBean.setUserId(userId);
				loginBean.setUserName(userInfo.get("USERNAME").toString());
				loginBean.setEmail(userInfo.get("EMAIL").toString());

				// DB에 회원등급과 권한, 회사정보값이 없을 경우 기본 설정값 사용
				if(userInfo.get("COMPANYIDX") != null && userInfo.get("") != "COMPANYIDX") {
					loginBean.setCompanyIdx(Integer.parseInt(userInfo.get("COMPANYIDX").toString()));
				} else {
					loginBean.setMembGb(PropertyUtil.settingProperty("member.company"));
				}

				if(userInfo.get("MEMBGB") != null && userInfo.get("MEMBGB") != "") {
					loginBean.setMembGb(userInfo.get("MEMBGB").toString());
				} else {
					loginBean.setMembGb(PropertyUtil.settingProperty("member.gubun"));
				}

				if(userInfo.get("MEMBGRADE") != null && userInfo.get("MEMBGRADE") != "") {
				    loginBean.setMembGrade(userInfo.get("MEMBGRADE").toString());
				} else {
					loginBean.setMembGrade(PropertyUtil.settingProperty("member.grade"));
				}

				if(userInfo.get("USEYN") != null && userInfo.get("USEYN") != "") {
				    loginBean.setUseYn(userInfo.get("USEYN").toString());
				} else {
					loginBean.setUseYn(PropertyUtil.settingProperty("member.useYn"));
				}

				session.setAttribute("userId", userId);
				session.setAttribute("email", userInfo.get("EMAIL").toString());
				session.setAttribute("userName", userInfo.get("USERNAME").toString());

				if(userInfo.get("COMPANYIDX") != null && userInfo.get("COMPANYIDX") != "") {
				    session.setAttribute("companyIdx", userInfo.get("COMPANYIDX").toString());
				} else {
					session.setAttribute("membGb", PropertyUtil.settingProperty("member.gubun"));
				}

				if(userInfo.get("MEMBGB") != null && userInfo.get("MEMBGB") != "") {
				    session.setAttribute("membGb", userInfo.get("MEMBGB").toString());
				} else {
					session.setAttribute("membGb", PropertyUtil.settingProperty("member.company"));
				}

				if(userInfo.get("MEMBGRADE") != null && userInfo.get("MEMBGRADE") != "") {
				    session.setAttribute("membGrade", userInfo.get("MEMBGRADE").toString());
				} else {
					session.setAttribute("membGrade", PropertyUtil.settingProperty("member.grade"));
				}

				if(userInfo.get("USEYN") != null && userInfo.get("USEYN") != "") {
				    session.setAttribute("membGrade", userInfo.get("USEYN").toString());
				} else {
					session.setAttribute("useYn", PropertyUtil.settingProperty("member.useYn"));
				}

			} else {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "사용자 정보가 없습니다.");
				errorMap.put("url", "/login/login.info");
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
			}

			System.out.println("로그인한 사람 : " + session.getAttribute("userId"));
			System.out.println("로그인한 사람 : " + session.getAttribute("membGb"));

			if(userInfo.get("USEYN") != "N" && !("N").equals(userInfo.get("USEYN"))) {
				Map<String, Object> successMap = new HashMap<String, Object>();
				successMap.put("msg", "로그인에 성공하였습니다.");
				successMap.put("url", "/info/infoMain.info");
				mav.addObject("successMap", successMap);
				mav.setViewName("/common/success2");
			} else {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "승인되지 않은 회원입니다.");
				errorMap.put("url", "/login/login.info");
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
			}
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인에 실패하였습니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
		}

		return mav;
	}

	/**
	 * @Description 로그아웃 처리
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping("/login/logout.info")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) {

		ModelAndView mav = new ModelAndView();
		session = req.getSession();

		loginBean.setUserId("");
		loginBean.setPassword("");
		loginBean.setEmail("");
		loginBean.setUserName("");
		loginBean.setAddr("");
		loginBean.setMembGb("");
		loginBean.setMembGrade("");
		loginBean.setCompanyIdx(0);

		session.removeAttribute("userId");
		session.removeAttribute("email");
		session.removeAttribute("userName");
		session.removeAttribute("membGb");
		session.removeAttribute("membGrade");
		session.removeAttribute("companyIdx");

		Map<String, Object> successMap = new HashMap<String, Object>();
		successMap.put("msg", "로그아웃 되었습니다.");
		successMap.put("url", "/login/login.info");
		mav.addObject("successMap", successMap);
		mav.setViewName("/common/success");

		return mav;
	}

	/**
	 * @Description 회원가입 페이지
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login/register.info")
	public ModelAndView register(HttpServletRequest req, HttpServletResponse res) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/register");

		return mav;
	}

	/**
	 * @Description 회원가입 처리
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login/registerProcess.info")
	public ModelAndView registerProcess(HttpServletRequest req, HttpServletResponse res) {

		ModelAndView mav = new ModelAndView();

		String userId = req.getParameter("userId").toString();
		String password = req.getParameter("password").toString();
		String userName = req.getParameter("userName").toString();
		String email = req.getParameter("email").toString();
		String addr = req.getParameter("addr").toString();
		String telNum = req.getParameter("telNum").toString();
		String membGb = PropertyUtil.settingProperty("member.gubun");
		String membGrade = PropertyUtil.settingProperty("member.grade");
		String companyIdx = PropertyUtil.settingProperty("member.company");
		String useYn = PropertyUtil.settingProperty("member.useYn");

		if(userId != "" && userId != null) {

			if(password != null && password != "") {
				Map<String, Object> userInfo = new HashMap<String, Object>();

				userInfo.put("userId", userId);
				userInfo.put("password", password);
				userInfo.put("userName", userName);
				userInfo.put("email", email);
				userInfo.put("addr", addr);
				userInfo.put("telNum", telNum);
				userInfo.put("membGb", membGb);
				userInfo.put("membGrade", membGrade);
				userInfo.put("companyIdx", companyIdx);
				userInfo.put("useYn", useYn);

				try {
				    loginService.insertUserInfo(userInfo);
				    Map<String, Object> successMap = new HashMap<String, Object>();
				    successMap.put("msg", "회원가입에 성공하였습니다. 로그인해 주세요.");
				    successMap.put("url", "close");
				    mav.addObject("successMap", successMap);
				    mav.setViewName("/common/success");
				} catch(Exception e) {
					e.toString();
					logger.error(e.toString());
					Map<String, Object> errorMap = new HashMap<String, Object>();
					errorMap.put("msg", "회원가입에 실패하였습니다.");
					errorMap.put("url", "/login/register.info");
					mav.addObject("errorMap", errorMap);
					mav.setViewName("/common/error");
				}
			} else {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "비밀번호를 입력하세요.");
				errorMap.put("url", "/login/register.info");
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
			}
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "아이디를 입력하세요.");
			errorMap.put("url", "/login/register.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
		}

		return mav;
	}

}
