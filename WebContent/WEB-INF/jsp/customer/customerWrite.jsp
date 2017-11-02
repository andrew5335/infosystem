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
<%
    String idx = (String)request.getAttribute("idx");
    String type = (String)request.getAttribute("type");
    Map<String, Object> customerInfo = (Map<String, Object>)request.getAttribute("customerInfo");
    
    String companyname = "";
    String companydetail = "";
    String manager = "";
    String part = "";
    String rank = "";
    String phonenm1 = "";
    String phonenm2 = "";
    String email = "";
    String fax = "";
    String addr = "";
    String phonenm3 = "";
    String phonenm4 = "";
    String email2 = "";
    String fax2 = "";
    String settledate = "";
    String infotxt = "입력";
    String comment = "";
    String manager2 = "";
    
    if(customerInfo != null) {
    	
    	companyname = customerInfo.get("COMPANYNAME").toString();
    	companydetail = customerInfo.get("COMPANYDETAIL").toString();
    	manager = customerInfo.get("MANAGER").toString();
    	part = customerInfo.get("PART").toString();
    	rank = customerInfo.get("RANK").toString();
    	phonenm1 = customerInfo.get("PHONENM1").toString();
    	phonenm2 = customerInfo.get("PHONENM2").toString();
    	email = customerInfo.get("EMAIL").toString();
    	fax = customerInfo.get("FAX").toString();
    	addr = customerInfo.get("ADDR").toString();
    	phonenm3 = customerInfo.get("PHONENM3").toString();
    	phonenm4 = customerInfo.get("PHONENM4").toString();
    	email2 = customerInfo.get("EMAIL2").toString();
    	fax2 = customerInfo.get("FAX2").toString();
    	settledate = customerInfo.get("SETTLEDATE").toString();
    	comment = customerInfo.get("COMMENT").toString();
    	manager2 = customerInfo.get("MANAGER2").toString();
    	infotxt = "수정";
    }
%>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">업체 정보 <%=infotxt %></h2></td>
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
    <form name="customerform" action="/customer/customerWriteProcess.info" method="post">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">
    <input type="hidden" id="type" name="type" value="<%=type%>">
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="20%" />
        <col width="*" />
    </colgroup>
        <tr>
            <th colspan="2">고객정보</th>
        </tr>
        <tr>
            <th class="th02">회사명</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="companyname" name="companyname" size="50" value="<%=companyname%>"></td>
        </tr>
        <tr>
            <th class="th02">회사세부정보</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="companydetail" name="companydetail" size="50" value="<%=companydetail%>"></td>
        </tr>
        <tr>
            <th class="th02">담당자</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="manager" name="manager" size="50" value="<%=manager%>"></td>
        </tr>
        <tr>
            <th class="th02">부서명</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="part" name="part" size="50" value="<%=part%>"></td>
        </tr>
        <tr>
            <th class="th02">직책</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="rank" name="rank" size="50" value="<%=rank%>"></td>
        </tr>
        <tr>
            <th class="th02">연락처1</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="phonenm1" name="phonenm1" size="50" value="<%=phonenm1%>"></td>
        </tr>
        <tr>
            <th class="th02">연락처2</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="phonenm2" name="phonenm2" size="50" value="<%=phonenm2%>"></td>
        </tr>
        <tr>
            <th class="th02">E-mail</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="email1" name="email1" size="50" value="<%=email%>"></td>
        </tr>
        <tr>
            <th class="th02">Fax</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="fax1" name="fax1" size="50" value="<%=fax%>"></td>
        </tr>
        <tr>
            <th class="th02">주소</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="addr" name="addr" size="50" value="<%=addr%>"></td>
        </tr>
        <tr>
            <th colspan="2">계산서 담당자 정보</th>
        </tr>
        <tr>
            <th class="th02">담당자</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="manager2" name="manager2" size="50" value="<%=manager2%>"></td>
        </tr>
        <tr>
            <th class="th02">연락처1</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="phonenm3" name="phonenm3" size="50" value="<%=phonenm3%>"></td>
        </tr>
        <tr>
            <th class="th02">연락처2</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="phonenm4" name="phonenm4" size="50" value="<%=phonenm4%>"></td>
        </tr>
        <tr>
            <th class="th02">E-mail</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="email2" name="email2" size="50" value="<%=email2%>"></td>
        </tr>
        <tr>
            <th class="th02">Fax</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="fax2" name="fax2" size="50" value="<%=fax2%>"></td>
        </tr>
        <tr>
            <th class="th02">결제예정일</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="settledate" name="settledate" size="50" value="<%=settledate%>"></td>
        </tr>
        <tr>
            <th colspan="2">기타</th>
        </tr>
        <tr>
            <th class="th02">비고</th>
            <td width="400" style="font-size: 12px"><input class="input01" type="text" id="comment" name="comment" size="50" value="<%=comment%>"></td>
        </tr>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="center"><input name="modify" class="btn_style4" id="modify" type="submit" value="<%=infotxt%>확인"/></td>
        </tr>
    </table>
    </form>
</body>
</html>