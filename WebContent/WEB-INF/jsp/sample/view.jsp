<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %> 
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<%
	String idx = (String)request.getAttribute("idx");
    String uploadFile = "";
    String tmpFileName = "";

	Map<String, Object> viewList = (Map<String, Object>)request.getAttribute("result");
	if(viewList.size() > 0) {
		String filePath = (String)viewList.get("UPLOADFILE");
		int pos = filePath.lastIndexOf(".");
		String fileExt = filePath.substring(pos + 1);
		
		if(fileExt.equals("jpg") || fileExt.equals("gif") || fileExt.equals("png")) {
			uploadFile = "<img src='" + filePath + "' width=600 height=400>";
		} else {
			int pos2 = filePath.lastIndexOf("/");
			String fileName = filePath.substring(pos2 + 1);

			uploadFile = "<a href='/down/fileDown.info?idx=" + idx + "'>" + fileName + "</a>";
		}
	}

%>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script>
	function delcontent(idx){

		if(confirm("삭제하시겠습니까?")){
			location.href="/sample/delete.info?idx="+idx;
		}
	}

	function modifycontent(idx){

		if(confirm("수정하시겠습니까?")){
			location.href="/sample/write.info?idx="+idx;
		}
	}
	
	$(document).ready(function() {
		$("#modify").click(function(e) {
    		var modify;
    		modify = confirm("수정하시겠습니까?");
    		
    		if(modify == true) {
    			location.href="/sample/write.info?idx=<%=idx%>";
    		} else {
    			alert("수정이 취소되었습니다.");
    		} 
    	});
    	
    	$("#delete").click(function(e) {
    		var del;
    		del = confirm("삭제하시겠습니까?");
    		
    		if(del == true) {
    			location.href="/sample/delete.info?idx=<%=idx%>";
    		} else {
    			alert("삭제가 취소되었습니다.");
    		}
    	});
    	
    	$("#list").click(function(e) {
    		location.href="/sample/list.info";
    	});
    	
    	$("#mg_member").click(function(e) {
    		location.href="/member/memberList.info";
    	});
    	
    	$("#mg_company").click(function(e) {
    		location.href="/customer/customerList.info";
    	});
    	
    	$("#mg_info").click(function(e) {
    		location.href="/info/infoList.info";
    	});
    	
//     	$("#mg_form").click(function(e) {
//     		location.href="/customer/customerWrite.info";
//     	});
    	
    	$("#mg_board").click(function(e) {
    		location.href="/sample/list.info";
    	});
	});
</script>
</head>
<%
    String membGb = (String)session.getAttribute("membGb");
%>
<body>
<table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">게시판</h2></td>
        </tr>
        <tr>
            <td height="10">&nbsp;</td>
        </tr>
        <%
            if(("99").equals(membGb)) {
        %>
        <tr>
            <td>
                <input name="mg_member" class="btn_style6" id="mg_member" type="submit" value="회원관리"/>
                <input name="mg_company" class="btn_style6" id="mg_company" type="submit" value="회원사관리"/>
                <input name="mg_info" class="btn_style6" id="mg_info" type="submit" value="분석정보관리"/>
<!--                 <input name="mg_form" class="btn_style6" id="mg_form" type="submit" value="리포트폼관리"/> -->
                <input name="mg_board" class="btn_style6" id="mg_board" type="submit" value="게시판관리"/>
            </td>
        </tr>
        <%
            }
        %>
        <tr>
            <td height="10">&nbsp;</td>
        </tr>
    </table>
<table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="20%" />
        <col width="*" />
    </colgroup>
	<tr>
		<th class="th02">이름 : </th>
		<td style="font-size:12px"><%=viewList.get("WRITER") %></td>
	</tr>
	<!--tr>
		<th class="th02">비밀번호 : </th>
		<td style="font-size:12px"><%=viewList.get("PASSWD") %></td>
	</tr-->
	<tr>
		<th class="th02">제목 : </th>
		<td style="font-size:12px"><%=viewList.get("TITLE") %></td>
	</tr>
	<tr>
		<th class="th02">내용 : </th>
		<td style="font-size:12px"><%=viewList.get("CONTENT") %></td>
	</tr>
	<tr>
		<th class="th02">첨부파일 : </th>
		<td style="font-size:12px"><%=uploadFile %></td>
	</tr>
</table>
<table cellpadding=1" cellspacing="1" border="0" width="600" align="center">
	<tr>
<!-- 		<td align="center" style="font-size:12px"><a href="/sample/list.info">리스트</a></td> -->
<%-- 		<td align="center" style="font-size:12px"><a href="javascript:modifycontent('<%=idx %>')">수정</a></td>  --%>
<%-- 		<td align="center" style="font-size:12px"><a href="#" onClick="javascript:delcontent('<%=idx %>')">삭제</a></td> --%>
		<td align="center" style="font-size: 12px"><input name="modify" class="btn_style4" id="modify" type="submit" value="정보수정"/></td>
        <td align="center" style="font-size: 12px"><input name="delete" class="btn_style4" id="delete" type="submit" value="정보삭제"/></td>
        <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="list" type="submit" value="돌아가기"/></td>
	</tr>
</table>

</body>
</html>