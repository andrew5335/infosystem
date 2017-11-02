<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
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
<body>
<%
	String idx = (String)request.getAttribute("idx");
	String title = "";
	String contents = "";
	String passwd = "";
	String writeName = "";
	Map<String, Object> viewList = (Map<String, Object>)request.getAttribute("result");
	if (viewList != null){
		title = viewList.get("TITLE").toString();
		contents = viewList.get("CONTENT").toString();
		//passwd = viewList.get("PASSWD").toString();
		writeName = viewList.get("WRITER").toString();
	} 

    String membGb = (String)session.getAttribute("membGb");

	//for(Map item : viewList){
%>
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
		<form name="form" id="insert" action="/sample/insert.info" method="post" enctype="multipart/form-data">
		<input type="hidden" id="idx" name="idx" value="<%=idx %>"/>
		<tr>
			<th class="th02">이름</th>
			<td width="400" align="center" style="font-size: 12px"><input type="text" id="writeName" name="writeName" value="<%=writeName %>" style="width:300px; height:22px"/></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td width="200" align="center" style="font-size: 12px">비밀번호</td> -->
<%-- 			<td width="400" align="center" style="font-size: 12px"><input type="password" id="passwd" name="passwd" value="<%=passwd %>" style="width:300px; height:22px"/></td> --%>
<!-- 		</tr> -->
		<tr>
			<th class="th02">제목</th>
			<td width="400" align="center" style="font-size: 12px"><input type="textarea" id="title" name="title" value="<%=title %>" style="width:300px; height:22px"/></td>
		</tr>
		<tr>
			<th class="th02">내용</th>
			<td width="400" align="center" style="font-size: 12px"><textarea id="contents" name="contents" style="width:300px; height:100px"/><%=contents %></textarea></td>
		</tr>
		<tr>
		    <th class="th02">첨부파일</th>
		    <td><input type="file" id="upFile1" name="upFile1"></td>
		</tr>
		<table width="400" align="center">
        <tr>
            <td align="center"><input name="inputok" class="btn_style4" id="inputok" type="submit" value="확인"/></td>
        </tr>
    </table>
		</form>
	</table>

</body>
</html>