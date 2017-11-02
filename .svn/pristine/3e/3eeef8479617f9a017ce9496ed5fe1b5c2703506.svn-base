package com.eye2web.infosys.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eye2web.infosys.bean.LoginBean;
import com.eye2web.infosys.service.CustomerService;
import com.eye2web.infosys.service.ExamService;
import com.eye2web.infosys.service.InfoService;
import com.eye2web.infosys.util.CommonUtil;

/**
 * 시험성적서 관련 Controller
 * @author andrew5335
 *
 */
@Controller
public class ExamReportController {

	private static Logger logger = Logger.getLogger(ExamReportController.class);

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ExamService examService;

	@Autowired
	private InfoService infoService;

	@Autowired
    private ServletContext context;

	private LoginBean loginBean;

	private CommonUtil commonUtil;

	private HttpSession session;

	private String userId;
	private String membGb;
	private String membGrade;
	private int companyIdx;

	/**
	 * 시험성적서 리스트
	 * 시험성적서는 자신의 회사와 관련된 내용만 나와야 함 (필요할지...)
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/exam/examList.info")
	public ModelAndView examList(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = loginBean.getCompanyIdx();

		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/exam/examWrite.info")
	public ModelAndView examWrite(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = Integer.parseInt(req.getParameter("companyIdx"));
		String infoIdx = req.getParameter("idx");    // 시험정보 테이블의 idx
		String type = req.getParameter("type");

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {

			Map<String, Object> customerMap = new HashMap<String, Object>();
			customerMap = customerService.getCustomerInfo(companyIdx);

			int tmpIdx = 0;
			tmpIdx = Integer.parseInt(infoIdx);

			Map<String, Object> examMap = new HashMap<String, Object>();
			examMap = examService.getExamResult(tmpIdx);

			// 정보 idx값이 없으면 에러
			if(infoIdx == null || infoIdx == "" || infoIdx.length() < 0) {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "필수값이 없습니다.");
				errorMap.put("url", "/info/infoView.info?idx="+infoIdx);
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
			} else {
				if(customerMap != null && customerMap.size() > 0) {
					long today = System.currentTimeMillis();
					DateFormat df = new SimpleDateFormat("yyMMdd");
					DateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
					String todayDate = df.format(today);

					String infoNo = "";
					String reportNo = "";
					infoNo = StringUtils.leftPad(infoIdx, 3, "0");
					reportNo = "OILTOK " + todayDate + "-" + infoNo;

					mav.addObject("customerMap", customerMap);
					mav.addObject("examMap", examMap);
					mav.addObject("infoIdx", infoIdx);
					mav.addObject("type", type);
					mav.addObject("reportNo", reportNo);
					mav.addObject("companyIdx", companyIdx);
					mav.setViewName("/exam/examWrite");
				} else {

				}
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

	@RequestMapping("/exam/examProcess.info")
	public ModelAndView examProcess(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = Integer.parseInt(req.getParameter("companyIdx"));
		String infoIdx = req.getParameter("infoIdx");    // 시험정보 테이블의 idx
		String type = req.getParameter("type");

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			commonUtil = new CommonUtil();
			Map<String, Object> examMap = commonUtil.convertReqToMap(req);

			if(examMap != null && examMap.size() > 0) {
				String testDate1 = (String)examMap.get("datepicker");
				String testDate2 = (String)examMap.get("datepicker2");
				testDate1 = testDate1.replace("-", "");
				testDate2 = testDate2.replace("-", "");
				examMap.put("testDate1", testDate1);
				examMap.put("testDate2", testDate2);
				String guTxt = "";

				try {
					if(!type.equals("insert")) {
						examMap.put("updateIdx", infoIdx);
						examService.updateExamResult(examMap);
						guTxt = "정보수정";
					} else {
				        examService.insertExamResult(examMap);
				        guTxt = "정보입력";
					}
					Map<String, Object> successMap = new HashMap<String, Object>();
					successMap.put("msg", guTxt + "에 성공하였습니다.");
					successMap.put("url", "/info/infoList.info");
				    mav.addObject("successMap", successMap);
				    mav.setViewName("/common/success");
				} catch(Exception e) {
					e.toString();
					Map<String, Object> errorMap = new HashMap<String, Object>();
					errorMap.put("msg", "시험성적 입력에 실패하였습니다.");
					errorMap.put("url", "/exam/examWrite.info?companyIdx="+companyIdx+"&idx="+infoIdx);
					mav.addObject("errorMap", errorMap);
					mav.setViewName("/common/error");
				}
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

	@RequestMapping("/exam/examView.info")
	public ModelAndView examView(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = Integer.parseInt(req.getParameter("companyIdx"));
		String infoIdx = req.getParameter("idx");    // 시험정보 테이블의 idx

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			int tmpIdx = 0;
			//tmpIdx = Integer.parseInt(infoIdx);
			tmpIdx = companyIdx;

			Map<String, Object> examMap = new HashMap<String, Object>();
			examMap = examService.getExamResult(tmpIdx);

			Map<String, Object> customerMap = new HashMap<String, Object>();
			customerMap = customerService.getCustomerInfo(companyIdx);

			if(examMap != null && examMap.size() > 0) {
				mav.addObject("examMap", examMap);
				mav.addObject("customerMap", customerMap);
				mav.addObject("infoIdx", infoIdx);
				mav.addObject("companyIdx", companyIdx);
				mav.addObject("type", "update");
				mav.setViewName("/exam/examView");
			} else {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "시험성적이 없습니다.");
				errorMap.put("url", "/info/infoView.info?idx="+infoIdx);
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

	@RequestMapping("/exam/examDelete.info")
	public ModelAndView examDelete(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = Integer.parseInt(req.getParameter("companyIdx"));
		String infoIdx = req.getParameter("idx");    // 시험정보 테이블의 idx

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			if(infoIdx != null && infoIdx != "") {
				int tmpIdx = 0;
				tmpIdx = Integer.parseInt(infoIdx);
				try {
					examService.deleteExamResult(tmpIdx);
					mav.setViewName("/info/infoList");
				} catch(Exception e) {
					Map<String, Object> errorMap = new HashMap<String, Object>();
					errorMap.put("msg", "삭제에 실패하였습니다.");
					errorMap.put("url", "/exam/examView.info?idx="+infoIdx);
					mav.addObject("errorMap", errorMap);
					mav.setViewName("/common/error");
				}
				Map<String, Object> successMap = new HashMap<String, Object>();
				successMap.put("msg", "정보삭제에 성공하였습니다.");
				successMap.put("url", "/info/infoList.info");
			    mav.addObject("successMap", successMap);
			    mav.setViewName("/common/success");
			} else {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "삭제에 필요한 값이 없습니다.");
				errorMap.put("url", "/exam/examView.info?idx="+infoIdx);
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

	@RequestMapping("/exam/reportExcel.info")
	public void reportExcel(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = Integer.parseInt(req.getParameter("companyIdx"));
		String infoIdx = req.getParameter("idx");    // 시험정보 테이블의 idx

		String reportLocation = context.getRealPath("WEB-INF");

		if(userId != null && userId != "") {

		} else {
			System.out.println("로그인이 필요한 서비스입니다.");
		}
	}

	@RequestMapping("/report/reportIssue.info")
	public ModelAndView reportIssue(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {

			int companyIdx = 0;
			int specIdx = 0;
			int sampleIdx = 0;
			int colspan = 2;

			String tmpCompanyIdx = req.getParameter("companyIdx");
			String tmpSpecIdx = req.getParameter("specIdx");
			String tmpSampleIdx = req.getParameter("sampleIdx");
			String startDate = req.getParameter("startDate");
			String endDate = req.getParameter("endDate");
			String searchKey = req.getParameter("searchKey");
			String companyName = req.getParameter("companyName");
			String specName = req.getParameter("specName");
			String sampleName = req.getParameter("sampleName");
			String smplPoint = req.getParameter("smplPoint");
			String manager = "";
			String smplDate = "";
			String examChk = req.getParameter("examChk");

			if(startDate != null) {
				mav.addObject("startDate", startDate);
			}

			if(endDate != null) {
				mav.addObject("endDate", endDate);
			}

			List<Map<String, Object>> customerList = customerService.getList();
			List colName = new ArrayList();
			colName = infoService.getColName();

			if(colName != null && colName.size() > 0) {
				//String[] colArray = (String[]) colName.toArray(new String[colName.size()]);
				String colArray[] = new String[colName.size()];
				for(int i=0; i < colName.size(); i++) {
					System.out.println("ColName : " + colName.get(i).toString());
					colArray[i] = colName.get(i).toString();
				}

				String column = "";
				column = Arrays.toString(colArray);
				column = column.replace("[", "");
				column = column.replace("]", "");
				column = column.replace(" ", "");
				column = column.replace("idx,companyIdx,specIdx,sampleIdx,", "");
				column = column.replace("condition,", "");
				column = column.replace("regdate,", "");
				column = column.replace("smplPoint,", "");
				mav.addObject("searchCol", column);
			}

			mav.addObject("customerList", customerList);
			mav.addObject("colspan", colspan);
			mav.addObject("companyIdx", companyIdx);
			mav.addObject("specIdx", specIdx);
			mav.addObject("sampleIdx", sampleIdx);
			mav.addObject("companyName", companyName);
			mav.addObject("specName", specName);
			mav.addObject("sampleName", sampleName);
			mav.addObject("smplPoint", smplPoint);
			mav.addObject("manager", manager);
			mav.addObject("examChk", examChk);

			mav.setViewName("/exam/reportIssue");
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
