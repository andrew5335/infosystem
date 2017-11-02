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
    		location.href="/info/infoWrite.info";
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
    	//alert(idx);
    	location.href="/info/infoView.info?idx=" + idx;
    }
    
    function fileUpload(idx, gu) {
    	window.open("/common/infoUpload.info?idx="+idx+"&gu="+gu, "파일업로드", "width=400, height=200, toolbar=no, menubar=no, scrollbar=no, resizable=yes");
    	
    }
    
    function fileDown(idx, gu) {
    	location.href="/down/infoDown.info?idx="+idx+"&gu="+gu;
    }
</script>
</head>
<%
    String membGb = (String)session.getAttribute("membGb");
%>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">SUOA 리스트</h2></td>
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
            <th>번호</th>
            <th>업체명</th>
            <th>시료명</th>
            <th>장치타입</th>
            <th>샘플링포인트</th>
            <th>유종</th>
            <th>담당자</th>
            <th>등록일자</th>
            <th>결과서다운</th>
            <th>시험성적서다운</th>
        </tr>
<%
	List<Map> infoList = (List)request.getAttribute("infoList");
	int pageCnt = 1;
	int prevPage = 0;
	int prevPage2 = 0;
	int nextPage = 0;
	int nextPage2 = 0;
	int curPage = 0;
	if(request.getAttribute("pageCnt") != null && !("").equals(request.getAttribute("pageCnt"))) {pageCnt = (Integer)request.getAttribute("pageCnt");}
	if(request.getAttribute("prevPage") != null && !("").equals(request.getAttribute("prevPage"))) {prevPage = (Integer)request.getAttribute("prevPage");}
	if(request.getAttribute("prevPage2") != null && !("").equals(request.getAttribute("prevPage2"))) {prevPage2 = (Integer)request.getAttribute("prevPage2");}
	if(request.getAttribute("nextPage") != null && !("").equals(request.getAttribute("nextPage"))) {nextPage = (Integer)request.getAttribute("nextPage");}
	if(request.getAttribute("nextPage2") != null && !("").equals(request.getAttribute("nextPage2"))) {nextPage2 = (Integer)request.getAttribute("nextPage2");}
	if(request.getAttribute("curPage") != null && !("").equals(request.getAttribute("curPage"))) {curPage = (Integer)request.getAttribute("curPage");}
	

	if(infoList.size() <= 0) {
%>
	<tr>
	    <td colspan="7">데이터가 없습니다.</td>
	</tr>
<%
	} else {
		for(Map item : infoList) {
%>
	<tr onmouseover="this.className='on'" onmouseout="this.className='';">
	    <td height="22" style="font-size:12px" align="center"><%=item.get("IDX")%></td>
	    <td height="22" style="font-size:12px" align="center"><a href="/info/infoView.info?idx=<%=item.get("IDX")%>"><%=item.get("COMPANYNAME")%></a></td>
	    <td height="22" style="font-size:12px" align="center"><%=item.get("SAMPLENAME")%></td>
	    <td height="22" style="font-size:12px" align="center"><%=item.get("MACHINENAME")%></td>
	    <td height="22" style="font-size:12px" align="center"><%=item.get("SMPLPOINT")%></td>
	    <td height="22" style="font-size:12px" align="center"><%=item.get("OILTYPE")%></td>
	    <td height="22" style="font-size:12px" align="center"><%=item.get("AUTHORIZER")%></td>
	    <td height="22" style="font-size:12px" align="center"><%=item.get("REGDATE")%></td>
	    <td height="22" style="font-size:12px" align="center">
	        <% if(item.get("RESULT") != null) { %>
	            <a href="javascript:fileDown('<%=item.get("IDX")%>','result');"><input name="complete" class="btn_style6" id="complete" type="submit" value="완료"></a>
	        <%
	            } else { 
	            	if(membGb != null && membGb != "" && Integer.parseInt(membGb) > 80) {
	        %>
	            <a href="javascript:fileUpload('<%=item.get("IDX")%>', 'result');"><input name="upload" class="btn_style1" id="upload" type="submit" value="업로드"/></a>
	        <% 
	            	}
	            } 
	        %>
	    </td>
	    <td height="22" style="font-size:12px" align="center">
	        <% if(item.get("REPORT") != null) { %>
	            <a href="javascript:fileDown('<%=item.get("IDX")%>','report');"><input name="complete" class="btn_style6" id="complete" type="submit" value="완료"></a>
	        <%
	            } else {
	            	if(membGb != null && membGb != "" && Integer.parseInt(membGb) > 80) {
	        %>
	            <a href="javascript:fileUpload('<%=item.get("IDX")%>', 'report');"><input name="upload" class="btn_style1" id="upload" type="submit" value="업로드"/></a>
	        <%
	            	}
	            } 
	        %>
	    </td>
	</tr>
<%
		}
	}
%>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="center">
            <% if(prevPage2 <= 0) {} else { %>
                <a href="/info/infoList.info?page=<%=prevPage2 %>"><%=prevPage2 %></a>
            <% } %>
            <% if(prevPage <= 0) {} else { %>
                <a href="/info/infoList.info?page=<%=prevPage %>"><%=prevPage %></a>
            <% } %>
            <b><a href="/info/infoList.info?page=<%=curPage %>"><%=curPage %></a></b>
            <% 
                if(nextPage > pageCnt) {} else {
            %>
                <a href="/info/infoList.info?page=<%=nextPage %>"><%=nextPage %></a>
            <% } %>
            <% if(nextPage2 > pageCnt) {} else { %>
                <a href="/info/infoList.info?page=<%=nextPage2 %>"><%=nextPage2 %></a>
            <% } %>
            </td>
        </tr>
    </table>
    <table width="100%" align="left">
        <tr>
            <%
                if(membGb != null && membGb != "" && Integer.parseInt(membGb) > 80) {
            %>
                <td align="right" style="font-size:12px"><input name="button" class="btn_style4" id="button" type="submit" value="정보등록"/></td>
            <%
                } else {
            %>
                <td></td>
            <%
                }
            %>
        </tr>
        <tr>
            <td height="20"></td>
        </tr>
    </table>
</body>
</html>