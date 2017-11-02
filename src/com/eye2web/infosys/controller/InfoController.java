package com.eye2web.infosys.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eye2web.infosys.bean.AddfieldBean;
import com.eye2web.infosys.bean.LoginBean;
import com.eye2web.infosys.bean.StandardData;
import com.eye2web.infosys.dto.InfoFileDto;
import com.eye2web.infosys.service.CustomerService;
import com.eye2web.infosys.service.ExamService;
import com.eye2web.infosys.service.InfoService;
import com.eye2web.infosys.util.CommonUtil;

/**
 * @author HJKim
 * @Description : 정보관리 화면 컨트롤러
 *
 */
@Controller
public class InfoController {

	private static Logger logger = Logger.getLogger(InfoController.class);

	@Autowired
	private InfoService infoService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ExamService examService;

	@Autowired
    private ServletContext context;

	private LoginBean loginBean;

	private AddfieldBean addfieldBean;

	private CommonUtil commonUtil;

	private HttpSession session;

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	private StandardData sData;

	//private InfoFileDto infoFileDto;

	private String userId;
	private String membGb;
	private String membGrade;
	private int companyIdx;

	// 페이징용
	private final int paging = 10;

	// 기준치 데이터
	private final String phydraulic1  = ">16/14/12";    // 유압유 주의기준
	private final String phydraulic2  = ">18/16/14";    // 유압유 경고기준
	private final String pgear1 = ">20/18/15";    // 기어유 주의기준
	private final String pgear2 = ">22/20/17";    // 기어유 경고기준
	private final String pengine1 = ">18/16/13";    // 엔진유 주의기준
	private final String pengine2 = ">20/18/15";    // 엔진유 경고기준
	private final String pturbine1 = ">18/16/13";    // 터빈유 주의기준
	private final String pturbine2 = ">20/18/15";    // 터빈유 경고기준
	private final String pbearing1 = ">18/16/13";    // 베어링유 주의기준
	private final String pbearing2 = ">20/18/15";    // 베어링유 경고기준

	private final String whydraulic1  = ">100";    // 유압유 주의기준
	private final String whydraulic2  = ">400";    // 유압유 경고기준
	private final String wgear1 = ">300";    // 기어유 주의기준
	private final String wgear2 = ">600";    // 기어유 경고기준
	private final String wengine1 = ">200";    // 엔진유 주의기준
	private final String wengine2 = ">500";    // 엔진유 경고기준
	private final String wturbine1 = ">50";    // 터빈유 주의기준
	private final String wturbine2 = ">300";    // 터빈유 경고기준
	private final String wair1 = ">100";    // 공기압축기 주의기준
	private final String wair2 = ">400";    // 공기압축기 경고기준
	private final String weht1 = ">250";    // EHT 주의기준
	private final String weht2 = ">400";    // EHT 경고기준

	private final String zddp1 = "Inflection point + 0.2";
	private final String zddp2 = "Initial AN + 1.0";
	private final String aw1 = "Initial AN + 0.2";
	private final String aw2 = "Initial AN + 1.0";
	private final String volume1 = "Initial AN + 0.03";
	private final String volume2 = "Initial AN + 0.05";

	private final String kzddp1 = "변곡점+0.2";
	private final String kzddp2 = "신유산가+1.0";
	private final String kaw1 = "신유산가+0.2";
	private final String kaw2 = "신유산가+1.0";
	private final String kvolume1 = "신유산가+0.03";
	private final String kvolume2 = "신유산가+0.05";

	private final String viscosity1 = "±10% by New";
	private final String viscosity2 = "±15% by New";
	private final String kviscosity1 = "신유점도±10%";
	private final String kviscosity2 = "신유점도±15%";
    private final double cviscosityA = 0.85;
    private final double cviscosityB = 0.9;
    private final double cviscosityC = 1.1;
    private final double cviscosityD = 1.15;

    private final String engine = "> 20 (30max)";
    private final String trucks = "> 100(100max)";
    private final String loaders = "> 60";
    private final String tractors = "> 150";
    private final String transmissions = "> 20-40";
    private final String oilpressure = "> 20";
    private final String gearbox = "> 100";
    private final String rolling = "> 50";

    // 새로운 기준치 - 2015-04-09 by Andrew Kim
    // 동점도
    private final String viscoauto1 = "±5% by New";
    private final String viscoauto2 = "±10% by New";
    private final double viscoval1 = 0.9;
    private final double viscoval2 = 0.95;
    private final double viscoval3 = 1.05;
    private final double viscoval4 = 1.10;

    // 산가
    private final String acidauto1 = "Initial AN+0.2";
    private final String acidauto2 = "Initial AN+1.0";
    private final String acidauto3 = "Initial AN+0.03";
    private final String acidauto4 = "Initial AN+0.05";
    private final double acidval1 = 0.2;
    private final double acidval2 = 1.0;
    private final double acidval3 = 0.03;
    private final double acidval4 = 0.05;

    // 염기가
    private final String baseauto1 = "<50% of new oil";
    private final String baseauto2 = "<25% of new oil";

    // 사용유 잔존 수명평가1
    private final String ruler1auto1 = "<75%";
    private final String ruler1auto2 = "<25%";

    // 사용유 잔존 수명평가2
    private final String ruler2auto1 = ">400";
    private final String ruler2auto2 = ">650";

    // 항유화성
    private final String waterval = ">30분";

    // 기포성
    private final String foamingval1 = "tendency >450";
    private final String foamingval2 = "stability >10";

    // 입자오염도
    private final String particleval1 = ">16/14/12";
    private final String particleval2 = ">18/16/14";
    private final String particleval3 = ">20/18/15";
    private final String particleval4 = ">22/20/17";
    private final String particleval5 = ">18/16/13";
    private final String particleval6 = ">20/18/15";

    // 수분
    private final String waterconval1 = ">50";    // 50 100 200 250 300 400 500 600
    private final String waterconval2 = ">100";
    private final String waterconval3 = ">200";
    private final String waterconval4 = ">250";
    private final String waterconval5 = ">300";
    private final String waterconval6 = ">400";
    private final String waterconval7 = ">500";
    private final String waterconval8 = ">600";

    // 철분마모분석
    private final String pqval1 = ">20";
    private final String pqval2 = ">50";
    private final String pqval3 = ">100";

    // 인화점
    private final String flashval1 = "decrease of 20℃";
    private final String flashval2 = "decrease of 30℃";

    // 염소분
    private final String chlorineval = ">100";

    // 바니쉬 잠재위험도 1
    private final String membraineval1 = ">30";
    private final String membraineval2 = ">40";

    // 바니쉬 잠재위험도 2
    private final String phosphateval1 = ">4mg";
    private final String phosphateval2 = ">10mg";

    // 색표시 위치
    private final String GRAY = "/images/gray.png";
    private final String RED = "/images/red.png";
    private final String ORANGE = "/images/orange.png";
    private final String GREEN = "/images/green.png";

