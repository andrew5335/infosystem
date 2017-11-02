<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@ page import="java.util.*" %> --%>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><decorator:title default="WearCheck OilTok Report" /></title>
		<!--link type="text/css" rel="stylesheet" href="/css/base.css"/-->	
		<script type="text/javascript" src="/js/common/common.js"></script>
		
		<link type="text/css" rel="stylesheet" href="/styles/base.css" />
		<link type="text/css" rel="stylesheet" href="/styles/jquery-ui.css" />
		<link type="text/css" rel="stylesheet" href="/styles/kendo/kendo.common.min.css" />
		<link type="text/css" rel="stylesheet" href="/styles/kendo/kendo.rtl.min.css" />
		<link type="text/css" rel="stylesheet" href="/styles/kendo/kendo.default.min.css" />
    	<link type="text/css" rel="stylesheet" href="/styles/kendo/kendo.dataviz.min.css" />
    	<link type="text/css" rel="stylesheet" href="/styles/kendo/kendo.dataviz.default.min.css" />
    		
		<script type="text/javascript" src="/js/jquery/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="/js/jquery/jquery-ui.js"></script>
		<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker-ko.min.js"></script>
		<script type="text/javascript" src="/js/kendo/kendo.web.min.js"></script>
		<script type="text/javascript" src="/js/kendo/kendo.culture.ko-KR.min.js"></script>
		<script type="text/javascript" src="/js/common/common.js"></script>
		<script type="text/javascript" src="/js/kendo/kendo.dataviz.min.js"></script>
		<decorator:head />
	</head>
	<body>	
		<div id="popup_mask" style="position:absolute;width:100%;height:100%;left:0;top:0;z-index:50;background-color:#000;display:none;overflow: hidden;"></div>
		<div id="wrapper"> 
			<div id="header">
				<page:applyDecorator name="gnb"/>
			</div>
			<div id="container">
				<div id="snb"> 
					<page:applyDecorator name="info-lnb"/>
				</div>
				<div id="content">
					<decorator:body />
				</div>
			</div>
			<div id="footer">
				<page:applyDecorator name="footer"/>
			</div>
		</div>
		<div id="loadingIndicator" style="display:none"><img src="/images/ajax-loader-1.gif"/></div>
	</body>
</html>