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
		$("#modify").click(function(e) {
    		var modify;
    		modify = confirm("수정하시겠습니까?");
    		
    		if(modify == true) {
    			location.href="/customer/machineWrite.info?idx=<%=idx%>&companyIdx=<%=companyIdx%>";
    		} else {
    			alert("수정이 취소되었습니다.");
    		} 
    	});
    	
    	$("#delete").click(function(e) {
    		var del;
    		del = confirm("삭제하시겠습니까?");
    		
    		if(del == true) {
    			location.href="/customer/machineDelete.info?idx=<%=idx%>&companyIdx=<%=companyIdx%>";
    		} else {
    			alert("삭제가 취소되었습니다.");
    		}
    	});
    	
    	$("#list").click(function(e) {
    		location.href="/customer/machineList.info?companyIdx=<%=companyIdx%>";
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
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">기계정보</h2></td>
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
            <td width="400" style="font-size: 12px"><%=machinename%></td>
        </tr>
        <tr>
            <th class="th02">기계종류</th>
            <td width="400" style="font-size: 12px"><%=machinetype%></td>
        </tr>
        <tr>
            <th class="th02">기계운용시간</th>
            <td width="400" style="font-size: 12px"><%=runtime%></td>
        </tr>
        <tr>
            <th class="th02">오일명</th>
            <td width="400" style="font-size: 12px"><%=oilname%></td>
        </tr>
        <tr>
            <th class="th02">오일사용시간</th>
            <td width="400" style="font-size: 12px"><%=oiltime%></td>
        </tr>
        <tr>
            <th class="th02">오일사용량</th>
            <td width="400" style="font-size: 12px"><%=oilamount%></td>
        </tr>
        <tr>
            <th class="th02">최근오일보충일</th>
            <td width="400" style="font-size: 12px"><%=oilsupldate%></td>
        </tr>
        <tr>
            <th class="th02">최근오일보충량</th>
            <td width="400" style="font-size: 12px"><%=oilsuplamount%></td>
        </tr>
    </table>
    <table class="tableTypeC" width="100%" align="center">
        <tr>
            <th colspan="6">샘플정보</th>
        </tr>
        <tr>
            <th class="th02">시료번호</th>
            <th class="th02">시료명</th>
            <th class="th02">샘플링포인트</th>
            <th class="th02">샘플링일자</th>
            <th class="th02">비고</th>
            <th class="th02">삭제처리</th>
        </tr>
        <%
            List<Map> sampleList = (List)request.getAttribute("sampleInfo");
        
            if(sampleList == null) {
        %>
            <tr>
                <td colspan="6" height="22" align="center" style="border-color:rgb(999);border:1px;border-style:solid;"><font style="font-size:12px">등록된 내용이 없습니다.</td>
            </tr>
        <%
            } else {
            	
            	for(Map item : sampleList) {
        %>
        <tr>
            <td align="center" style="font-size: 12px"><%=item.get("SPECINUM") %></td>
            <td align="center" style="font-size: 12px"><%=item.get("SPECINAME") %></td>
            <td align="center" style="font-size: 12px"><%=item.get("SMPLPOINT") %></td>
            <td align="center" style="font-size: 12px"><%=item.get("SMPLDATE") %></td>
            <td align="center" style="font-size: 12px"><%=item.get("SMPLCOMMENT") %></td>
            <td align="center" style="font-size: 12px"><a href="/customer/sampleDelete.info?idx=<%=item.get("IDX") %>&companyIdx=<%=companyIdx%>&machineIdx=<%=idx%>">삭제</a></td>
        </tr>
        <%
            	}
            }
        %>
    </table>
<!--     <table width="600" align="center"> -->
<!--         <tr> -->
<!--             <td height="20"></td> -->
<!--         </tr> -->
<!--     </table> -->
    <form name="sampleForm" action="/customer/sampleWrite.info" method="post">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">
    <input type="hidden" id="companyIdx" name="companyIdx" value="<%=companyIdx%>">
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="15%" />
        <col width="*" />
        <col width="15%" />
        <col width="*" />
        <col width="15%" />
        <col width="*" />
        <col width="15%" />
        <col width="*" />
    </colgroup>
        <tr>
            <th class="th02">시료명</th>
            <td align="center" style="font-size: 12px"><input type="text" id="sampleName" name="sampleName" style="width:100px; height:22px"></td>
            <th class="th02">샘플링포인트</th>
            <td align="center" style="font-size: 12px"><input type="text" id="samplePoint" name="samplePoint" style="width:100px; height:22px"></td>
            <th class="th02">샘플링일자</th>
            <td align="center" style="font-size: 12px"><input type="text" id="sampleDate" name="sampleDate" style="width:100px; height:22px"></td>
            <th class="th02">비고</th>
            <td align="center" style="font-size: 12px"><input type="text" id="sampleComment" name="sampleComment" style="width:100px; height:22px"></td>
        </tr>
        <tr>
            <th colspan="8" class="th02"><input name="inputok" class="btn_style4" id="inputok" type="submit" value="확인"/></th>
        </tr>
    </table>
    </form>
    <table width="600" align="center">
        <tr>
            <td height="30"></td>
        </tr>
    </table>
    <table width="600" align="center">
        <tr>
<%--             <td align="center" style="font-size: 12px"><a href="/customer/machineWrite.info?idx=<%=idx%>&companyIdx=<%=companyIdx%>">수정</a></td> --%>
<%--             <td align="center" style="font-size: 12px"><a href="/customer/machineDelete.info?idx=<%=idx%>&companyIdx=<%=companyIdx%>">삭제</a></td> --%>
<%--             <td align="center" style="font-size: 12px"><a href="/customer/machineList.info?companyIdx=<%=companyIdx%>">돌아가기</a></td> --%>
            <td align="center" style="font-size: 12px"><input name="modify" class="btn_style4" id="modify" type="submit" value="정보수정"/></td>
            <td align="center" style="font-size: 12px"><input name="delete" class="btn_style4" id="delete" type="submit" value="정보삭제"/></td>
            <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="list" type="submit" value="돌아가기"/></td>
        </tr>
    </table>
</body>
</html>