<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<%
    String userId = (String)session.getAttribute("userId");

    if(userId == null || userId == "") {
%>
<script type="text/javascript">
    location.href = "/login/login.info";
</script>
<%
    } else {
%>
<script type="text/javascript">
    location.href = "/info/infoMain.info";
</script>
<%
    }
%>
</head>
<body>
	<table width="100%" align="center">
	    <tr>
	        <td align="center"><img src="/images/undercon.jpg"></td>
	    </tr>
	    <tr>
	        <td align="center"><a href="/login/login.info" style="text-decoration: none"><p style="font-size: 12px;">진행상황 보러가기</p></a></td>
	    </tr>
	</table>
</body>
</html>