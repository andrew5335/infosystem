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
		
		$("#companyIdx").change(function(){
    		var companyIdx = $(this).val();
    		//alert(companyIdx);
    		$.ajax({
    			type: "POST", 
    			url: "/ajax/machineList.info", 
    			data: "companyIdx="+companyIdx, 
    			success: function(msg){
    				//alert(msg);
    				var resultObj = $.parseJSON(msg);
    				//alert(resultObj);
    				
    				var result = $("#specIdx");
    				result.empty();
    				result.append($("<option value=''></option>"));
    				//alert(resultObj.result.length);
    				for(i=0; i < resultObj.result.length; i++) {
    					//alert(resultObj.result[i].IDX);
    					result.append("<option value='"+resultObj.result[i].IDX+"'>"+resultObj.result[i].MACHINENAME+"</option>");
    					//result.append(
    			        //        $('<option></option>').val(resultObj.result[i].IDX).html(resultObj.result[i].MACHINENAME)
    			        //);

    				}
    				//$("#speciIdx").html(result);
    				$("#specIdx").show();
    			} 
    		});
    	});
		
		$("#specIdx").change(function(){
    		var specIdx = $(this).val();
    		
    		$.ajax({
    			type: "POST", 
    			url: "/ajax/smplList.info", 
    			data: "specIdx="+specIdx, 
    			success: function(msg){
    				var resultObj = $.parseJSON(msg);
    				var result = $("#sampleIdx");
    				result.empty();
    				result.append($("<option value=''></option>"));
    				//alert(resultObj.result.length);
    				for(i=0; i < resultObj.result.length; i++) {
    					//alert(resultObj.result[i].IDX);
    					result.append("<option value='"+resultObj.result[i].IDX+"' >"+resultObj.result[i].SPECINAME+"</option>");
    					//result.append(
    			        //        $('<option></option>').val(resultObj.result[i].IDX).html(resultObj.result[i].SPECINAME)
    			        //);

    				}
    				//$("#speciIdx").html(result);
    				$("#sampleIdx").show();
    			} 
    		});
    	});
		
		$("#sampleIdx").change(function(){
    		var sampleIdx = $(this).val();
    		
    		$.ajax({
    			type: "POST", 
    			url: "/ajax/smplPoint.info", 
    			data: "sampleIdx="+sampleIdx, 
    			success: function(msg){
    				var resultObj = $.parseJSON(msg);
    				//alert(resultObj.result);
    				$("#smplpoint").val(resultObj.result);
    			}
    		});
    	});
		
	});
</script>
</head>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">장비 결과데이터 업로드</h2></td>
        </tr>
        <tr>
            <td height="30">&nbsp;</td>
        </tr>
    </table>
    <form name="deviceForm" action="/device/deviceResultUploadProcess.info" method="POST" enctype="multipart/form-data">
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th>업체명</th>
            <th>장치타입</th>
            <th>시료명</th>
            <th>샘플링포인트</th>
            <th>유종</th>
            <th>담당자</th>
        </tr>
        <tr>
        <%
        	List<Map> customerList = (List)request.getAttribute("customerList");
        %>
            <td style="font-size:12px;" align="center">
                <select name="companyIdx" id="companyIdx">
                    <option value=""></option>
                    <%
                        if(customerList.size() <= 0) {
                    %>
                    
                    <%
                        } else {
                        	for(Map item : customerList) {
                    %>
                        <option value="<%=item.get("IDX")%>"><%=item.get("COMPANYNAME") %></option>
                    <%
                        	}
                        }
                    %>
                    
                </select>
            </td>
            <td style="font-size:12px;" align="center">
                <select id="specIdx" name="specIdx"> 
                </select>
            </td>
            <td style="font-size:12px;" align="center">
                <select id="sampleIdx" name="sampleIdx">
                </select>
            </td>
            <td style="font-size:12px;" align="center"><input type="text" id="smplpoint" name="smplpoint" style="width:80px; height:15px" value=""></td>
            <td style="font-size:12px;" align="center"><input type="text" id="oilType" name="oilType" style="width:80px; height:15px" value=""></td>
            <td style="font-size:12px;" align="center"><input type="text" id="authorizer" name="authorizer" style="width:80px; height:15px" value=""></td>
        </tr>
    </table>
    
    <table class="tableTypeB" width="100%" align="center">
        <tr>
            <th>ISO Result</th>
            <th>NAS Result</th>
            <th>SAE AS Result</th>
        </tr>
        <tr>
            <td><input type="file" id="result1" name="result1"></td>
            <td><input type="file" id="result2" name="result2"></td>
            <td><input type="file" id="result3" name="result3"></td>
        </tr>
    </table>
    
    <table width="100%" align="center">
        <tr>
            <td align="center"><!--input type="submit" value="확인"--><input name="button" class="btn_style4" id="button" type="submit" value="확인"/></td>
        </tr>
    </table>
    </form>
</body>
</html>