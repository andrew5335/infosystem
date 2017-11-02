<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<div class="left_zone">
	<div><img src="/images/left_title_admin.gif"/></div>
	<div class="left_zone_menu">
		<ul>
			<li class="left_1depth"><a href="/info/infoMain.info"><b>OilTok Report</b></a>
				<ul>
					<li><a href="/info/infoList.info">시험정보관리</a></li>
					<%
			            String membGb = "";
			            String membGrade = "";
			            String companyIdx = "";
			            
			            if(session != null) {
				            membGb = (String)session.getAttribute("membGb");
				            membGrade = (String)session.getAttribute("membGrade");
				            companyIdx = (String)session.getAttribute("companyIdx");
			            } else {
			            	
			            }
			            
			            if(!membGb.equals("99")) {} else {
			        %>
					<li><a href="/customer/customerList.info">업체관리</a></li>
					<li><a href="/member/memberList.info">회원관리</a></li>
					<li><a href="/report/reportIssue.info">레포트발급</a></li>
					<%
			            }
					%>
					<li><a href="/info/infoAnalysis.info">정보분석</a></li>
					<li><a href="/sample/list.info">게시판</a></li>
					<%
						if(!membGb.equals("99")) {} else {
					%>
					<li><a href="/device/deviceResultUpload.info">장비파일업로드</a></li>
					<%
						}
					%>
				</ul>
			</li>
		</ul>
	</div>
</div>