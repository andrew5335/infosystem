<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<script type="text/javascript">
    $(document).ready(function() {
    	$("#button").click(function(e) {
    		location.href="/sample/write.info";
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
    
    function getView(idx) {
    	location.href="/sample/view.info?method=view&idx=" + idx;
    }
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
	<table class="tableTypeB" width="100%" align="left">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<%
			List<Map> list = (List)request.getAttribute("result");
			for(Map item : list) {
		%>
			<tr onmouseover="this.className='on'" onmouseout="this.className='';"  onclick="getView('<%=item.get("IDX")%>');">
				<td height="22" style="font-size:12px" align="center"><a href="/sample/view.info?method=view&idx=<%=item.get("IDX") %>"><%=item.get("TITLE") %></a></td>
				<td height="22" style="font-size:12px" align="center"><%=item.get("WRITER") %></td>
				<td height="22" style="font-size:12px" align="center"><%=item.get("HITCNT") %></td>
				<td height="22" style="font-size:12px" align="center"><%=item.get("REGDATE") %></td>
			</tr>			
		<%
			}
		%>
	</table>
	<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
		<tr>
			<td height="5"></td>
		</tr>
		<tr>
			<td align="right" style="font-size:12px"><input name="button" class="btn_style4" id="button" type="submit" value="글등록"/></td>
		</tr>
		<tr>
		    <td height="20"></td>
		</tr>
	</table>
</body>
</html>