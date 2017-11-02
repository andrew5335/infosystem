<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
//     $(document).ready(function() {
//     	$("#logout").click(function(e) {
//     		var logout;
//     		logout = confirm("로그아웃하시겠습니까?");
    		
//     		if(logout == true) {
//     			location.href="/login/logout.info";
//     		} else {
//     			alert("로그아웃이 취소되었습니다.");
//     		} 
//     	});
//     });
    
    function getView(idx) {
    	//alert(idx);
    	location.href="/info/infoView.info?idx=" + idx;
    }
    
    function getCustomerView(idx) {
    	location.href="/customer/customerView.info?idx=" + idx;
    }
</script>
</head>
<body>
<!--     <table width="100%" align="center"> -->
<!--         <tr> -->
<!--             <td align="right"><a href="/login/logout.info" style="text-decoration: none; font-size: 12px">로그아웃</a></td> -->
<!--         </tr> -->
<!--     </table> -->
<!-- 	<table width="100%" align="center"> -->
<!--         <tr> -->
<!--             <td align="right"><input name="logout" class="btn_style4" id="logout" type="submit" value="로그아웃"/></td> -->
<!--         </tr> -->
<!--     </table> -->
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">최근 가입 고객사 리스트</h2></td>
        </tr>
    </table>
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th>회사명</th>
            <th>담당자</th>
            <th>부서명</th>
            <th>전화번호</th>
            <th>이메일</th>
        </tr>
        <%
			List<Map> customerList = (List)request.getAttribute("customerList");
            
            if(customerList.size() <= 0) {
        %>
            <tr>
                <td colspan="5" height="22" align="center" style="border-color:rgb(999);border:1px;border-style:solid;"><font style="font-size:12px">등록된 내용이 없습니다.</td>
            </tr>
        <%	
            } else {
        
				for(Map item : customerList) {
		%>
		    <tr onmouseover="this.className='on'" onmouseout="this.className='';" onclick="getCustomerView('<%=item.get("IDX")%>');">
		        <td height="22" style="font-size:12px" align="center"><a href="/customer/customerView.info?idx=<%=item.get("IDX")%>"><%=item.get("COMPANYNAME") %></a></td>
		        <td height="22" style="font-size:12px" align="center"><%=item.get("MANAGER") %></td>
		        <td height="22" style="font-size:12px" align="center"><%=item.get("PART") %></td>
		        <td height="22" style="font-size:12px" align="center"><%=item.get("PHONENM1") %></td>
		        <td height="22" style="font-size:12px" align="center"><%=item.get("EMAIL") %></td>
		    </tr>
		<%
			    }
				
            }
		%>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">최근 분석요청 리스트</h2></td>
        </tr>
    </table>
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th>번호</th>
            <th>업체명</th>
            <th>시료명</th>
            <th>장치타입</th>
            <th>샘플링포인트</th>
            <th>유종</th>
            <th>담당자</th>
            <th>등록일자</th>
        </tr>
		<%
			List<Map> infoList = (List)request.getAttribute("infoList");
		
			if(infoList.size() <= 0) {
		%>
			<tr>
			    <td colspan="7">데이터가 없습니다.</td>
			</tr>
		<%
			} else {
				for(Map item : infoList) {
		%>
			<tr onmouseover="this.className='on'" onmouseout="this.className='';" onclick="getView('<%=item.get("IDX")%>');">
			    <td height="22" style="font-size:12px" align="center"><%=item.get("IDX")%></td>
			    <td height="22" style="font-size:12px" align="center"><a href="/info/infoView.info?idx=<%=item.get("IDX")%>"><%=item.get("COMPANYNAME")%></a></td>
			    <td height="22" style="font-size:12px" align="center"><%=item.get("SAMPLENAME")%></td>
			    <td height="22" style="font-size:12px" align="center"><%=item.get("MACHINENAME")%></td>
			    <td height="22" style="font-size:12px" align="center"><%=item.get("SMPLPOINT")%></td>
			    <td height="22" style="font-size:12px" align="center"><%=item.get("OILTYPE")%></td>
			    <td height="22" style="font-size:12px" align="center"><%=item.get("AUTHORIZER")%></td>
			    <td height="22" style="font-size:12px" align="center"><%=item.get("REGDATE")%></td>
			</tr>
		<%
				}
			}
		%>
    </table>
</body>
</html>