<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script-->
<script type="text/javascript">
    $(document).ready(function() {
    	$("#logout").click(function(e) {
    		var logout;
    		logout = confirm("로그아웃하시겠습니까?");
    		
    		if(logout == true) {
    			location.href="/login/logout.info";
    		} else {
    			alert("로그아웃이 취소되었습니다.");
    		} 
    	});
    	
    	$("#admin").click(function(){
    			location.href="/manager/main.info";
    	});
    });
</script>
<title>WearCheck OilTok Report</title>
<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
    <tr>
        <td width="50%" align="left">
            <h1><a href="/" title="Wearcheck OilTalk Report"><img src="/images/wearcheck_logo.png" width="80" alt="OilTalk Report System" id="Insert_logo"/>&nbsp;&nbsp;<font style="font-size:14px; font-weight: bold">OilTok Report</font></a></h1>
        </td>
        <td width="50%" align="right">
            <h1><a href="/" title="Solge"><font style="font-size:12px; font-weight: bold">A proud member of Wearcheck international</font>&nbsp;&nbsp;<img src="/images/top_logo_solge2.jpg" width="153" alt="Solge" id="Insert_logo"/></a></h1>
        </td>
    </tr>
</table>
<!--h1><a href="/" title="Wearcheck OilTalk Report System"><img src="/images/wearcheck_logo.png" width="80" alt="OilTalk Report System" id="Insert_logo"/>&nbsp;&nbsp;<font style="font-size:14px; font-weight: bold">OilTalk Report</font></a></h1-->
<%-- <%	if( _userVo != null ) {	%> --%>
<!-- 	<div class="top_menu"> -->
<!-- 		<ul> -->
<%-- 			<li style="padding-top:9px;"><strong><%=_userVo.getUserName() %></strong>님, 환영합니다. </li> --%>
<!-- 			<li><img src="/images/btn_logout.gif"/>" onclick="location.href='/auth/logout"/>';" alt="로그아웃" style="cursor:pointer"/></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<%-- <%	}	%> --%>
<table width="100%" align="center">
    <tr>
        <td align="right">
        <%
            String membGb = "";
            String membGrade = "";
            String companyIdx = "";
            
            if(session != null) {
	            membGb = (String)session.getAttribute("membGb");
	            membGrade = (String)session.getAttribute("membGrade");
	            companyIdx = (String)session.getAttribute("companyIdx");
            } else {
            	
            }
            
            if(!membGb.equals("99")) {} else {
        %>
        <input name="admin" class="btn_style1" id="admin" type="submit" value="관리자"/>
        <%
            }
        %>
        <input name="logout" class="btn_style4" id="logout" type="submit" value="로그아웃"/></td>
    </tr>
</table>