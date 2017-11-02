<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="/styles/base.css" />
<script type="text/javascript">
	function close_win(){
		window.opener.location.reload();
        window.close();
	}
</script>

</head>
<%
    String idx = (String)request.getAttribute("idx");
    String gu= (String)request.getAttribute("gu");
%>
<body>
    <form name="form" id="form" action="/info/infoUploadProcess.info" method="post" enctype="multipart/form-data">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">
    <input type="hidden" id="gu" name="gu" value="<%=gu%>">
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">파일 업로드</h2></td>
        </tr>
        <tr>
            <td><input type="file" id="upFile1" name="upFile1"></td>
        </tr>
        <tr>
            <td><input name="button" class="btn_style4" id="button" type="submit" value="확인"/></td>
        </tr>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="right"><a href="javascript:close_win();"><b>창닫기</b></a></td>
        </tr>
    </table>
    </form>
</body>
</html>