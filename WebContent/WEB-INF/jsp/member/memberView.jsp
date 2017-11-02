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
    Map<String, Object> memberInfo = (Map<String, Object>)request.getAttribute("memberInfo");
    List<Map> customerList = (List<Map>)request.getAttribute("customerList");
%>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#modify").click(function(e) {
    		var modify;
    		modify = confirm("수정하시겠습니까?");
    		
    		if(modify == true) {
    			location.href="/member/memberWrite.info?idx=<%=idx%>";
    		} else {
    			alert("수정이 취소되었습니다.");
    		} 
    	});
    	
    	$("#delete").click(function(e) {
    		var del;
    		del = confirm("삭제하시겠습니까?");
    		
    		if(del == true) {
    			location.href="/member/memberDelete.info?idx=<%=idx%>";
    		} else {
    			alert("삭제가 취소되었습니다.");
    		}
    	});
    	
    	$("#list").click(function(e) {
    		location.href="/member/memberList.info";
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
            <td align="left"><h2 class="pageTitleH1">회원정보</h2></td>
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
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="20%" />
        <col width="*" />
    </colgroup>
        <tr>
            <th class="th02">아이디</th>
            <td height="25" style="font-size: 12px"><%=memberInfo.get("USERID")%></td>
        </tr>
        <tr>
            <th class="th02">이름</th>
            <td height="25" style="font-size: 12px"><%=memberInfo.get("USERNAME")%></td>
        </tr>
        <tr>
            <th class="th02">메일주소</th>
            <td height="25" style="font-size: 12px"><%=memberInfo.get("EMAIL")%></td>
        </tr>
        <tr>
            <th class="th02">주소</th>
            <td height="25" style="font-size: 12px"><%=memberInfo.get("ADDR")%></td>
        </tr>
        <tr>
            <th class="th02">전화번호</th>
            <td height="25" style="font-size: 12px"><%=memberInfo.get("TELNUM")%></td>
        </tr>
        <tr>
            <th class="th02">회원등급</th>
            <td height="25" style="font-size: 12px">
                <% if(("99").equals(memberInfo.get("MEMBGB"))) {%>시스템관리자<%} else if(("88").equals(memberInfo.get("MEMBGB"))) { %>업체관리자<% } else { %>일반사용자<% } %>
            </td>
        </tr>
        <tr>
            <th class="th02">소속회사</th>
            <td>
                <%
                    if(customerList.size() > 0) {
                    	for(int i=0; i < customerList.size(); i++) {
                    		if(memberInfo.get("COMPANYIDX").equals(customerList.get(i).get("IDX").toString())) {
                %>
                    <%=customerList.get(i).get("COMPANYNAME") %>
                <%
                    		}
                    	}
                    }
                %>
            </td>
        </tr>
        <tr>
            <th class="th02">승인유무</th>
            <td height="25" style="font-size: 12px"><% if(("Y").equals(memberInfo.get("USEYN"))) {%>승인<%} else { %>미승인<%} %></td>
        </tr>
        <tr>
            <th class="th02">등록일자</th>
            <td height="25" style="font-size: 12px"><%=memberInfo.get("REGDATE")%></td>
        </tr>
    </table>
    <table width="400" align="center">
        <tr>
            <td colspan="3" height="30"></td>
        </tr>
        <tr>
<%--             <td align="center" height="22" style="font-size:12px"><a href="/member/memberWrite.info?idx=<%=idx%>" style="text-decoration: none;">수정</a></td> --%>
<%--             <td align="center" height="22" style="font-size:12px"><a href="/member/memberDelete.info?idx=<%=idx%>" style="text-decoration: none;">삭제</a></td> --%>
<!--             <td align="center" height="22" style="font-size:12px"><a href="/member/memberList.info" style="text-decoration: none;">돌아가기</a></td> -->
			<td align="center" style="font-size: 12px"><input name="modify" class="btn_style4" id="modify" type="submit" value="정보수정"/></td>
            <td align="center" style="font-size: 12px"><input name="delete" class="btn_style4" id="delete" type="submit" value="정보삭제"/></td>
            <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="list" type="submit" value="돌아가기"/></td>
        </tr>
    </table>
</body>
</html>