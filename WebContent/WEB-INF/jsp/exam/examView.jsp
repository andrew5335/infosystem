<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<%
	String infoIdx = (String)request.getAttribute("infoIdx");
	String membGb = (String)session.getAttribute("membGb");
	Map<String, Object> infoMap = (Map<String, Object>)request.getAttribute("infoMap");
	int companyIdx = (Integer)request.getAttribute("companyIdx");
	Map<String, Object> customerMap = (Map<String, Object>)request.getAttribute("customerMap");
	Map<String, Object> examMap = (Map<String, Object>)request.getAttribute("examMap");
	String type = (String)request.getAttribute("type");
%>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#modify").click(function(e) {
		var write;
		write = confirm("시험성적서를 수정하시겠습니까?");
		
		if(write == true) {
			location.href="/exam/examWrite.info?idx=<%=infoIdx%>&companyIdx=<%=companyIdx%>&type=<%=type%>";
		} else {
			alert("시험성적서 입력이 취소되었습니다.");
		}
		
	});
	
	$("#delete").click(function(e) {
		var write;
		write = confirm("시험성적서를 삭제하시겠습니까?");
		
		if(write == true) {
			location.href="/exam/examDelete.info?idx=<%=infoIdx%>&companyIdx=<%=companyIdx%>";
		} else {
			alert("시험성적서 입력이 취소되었습니다.");
		}
		
	});
});

//datepicker
$(function() {
	$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
	$( "#datepicker" ).datepicker(
		{
			changeMonth: true,
		    changeYear: true,
			dateFormat: "yy-mm-dd", // 날자형식 YYYY-MM-DD 
			//numberOfMonths: 3,  // 2달만 보여줌 
			showButtonPanel: true,
			//minDate : 0 //과거없음
			maxDate : 0 // 미래없음
		}
	);
	
	//$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
	$( "#datepicker2" ).datepicker(
		{
			changeMonth: true,
		    changeYear: true,
			dateFormat: "yy-mm-dd", // 날자형식 YYYY-MM-DD 
			//numberOfMonths: 3,  // 2달만 보여줌 
			showButtonPanel: true,
			//minDate : 0 //과거없음
			maxDate : 0 // 미래없음
		}
	);
});
</script>
</head>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">Report Data 입력</h2></td>
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

    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th width="100%">1. Customer Information</th>
        </tr>
    </table>
    <table class="tableTypeC" width="100%" align="center">
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Customer</td>
            <td width="30%" style="font-size:12px; height:18px; background-color: #ffffff"><%=customerMap.get("COMPANYNAME") %></td>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">To</td>
            <td width="30%" style="font-size:12px; height:18px; background-color: #ffffff"><%=customerMap.get("MANAGER") %></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Address</td>
            <td width="80%" colspan="3" style="font-size:12px; height:18px; background-color: #ffffff"><%=customerMap.get("ADDR") %></td>
        </tr>
    </table>
    
    <table width="100%" align="center">
        <tr><td height="10"></td></tr>
    </table>
    
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th width="100%">2. Sample Information</th>
        </tr>
    </table>
    <table class="tableTypeC" width="100%" align="center">
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Number Of Samples</td>
            <td width="80%"><%=examMap.get("SAMPLECNT")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Test Parameter</td>
            <td width="80%"><%=examMap.get("TESTPARAMETER")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Test Date</td>
            <td width="80%"><%=examMap.get("TESTDATE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Report No</td>
            <td width="80%"><%=examMap.get("REPORTNO")%></td>
        </tr>
    </table>
    
    <table width="100%" align="center">
        <tr><td height="10"></td></tr>
    </table>
    
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th width="100%">3. Results</th>
        </tr>
    </table>
    <table class="tableTypeC" width="100%" align="center">
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Results</td>
            <td width="80%"><%=examMap.get("RESULT")%></td>
        </tr>
    </table>
    
    <table width="100%" align="center">
        <tr><td height="10"></td></tr>
    </table>
    
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th width="100%">4. Number of Pages</th>
        </tr>
    </table>
    <table class="tableTypeC" width="100%" align="center">
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Number Of Pages</td>
            <td width="80%"><%=examMap.get("PAGECNT")%></td>
        </tr>
    </table>
    
    <table width="100%" align="center">
        <tr><td height="10"></td></tr>
    </table>
    
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th width="100%">5. Report</th>
        </tr>
    </table>
    <table class="tableTypeC" width="100%" align="center">
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Report</td>
            <td width="80%"><%=examMap.get("REPORT")%></td>
        </tr>
    </table>
    
    <table width="100%" align="center">
        <tr>
            <td height="20"></td>
        </tr>
    </table>
    <%
        if(membGb != null && membGb != "" && Integer.parseInt(membGb) > 80) {
    %>
    <table width="100%" align="center">
        <tr>
            <td align="center"><!--input type="submit" value="확인"--><input name="button" class="btn_style4" id="modify" type="submit" value="수정"/></td>
            <td align="center"><!--input type="submit" value="확인"--><input name="button" class="btn_style4" id="delete" type="submit" value="삭제"/></td>
        </tr>
    </table>
    <%
        }
    %>

</body>
</html>