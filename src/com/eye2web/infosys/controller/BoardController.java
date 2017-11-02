package com.eye2web.infosys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eye2web.infosys.bean.LoginBean;
import com.eye2web.infosys.service.BoardService;

@Controller
public class BoardController {

	private static Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private BoardService boardService;

	private LoginBean loginBean;

	private HttpSession session;

	private String userId;

	@RequestMapping("/board/boardList.info")
	public ModelAndView boardList(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/board/boardView.info")
	public ModelAndView boardView(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/board/boardWrite.info")
	public ModelAndView boardWrite(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/board/boardDelete.info")
	public ModelAndView boardDelete(HttpServletRequest req, HttpServletResponse res) throws Exception {

		userId = loginBean.getUserId();
		System.out.println("로그인한 사용자 : " + userId);

		ModelAndView mav = new ModelAndView();

		return mav;
	}

}
