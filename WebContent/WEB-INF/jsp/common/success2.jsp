<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Map<String, Object> successMap = (Map<String, Object>)request.getAttribute("successMap");

    if(successMap.get("url") != "close") {
%>
    <script>
        location.href='<%=successMap.get("url")%>';
    </script>
<%
    } else {
%>
    <script>
        alert('<%=successMap.get("msg")%>');
        window.close();
    </script>
<%
    }
%>
</body>
</html>