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
	String type = (String)request.getAttribute("type");;
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
            <td align="left"><h2 class="pageTitleH1">회원등록</h2></td>
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
		Map<String, Object> memberInfo = (Map<String, Object>)request.getAttribute("memberInfo");
		List<Map> customerList = (List<Map>)request.getAttribute("customerList");
		
		String userId = "";
		String username = "";
		String email = "";
		String addr = "";
		String telNum = "";
		String membGb = "";
		String useYn = "";
		String companyIdx = "";
		String btnText = "회원등록";
		
		if(memberInfo != null) {
			userId = (String)memberInfo.get("USERID");
			username = (String)memberInfo.get("USERNAME");
			email = (String)memberInfo.get("EMAIL");
			addr = (String)memberInfo.get("ADDR");
			telNum = (String)memberInfo.get("TELNUM");
			membGb = (String)memberInfo.get("MEMBGB");
			useYn = (String)memberInfo.get("USEYN");
			companyIdx = (String)memberInfo.get("COMPANYIDX");
			btnText = "정보수정";
		}
	%>
    <form name="regForm" action="/member/memberWriteProcess.info" method="post">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">
    <input type="hidden" id="type" name="type" value="<%=type%>">
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="20%" />
        <col width="*" />
    </colgroup>
        <tr>
            <th class="th02">아이디</th>
            <td><input type="text" id="userId" name="userId" value="<%=userId %>" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">비밀번호</th>
            <td><input type="password" id="password" name="password" value="" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">이름</th>
            <td><input type="text" id="userName" name="userName" value="<%=username %>" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">메일주소</th>
            <td><input type="text" id="email" name="email" value="<%=email %>" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">주소</th>
            <td><input type="text" id="addr" name="addr" value="<%=addr %>" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">전화번호</th>
            <td><input type="text" id="telNum" name="telNum" value="<%=telNum %>" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">소속회사</th>
            <td>
                <select name="companyIdx" id="companyIdx">
                    <option value=""></option>
                    <%
                        if(customerList.size() <= 0) {
                    %>
                    
                    <%
                        } else {
                        	for(Map item : customerList) {
                    %>
                        <option value="<%=item.get("IDX")%>" <%if(item.get("IDX").toString().equals(companyIdx)) {%>selected<%}%>><%=item.get("COMPANYNAME")%></option>
                    <%
                        	}
                        }
                    %> 
                </select>
            </td>
        </tr>
        <tr>
            <th class="th02">회원등급</th>
            <td>
                <select name="membGb" id="membGb">
                    <option value=""></option>
                    <option value="99" <% if(membGb.equals("99")) { %> selected="selected" <% } %>>시스템관리자</option>
                    <option value="88" <% if(membGb.equals("88")) { %> selected="selected" <% } %>>업체관리자</option>
                    <option value="00" <% if(membGb.equals("00")) { %> selected="selected" <% } %>>일반회원</option>
                </select>
            </td>
        </tr>
        <tr>
            <th class="th02">승인유무</th>
            <td>
                <select name="useYn" id="useYn">
                    <option value=""></option>
                    <option value="Y" <% if(useYn.equals("Y")) { %> selected="selected" <% } %>>승인</option>
                    <option value="N" <% if(useYn.equals("N")) { %> selected="selected" <% } %>>미승인</option>
                </select>
            </td>
        </tr>
    </table>
    <table width="400" align="center">
        <tr>
            <td align="center"><!--input type="submit" id="submit" name="submit" value="<%=btnText %>" style="width: 200px; height:30px;"--><input name="inputok" class="btn_style4" id="inputok" type="submit" value="<%=btnText %>"/></td>
        </tr>
    </table>
    </form>
</body>
</html>