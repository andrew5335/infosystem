<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<%
	String idx = (String)request.getAttribute("idx");
	String companyIdx = (String)request.getAttribute("companyIdx");
	String type = (String)request.getAttribute("type");
%>
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
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">기계정보입력</h2></td>
        </tr>
        <tr>
            <td height="10">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <input name="mg_member" class="btn_style6" id="mg_member" type="submit" value="회원관리"/>
                <input name="mg_company" class="btn_style6" id="mg_company" type="submit" value="회원사관리"/>
                <input name="mg_info" class="btn_style6" id="mg_info" type="submit" value="분석정보관리"/>
<!--                 <input name="mg_form" class="btn_style6" id="mg_form" type="submit" value="리포트폼관리"/> -->
                <input name="mg_board" class="btn_style6" id="mg_board" type="submit" value="게시판관리"/>
            </td>
        </tr>
        <tr>
            <td height="10">&nbsp;</td>
        </tr>
    </table>
    <%
	    Map<String, Object> machineInfo = (Map<String, Object>)request.getAttribute("machineInfo");
	    
	    String companyname = "";
	    String machinename = "";
	    String machinetype = "";
	    String runtime = "";
	    String oilname = "";
	    String oiltime = "";
	    String oilamount = "";
	    String oilsupldate = "";
	    String oilsuplamount = "";
	    String regdate = "";
	    
	    if(machineInfo != null) {
	    	
	    	companyname = machineInfo.get("COMPANYNAME").toString();
	    	machinename = machineInfo.get("MACHINENAME").toString();
	    	machinetype = machineInfo.get("MACHINETYPE").toString();
	    	runtime = machineInfo.get("RUNTIME").toString();
	    	oilname = machineInfo.get("OILNAME").toString();
	    	oiltime = machineInfo.get("OILTIME").toString();
	    	oilamount = machineInfo.get("OILAMOUNT").toString();
	    	oilsupldate = machineInfo.get("OILSUPLDATE").toString();
	    	oilsuplamount = machineInfo.get("OILSUPLAMOUNT").toString();
	    	regdate = machineInfo.get("REGDATE").toString();
	    	
	    }
    %>
    <form name="machineform" action="/customer/machineWriteProcess.info" method="post">
    <input type="hidden" id="companyIdx" name="companyIdx" value="<%=companyIdx%>">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">
    <input type="hidden" id="type" name="type" value="<%=type%>">
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="20%" />
        <col width="*" />
    </colgroup>
        <tr>
            <th colspan="2">기계정보</th>
        </tr>
        <tr>
            <th class="th02">기계명</th>
            <td width="400" style="font-size: 12px"><input type="text" id="machinename" name="machinename" style="width:300px; height:22px" value="<%=machinename%>"></td>
        </tr>
        <tr>
            <th class="th02">기계종류</th>
            <td width="400" style="font-size: 12px"><input type="text" id="machinetype" name="machinetype" style="width:300px; height:22px" value="<%=machinetype%>"></td>
        </tr>
        <tr>
            <th class="th02">기계운용시간</th>
            <td width="400" style="font-size: 12px"><input type="text" id="runtime" name="runtime" style="width:300px; height:22px" value="<%=runtime%>"></td>
        </tr>
        <tr>
            <th class="th02">오일명</th>
            <td width="400" style="font-size: 12px"><input type="text" id="oilname" name="oilname" style="width:300px; height:22px" value="<%=oilname%>"></td>
        </tr>
        <tr>
            <th class="th02">오일사용시간</th>
            <td width="400" style="font-size: 12px"><input type="text" id="oiltime" name="oiltime" style="width:300px; height:22px" value="<%=oiltime%>"></td>
        </tr>
        <tr>
            <th class="th02">오일사용량</th>
            <td width="400" style="font-size: 12px"><input type="text" id="oilamount" name="oilamount" style="width:300px; height:22px" value="<%=oilamount%>"></td>
        </tr>
        <tr>
            <th class="th02">최근오일보충일</th>
            <td width="400" style="font-size: 12px"><input type="text" id="oilsupldate" name="oilsupldate" style="width:300px; height:22px" value="<%=oilsupldate%>"></td>
        </tr>
        <tr>
            <th class="th02">최근오일보충량</th>
            <td width="400" style="font-size: 12px"><input type="text" id="oilsuplamount" name="oilsuplamount" style="width:300px; height:22px" value="<%=oilsuplamount%>"></td>
        </tr>
    </table>
    <table width="600" align="center">
        <tr>
            <td align="center"><input name="inputok" class="btn_style4" id="inputok" type="submit" value="확인"/></td>
        </tr>
    </table>
    </form>
</body>
</html>