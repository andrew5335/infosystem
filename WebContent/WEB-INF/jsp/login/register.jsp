<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<link type="text/css" rel="stylesheet" href="/css/base.css"/>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    	$("#loginBtn").submit(function() {
    		if( $.trim($("#userId").val()) == "" ) {
				alert("아이디를 입력하세요.");
				$("#userId").focus();
				return false;
			}
    		
    		if( $.trim($("#password").val()) == "" ) {
				alert("아이디를 입력하세요.");
				$("#password").focus();
				return false;
			}
    		
    		if( $.trim($("#userName").val()) == "" ) {
				alert("이름을 입력하세요.");
				$("#userName").focus();
				return false;
			}
    		
    		if( $.trim($("#email").val()) == "" ) {
				alert("E-mail주소를 입력하세요.");
				$("#email").focus();
				return false;
			}
    		
    		if( $.trim($("#addr").val()) == "" ) {
				alert("주소를 입력하세요.");
				$("#addr").focus();
				return false;
			}
    		
    		if( $.trim($("#telNum").val()) == "" ) {
				alert("전화번호를 입력하세요.");
				$("#telNum").focus();
				return false;
			}
    	});
    });
</script>
</head>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">회원가입</h2></td>
        </tr>
        <tr>
            <td height="30">&nbsp;</td>
        </tr>
    </table>
    <form name="regForm" action="/login/registerProcess.info" method="post">
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="20%" />
        <col width="*" />
    </colgroup>
        <tr>
            <th class="th02">아이디</td>
            <td><input type="text" id="userId" name="userId" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">비밀번호</td>
            <td><input type="password" id="password" name="password" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">이름</td>
            <td><input type="text" id="userName" name="userName" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">메일주소</td>
            <td><input type="text" id="email" name="email" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">주소</td>
            <td><input type="text" id="addr" name="addr" style="width: 250px; height:20px;"></td>
        </tr>
        <tr>
            <th class="th02">전화번호</td>
            <td><input type="text" id="telNum" name="telNum" style="width: 250px; height:20px;"></td>
        </tr>
    </table>
    <table width="100%" align="center">
        <tr>
            <td align="center"><!--input type="submit" value="확인"--><input name="loginBtn" class="btn_style4" id="loginBtn" type="submit" value="회원가입"/></td>
        </tr>
    </table>
    </form>
</body>
</html>