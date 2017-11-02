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
    Map<String, Object> customerInfo = (Map<String, Object>)request.getAttribute("customerInfo");
%>
<script type="text/javascript">
    $(document).ready(function() {
    	$("#modify").click(function(e) {
    		var modify;
    		modify = confirm("수정하시겠습니까?");
    		
    		if(modify == true) {
    			location.href="/customer/customerWrite.info?idx=<%=idx%>";
    		} else {
    			alert("수정이 취소되었습니다.");
    		} 
    	});
    	
    	$("#delete").click(function(e) {
    		var del;
    		del = confirm("삭제하시겠습니까?");
    		
    		if(del == true) {
    			location.href="/customer/customerDelete.info?idx=<%=idx%>";
    		} else {
    			alert("삭제가 취소되었습니다.");
    		}
    	});
    	
    	$("#machine").click(function(e) {
    		location.href="/customer/machineList.info?companyIdx=<%=idx%>";
    	});
    	
    	$("#list").click(function(e) {
    		location.href="/customer/customerList.info";
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
            <td align="left"><h2 class="pageTitleH1">업체 정보 보기</h2></td>
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
            <th colspan="2">고객정보</th>
        </tr>
        <tr>
            <th class="th02">회사명</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("COMPANYNAME")%></td>
        </tr>
        <tr>
            <th class="th02">회사세부정보</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("COMPANYDETAIL")%></td>
        </tr>
        <tr>
            <th class="th02">담당자</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("MANAGER")%></td>
        </tr>
        <tr>
            <th class="th02">부서명</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("PART")%></td>
        </tr>
        <tr>
            <th class="th02">직책</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("RANK")%></td>
        </tr>
        <tr>
            <th class="th02">연락처1</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("PHONENM1")%></td>
        </tr>
        <tr>
            <th class="th02">연락처2</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("PHONENM2")%></td>
        </tr>
        <tr>
            <th class="th02">E-mail</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("EMAIL")%></td>
        </tr>
        <tr>
            <th class="th02">Fax</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("FAX")%></td>
        </tr>
        <tr>
            <th class="th02">주소</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("ADDR")%></td>
        </tr>
        <tr>
            <th colspan="2">계산서 담당자 정보</th>
        </tr>
        <tr>
            <th class="th02">담당자</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("MANAGER2")%></td>
        </tr>
        <tr>
            <th class="th02">연락처1</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("PHONENM3")%></td>
        </tr>
        <tr>
            <th class="th02">연락처2</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("PHONENM4")%></td>
        </tr>
        <tr>
            <th class="th02">E-mail</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("EMAIL2")%></td>
        </tr>
        <tr>
            <th class="th02">Fax</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("FAX2")%></td>
        </tr>
        <tr>
            <th class="th02">결제예정일</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("SETTLEDATE")%></td>
        </tr>
        <tr>
            <th colspan="2">기타</th>
        </tr>
        <tr>
            <th class="th02">비고</th>
            <td width="80%" style="font-size: 12px"><%=customerInfo.get("COMMENT")%></td>
        </tr>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="center" style="font-size: 12px"><input name="modify" class="btn_style4" id="modify" type="submit" value="정보수정"/></td>
            <td align="center" style="font-size: 12px"><input name="delete" class="btn_style4" id="delete" type="submit" value="정보삭제"/></td>
            <td align="center" style="font-size: 12px"><input name="machine" class="btn_style4" id="machine" type="submit" value="시료정보"/></td>
            <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="list" type="submit" value="목록보기"/></td>
        </tr>
    </table>
</body>
</html>