	/**
	 * @Description 정보관리 메인화면
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/info/infoMain.info")
	public ModelAndView infoMain(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = loginBean.getCompanyIdx();

		int page = 0;    // 페이징용, 메인의 경우 최근 10개만 나오도록...

		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);
		System.out.println("로그인한 사용자 등급 : " + membGb);
		System.out.println("로그인한 사용자 권한: " + membGrade);
		System.out.println("로그인한 사용자 소속회사: " + companyIdx);

		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> infoList = new ArrayList<Map<String, Object>>();
	    List<Map<String, Object>> customerList = new ArrayList<Map<String, Object>>();
	    Map<String, Object> infoMap = new HashMap<String, Object>();

		if(userId != null && userId != "") {
			if(!membGb.equals("99") && membGb != "99") {
				infoMap.put("companyIdx", companyIdx);
				infoMap.put("page", page);
				infoList = infoService.getList2(infoMap);
			    customerList = customerService.getList2(infoMap);
			} else {
				infoMap.put("page", page);
				infoList = infoService.getList(infoMap);
			    customerList = customerService.getList();
			}

			mav.addObject("infoList", infoList);
			mav.addObject("customerList", customerList);
		    mav.setViewName("/info/infoMain");
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
		}

		return mav;
	}

	/**
	 * @Description 정보 리스트
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/info/infoList.info")
	public ModelAndView infoList(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = loginBean.getCompanyIdx();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		int listCnt = 0;    // 전체 수
		int pageCnt = 1;    // 총 페이지 수, 최초는 1
		int page = 0;    // 페이징용, 최초는 첫 페이지 10개
		int curPage = 0;    // 현재 페이지
		int prevPage = 0;    // 이전 페이지
		int prevPage2 = 0;    // 이전의 이전 페이지
		int nextPage = 0;    // 다음 페이지
		int nextPage2 = 0;    // 다음의 다음 페이지
		int reqPage = 0;    // 요청 페이지
		if(!("").equals(req.getParameter("page")) && req.getParameter("page") != null) {
			reqPage = Integer.parseInt(req.getParameter("page"));
			page = (reqPage - 1) * 10;
			curPage = reqPage;
		} else {
			curPage = 1;
		}

		prevPage = curPage - 1;
		prevPage2 = curPage - 2;
		nextPage = curPage + 1;
		nextPage2 = curPage + 2;

		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> infoList = new ArrayList<Map<String, Object>>();
	    List<Map<String, Object>> customerList = new ArrayList<Map<String, Object>>();
	    Map<String, Object> infoMap = new HashMap<String, Object>();

		if(userId != null && userId != "") {
			if(!membGb.equals("99") && membGb != "99") {
				infoMap.put("companyIdx", companyIdx);
				infoMap.put("page", page);
				listCnt = infoService.getCount(infoMap);
				if(listCnt != 0 && listCnt > 0) {
					pageCnt = (int)Math.ceil((double)listCnt / paging);
				}
				infoList = infoService.getList2(infoMap);
			    customerList = customerService.getList2(infoMap);

			    mav.addObject("pageCnt", pageCnt);
			} else {
				infoMap.put("page", page);
				listCnt = infoService.getCount(infoMap);
				if(listCnt != 0 && listCnt > 0) {
					pageCnt = (int)Math.ceil((double)listCnt / paging);
				}
				infoList = infoService.getList(infoMap);
			    customerList = customerService.getList();

			    mav.addObject("pageCnt", pageCnt);
			}

			mav.addObject("curPage", curPage);
			mav.addObject("prevPage", prevPage);
			mav.addObject("prevPage2", prevPage2);
			mav.addObject("nextPage", nextPage);
			mav.addObject("nextPage2", nextPage2);
			mav.addObject("infoList", infoList);
			mav.setViewName("/info/infoList");
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
		}

		return mav;
	}

	/**
	 * @Description 정보 입력 화면
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/info/infoWrite.info")
	public ModelAndView infoWrite(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = loginBean.getCompanyIdx();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		// 로그인한 사용자인 경우
		if(userId != null && userId != "") {
			String idx = "";
			int tmpidx = 0;
			Map<String, Object> infoMap = null;
			idx = req.getParameter("idx");

			List<Map<String, Object>> customerList = customerService.getList();

			// 정보 idx 값이 있을 경우 수정, 없으면 입력
			if(idx == null || idx == "" || idx.length() < 0) {

				// idx값이 없을 경우 빈 입력 페이지 표시
				mav.addObject("infoMap", infoMap);
				mav.addObject("idx", "");
				mav.addObject("type", "write");
				mav.addObject("customerList", customerList);
				mav.setViewName("/info/infoWrite");
			} else {
				// idx 값이 있을 경우 관련 정보를 DB에서 가져와 페이지의 각 필드에 노출
				tmpidx = Integer.parseInt(idx);
				infoMap = infoService.getInfoDetail(tmpidx);

				if(infoMap.size() > 0) {
					mav.addObject("idx", idx);
					mav.addObject("infoMap", infoMap);
					mav.addObject("type", "update");
					mav.addObject("customerList", customerList);
					mav.setViewName("/info/infoWrite");
				} else {
					Map<String, Object> errorMap = new HashMap<String, Object>();
					errorMap.put("msg", "정보가 없습니다..");
					errorMap.put("url", "/infoMap/infoList.info");
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

	/**
	 * @Description 기계 리스트
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	@RequestMapping("/ajax/machineList.info")
	public void machineList(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String companyIdx = "";
		String examYn = "";
		companyIdx = req.getParameter("companyIdx").toString();

		if(companyIdx != null && companyIdx != "") {
			int cpIdx = Integer.parseInt(companyIdx);
			List<Map> mcList = customerService.getMachineList(cpIdx);
			Map<String, Object> examResult = examService.getExamResult(cpIdx);

			if(examResult != null && examResult.size() > 0) {
				examYn = "Y";
			} else {
				examYn = "N";
			}

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", mcList);
			jsonObj.put("examYn", examYn);
			System.out.println(jsonObj);
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out=res.getWriter();
            out.print(jsonObj.toString());
		}
	}

	/**
	 * @Description 샘플 리스트
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	@RequestMapping("/ajax/smplList.info")
	public void smplList(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String specIdx = "";
		specIdx = req.getParameter("specIdx").toString();

		if(specIdx != null && specIdx != "") {
			int smplIdx = Integer.parseInt(specIdx);
			List<Map> smList = customerService.getSampleList(smplIdx);

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", smList);
			System.out.println(jsonObj);
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out=res.getWriter();
            out.print(jsonObj.toString());
		}
	}

	/**
	 * @Description 샘플포인트 정보
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	@RequestMapping("/ajax/smplPoint.info")
	public void smplPoint(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String sampleIdx = "";
		sampleIdx = req.getParameter("sampleIdx").toString();

		if(sampleIdx != null && sampleIdx != "") {
			int smplIdx = Integer.parseInt(sampleIdx);
			String rstSmplPoint = infoService.getSmplPoint(smplIdx);

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", rstSmplPoint);
			System.out.println(jsonObj);
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out=res.getWriter();
            out.print(jsonObj.toString());
		}
	}

	/**
	 * @Description 정보입력 처리
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/info/infoWriteProcess.info")
	public ModelAndView infoWriteProcess(HttpServletRequest req, HttpServletResponse res, InfoFileDto infoFileDto) throws Exception {

		userId = loginBean.getUserId();
		membGb = loginBean.getMembGb();
		membGrade = loginBean.getMembGrade();
		companyIdx = loginBean.getCompanyIdx();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		String idx = req.getParameter("idx");
		String type = req.getParameter("type");
		String companyIdx = req.getParameter("companyIdx");
		String specIdx = req.getParameter("specIdx");
		String sampleIdx = req.getParameter("sampleIdx");
		String smplPoint = req.getParameter("smplpoint");
		String oilType = req.getParameter("oilType");
		String authorizer = req.getParameter("authorizer");

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			commonUtil = new CommonUtil();
			Map<String, Object> infoMap = commonUtil.convertReqToMap(req);

			long today = System.currentTimeMillis();
			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String todayDate = df.format(today);
			System.out.println("오늘 날짜 : " + todayDate);

			String path = req.getSession().getServletContext().getRealPath("/");
			System.out.println("Path : " + path);

			MultipartFile upFile1 = infoFileDto.getUpFile1();
			MultipartFile ucuttingWear          = infoFileDto.getUcuttingWear();
			MultipartFile ufatigueWear          = infoFileDto.getUfatigueWear();
			MultipartFile unonmetalicparticles  = infoFileDto.getUnonmetalicparticles();
			MultipartFile usevereSlidingWear    = infoFileDto.getUsevereSlidingWear();
			MultipartFile uwater                = infoFileDto.getUwater();
			MultipartFile ufiber                = infoFileDto.getUfiber();
			MultipartFile uParticleInfo1        = infoFileDto.getuParticleInfo1();
			MultipartFile uParticleInfo2        = infoFileDto.getuParticleInfo2();
			MultipartFile uParticleInfo3        = infoFileDto.getuParticleInfo3();
			MultipartFile uParticleInfo4        = infoFileDto.getuParticleInfo4();
			MultipartFile uParticleInfo5        = infoFileDto.getuParticleInfo5();
			MultipartFile uMembranePatchImg1    = infoFileDto.getuMembranePatchImg1();
			MultipartFile uMembranePatchImg2    = infoFileDto.getuMembranePatchImg2();
			MultipartFile uMembranePatchImg3    = infoFileDto.getuMembranePatchImg3();
			MultipartFile uMembranePatchImg4    = infoFileDto.getuMembranePatchImg4();
			MultipartFile uMembranePatchImg5    = infoFileDto.getuMembranePatchImg5();
			MultipartFile uMembranePatchImg6    = infoFileDto.getuMembranePatchImg6();
			MultipartFile uPatch                = infoFileDto.getuPatch();
			MultipartFile uPatchExt             = infoFileDto.getuPatchExt();
			MultipartFile uPatchTest            = infoFileDto.getuPatchTest();
			MultipartFile uSludge               = infoFileDto.getuSludge();
			MultipartFile uBlotter              = infoFileDto.getuBlotter();
			MultipartFile uRuler1               = infoFileDto.getuRuler1();
			MultipartFile uRuler2               = infoFileDto.getuRuler2();
			MultipartFile uInsoluble            = infoFileDto.getuInsoluble();

			String fileName1 = commonUtil.fileUpload(upFile1, req);
			String ucuttingWearName					= commonUtil.fileUpload(ucuttingWear, req);
			String uFatigueWearName         = commonUtil.fileUpload(ufatigueWear, req);
			String unonmetalicparticlesName  = commonUtil.fileUpload(unonmetalicparticles, req);
			String usevereSlidingWearName   = commonUtil.fileUpload(usevereSlidingWear, req);
			String uwaterName               = commonUtil.fileUpload(uwater, req);
			String ufiberName               = commonUtil.fileUpload(ufiber, req);
			String uParticleInfo1Name       = commonUtil.fileUpload(uParticleInfo1, req);
			String uParticleInfo2Name       = commonUtil.fileUpload(uParticleInfo2, req);
			String uParticleInfo3Name       = commonUtil.fileUpload(uParticleInfo3, req);
			String uParticleInfo4Name       = commonUtil.fileUpload(uParticleInfo4, req);
			String uParticleInfo5Name       = commonUtil.fileUpload(uParticleInfo5, req);
			String uMembranePatchImg1Name   = commonUtil.fileUpload(uMembranePatchImg1, req);
			String uMembranePatchImg2Name   = commonUtil.fileUpload(uMembranePatchImg2, req);
			String uMembranePatchImg3Name   = commonUtil.fileUpload(uMembranePatchImg3, req);
			String uMembranePatchImg4Name   = commonUtil.fileUpload(uMembranePatchImg4, req);
			String uMembranePatchImg5Name   = commonUtil.fileUpload(uMembranePatchImg5, req);
			String uMembranePatchImg6Name   = commonUtil.fileUpload(uMembranePatchImg6, req);
			String uPatchName               = commonUtil.fileUpload(uPatch, req);
			String uPatchExtName            = commonUtil.fileUpload(uPatchExt, req);
			String uPatchTestName           = commonUtil.fileUpload(uPatchTest, req);
			String uSludgeName              = commonUtil.fileUpload(uSludge, req);
			String uBlotterName             = commonUtil.fileUpload(uBlotter, req);
			String uRuler1Name              = commonUtil.fileUpload(uRuler1, req);
			String uRuler2Name              = commonUtil.fileUpload(uRuler2, req);
			String uInsolubleName          = commonUtil.fileUpload(uInsoluble, req);

			infoMap.put("ucuttingWear", ucuttingWearName);
			infoMap.put("ufatigueWear", uFatigueWearName);
			infoMap.put("unonmetalicparticles", unonmetalicparticlesName);
			infoMap.put("usevereSlidingWear", usevereSlidingWearName);
			infoMap.put("uwater", uwaterName);
			infoMap.put("ufiber", ufiberName);
			infoMap.put("uParticleInfo1", uParticleInfo1Name);
			infoMap.put("uParticleInfo2", uParticleInfo2Name);
			infoMap.put("uParticleInfo3", uParticleInfo3Name);
			infoMap.put("uParticleInfo4", uParticleInfo4Name);
			infoMap.put("uParticleInfo5", uParticleInfo5Name);
			infoMap.put("uMembranePatchImg1", uMembranePatchImg1Name);
			infoMap.put("uMembranePatchImg2", uMembranePatchImg2Name);
			infoMap.put("uMembranePatchImg3", uMembranePatchImg3Name);
			infoMap.put("uMembranePatchImg4", uMembranePatchImg4Name);
			infoMap.put("uMembranePatchImg5", uMembranePatchImg5Name);
			infoMap.put("uMembranePatchImg6", uMembranePatchImg6Name);
			infoMap.put("uPatch", uPatchName);
			infoMap.put("uPatchExt", uPatchExtName);
			infoMap.put("uPatchTest", uPatchTestName);
			infoMap.put("uSludge", uSludgeName);
			infoMap.put("uBlotter", uBlotterName);
			infoMap.put("uRuler1", uRuler1Name);
			infoMap.put("uRuler2", uRuler2Name);
			infoMap.put("uInsoluble", uInsolubleName);

			if(idx != null || idx != "" || idx.length() > 0) {
				infoMap.put("idx", idx);
			}

			infoMap.put("companyIdx", companyIdx);
			infoMap.put("specIdx", specIdx);
			infoMap.put("sampleIdx", sampleIdx);
			infoMap.put("smplPoint", smplPoint);
			infoMap.put("oilType", oilType);
			infoMap.put("authorizer", authorizer);
			infoMap.put("regDate", todayDate);
			infoMap.put("register", userId);

			try {
				Map<String, Object> successMap = new HashMap<String, Object>();

				Iterator<String> iterator = infoMap.keySet().iterator();
			    while (iterator.hasNext()) {
			        String key = iterator.next();
			        System.out.print("key="+key);
			        System.out.println(" value="+infoMap.get(key));
			    }

				if(type == "write" || type.equals("write")) {
					infoService.insertSolgeInfo(infoMap);
					successMap.put("msg", "정보입력에 성공하였습니다.");
				} else {
					infoService.updateSolgeInfo(infoMap);
					successMap.put("msg", "정보수정에 성공하였습니다.");
				}

				successMap.put("url", "/info/infoList.info");
			    mav.addObject("successMap", successMap);
			    mav.setViewName("/common/success");
			} catch(Exception e) {
				e.toString();
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

	/**
	 * @Description 정보 보기 화면
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/info/infoView.info")
	public ModelAndView infoView(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			String idx = "";
			int tmpidx = 0;
			Map<String, Object> infoMap = null;
			idx = req.getParameter("idx");

			if(idx == null || idx == "" || idx.length() < 0) {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "정보가 없습니다..");
				errorMap.put("url", "/infoMap/infoList.info");
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
			} else {
				// idx 값이 있을 경우 관련 정보를 DB에서 가져와 페이지의 각 필드에 노출
				tmpidx = Integer.parseInt(idx);
				infoMap = infoService.getInfoDetail(tmpidx);

				if(infoMap.size() > 0) {
					Map<String, Object> examMap = new HashMap<String, Object>();
					examMap = examService.getExamResult(tmpidx);
					if(examMap != null && examMap.size() > 0) {
						mav.addObject("infoIdx", idx);
					} else {
						mav.addObject("infoIdx", "");
					}
					mav.addObject("idx", idx);
					mav.addObject("infoMap", infoMap);
					mav.addObject("type", "update");
					mav.setViewName("/info/infoView");
				} else {
					Map<String, Object> errorMap = new HashMap<String, Object>();
					errorMap.put("msg", "정보가 없습니다..");
					errorMap.put("url", "/infoMap/infoList.info");
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

	/**
	 * @Description 엑셀 다운로드
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	@RequestMapping("/info/infoExcelDownload.info")
	public void infoExcelDownload(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		String reportLocation = context.getRealPath("WEB-INF");
		System.out.println("report location : " + reportLocation);

		if(userId != null && userId != "") {
			String idx = "";
			int tmpidx = 0;
			Map<String, Object> excelMap = null;
			idx = req.getParameter("idx");
			String excelgu = "excel1";
			String path = req.getSession().getServletContext().getRealPath("/");

			if(idx == null || idx == "" || idx.length() < 0) {

			} else {
				commonUtil = new CommonUtil();
				tmpidx = Integer.parseInt(idx);
				excelMap = infoService.getInfoDetail(tmpidx);
				System.out.println("name : " + excelMap.get("COMPANYNAME"));
				String excelName = "Solge_Report_" + excelMap.get("COMPANYNAME");
				System.out.println("엑셀파일명 : " +  excelName);
				commonUtil.excelDownload(excelMap, "", excelName, res, req, reportLocation, path, excelgu);
			}
		} else {
			System.out.println("로그인이 필요한 서비스입니다.");
		}
	}

	@RequestMapping("/info/infoDelete.info")
	public ModelAndView deleteInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		//userId = (String)session.getAttribute("userId");

		if(userId != null && userId != "") {
			String idx = "";
			int tmpidx = 0;
			Map<String, Object> infoMap = null;
			idx = req.getParameter("idx");

			if(idx == null || idx == "" || idx.length() < 0) {
				ModelAndView mav = new ModelAndView();
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put("msg", "삭제에 필요한 값이 없습니다..");
				errorMap.put("url", "/info/infoList.info");
				mav.addObject("errorMap", errorMap);
				mav.setViewName("/common/error");
				return mav;
			} else {
				try {
					tmpidx = Integer.parseInt(idx);
					infoService.deleteInfo(tmpidx);
				} catch(Exception e) {
					e.toString();
					ModelAndView mav = new ModelAndView();
					Map<String, Object> errorMap = new HashMap<String, Object>();
					errorMap.put("msg", "삭제에 실패하였습니다..");
					errorMap.put("url", "/info/infoList.info");
					mav.addObject("errorMap", errorMap);
					mav.setViewName("/common/error");
					return mav;
				}
			}
		} else {
			ModelAndView mav = new ModelAndView();
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
			return mav;
		}

		return new ModelAndView("redirect:/info/infoList.info");
	}

	@RequestMapping("/info/infoAnalysis.info")
	public ModelAndView infoAnalysis(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();

		userId = loginBean.getUserId();
		//userId = (String)session.getAttribute("userId");

		if(userId != null && userId != "") {
			sData = new StandardData();
			System.out.println(sData.getAw1());
			int companyIdx = 0;
			int specIdx = 0;
			int sampleIdx = 0;
			int colspan = 2;
			String searchCol = "";
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

			List<Map> analysisList = null;
			Map analysisMap = new HashMap();

			if(searchKey != null && !searchKey.equals("")) {

				analysisMap.put("searchKey", searchKey);
				if(tmpCompanyIdx != "" && tmpCompanyIdx != null) {
					companyIdx = Integer.parseInt(tmpCompanyIdx);
					Map<String, Object> customerMap = customerService.getCustomerInfo(companyIdx);
					if(customerMap != null) {
						manager = (String) customerMap.get("MANAGER");
					}
				}
				analysisMap.put("companyIdx", companyIdx);

				if(tmpSpecIdx != "" && tmpSpecIdx != null) {
					specIdx = Integer.parseInt(tmpSpecIdx);
				}
				analysisMap.put("specIdx", specIdx);

				if(tmpSampleIdx != "" && tmpSampleIdx != null) {
					sampleIdx = Integer.parseInt(tmpSampleIdx);
				}

				searchCol = req.getParameter("searchCol");
				String[] searchColVal = searchCol.split(",");
				int searchColSize = 0;
				searchColSize = searchColVal.length;
				System.out.println("searchColSize : " + searchColSize);
				if(searchColSize >= 2) {
					colspan = searchColSize;
				}

				String startDate1 = "";
				String endDate1 = "";

				if(startDate != null && startDate != "") {
					startDate1 = startDate.replace("-", "") + "000000";
				}

				if(endDate != null && endDate != "") {
					endDate1 = endDate.replace("-", "") + "235959";
				}

				analysisMap.put("sampleIdx", sampleIdx);
				analysisMap.put("startDate", startDate1);
				analysisMap.put("endDate", endDate1);
				analysisMap.put("colName", searchCol);

				analysisList = infoService.getAnalysisList(analysisMap);

				Map resultMap = new HashMap<String, Object>();

				if(analysisList != null) {
					for(int j=0; j < searchColVal.length; j++) {
						String[] colVal = null;
						List<String> colValList = new ArrayList<String>();
						for(int i =0; i < analysisList.size(); i++) {
							colValList.add((String)analysisList.get(i).get(searchColVal[j]));
						}
						colVal = colValList.toArray(new String[colValList.size()]);
						System.out.println("배열값" + Arrays.toString(colVal));
						resultMap.put(searchColVal[j], Arrays.toString(colVal));
					}

					List<String> dateList = new ArrayList<String>();
					Object[] dateVal = null;
					for(int nn=0; nn < analysisList.size(); nn++) {
						dateList.add(analysisList.get(nn).get("regdate").toString().substring(0, 4) + "-" + analysisList.get(nn).get("regdate").toString().substring(4, 6) + "-" + analysisList.get(nn).get("regdate").toString().substring(6, 8));
					}
					dateVal = dateList.toArray(new Object[dateList.size()]);
					resultMap.put("regdate", Arrays.toString(dateVal));
					resultMap.put("regdate2", dateVal);
					System.out.println("날짜배열값" + Arrays.toString(dateVal));
					System.out.println("날짜배열값" + dateVal);
				}
				mav.addObject("resultMap", resultMap);
				System.out.println("resultMap data : " + resultMap);
			}

			List<Map<String, Object>> customerList = customerService.getList();
			List<Map> colList = infoService.getColumnName();
			Map colMap = new HashMap();
			for(int i=0; i < colList.size(); i++) {
				colMap.put(colList.get(i).get("COLUMN_NAME"), colList.get(i).get("COLUMN_NAME"));
			}

			if(startDate != null) {
				mav.addObject("startDate", startDate);
			}

			if(endDate != null) {
				mav.addObject("endDate", endDate);
			}

			mav.addObject("analysisList", analysisList);
			mav.addObject("colList", colList);
			mav.addObject("customerList", customerList);
			mav.addObject("colMap", colMap);
			mav.addObject("colspan", colspan);
			mav.addObject("companyIdx", companyIdx);
			mav.addObject("specIdx", specIdx);
			mav.addObject("sampleIdx", sampleIdx);
			mav.addObject("searchCol", searchCol);
			mav.addObject("companyName", companyName);
			mav.addObject("specName", specName);
			mav.addObject("sampleName", sampleName);
			mav.addObject("smplPoint", smplPoint);
			mav.addObject("manager", manager);
			mav.addObject("examChk", examChk);
			mav.setViewName("/info/infoAnalysis2");
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
		}

		return mav;
	}

	@RequestMapping("/ajax/infoAnalysisExcel2.info")
	public void infoAnalysisExcel2(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		String reportLocation = context.getRealPath("WEB-INF");
		System.out.println("report location : " + reportLocation);
		String path = req.getSession().getServletContext().getRealPath("/");
		String excelName = "WearCheck_Exam_Result";

		if(userId != null && userId != "") {
			commonUtil = new CommonUtil();
			int companyIdx = 0;
			String tmpCompanyIdx = req.getParameter("companyIdx");
			Map<String, Object> examMap = new HashMap<String, Object>();

			if(tmpCompanyIdx != "" && tmpCompanyIdx != null) {
				companyIdx = Integer.parseInt(tmpCompanyIdx);
				Map<String, Object> customerMap = customerService.getCustomerInfo(companyIdx);
				if(customerMap != null) {
					String manager = (String) customerMap.get("MANAGER");
					String companyName = (String) customerMap.get("COMPANYNAME");
				}

				examMap = examService.getExamResult(companyIdx);
				if(examMap != null && examMap.size() > 0) {
					commonUtil.excelDownload(examMap, "", excelName, res, req, reportLocation, path, "exam");
				} else {

				}
			}
		} else {
			System.out.println("로그인이 필요한 서비스입니다.");
		}
	}

	@RequestMapping("/ajax/infoAnalysisExcel.info")
	public void infoAnalysisExcel(HttpServletRequest req, HttpServletResponse res)  throws Exception {

		userId = loginBean.getUserId();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		String reportLocation = context.getRealPath("WEB-INF");
		System.out.println("report location : " + reportLocation);
		String path = req.getSession().getServletContext().getRealPath("/");

		if(userId != null && userId != "") {

			commonUtil = new CommonUtil();
			int companyIdx = 0;
			int specIdx = 0;
			int sampleIdx = 0;
			int colspan = 2;
			String searchCol = "";
			String tmpCompanyIdx = req.getParameter("companyIdx1");
			String tmpSpecIdx = req.getParameter("specIdx1");
			String tmpSampleIdx = req.getParameter("sampleIdx1");
			String startDate = req.getParameter("startDate1");
			String endDate = req.getParameter("endDate1");
			String searchKey = req.getParameter("searchKey1");
			String companyName = req.getParameter("companyName1");
			String specName = req.getParameter("specName1");
			String sampleName = req.getParameter("sampleName1");
			String manager = req.getParameter("manager1");
			String smplPoint = req.getParameter("smplPoint1");
			String smplDate = "";
			String excelName = "WearCheck_Report";
			String excelgu = "excel2";
			String standardCol = "";
			String standard = req.getParameter("standard1");
//			String standard2 = req.getParameter("pgear");
//			String standard3 = req.getParameter("pengine");
//			String standard4 = req.getParameter("pturbine");
//			String standard5 = req.getParameter("pbearing");
//			String standard6 = req.getParameter("pairpress");
//			String standard7 = req.getParameter("pehc");
			//String cvalue = req.getParameter("cvalue");
			String viscoval = req.getParameter("viscoval1");
			String acidval = req.getParameter("acidval1");

			String oilcon = "";
			String contamicon = "";
			String wearcon = "";

			String queryString = req.getQueryString();
			System.out.println("Query String : " + queryString);

			oilcon = req.getParameter("oilcon1");
			contamicon = req.getParameter("contamicon1");
			wearcon = req.getParameter("wearcon1");

			System.out.println("신호등표시 oil condition : " + oilcon);
			System.out.println("신호등표시 contamination : " + contamicon);
			System.out.println("신호등표시 wear : " + wearcon);

			if(oilcon != null && !oilcon.equals("") && !oilcon.equals("undefined")) {
				if(!oilcon.equals("2") && !oilcon.equals("3")) {
					oilcon = GREEN;
				} else if(!oilcon.equals("1") && !oilcon.equals("3")) {
					oilcon = ORANGE;
				} else if(!oilcon.equals("1") && !oilcon.equals("2")) {
					oilcon = RED;
				}
			} else {
				oilcon = GRAY;
			}

			if(contamicon != null && !contamicon.equals("") && !contamicon.equals("undefined")) {
				if(!contamicon.equals("2") && !contamicon.equals("3")) {
					contamicon = GREEN;
				} else if(!contamicon.equals("1") && !contamicon.equals("3")) {
					contamicon = ORANGE;
				} else if(!contamicon.equals("1") && !contamicon.equals("2")) {
					contamicon = RED;
				}
			} else {
				contamicon = GRAY;
			}

			if(wearcon != null && !wearcon.equals("") && !wearcon.equals("undefined")) {
				if(!wearcon.equals("2") && !wearcon.equals("3")) {
					wearcon = GREEN;
				} else if(!wearcon.equals("1") && !wearcon.equals("3")) {
					wearcon = ORANGE;
				} else if(!wearcon.equals("1") && !wearcon.equals("2")) {
					wearcon = RED;
				}
			} else {
				wearcon = GRAY;
			}

			System.out.println("색상표시 oil condition : " + oilcon);
			System.out.println("색상표시 contamination : " + contamicon);
			System.out.println("색상표시 wear : " + wearcon);

			List<Map> analysisList = null;
			Map analysisMap = new HashMap();
			Map<String, Object> examMap = new HashMap<String, Object>();
			Map resultMap = new HashMap<String, Object>();

			if(searchKey != null && !searchKey.equals("")) {

				analysisMap.put("searchKey", searchKey);
				if(tmpCompanyIdx != "" && tmpCompanyIdx != null) {
					companyIdx = Integer.parseInt(tmpCompanyIdx);
					Map<String, Object> customerMap = customerService.getCustomerInfo(companyIdx);
					if(customerMap != null) {
						manager = (String) customerMap.get("MANAGER");
						companyName = (String) customerMap.get("COMPANYNAME");
					}

					examMap = examService.getExamResult(companyIdx);

					//commonUtil.excelDownload(examMap, "", excelName, res, req, reportLocation, path, "exam");
				}
				analysisMap.put("companyIdx", companyIdx);

				if(tmpSpecIdx != "" && tmpSpecIdx != null) {
					specIdx = Integer.parseInt(tmpSpecIdx);
				}
				analysisMap.put("specIdx", specIdx);

				if(tmpSampleIdx != "" && tmpSampleIdx != null) {
					sampleIdx = Integer.parseInt(tmpSampleIdx);
					smplDate = infoService.getSmplDate(sampleIdx);
				}

				searchCol = req.getParameter("searchCol1");
				String[] searchColVal = searchCol.split(",");
				int searchColSize = 0;
				searchColSize = searchColVal.length;
				System.out.println("searchCol : " + searchCol);
				System.out.println("searchColSize : " + searchColSize);
				if(searchColSize >= 2) {
					colspan = searchColSize;
				}

				String startDate1 = "";
				String endDate1 = "";

				if(startDate != null && startDate != "") {
					startDate1 = startDate.replace("-", "") + "000000";
				}

				if(endDate != null && endDate != "") {
					endDate1 = endDate.replace("-", "") + "235959";
				}

				analysisMap.put("sampleIdx", sampleIdx);
				analysisMap.put("startDate", startDate1);
				analysisMap.put("endDate", endDate1);
				analysisMap.put("colName", searchCol);

				analysisList = infoService.getAnalysisList(analysisMap);


				List oilList = new ArrayList();
				List conList = new ArrayList();
				List wearList = new ArrayList();

				List pcountList1 = new ArrayList();
				List pcountList2 = new ArrayList();
				List pcountList3 = new ArrayList();
				List pcountList4 = new ArrayList();
				List pcountList5 = new ArrayList();
				List pcountList6 = new ArrayList();
				List cuttingList1 = new ArrayList();
				List cuttingList2 = new ArrayList();
				List cuttingList3 = new ArrayList();
				List cuttingList4 = new ArrayList();
				List fatigueList1 = new ArrayList();
				List fatigueList2 = new ArrayList();
				List fatigueList3 = new ArrayList();
				List fatigueList4 = new ArrayList();
				List severeList1 = new ArrayList();
				List severeList2 = new ArrayList();
				List severeList3 = new ArrayList();
				List severeList4 = new ArrayList();
				List nonmetalicList1 = new ArrayList();
				List nonmetalicList2 = new ArrayList();
				List nonmetalicList3 = new ArrayList();
				List nonmetalicList4 = new ArrayList();
				List numparticleList1 = new ArrayList();
				List numparticleList2 = new ArrayList();
				List numparticleList3 = new ArrayList();
				List numparticleList4 = new ArrayList();
				List numparticleList5 = new ArrayList();
				List water = new ArrayList();
				List chlorine = new ArrayList();
				List mpc1 = new ArrayList();
				List mpc2 = new ArrayList();
				List mpc3 = new ArrayList();
				List patch = new ArrayList();
				List silicon = new ArrayList();
				List boron = new ArrayList();
				List sodium = new ArrayList();
				List abs1 = new ArrayList();
				List abs2 = new ArrayList();
				List abs3 = new ArrayList();
				List abs4 = new ArrayList();
				List abs5 = new ArrayList();
				List abs6 = new ArrayList();
				List abs7 = new ArrayList();
				List abs8 = new ArrayList();

				List viscosityList1 = new ArrayList();
				List viscosityList2 = new ArrayList();
				List viscosityList3 = new ArrayList();
				List acid = new ArrayList();
				List specific = new ArrayList();
				List ruler1 = new ArrayList();
				List ruler2 = new ArrayList();
				List ruler3 = new ArrayList();
				List rulernumber = new ArrayList();
				List foaming1 = new ArrayList();
				List foaming2 = new ArrayList();
				List foaming3 = new ArrayList();
				List water2 = new ArrayList();
				List pour = new ArrayList();
				List flash1 = new ArrayList();
				List flash2 = new ArrayList();
				List mg = new ArrayList();
				List ca = new ArrayList();
				List ba = new ArrayList();
				List ph = new ArrayList();
				List zn = new ArrayList();
				List additive1 = new ArrayList();
				List additive2 = new ArrayList();
				List additive3 = new ArrayList();
				List additive4 = new ArrayList();

				List fe = new ArrayList();
				List cr = new ArrayList();
				List pb = new ArrayList();
				List cu = new ArrayList();
				List sn = new ArrayList();
				List al = new ArrayList();
				List ni = new ArrayList();
				List ag = new ArrayList();
				List mo = new ArrayList();
				List ti = new ArrayList();
				List vana = new ArrayList();
				List pqList = new ArrayList();

				// 신규 추가리스트 2015-04-08
				List additionallist = new ArrayList();
				List additional1 = new ArrayList();
				List additional2 = new ArrayList();
				List additional3 = new ArrayList();

				List basenumber = new ArrayList();
				List potassium = new ArrayList();
				List manganese = new ArrayList();
				List droppoint = new ArrayList();
				List penetration = new ArrayList();
				List oilseparation = new ArrayList();
				List newabs1 = new ArrayList();
				List newabs2 = new ArrayList();
				List newabs3 = new ArrayList();
				List newabs4 = new ArrayList();
				List newabs5 = new ArrayList();
				List newabs6 = new ArrayList();
				List newabs7 = new ArrayList();
				List newabs8 = new ArrayList();
				List newabs9 = new ArrayList();
				List newabs10 = new ArrayList();
				List newabs11 = new ArrayList();
				List newabs12 = new ArrayList();
				List newabs13 = new ArrayList();
				List newabs14 = new ArrayList();
				List coabs1 = new ArrayList();
				List coabs2 = new ArrayList();
				List coabs3 = new ArrayList();
				List coabs4 = new ArrayList();
				List coabs5 = new ArrayList();
				List coabs6 = new ArrayList();
				List coabs7 = new ArrayList();
				List coabs8 = new ArrayList();
				List coabs9 = new ArrayList();
				List coabs10 = new ArrayList();
				List coabs11 = new ArrayList();
				List coabs12 = new ArrayList();
				List coabs13 = new ArrayList();
				List coabs14 = new ArrayList();
				List coabs15 = new ArrayList();

				List addfield = new ArrayList();
				List addfieldcon = new ArrayList();

				// 신규기준치에 따른 적용처리
				String pvisco1 = "";
				String pvisco2 = "";
				String pvisco3 = "";
				String pvisco4 = "";
				String pacid1 = "";
				String pacid2 = "";
				String pbase1 = "";
				String pbase2 = "";
				String pruler11 = "";
				String pruler12 = "";
				String pruler21 = "";
				String pruler22 = "";
				String pwaterseparability = "";
				String pfoaming1 = "";
				String pfoaming2 = "";
				String pparticle1 = "";
				String pparticle2 = "";
				String pwatercon1 = "";
				String pwatercon2 = "";
				String ppq = "";
				String pflash = "";
				String pchlorine = "";
				String pmpc1 = "";
				String pmpc2 = "";
				String pphosphate1 = "";
				String pphosphate2 = "";

				if(standard != null && standard != "") {

					// 동점도는 모든 기준치에 공통으로 적용 - 필요시 계산하여 적용
					if(viscoval != null && viscoval != "" && !viscoval.equals("")) {
						pvisco1 = String.valueOf(Integer.parseInt(viscoval) * viscoval1);
						pvisco2 = String.valueOf(Integer.parseInt(viscoval) * viscoval2);
						pvisco3 = String.valueOf(Integer.parseInt(viscoval) * viscoval3);
						pvisco4 = String.valueOf(Integer.parseInt(viscoval) * viscoval4);
					} else {
						pvisco1 = viscoauto1;
						pvisco2 = viscoauto2;
						pvisco3 = "";
						pvisco4 = "";
					}

					if(standard.equals("phydraulic") || ("phydraulic").equals(standard)) {
						// 유압유 - 동점도, 산가, 사용유1, 기포성, 입자오염도, 수분, 철분마모분석, 바니쉬1 적용
						if(acidval != null && acidval != "" && !acidval.equals("")) {
							pacid1 = String.valueOf(Integer.parseInt(acidval + acidval1));
							pacid2 = String.valueOf(Integer.parseInt(acidval + acidval2));
						} else {
							pacid1 = acidauto1;
							pacid2 = acidauto2;
						}
						pruler11 = ruler1auto1;
						pruler12 = ruler1auto2;
						pfoaming1 = foamingval1;
						pfoaming2 = foamingval2;
						pparticle1 = particleval1;
						pparticle2 = particleval2;
						pwatercon1 = waterconval2;
						pwatercon2 = waterconval6;
						pmpc1 = membraineval1;
						pmpc2 = membraineval2;
 					} else if(standard.equals("pgear") || ("pgear").equals(standard)) {
						// 기어유
						pacid1 = "Inflection point+0.2";
						pacid2 = acidauto2;
						pfoaming1 = foamingval1;
						pfoaming2 = foamingval2;
						pparticle1 = particleval3;
						pparticle2 = particleval4;
						pwatercon1 = waterconval5;
						pwatercon2 = waterconval8;
						ppq = pqval3;
					} else if(standard.equals("pengine") || ("pengine").equals(standard)) {
						// 엔진유
						pbase1 = baseauto1;
						pbase2 = baseauto2;
						pfoaming1 = foamingval1;
						pfoaming2 = foamingval2;
						pparticle1 = particleval5;
						pparticle2 = particleval6;
						pwatercon1 = waterconval3;
						pwatercon2 = waterconval7;
						ppq = pqval1;
						pflash = flashval2;
					} else if(standard.equals("pturbine") || ("pturbine").equals(standard)) {
						// 터빈유
						if(acidval != null && acidval != "" && !acidval.equals("")) {
							pacid1 = String.valueOf(Integer.parseInt(acidval + acidval3));
							pacid2 = String.valueOf(Integer.parseInt(acidval + acidval4));
						} else {
							pacid1 = acidauto3;
							pacid2 = acidauto4;
						}
						pruler11 = ruler1auto1;
						pruler12 = ruler1auto2;
						pwaterseparability = waterval;
						pfoaming1 = foamingval1;
						pfoaming2 = foamingval2;
						pparticle1 = particleval5;
						pparticle2 = particleval6;
						pwatercon1 = waterconval1;
						pwatercon2 = waterconval5;
						pmpc1 = membraineval1;
						pmpc2 = membraineval2;
					} else if(standard.equals("pbearing") || ("pbearing").equals(standard)) {
						// 베어링유
						if(acidval != null && acidval != "" && !acidval.equals("")) {
							pacid1 = String.valueOf(Integer.parseInt(acidval + acidval1));
							pacid2 = String.valueOf(Integer.parseInt(acidval + acidval2));
						} else {
							pacid1 = acidauto1;
							pacid2 = acidauto2;
						}
						pruler11 = ruler1auto1;
						pruler12 = ruler1auto2;
						pparticle1 = particleval5;
						pparticle2 = particleval6;
						pmpc1 = membraineval1;
						pmpc2 = membraineval2;
					} else if(standard.equals("pairpress") || ("pairpress").equals(standard)) {
						// 공기압축기유
						pwaterseparability = waterval;
						pwatercon1 = waterconval2;
						pwatercon2 = waterconval6;
						pflash = flashval1;
					} else {
						// ehc유
						pruler21 = ruler2auto1;
						pruler22 = ruler2auto2;
						pwaterseparability = waterval;
						pfoaming1 = foamingval1;
						pfoaming2 = foamingval2;
						pparticle1 = particleval5;
						pparticle2 = particleval6;
						pwatercon1 = waterconval4;
						pwatercon2 = waterconval6;
						pflash = flashval1;
						pchlorine = chlorineval;
						pphosphate1 = phosphateval1;
						pphosphate2 = phosphateval2;
					}
				}

				resultMap.put("pvisco1",pvisco1);
				resultMap.put("pvisco2",pvisco2);
				resultMap.put("pvisco3",pvisco3);
				resultMap.put("pvisco4",pvisco4);
				resultMap.put("pacid1",pacid1);
				resultMap.put("pacid2",pacid2);
				resultMap.put("pbase1",pbase1);
				resultMap.put("pbase2",pbase2);
				resultMap.put("pruler11",pruler11);
				resultMap.put("pruler12",pruler12);
				resultMap.put("pruler21",pruler21);
				resultMap.put("pruler22",pruler22);
				resultMap.put("pwaterseparability",pwaterseparability);
				resultMap.put("pfoaming1",pfoaming1);
				resultMap.put("pfoaming2",pfoaming2);
				resultMap.put("pparticle1",pparticle1);
				resultMap.put("pparticle2",pparticle2);
				resultMap.put("pwatercon1",pwatercon1);
				resultMap.put("pwatercon2",pwatercon2);
				resultMap.put("ppq",ppq);
				resultMap.put("pflash",pflash);
				resultMap.put("pchlorine",pchlorine);
				resultMap.put("pmpc1",pmpc1);
				resultMap.put("pmpc2",pmpc2);
				resultMap.put("pphosphate1",pphosphate1);
				resultMap.put("pphosphate2",pphosphate2);

				if(analysisList != null) {
					for(int j=0; j < searchColVal.length; j++) {
						String[] colVal = null;
						List<String> colValList = new ArrayList<String>();

						for(int i =0; i < analysisList.size(); i++) {
							colValList.add((String)analysisList.get(i).get(searchColVal[j]));
						}
						colVal = colValList.toArray(new String[colValList.size()]);
						if(searchColVal[j].equals("viscosity40") || searchColVal[j].equals("viscosity100") || searchColVal[j].equals("viscosityindex") || searchColVal[j].equals("acidnumber") || searchColVal[j].equals("rul1peak") || searchColVal[j].equals("rul2peak") || searchColVal[j].equals("rulareatotal") || searchColVal[j].equals("rulernumber") || searchColVal[j].equals("tendency") || searchColVal[j].equals("stability") || searchColVal[j].equals("nil") || searchColVal[j].equals("waterseparability") || searchColVal[j].equals("mgrde") || searchColVal[j].equals("mgrfs") || searchColVal[j].equals("carde") || searchColVal[j].equals("carfs") || searchColVal[j].equals("barde") || searchColVal[j].equals("barfs") || searchColVal[j].equals("prde") || searchColVal[j].equals("prfs") || searchColVal[j].equals("znrde") || searchColVal[j].equals("znrfs") || searchColVal[j].equals("antiwater") || searchColVal[j].equals("phenol") || searchColVal[j].equals("rust") || searchColVal[j].equals("dispersant") || searchColVal[j].equals("basenumber")) {
							oilList.add(colVal);
						} else if(searchColVal[j].equals("ferde") || searchColVal[j].equals("ferfs") || searchColVal[j].equals("crrde") || searchColVal[j].equals("crrfs") || searchColVal[j].equals("pbrde") || searchColVal[j].equals("pbrfs") || searchColVal[j].equals("curde") || searchColVal[j].equals("curfs") || searchColVal[j].equals("snrde") || searchColVal[j].equals("snrfs") || searchColVal[j].equals("alrde") || searchColVal[j].equals("alrfs") || searchColVal[j].equals("nirde") || searchColVal[j].equals("nirfs") || searchColVal[j].equals("agrde") || searchColVal[j].equals("agrfs") || searchColVal[j].equals("morde") || searchColVal[j].equals("morfs") || searchColVal[j].equals("tirde") || searchColVal[j].equals("tirfs") || searchColVal[j].equals("vrde") || searchColVal[j].equals("vrfs") || searchColVal[j].equals("pqindex") || searchColVal[j].equals("potassium")) {
							wearList.add(colVal);
						} else if(searchColVal[j].equals("abs1") || searchColVal[j].equals("abs2") || searchColVal[j].equals("abs3") || searchColVal[j].equals("abs4") || searchColVal[j].equals("abs5") || searchColVal[j].equals("abs6") || searchColVal[j].equals("abs7") || searchColVal[j].equals("abs8") || searchColVal[j].equals("abs9") || searchColVal[j].equals("abs10") || searchColVal[j].equals("abs11") || searchColVal[j].equals("abs12") || searchColVal[j].equals("abs13") || searchColVal[j].equals("abs14") || searchColVal[j].equals("coabs1") || searchColVal[j].equals("coabs2") || searchColVal[j].equals("coabs3") || searchColVal[j].equals("coabs4") || searchColVal[j].equals("coabs5") || searchColVal[j].equals("coabs6") || searchColVal[j].equals("coabs7") || searchColVal[j].equals("coabs8") || searchColVal[j].equals("coabs9") || searchColVal[j].equals("coabs10") || searchColVal[j].equals("coabs11") || searchColVal[j].equals("coabs12") || searchColVal[j].equals("coabs13") || searchColVal[j].equals("coabs14") || searchColVal[j].equals("coabs15")) {
							additional2.add(colVal);
						} else {
							conList.add(colVal);
						}

						if(searchColVal[j].equals("abs1") || searchColVal[j].equals("abs2") || searchColVal[j].equals("abs3") || searchColVal[j].equals("abs4") || searchColVal[j].equals("abs5") || searchColVal[j].equals("abs6") || searchColVal[j].equals("abs7") || searchColVal[j].equals("abs8") || searchColVal[j].equals("abs9") || searchColVal[j].equals("abs10") || searchColVal[j].equals("abs11") || searchColVal[j].equals("abs12") || searchColVal[j].equals("abs13") || searchColVal[j].equals("abs14") || searchColVal[j].equals("coabs1") || searchColVal[j].equals("coabs2") || searchColVal[j].equals("coabs3") || searchColVal[j].equals("coabs4") || searchColVal[j].equals("coabs5") || searchColVal[j].equals("coabs6") || searchColVal[j].equals("coabs7") || searchColVal[j].equals("coabs8") || searchColVal[j].equals("coabs9") || searchColVal[j].equals("coabs10") || searchColVal[j].equals("coabs11") || searchColVal[j].equals("coabs12") || searchColVal[j].equals("coabs13") || searchColVal[j].equals("coabs14") || searchColVal[j].equals("coabs15") || searchColVal[j].equals("specificgravity") || searchColVal[j].equals("pourpoint") || searchColVal[j].equals("flashpoint") || searchColVal[j].equals("abs1") || searchColVal[j].equals("chlorine") || searchColVal[j].equals("droppoint") || searchColVal[j].equals("penetration") || searchColVal[j].equals("oilseparation")) {
							additionallist.add(colVal);
						}

						if(searchColVal[j].equals("abs1")) {
							newabs1.add(colVal);
						}
						if(searchColVal[j].equals("abs2")) {
							newabs2.add(colVal);
						}
						if(searchColVal[j].equals("abs3")) {
							newabs3.add(colVal);
						}
						if(searchColVal[j].equals("abs4")) {
							newabs4.add(colVal);
						}
						if(searchColVal[j].equals("abs5")) {
							newabs5.add(colVal);
						}
						if(searchColVal[j].equals("abs6")) {
							newabs6.add(colVal);
						}
						if(searchColVal[j].equals("abs7")) {
							newabs7.add(colVal);
						}
						if(searchColVal[j].equals("abs8")) {
							newabs8.add(colVal);
						}
						if(searchColVal[j].equals("abs9")) {
							newabs9.add(colVal);
						}
						if(searchColVal[j].equals("abs10")) {
							newabs10.add(colVal);
						}
						if(searchColVal[j].equals("abs11")) {
							newabs11.add(colVal);
						}
						if(searchColVal[j].equals("abs12")) {
							newabs12.add(colVal);
						}
						if(searchColVal[j].equals("abs13")) {
							newabs13.add(colVal);
						}
						if(searchColVal[j].equals("abs14")) {
							newabs14.add(colVal);
						}

						if(searchColVal[j].equals("coabs1")) {
							coabs1.add(colVal);
						}
						if(searchColVal[j].equals("coabs2")) {
							coabs2.add(colVal);
						}
						if(searchColVal[j].equals("coabs3")) {
							coabs3.add(colVal);
						}
						if(searchColVal[j].equals("coabs4")) {
							coabs4.add(colVal);
						}
						if(searchColVal[j].equals("coabs5")) {
							coabs5.add(colVal);
						}
						if(searchColVal[j].equals("coabs6")) {
							coabs6.add(colVal);
						}
						if(searchColVal[j].equals("coabs7")) {
							coabs7.add(colVal);
						}
						if(searchColVal[j].equals("coabs8")) {
							coabs8.add(colVal);
						}
						if(searchColVal[j].equals("coabs9")) {
							coabs9.add(colVal);
						}
						if(searchColVal[j].equals("coabs10")) {
							coabs10.add(colVal);
						}
						if(searchColVal[j].equals("coabs11")) {
							coabs11.add(colVal);
						}
						if(searchColVal[j].equals("coabs12")) {
							coabs12.add(colVal);
						}
						if(searchColVal[j].equals("coabs13")) {
							coabs13.add(colVal);
						}
						if(searchColVal[j].equals("coabs14")) {
							coabs14.add(colVal);
						}
						if(searchColVal[j].equals("coabs15")) {
							coabs15.add(colVal);
						}

						if(searchColVal[j].equals("basenumber")) {
							basenumber.add(colVal);
						}

						if(searchColVal[j].equals("potassium")) {
							potassium.add(colVal);
						}

						if(searchColVal[j].equals("manganese")) {
							manganese.add(colVal);
						}

						if(searchColVal[j].equals("droppoint")) {
							droppoint.add(colVal);
						}

						if(searchColVal[j].equals("penetration")) {
							penetration.add(colVal);
						}

						if(searchColVal[j].equals("oilseparation")) {
							oilseparation.add(colVal);
						}

						if(searchColVal[j].equals("addfield")) {
							addfield.add(colVal);
						}

						if(searchColVal[j].equals("addfieldcon")) {
							addfieldcon.add(colVal);
						}

						//addfieldBean.setAddfield(addfield);
						//addfieldBean.setAddfieldcon(addfieldcon);

						if(searchColVal[j].equals("p4um") || searchColVal[j].equals("p6um") || searchColVal[j].equals("p14um") || searchColVal[j].equals("p21um") || searchColVal[j].equals("p38um") || searchColVal[j].equals("p70um")) {
							//pcountList.add(colVal);
							if(searchColVal[j].equals("p4um")) {
								pcountList1.add(colVal);
							} else if(searchColVal[j].equals("p6um")) {
								pcountList2.add(colVal);
							} else if(searchColVal[j].equals("p14um")) {
								pcountList3.add(colVal);
							} else if(searchColVal[j].equals("p21um")) {
								pcountList4.add(colVal);
							} else if(searchColVal[j].equals("p38um")) {
								pcountList5.add(colVal);
							} else {
								pcountList6.add(colVal);
							}
						} else if(searchColVal[j].equals("ccount") || searchColVal[j].equals("caverage") || searchColVal[j].equals("cstd") || searchColVal[j].equals("cmaxsize")) {
							//cuttingList.add(colVal);
							if(searchColVal[j].equals("ccount")) {
								cuttingList1.add(colVal);
							} else if(searchColVal[j].equals("caverage")) {
								cuttingList2.add(colVal);
							} else if(searchColVal[j].equals("cstd")) {
								cuttingList3.add(colVal);
							} else {
								cuttingList4.add(colVal);
							}
						} else if(searchColVal[j].equals("scount") || searchColVal[j].equals("saverage") || searchColVal[j].equals("sstd") || searchColVal[j].equals("smaxsize")) {
							//severeList.add(colVal);
							if(searchColVal[j].equals("scount")) {
								severeList1.add(colVal);
							} else if(searchColVal[j].equals("saverage")) {
								severeList2.add(colVal);
							} else if(searchColVal[j].equals("sstd")) {
								severeList3.add(colVal);
							} else {
								severeList4.add(colVal);
							}
						} else if(searchColVal[j].equals("fcount") || searchColVal[j].equals("faverage") || searchColVal[j].equals("fstd") || searchColVal[j].equals("fmaxsize")) {
							//fatigueList.add(colVal);
							if(searchColVal[j].equals("fcount")) {
								fatigueList1.add(colVal);
							} else if(searchColVal[j].equals("faverage")) {
								fatigueList2.add(colVal);
							} else if(searchColVal[j].equals("fstd")) {
								fatigueList3.add(colVal);
							} else {
								fatigueList4.add(colVal);
							}
						} else if(searchColVal[j].equals("ncount") || searchColVal[j].equals("naverage") || searchColVal[j].equals("nstd") || searchColVal[j].equals("nmaxsize")) {
							//nonmetalicList.add(colVal);
							if(searchColVal[j].equals("ncount")) {
								nonmetalicList1.add(colVal);
							} else if(searchColVal[j].equals("naverage")) {
								nonmetalicList2.add(colVal);
							} else if(searchColVal[j].equals("nstd")) {
								nonmetalicList3.add(colVal);
							} else {
								nonmetalicList4.add(colVal);
							}
						} else if(searchColVal[j].equals("five") || searchColVal[j].equals("fifteen") || searchColVal[j].equals("twentyfive") || searchColVal[j].equals("fifty") || searchColVal[j].equals("hundred")) {
							//numparticleList.add(colVal);
							if(searchColVal[j].equals("five")) {
								numparticleList1.add(colVal);
							} else if(searchColVal[j].equals("fifteen")) {
								numparticleList2.add(colVal);
							} else if(searchColVal[j].equals("twentyfive")) {
								numparticleList3.add(colVal);
							} else if(searchColVal[j].equals("fifty")) {
								numparticleList4.add(colVal);
							} else {
								numparticleList5.add(colVal);
							}
						} else if(searchColVal[j].equals("water")) {
							water.add(colVal);
						} else if(searchColVal[j].equals("chlorine")) {
							chlorine.add(colVal);
						} else if(searchColVal[j].equals("impcval") || searchColVal[j].equals("mpcval") || searchColVal[j].equals("eval")) {
							//mpc.add(colVal);
							if(searchColVal[j].equals("impcval")) {
								mpc1.add(colVal);
							} else if(searchColVal[j].equals("mpcval")) {
								mpc2.add(colVal);
							} else {
								mpc3.add(colVal);
							}
						} else if(searchColVal[j].equals("mpcweight")) {
							patch.add(colVal);
						} else if(searchColVal[j].equals("siliconrde")) {
							silicon.add(colVal);
						} else if(searchColVal[j].equals("boronrde")) {
							boron.add(colVal);
						} else if(searchColVal[j].equals("sodiumrde")) {
							sodium.add(colVal);
						} else if(searchColVal[j].equals("oxidation") || searchColVal[j].equals("detergent") || searchColVal[j].equals("diesel") || searchColVal[j].equals("ethylene") || searchColVal[j].equals("nitration") || searchColVal[j].equals("sootloading") || searchColVal[j].equals("sulfate") || searchColVal[j].equals("waterastm")) {
							//abs.add(colVal);
							if(searchColVal[j].equals("oxidation")) {
								abs1.add(colVal);
							} else if(searchColVal[j].equals("detergent")) {
								abs2.add(colVal);
							} else if(searchColVal[j].equals("diesel")) {
								abs3.add(colVal);
							} else if(searchColVal[j].equals("ethylene")) {
								abs4.add(colVal);
							} else if(searchColVal[j].equals("nitration")) {
								abs5.add(colVal);
							} else if(searchColVal[j].equals("sootloading")) {
								abs6.add(colVal);
							} else if(searchColVal[j].equals("sulfate")) {
								abs7.add(colVal);
							} else {
								abs8.add(colVal);
							}
						} else if(searchColVal[j].equals("viscosity40") || searchColVal[j].equals("viscosity100") || searchColVal[j].equals("viscosityindex")) {
							//viscosity.add(colVal);
							if(searchColVal[j].equals("viscosity40")) {
								viscosityList1.add(colVal);
							} else if(searchColVal[j].equals("viscosity100")) {
								viscosityList2.add(colVal);
							} else {
								viscosityList3.add(colVal);
							}
						} else if(searchColVal[j].equals("acidnumber")) {
							acid.add(colVal);
						} else if(searchColVal[j].equals("specificgravity")) {
							specific.add(colVal);
						} else if(searchColVal[j].equals("rul1peak") || searchColVal[j].equals("rul2peak") || searchColVal[j].equals("rulareatotal")) {
							//ruler.add(colVal);
							if(searchColVal[j].equals("rul1peak")) {
								ruler1.add(colVal);
							} else if(searchColVal[j].equals("rul2peak")) {
								ruler2.add(colVal);
							} else {
								ruler3.add(colVal);
							}
						} else if(searchColVal[j].equals("rulernumber")) {
							rulernumber.add(colVal);
						} else if(searchColVal[j].equals("tendency") || searchColVal[j].equals("stability") || searchColVal[j].equals("nil")) {
							//foaming.add(colVal);
							if(searchColVal[j].equals("tendency")) {
								foaming1.add(colVal);
							} else if(searchColVal[j].equals("stability")) {
								foaming2.add(colVal);
							} else {
								foaming3.add(colVal);
							}
						} else if(searchColVal[j].equals("waterseparability")) {
							water2.add(colVal);
						} else if(searchColVal[j].equals("pourpoint")) {
							pour.add(colVal);
						} else if(searchColVal[j].equals("flashpoint")) {
							flash1.add(colVal);
						} else if(searchColVal[j].equals("flashpoint2")) {
							flash2.add(colVal);
						} else if(searchColVal[j].equals("mgrde")) {
							mg.add(colVal);
						} else if(searchColVal[j].equals("carde")) {
							ca.add(colVal);
						} else if(searchColVal[j].equals("barde")) {
							ba.add(colVal);
						} else if(searchColVal[j].equals("prde")) {
							ph.add(colVal);
						} else if(searchColVal[j].equals("znrde")) {
							zn.add(colVal);
						} else if(searchColVal[j].equals("antiwater") || searchColVal[j].equals("phenol") || searchColVal[j].equals("rust") || searchColVal[j].equals("dispersant")) {
							//additive.add(colVal);
							if(searchColVal[j].equals("antiwater")) {
								additive1.add(colVal);
							} else if(searchColVal[j].equals("phenol")) {
								additive2.add(colVal);
							} else if(searchColVal[j].equals("rust")) {
								additive3.add(colVal);
							} else {
								additive4.add(colVal);
							}
						} else if(searchColVal[j].equals("ferde")) {
							fe.add(colVal);
						} else if(searchColVal[j].equals("crrde")) {
							cr.add(colVal);
						} else if(searchColVal[j].equals("pbrde")) {
							pb.add(colVal);
						} else if(searchColVal[j].equals("curde")) {
							cu.add(colVal);
						} else if(searchColVal[j].equals("snrde")) {
							sn.add(colVal);
						} else if(searchColVal[j].equals("alrde")) {
							al.add(colVal);
						} else if(searchColVal[j].equals("nirde")) {
							ni.add(colVal);
						} else if(searchColVal[j].equals("agrde")) {
							ag.add(colVal);
						} else if(searchColVal[j].equals("morde")) {
							mo.add(colVal);
						} else if(searchColVal[j].equals("tirde")) {
							ti.add(colVal);
						} else if(searchColVal[j].equals("vrde")) {
							vana.add(colVal);
						} else if(searchColVal[j].equals("pqindex")) {
							pqList.add(colVal);
						}
						System.out.println("배열명 : " + searchColVal[j] + " - 배열값 : " + Arrays.toString(colVal));
						resultMap.put(searchColVal[j], colVal);
					}
					resultMap.put("oilList", oilList);
					resultMap.put("conList", conList);
					resultMap.put("wearList", wearList);

//					String[] siliconArr = null;
//					String[] boronArr = null;
//					String[] sodiumArr = null;
//
//					String[] mgArr = null;
//					String[] caArr = null;
//					String[] baArr = null;
//					String[] phArr = null;
//					String[] znArr = null;
//
//					String[] feArr = null;
//					String[] crArr = null;
//					String[] pbArr = null;
//					String[] cuArr = null;
//					String[] snArr = null;
//					String[] alArr = null;
//					String[] niArr = null;
//					String[] agArr = null;
//					String[] moArr = null;
//					String[] tiArr = null;
//					String[] vanaArr = null;

					// 리스트가 null이 아니거나 리스트 사이즈가 0보다 큰 경우에 리스트안의 배열을 재배치하는 method 호출
					// 단 RDE, RFS 값을 가지고 있는 리스트만 해당
//					if(silicon != null && silicon.size() > 0) {siliconArr = commonUtil.concatArr(silicon);}
//					if(boron != null && boron.size() > 0) {boronArr = commonUtil.concatArr(boron);}
//					if(sodium != null && sodium.size() > 0) {sodiumArr = commonUtil.concatArr(sodium);}
//					if(mg != null && mg.size() > 0) {mgArr = commonUtil.concatArr(mg);}
//					if(ca != null && ca.size() > 0) {caArr = commonUtil.concatArr(ca);}
//					if(ba != null && ba.size() > 0) {baArr = commonUtil.concatArr(ba);}
//					if(ph != null && ph.size() > 0) {phArr = commonUtil.concatArr(ph);}
//					if(zn != null && zn.size() > 0) {znArr = commonUtil.concatArr(zn);}
//					if(fe != null && fe.size() > 0) {feArr = commonUtil.concatArr(fe);}
//					if(cr != null && cr.size() > 0) {crArr = commonUtil.concatArr(cr);}
//					if(pb != null && pb.size() > 0) {pbArr = commonUtil.concatArr(pb);}
//					if(cu != null && cu.size() > 0) {cuArr = commonUtil.concatArr(cu);}
//					if(sn != null && sn.size() > 0) {snArr = commonUtil.concatArr(sn);}
//					if(al != null && al.size() > 0) {alArr = commonUtil.concatArr(al);}
//					if(ni != null && ni.size() > 0) {niArr = commonUtil.concatArr(ni);}
//					if(ag != null && ag.size() > 0) {agArr = commonUtil.concatArr(ag);}
//					if(mo != null && mo.size() > 0) {moArr = commonUtil.concatArr(mo);}
//					if(ti != null && ti.size() > 0) {tiArr = commonUtil.concatArr(ti);}
//					if(vana != null && vana.size() > 0) {vanaArr = commonUtil.concatArr(vana);}
//
//					resultMap.put("siliconArr", siliconArr);
//					resultMap.put("boronArr", boronArr);
//					resultMap.put("sodiumArr", sodiumArr);
//
//					resultMap.put("mgArr", mgArr);
//					resultMap.put("caArr", caArr);
//					resultMap.put("baArr", baArr);
//					resultMap.put("phArr", phArr);
//					resultMap.put("znArr", znArr);
//
//					resultMap.put("feArr", feArr);
//					resultMap.put("crArr", crArr);
//					resultMap.put("pbArr", pbArr);
//					resultMap.put("cuArr", cuArr);
//					resultMap.put("snArr", snArr);
//					resultMap.put("alArr", alArr);
//					resultMap.put("niArr", niArr);
//					resultMap.put("agArr", agArr);
//					resultMap.put("moArr", moArr);
//					resultMap.put("tiArr", tiArr);
//					resultMap.put("vanaArr", vanaArr);

					resultMap.put("pcountList1", pcountList1);
					resultMap.put("pcountList2", pcountList2);
					resultMap.put("pcountList3", pcountList3);
					resultMap.put("pcountList4", pcountList4);
					resultMap.put("pcountList5", pcountList5);
					resultMap.put("pcountList6", pcountList6);
					resultMap.put("cuttingList1", cuttingList1);
					resultMap.put("cuttingList2", cuttingList2);
					resultMap.put("cuttingList3", cuttingList3);
					resultMap.put("cuttingList4", cuttingList4);
					resultMap.put("fatigueList1", fatigueList1);
					resultMap.put("fatigueList2", fatigueList2);
					resultMap.put("fatigueList3", fatigueList3);
					resultMap.put("fatigueList4", fatigueList4);
					resultMap.put("severeList1", severeList1);
					resultMap.put("severeList2", severeList2);
					resultMap.put("severeList3", severeList3);
					resultMap.put("severeList4", severeList4);
					resultMap.put("nonmetalicList1", nonmetalicList1);
					resultMap.put("nonmetalicList2", nonmetalicList2);
					resultMap.put("nonmetalicList3", nonmetalicList3);
					resultMap.put("nonmetalicList4", nonmetalicList4);
					resultMap.put("numparticleList1", numparticleList1);
					resultMap.put("numparticleList2", numparticleList2);
					resultMap.put("numparticleList3", numparticleList3);
					resultMap.put("numparticleList4", numparticleList4);
					resultMap.put("numparticleList5", numparticleList5);
					resultMap.put("water", water);
					resultMap.put("chlorine", chlorine);
					resultMap.put("mpc1", mpc1);
					resultMap.put("mpc2", mpc2);
					resultMap.put("mpc3", mpc3);
					resultMap.put("patch", patch);
					resultMap.put("silicon", silicon);
					resultMap.put("boron", boron);
					resultMap.put("sodium", sodium);
					resultMap.put("abs1", abs1);
					resultMap.put("abs2", abs2);
					resultMap.put("abs3", abs3);
					resultMap.put("abs4", abs4);
					resultMap.put("abs5", abs5);
					resultMap.put("abs6", abs6);
					resultMap.put("abs7", abs7);
					resultMap.put("abs8", abs8);

					resultMap.put("viscosityList1", viscosityList1);
					resultMap.put("viscosityList2", viscosityList2);
					resultMap.put("viscosityList3", viscosityList3);
					resultMap.put("acid", acid);
					resultMap.put("specific", specific);
					resultMap.put("ruler1", ruler1);
					resultMap.put("ruler2", ruler2);
					resultMap.put("ruler3", ruler3);
					resultMap.put("rulernumber", rulernumber);
					resultMap.put("foaming1", foaming1);
					resultMap.put("foaming2", foaming2);
					resultMap.put("foaming3", foaming3);
					resultMap.put("water2", water2);
					resultMap.put("pour", pour);
					resultMap.put("flash1", flash1);
					resultMap.put("flash2", flash2);
					resultMap.put("mg", mg);
					resultMap.put("ca", ca);
					resultMap.put("ba", ba);
					resultMap.put("ph", ph);
					resultMap.put("zn", zn);
					resultMap.put("additive1", additive1);
					resultMap.put("additive2", additive2);
					resultMap.put("additive3", additive3);
					resultMap.put("additive4", additive4);

					resultMap.put("fe", fe);
					resultMap.put("cr", cr);
					resultMap.put("pb", pb);
					resultMap.put("cu", cu);
					resultMap.put("sn", sn);
					resultMap.put("al", al);
					resultMap.put("ni", ni);
					resultMap.put("ag", ag);
					resultMap.put("mo", mo);
					resultMap.put("ti", ti);
					resultMap.put("vana", vana);
					resultMap.put("pqList", pqList);

					resultMap.put("additionallist", additionallist);
					resultMap.put("basenumber", basenumber);
					resultMap.put("additional1", additional1);
					resultMap.put("additional2", additional2);
					resultMap.put("additional3", additional3);
					resultMap.put("potassium", potassium);
					resultMap.put("manganese", manganese);
					resultMap.put("droppoint", droppoint);
					resultMap.put("penetration", penetration);
					resultMap.put("oilseparation", oilseparation);

					resultMap.put("newabs1", newabs1);
					resultMap.put("newabs2", newabs2);
					resultMap.put("newabs3", newabs3);
					resultMap.put("newabs4", newabs4);
					resultMap.put("newabs5", newabs5);
					resultMap.put("newabs6", newabs6);
					resultMap.put("newabs7", newabs7);
					resultMap.put("newabs8", newabs8);
					resultMap.put("newabs9", newabs9);
					resultMap.put("newabs10", newabs10);
					resultMap.put("newabs11", newabs11);
					resultMap.put("newabs12", newabs12);
					resultMap.put("newabs13", newabs13);
					resultMap.put("newabs14", newabs14);
					resultMap.put("coabs1", coabs1);
					resultMap.put("coabs2", coabs2);
					resultMap.put("coabs3", coabs3);
					resultMap.put("coabs4", coabs4);
					resultMap.put("coabs5", coabs5);
					resultMap.put("coabs6", coabs6);
					resultMap.put("coabs7", coabs7);
					resultMap.put("coabs8", coabs8);
					resultMap.put("coabs9", coabs9);
					resultMap.put("coabs10", coabs10);
					resultMap.put("coabs11", coabs11);
					resultMap.put("coabs12", coabs12);
					resultMap.put("coabs13", coabs13);
					resultMap.put("coabs14", coabs14);
					resultMap.put("coabs15", coabs15);

					addfieldBean = new AddfieldBean();
					if(addfield != null && addfield.size() > 0)
					for(int i=0; i < addfield.size(); i++) {
						if(addfield.get(i) != null && addfield.size() > 0) {
							//resultMap.put("addfield", addfield.get(i));
							addfieldBean.setAddfield(addfield);
						}
					}
					//resultMap.put("addfield", addfield);
					//resultMap.put("addfieldcon", addfieldcon);
					addfieldBean.setAddfieldcon(addfieldcon);
					resultMap.put("addfieldBean", addfieldBean);

					resultMap.put("oilcon", oilcon);
					resultMap.put("contamicon", contamicon);
					resultMap.put("wearcon", wearcon);

					List<String> dateList = new ArrayList<String>();
					List<String> iso1List = new ArrayList<String>();
					List<String> iso2List = new ArrayList<String>();
					List<String> nas1List = new ArrayList<String>();
					List<String> nas2List = new ArrayList<String>();
					List<String> sae1List = new ArrayList<String>();
					List<String> sae2List = new ArrayList<String>();

					Object[] dateVal = null;
					Object[] iso1Val = null;
					Object[] iso2Val = null;
					Object[] nas1Val = null;
					Object[] nas2Val = null;
					Object[] sae1Val = null;
					Object[] sae2Val = null;
					for(int nn=0; nn < analysisList.size(); nn++) {
						dateList.add(analysisList.get(nn).get("regdate").toString().substring(0, 4) + "-" + analysisList.get(nn).get("regdate").toString().substring(4, 6) + "-" + analysisList.get(nn).get("regdate").toString().substring(6, 8));
						iso1List.add((String)analysisList.get(nn).get("iso1"));
						iso2List.add((String)analysisList.get(nn).get("iso2"));
						nas1List.add((String)analysisList.get(nn).get("nas1"));
						nas2List.add((String)analysisList.get(nn).get("nas2"));
						sae1List.add((String)analysisList.get(nn).get("sae1"));
						sae2List.add((String)analysisList.get(nn).get("sae2"));
					}
					System.out.println(analysisList.get(analysisList.size()-1).get("UWATER"));
					// 이미지값 담기. 마지막 리스트에 담겨져 return 되어 오는 이미지를 엑셀에 표현하므로 마지막 리스트의 값 가져와 담기
					resultMap.put("unonmetalicparticles", analysisList.get(analysisList.size()-1).get("UNONMETALICPARTICLES"));
					resultMap.put("upatchext", analysisList.get(analysisList.size()-1).get("UPATCHEXT"));
					resultMap.put("upatchtest", analysisList.get(analysisList.size()-1).get("UPATCHTEST"));
					resultMap.put("ufiber", analysisList.get(analysisList.size()-1).get("UFIBER"));
					resultMap.put("usevereslidingwear", analysisList.get(analysisList.size()-1).get("USEVERESLIDINGWEAR"));
					resultMap.put("uparticleinfo5", analysisList.get(analysisList.size()-1).get("UPARTICLEINFO5"));
					resultMap.put("uparticleinfo4", analysisList.get(analysisList.size()-1).get("UPARTICLEINFO4"));
					resultMap.put("uparticleinfo3", analysisList.get(analysisList.size()-1).get("UPARTICLEINFO3"));
					resultMap.put("uparticleinfo2", analysisList.get(analysisList.size()-1).get("UPARTICLEINFO2"));
					resultMap.put("uparticleinfo1", analysisList.get(analysisList.size()-1).get("UPARTICLEINFO1"));
					resultMap.put("umembranepatchimg5", analysisList.get(analysisList.size()-1).get("UMEMBRANEPATCHIMG5"));
					resultMap.put("umembranepatchimg6", analysisList.get(analysisList.size()-1).get("UMEMBRANEPATCHIMG6"));
					resultMap.put("umembranepatchimg3", analysisList.get(analysisList.size()-1).get("UMEMBRANEPATCHIMG3"));
					resultMap.put("umembranepatchimg4", analysisList.get(analysisList.size()-1).get("UMEMBRANEPATCHIMG4"));
					resultMap.put("umembranepatchimg2", analysisList.get(analysisList.size()-1).get("UMEMBRANEPATCHIMG2"));
					resultMap.put("umembranepatchimg1", analysisList.get(analysisList.size()-1).get("UMEMBRANEPATCHIMG1"));
					resultMap.put("ublotter", analysisList.get(analysisList.size()-1).get("UBLOTTER"));
					resultMap.put("ucuttingwear", analysisList.get(analysisList.size()-1).get("UCUTTINGWEAR"));
					resultMap.put("upatch", analysisList.get(analysisList.size()-1).get("UPATCH"));
					resultMap.put("ufatiguewear", analysisList.get(analysisList.size()-1).get("UFATIGUEWEAR"));
					resultMap.put("uruler2", analysisList.get(analysisList.size()-1).get("URULER2"));
					resultMap.put("uruler1", analysisList.get(analysisList.size()-1).get("URULER1"));
					resultMap.put("usludge", analysisList.get(analysisList.size()-1).get("USLUDGE"));
					resultMap.put("uwater", analysisList.get(analysisList.size()-1).get("UWATER"));
					resultMap.put("lastDate", dateList.get(dateList.size()-1));

					dateVal = dateList.toArray(new Object[dateList.size()]);
					iso1Val = iso1List.toArray(new Object[iso1List.size()]);
					iso2Val = iso2List.toArray(new Object[iso2List.size()]);
					nas1Val = nas1List.toArray(new Object[nas1List.size()]);
					nas2Val = nas2List.toArray(new Object[nas2List.size()]);
					sae1Val = sae1List.toArray(new Object[sae1List.size()]);
					sae2Val = sae2List.toArray(new Object[sae2List.size()]);

					// RDE, RFS 타이틀 생성
					int dateValSize = dateVal.length;
					List<String> titleList = new ArrayList<String>();
					Object[] titleVal = null;
					for(int z=0; z < dateValSize; z++) {
						titleList.add("RDE");
						titleList.add("RFS");
					}
					titleVal = titleList.toArray(new Object[titleList.size()]);
					resultMap.put("titleVal", titleVal);

					resultMap.put("regdate", Arrays.toString(dateVal));
					resultMap.put("regdate2", dateVal);
					resultMap.put("iso1", iso1Val);
					resultMap.put("iso2", iso2Val);
					resultMap.put("nas1", nas1Val);
					resultMap.put("nas2", nas2Val);
					resultMap.put("sae1", sae1Val);
					resultMap.put("sae2", sae2Val);
					System.out.println("날짜배열값" + Arrays.toString(dateVal));
					System.out.println("iso배열값" + Arrays.toString(iso1Val));
					System.out.println("nas배열값" + Arrays.toString(nas1Val));
					System.out.println("sae배열값" + Arrays.toString(sae1Val));
					System.out.println("날짜배열값" + dateVal);
				}
//				resultMap.put("pcon1",pcon1);
//				resultMap.put("pcon2",pcon2);
//				resultMap.put("wcon1",wcon1);
//				resultMap.put("wcon2",wcon2);
//				resultMap.put("an1",an1);
//				resultMap.put("an2",an2);
//				resultMap.put("visco1",visco1);
//				resultMap.put("visco2",visco2);
//				resultMap.put("pq",pq);
//				resultMap.put("vis1",vis1);
//				resultMap.put("vis2",vis2);
//				resultMap.put("vis3",vis3);
//				resultMap.put("vis4",vis4);
				resultMap.put("searchColVal", searchColVal);
				resultMap.put("companyName", companyName);
				resultMap.put("AUTHORIZER", manager);
				resultMap.put("SAMPLENAME", sampleName);
				resultMap.put("SAMPLEDATE", smplDate);
				resultMap.put("OILTYPE", sampleName);
				resultMap.put("reportNo", examMap.get("REPORTNO"));
				System.out.println("resultMap data : " + resultMap);
				System.out.println("viscosityList1 data : " + resultMap.get("viscosityList1").toString());
				System.out.println("viscosityList2 data : " + resultMap.get("viscosityList2").toString());
				System.out.println("viscosityList3 data : " + resultMap.get("viscosityList3").toString());
				commonUtil.excelDownload(resultMap, "", excelName, res, req, reportLocation, path, excelgu);
			}

		} else {
			System.out.println("로그인이 필요한 서비스입니다.");
		}
	}

	@RequestMapping("/common/infoUpload.info")
	public ModelAndView infoUpload(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			String idx = req.getParameter("idx");
			String gu = req.getParameter("gu");
			mav.addObject("idx", idx);
			mav.addObject("gu", gu);
			mav.setViewName("/common/infoUpload");
		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
			return mav;
		}

		return mav;
	}

	/**
	 * Desc : 시험성적서 및 결과서 파일 업로드
	 * @param req
	 * @param res
	 * @param infoFileDto
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/info/infoUploadProcess.info")
	public ModelAndView infoUploadProcess(HttpServletRequest req, HttpServletResponse res, InfoFileDto infoFileDto) throws Exception {

		userId = loginBean.getUserId();
		commonUtil = new CommonUtil();
		//userId = (String)session.getAttribute("userId");
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		if(userId != null && userId != "") {
			String idx = req.getParameter("idx");
			String gu = req.getParameter("gu");
			System.out.println("IDX : " + idx);
			System.out.println("Gu : " + gu);
			int tmpIdx = 0;
			tmpIdx = Integer.parseInt(idx);
			String result = "";

			Map<String, Object> updateMap = new HashMap<String, Object>();

			if(gu != null && gu != "") {
				if(!gu.equals("report")) {
					MultipartFile upFile1 = infoFileDto.getUpFile1();
					if(upFile1.getSize() > 0) {
						result = commonUtil.fileUpload(upFile1, req);

						if(null != result && "" != result) {
							updateMap.put("idx", tmpIdx);
							updateMap.put("uresult", result);
							try {
							    infoService.updateInfoFile(updateMap, gu);
							} catch(Exception e) {
								e.toString();
								Map<String, Object> errorMap = new HashMap<String, Object>();
								errorMap.put("msg", "파일 저장에 실패하였습니다..");
								errorMap.put("url", "/common/infoUpload.info");
								mav.addObject("errorMap", errorMap);
								mav.setViewName("/common/error");
								return mav;
							}
						} else {
							Map<String, Object> errorMap = new HashMap<String, Object>();
							errorMap.put("msg", "파일 저장에 실패하였습니다.");
							errorMap.put("url", "/common/infoUpload.info");
							mav.addObject("errorMap", errorMap);
							mav.setViewName("/common/error");
							return mav;
						}
					}
				} else {
					//MultipartFile reportName = infoFileDto.getUreport();
					MultipartFile upFile1 = infoFileDto.getUpFile1();
					if(upFile1.getSize() > 0) {
						result = commonUtil.fileUpload(upFile1, req);

						if(null != result && "" != result) {
							updateMap.put("idx", tmpIdx);
							updateMap.put("ureport", result);
							try {
							    infoService.updateInfoFile(updateMap, gu);
							} catch(Exception e) {
								e.toString();
								Map<String, Object> errorMap = new HashMap<String, Object>();
								errorMap.put("msg", "파일 저장에 실패하였습니다..");
								errorMap.put("url", "/common/infoUpload.info");
								mav.addObject("errorMap", errorMap);
								mav.setViewName("/common/error");
								return mav;
							}
						} else {
							Map<String, Object> errorMap = new HashMap<String, Object>();
							errorMap.put("msg", "파일 저장에 실패하였습니다.");
							errorMap.put("url", "/common/infoUpload.info");
							mav.addObject("errorMap", errorMap);
							mav.setViewName("/common/error");
							return mav;
						}
					}
				}

				Map<String, Object> successMap = new HashMap<String, Object>();
				successMap.put("msg", "파일 처리에 성공하였습니다.");
				successMap.put("url", "/common/infoUpload.info");
			    mav.addObject("successMap", successMap);
			    mav.setViewName("/common/success");
			}

		} else {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("msg", "로그인이 필요한 서비스입니다.");
			errorMap.put("url", "/login/login.info");
			mav.addObject("errorMap", errorMap);
			mav.setViewName("/common/error");
			return mav;
		}

		return mav;
	}

	@RequestMapping("/down/infoDown.info")
	public void infoDown(HttpServletRequest req, HttpServletResponse res) throws Exception {

		commonUtil = new CommonUtil();
		String fileName = "";
		String filePath = "";
		String reportFile = "";
		String resultFile = "";
		int tmpidx = 0;

		String idx = req.getParameter("idx");
		String gu = req.getParameter("gu");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> downMap = new HashMap<String, Object>();

		if (idx != null || idx.length() != 0){
			if(gu != null && gu != "") {
				tmpidx = Integer.parseInt(idx);
				downMap.put("idx", idx);
				resultMap = infoService.getInfoFile(downMap);

				if(resultMap != null && resultMap.size() > 0) {
					reportFile = (String)resultMap.get("UREPORT");
					resultFile = (String)resultMap.get("URESULT");

					if(!gu.equals("report")) {
						int pos = resultFile.lastIndexOf("/");
						fileName = resultFile.substring(pos + 1);
						filePath = resultFile.substring(0, pos);
						commonUtil.fileDownload(fileName, filePath, req, res);
					} else {
						int pos = reportFile.lastIndexOf("/");
						fileName = reportFile.substring(pos + 1);
						filePath = reportFile.substring(0, pos);
						commonUtil.fileDownload(fileName, filePath, req, res);
					}
				}
			}
		}
	}
}