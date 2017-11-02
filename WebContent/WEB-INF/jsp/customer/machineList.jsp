<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	List<Map> machineList = (List)request.getAttribute("machineList");
	String companyIdx = request.getAttribute("companyIdx").toString();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<script type="text/javascript">
    $(document).ready(function() {
    	$("#button").click(function(e) {
    		location.href="/customer/machineWrite.info?companyIdx=<%=companyIdx%>";
    	});
    	
    	$("#backtolist").click(function(e) {
    		location.href="/customer/customerView.info?idx=" + <%=companyIdx%>;
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
    
    function getView(idx, companyidx) {
    	location.href="/customer/machineView.info?idx=" + idx + "&companyIdx=" + companyidx;
    }
</script>
</head>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">시료정보 리스트</h2></td>
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
    <table class="tableTypeB" width="100%" align="left">
        <tr>
            <th>회사명</th>
            <th>기계명</th>
            <th>기계종류</th>
            <th>기계운용시간</th>
            <th>오일명</th>
            <th>오일사용시간</th>
            <th>오일사용량(L)</th>
            <th>최근 오일 보충일</th>
            <th>최근 오일 보충량(L)</th>
            <th>등록일자</th>
        </tr>
        <%
            if(machineList.size() <= 0) {
        %>
            <tr>
                <td colspan="10" height="22" align="center" style="border-color:rgb(999);border:1px;border-style:solid;"><font style="font-size:12px">등록된 내용이 없습니다.</td>
            </tr>
        <%    	
            } else {
        
				for(Map item : machineList) {
		%>
	        <tr onmouseover="this.className='on'" onmouseout="this.className='';" onclick="getView('<%=item.get("IDX")%>', '<%=companyIdx%>');">
	            <td height="22" style="font-size:12px" align="center"><%=item.get("COMPANYNAME") %></td>
	            <td height="22" style="font-size:12px" align="center"><a href="/customer/machineView.info?idx=<%=item.get("IDX")%>&companyIdx=<%=companyIdx%>"><%=item.get("MACHINENAME") %></a></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("MACHINETYPE") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("RUNTIME") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("OILNAME") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("OILTIME") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("OILAMOUNT") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("OILSUPLDATE") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("OILSUPLAMOUNT") %></td>
	            <td height="22" style="font-size:12px" align="center"><%=item.get("REGDATE") %></td>
	        </tr>
	    <%
			    }
				
            }
	    %>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="center"><input name="button" class="btn_style4" id="button" type="submit" value="기계등록"/></td>
            <td align="center"><input name="backtolist" class="btn_style4" id="backtolist" type="submit" value="돌아가기"/></td>
        </tr>
    </table>
</body>
</html>