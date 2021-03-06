package com.eye2web.infosys.bean;

public class LoginBean {

	private static String userId;    // 회원아이디
	private static String password;    // 비밀번호
	private static String userName;    // 회원이름
	private static String email;    // 메일주소
	private static String addr;    // 주소

	private static String membGb;    // 회원구분 - 00 : 가입요청회원 : 로그인 X / 77 : 업체사용자 / 88 : 업체 관리자 - 업체 관리 가능, 관리자 페이지에 들어올 경우 자기 업체 정보만 확인 가능 / 99 : 관리자 - 전 페이지 접근 가능, 관리자 페이지 접근 가능
	private static String membGrade;    // 회원등급 -  S : 읽기,쓰기,수정,삭제 / A : 읽기,쓰기 / B : 읽기 / C : 사용제한
	private static int companyIdx;
	private static String useYn;

	public static String getUserId() {
		return userId;
	}
	public static void setUserId(String userId) {
		LoginBean.userId = userId;
	}
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		LoginBean.password = password;
	}
	public static String getUserName() {
		return userName;
	}
	public static void setUserName(String userName) {
		LoginBean.userName = userName;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		LoginBean.email = email;
	}
	public static String getAddr() {
		return addr;
	}
	public static void setAddr(String addr) {
		LoginBean.addr = addr;
	}
	public static String getMembGb() {
		return membGb;
	}
	public static void setMembGb(String membGb) {
		LoginBean.membGb = membGb;
	}
	public static String getMembGrade() {
		return membGrade;
	}
	public static void setMembGrade(String membGrade) {
		LoginBean.membGrade = membGrade;
	}
	public static int getCompanyIdx() {
		return companyIdx;
	}
	public static void setCompanyIdx(int companyIdx) {
		LoginBean.companyIdx = companyIdx;
	}
	public static String getUseYn() {
		return useYn;
	}
	public static void setUseYn(String useYn) {
		LoginBean.useYn = useYn;
	}
}
