<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<%
	String type = (String)request.getAttribute("type");
	String idx = (String)request.getAttribute("idx");
	Map<String, Object> infoMap = (Map<String, Object>)request.getAttribute("infoMap");
%>
<!-- <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script> -->
<script src="/js/jquery.classyedit.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    	$(".classy-editor").ClassyEdit();
    	
    	$("#chktest").click(function(e) {
    		var chk = $(this).is(":checked");
    		//alert(chk);
    		if(chk) {
    			document.getElementById("testtable").style.display = "";
    		} else {
    			document.getElementById("testtable").style.display = "none";
    		}
    	});
    	
    	$("#condition").click(function(e){
    		var chk = $(this).is(":checked");
    		if(chk) {
    			document.getElementById("conditiontbl").style.display = "";
    		} else {
    			document.getElementById("conditiontbl").style.display = "none";
    		}
    	});
    	
    	$("#contamination").click(function(e){
    		var chk = $(this).is(":checked");
    		if(chk) {
    			document.getElementById("contaminationtbl").style.display = "";
    		} else {
    			document.getElementById("contaminationtbl").style.display = "none";
    		}
    	});
    	
    	$("#wear").click(function(e){
    		var chk = $(this).is(":checked");
    		if(chk) {
    			document.getElementById("weartbl").style.display = "";
    		} else {
    			document.getElementById("weartbl").style.display = "none";
    		}
    	});

		$("input[name=typeChk]").change(function() {
            var radioVal = $(this).val();

			if(radioVal == "A") {
			   document.getElementById("oiltbl").style.display = "";
				document.getElementById("viscotbl").style.display = "";
				document.getElementById("acidtbl").style.display = "";
				document.getElementById("basetbl").style.display = "";
				document.getElementById("addtivestbl").style.display = "";
				document.getElementById("rulertbl").style.display = "";
				document.getElementById("rulertbl2").style.display = "";
				document.getElementById("foamingtbl").style.display = "";
				document.getElementById("watertbl").style.display = "";
				document.getElementById("contaminationtbl").style.display = "";
				document.getElementById("watercontenttbl").style.display = "";
				document.getElementById("particletbl").style.display = "";
				document.getElementById("particlenumtbl").style.display = "";
				document.getElementById("contmetaltbl").style.display = "";
				document.getElementById("membranetbl").style.display = "";
				document.getElementById("phosphatetbl").style.display = "";
				document.getElementById("weartbl").style.display = "";
				document.getElementById("wearmetaltbl").style.display = "";
				document.getElementById("multisourcetbl").style.display = "";
				document.getElementById("ferrousdencitytbl").style.display = "";
				document.getElementById("additional1").style.display = "";
				document.getElementById("additional2").style.display = "";
				document.getElementById("additional3").style.display = "none";
			} else if(radioVal == "B") {
           document.getElementById("oiltbl").style.display = "";    // oil table
				document.getElementById("viscotbl").style.display = "";    // 동점도
				document.getElementById("acidtbl").style.display = "";    // 산가
				document.getElementById("basetbl").style.display = "none";    // 염기가
				document.getElementById("addtivestbl").style.display = "none";    // 원소분석
				document.getElementById("rulertbl").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("rulertbl2").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("foamingtbl").style.display = "none";    // 기포성
				document.getElementById("watertbl").style.display = "none";    // 항유화성
				document.getElementById("contaminationtbl").style.display = "";    // contamination table
				document.getElementById("watercontenttbl").style.display = "";    // 수분
				document.getElementById("particletbl").style.display = "";    // 입자오염도
				document.getElementById("particlenumtbl").style.display = "";    // 입자크기별 개수
				document.getElementById("contmetaltbl").style.display = "none";    // 원소분석 con metal
				document.getElementById("membranetbl").style.display = "none";    // 바니쉬 잠재 위험도
				document.getElementById("phosphatetbl").style.display = "none";    // 바니쉬 잠재 위험도 2
				document.getElementById("weartbl").style.display = "";    // wear table
				document.getElementById("wearmetaltbl").style.display = "none";    // 원소분석 wear metal
				document.getElementById("multisourcetbl").style.display = "none";    // 원소분석 multi source
				document.getElementById("ferrousdencitytbl").style.display = "";    // 철분마모분석
				document.getElementById("additional1").style.display = "none";    // additional 1
				document.getElementById("additional2").style.display = "none";    // additional 2
				document.getElementById("additional3").style.display = "none";
			} else if(radioVal == "C") {
				document.getElementById("oiltbl").style.display = "none";    // oil table
				document.getElementById("viscotbl").style.display = "none";    // 동점도
				document.getElementById("acidtbl").style.display = "none";    // 산가
				document.getElementById("basetbl").style.display = "none";    // 염기가
				document.getElementById("addtivestbl").style.display = "none";    // 원소분석
				document.getElementById("rulertbl").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("rulertbl2").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("foamingtbl").style.display = "none";    // 기포성
				document.getElementById("watertbl").style.display = "none";    // 항유화성
				document.getElementById("contaminationtbl").style.display = "";    // contamination table
				document.getElementById("watercontenttbl").style.display = "";    // 수분
				document.getElementById("particletbl").style.display = "";    // 입자오염도
				document.getElementById("particlenumtbl").style.display = ""; // 입자크기별 개수
				document.getElementById("contmetaltbl").style.display = "";    // 원소분석 con metal
				document.getElementById("membranetbl").style.display = "";    // 바니쉬 잠재 위험도
				document.getElementById("phosphatetbl").style.display = "";    // 바니쉬 잠재 위험도 2
				document.getElementById("weartbl").style.display = "";    // wear table
				document.getElementById("wearmetaltbl").style.display = "";    // 원소분석 wear metal
				document.getElementById("multisourcetbl").style.display = "";    // 원소분석 multi source
				document.getElementById("ferrousdencitytbl").style.display = "";    // 철분마모분석
				document.getElementById("additional1").style.display = "";    // additional 1
				document.getElementById("additional2").style.display = "";    // additional 2
				document.getElementById("additional3").style.display = "none";
			} else if(radioVal == "D") {
				document.getElementById("oiltbl").style.display = "none";    // oil table
				document.getElementById("viscotbl").style.display = "none";    // 동점도
				document.getElementById("acidtbl").style.display = "none";    // 산가
				document.getElementById("basetbl").style.display = "none";    // 염기가
				document.getElementById("addtivestbl").style.display = "none";    // 원소분석
				document.getElementById("rulertbl").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("rulertbl2").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("foamingtbl").style.display = "none";    // 기포성
				document.getElementById("watertbl").style.display = "none";    // 항유화성
				document.getElementById("contaminationtbl").style.display = "none";    // contamination table
				document.getElementById("watercontenttbl").style.display = "none";    // 수분
				document.getElementById("particletbl").style.display = "none";    // 입자오염도
				document.getElementById("particlenumtbl").style.display = "none"; // 입자크기별 개수
				document.getElementById("contmetaltbl").style.display = "none";    // 원소분석 con metal
				document.getElementById("membranetbl").style.display = "none";    // 바니쉬 잠재 위험도
				document.getElementById("phosphatetbl").style.display = "none";    // 바니쉬 잠재 위험도 2
				document.getElementById("weartbl").style.display = "none";    // wear table
				document.getElementById("wearmetaltbl").style.display = "none";    // 원소분석 wear metal
				document.getElementById("multisourcetbl").style.display = "none";    // 원소분석 multi source
				document.getElementById("ferrousdencitytbl").style.display = "none";    // 철분마모분석
				document.getElementById("additional1").style.display = "";    // additional 1
				document.getElementById("additional2").style.display = "";    // additional 2
				document.getElementById("additional3").style.display = "none";
			} else {
				document.getElementById("oiltbl").style.display = "none";    // oil table
				document.getElementById("viscotbl").style.display = "none";    // 동점도
				document.getElementById("acidtbl").style.display = "none";    // 산가
				document.getElementById("basetbl").style.display = "none";    // 염기가
				document.getElementById("addtivestbl").style.display = "none";    // 원소분석
				document.getElementById("rulertbl").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("rulertbl2").style.display = "none";    // 사용유 잔존 수명평가
				document.getElementById("foamingtbl").style.display = "none";    // 기포성
				document.getElementById("watertbl").style.display = "none";    // 항유화성
				document.getElementById("contaminationtbl").style.display = "none";    // contamination table
				document.getElementById("watercontenttbl").style.display = "none";    // 수분
				document.getElementById("particletbl").style.display = "none";    // 입자오염도
				document.getElementById("particlenumtbl").style.display = "none"; // 입자크기별 개수
				document.getElementById("contmetaltbl").style.display = "none";    // 원소분석 con metal
				document.getElementById("membranetbl").style.display = "none";    // 바니쉬 잠재 위험도
				document.getElementById("phosphatetbl").style.display = "none";    // 바니쉬 잠재 위험도 2
				document.getElementById("weartbl").style.display = "none";    // wear table
				document.getElementById("wearmetaltbl").style.display = "none";    // 원소분석 wear metal
				document.getElementById("multisourcetbl").style.display = "none";    // 원소분석 multi source
				document.getElementById("ferrousdencitytbl").style.display = "none";    // 철분마모분석
				document.getElementById("additional1").style.display = "none";    // additional 1
				document.getElementById("additional2").style.display = "none";    // additional 2
				document.getElementById("additional3").style.display = "";
			}
		});
    	
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
    
    function openDoc() {
    	if(document.getElementById("idx").value == "") {
    		document.getElementById("contaminationtbl").style.display = "none";
    		document.getElementById("conditiontbl").style.display = "none";
    		document.getElementById("weartbl").style.display = "none";
    	} else {
    		document.getElementById("contaminationtbl").style.display = "";
    		document.getElementById("conditiontbl").style.display = "";
    		document.getElementById("weartbl").style.display = "";
    	}
    }
</script>
<link rel="stylesheet" type="text/css" href="/css/jquery.classyedit.css" />
</head>
<%
    String membGb = (String)session.getAttribute("membGb");
%>
<body onload="openDoc();">
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">Report Data 입력</h2></td>
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
<%
    if(infoMap != null) {
%>
<script>
	function getCompanyVal(machinename) {
		var tmpcompanyIdx = document.getElementById("companyIdx");
		var companyIdx = tmpcompanyIdx.options[tmpcompanyIdx.selectedIndex].value;
		var specIdx;
		//alert(machinename);
		//alert(companyIdx.options[companyIdx.selectedIndex].value);
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
					if(machinename != resultObj.result[i].MACHINENAME) {
						result.append("<option value='"+resultObj.result[i].IDX+"'>"+resultObj.result[i].MACHINENAME+"</option>");
				    } else {
				    	result.append("<option value='"+resultObj.result[i].IDX+"' selected>"+resultObj.result[i].MACHINENAME+"</option>");
				    	specIdx = resultObj.result[i].IDX;
				    }
					//result.append(
			        //        $('<option></option>').val(resultObj.result[i].IDX).html(resultObj.result[i].MACHINENAME)
			        //);
				}
				//$("#speciIdx").html(result);
				//alert(specIdx);
	
				getSpecVal(specIdx, "<%=infoMap.get("SAMPLENAME")%>");
				$("#specIdx").show();
			} 
		});
	}
	
	function getSpecVal(specIdx, specname) {
		
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
					if(specname != resultObj.result[i].SPECINAME) {
						result.append("<option value='"+resultObj.result[i].IDX+"' >"+resultObj.result[i].SPECINAME+"</option>");
					} else {
						result.append("<option value='"+resultObj.result[i].IDX+"' selected>"+resultObj.result[i].SPECINAME+"</option>");
					}
					//result.append(
			        //        $('<option></option>').val(resultObj.result[i].IDX).html(resultObj.result[i].SPECINAME)
			        //);
	
				}
				//$("#speciIdx").html(result);
				$("#sampleIdx").show();
			} 
		});
	}
</script>
    <form name="infoForm" action="/info/infoWriteProcess.info" method="POST" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="<%=type%>">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">

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
                        <option value="<%=item.get("IDX")%>" <%if(item.get("COMPANYNAME").toString().equals(infoMap.get("COMPANYNAME").toString())) {%>selected<%}%>><%=item.get("COMPANYNAME")%></option>
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
            <td style="font-size:12px;" align="center"><input type="text" id="smplpoint" name="smplpoint" style="width:80px; height:15px" value="<%=infoMap.get("SMPLPOINT")%>"></td>
            <td style="font-size:12px;" align="center"><input type="text" id="oilType" name="oilType" style="width:80px; height:15px" value="<%=infoMap.get("OILTYPE")%>"></td>
            <td style="font-size:12px;" align="center"><input type="text" id="authorizer" name="authorizer" style="width:80px; height:15px" value="<%=infoMap.get("AUTHORIZER")%>"></td>
        </tr>
    </table>
<script>
getCompanyVal("<%=infoMap.get("MACHINENAME")%>");
</script> 

    <table class="tableTypeB" width="100%" align="center">
        <tr>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="A">A. 전체폼</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="B">B. 기본분석</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="C">C. Contamination, Wear</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="D">D. 추가분석</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="E">E. 그리스분석</th>
		  </tr>
    </table>

    <table class="tableTypeB" width="100%" align="center" id="oiltbl" name="oiltbl">
        <tr>
            <th width="100%">OIL Condition</th>
        </tr>
    </table>
    
    <table class="tableTypeC" id="viscotbl" name="viscotbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">동점도 Viscosity (cSt)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity@40℃</td>
            <td><input type="text" id="viscosity40" name="viscosity40" style="width:266px; height:15px" value="<%=infoMap.get("VISCOSITY40")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity@100℃</td>
            <td><input type="text" id="viscosity100" name="viscosity100" style="width:266px; height:15px" value="<%=infoMap.get("VISCOSITY100")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index</td>
            <td><input type="text" id="viscosityindex" name="viscosityindex" style="width:266px; height:15px" value="<%=infoMap.get("VISCOSITYINDEX")%>"></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="acidtbl" name="acidtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">산가 Acid Number (mgKOH/g)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Acid Number</td>
            <td><input type="text" id="acidnumber" name="acidnumber" style="width:200px; height:15px" value="<%=infoMap.get("ACIDNUMBER")%>"></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="basetbl" name="basetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">염기가 Base Number (mgKOH/g)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Base Number</td>
            <td><input type="text" id="basenumber" name="basenumber" style="width:200px; height:15px" value="<%=infoMap.get("BASENUMBER")%>"></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="addtivestbl" name="addtivestbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Magnesium (Mg)</td>
            <td><input type="text" id="mgrde" name="mgrde" style="width:200px; height:15px" value="<%=infoMap.get("MGRDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Calcium (Ca)</td>
            <td><input type="text" id="carde" name="carde" style="width:200px; height:15px" value="<%=infoMap.get("CARDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Barium (Ba)</td>
            <td><input type="text" id="barde" name="barde" style="width:200px; height:15px" value="<%=infoMap.get("BARDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phosphorus (P)</td>
            <td><input type="text" id="prde" name="prde" style="width:200px; height:15px" value="<%=infoMap.get("PRDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Zinc (Zn)</td>
            <td><input type="text" id="znrde" name="znrde" style="width:200px; height:15px" value="<%=infoMap.get("ZNRDE")%>"></td>
        </tr>
    </table>

    <table class="tableTypeC" id="rulertbl" name="rulertbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">사용유 잔존 수명평가 Remaining Useful Life; RULER (%)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RUL1_Peak1</td>
            <td><input type="text" id="rul1peak" name="rul1peak" style="width:200px; height:15px" value="<%=infoMap.get("RUL1PEAK")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RUL2_Peak2</td>
            <td><input type="text" id="rul2peak" name="rul2peak" style="width:200px; height:15px" value="<%=infoMap.get("RUL2PEAK")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="rulertbl2" name="rulertbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">사용유 잔존 수명평가 Remaining Useful Life; RULER (R/N)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RULER NUMBER</td>
            <td><input type="text" id="rulernumber" name="rulernumber" style="width:200px; height:15px" value="<%=infoMap.get("RULERNUMBER")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="foamingtbl" name="foamingtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">기포성 Foaming characteristic of oil (ml)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">24℃</td>
            <td><input type="text" id="tendency" name="tendency" style="width:200px; height:15px" value="<%=infoMap.get("TENDENCY")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">93.5℃</td>
            <td><input type="text" id="stability" name="stability" style="width:200px; height:15px" value="<%=infoMap.get("STABILITY")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">24℃</td>
            <td><input type="text" id="nil" name="nil" style="width:200px; height:15px" value="<%=infoMap.get("NIL")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="watertbl" name="watertbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">항유화성 Water separability (min)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water separability</td>
            <td><input type="text" id="waterseparability" name="waterseparability" style="width:200px; height:15px" value="<%=infoMap.get("WATERSEPARABILITY")%>"></td>
        </tr>
    </table>

	<table width="100%" align="center">
	    <tr>
            <td height="10"></td>
		</tr>
	</table>

	<table class="tableTypeB" width="100%" align="center" id="contaminationtbl" name="contaminationtbl">
        <tr>
            <th width="100%">Contamination</th>
        </tr>
    </table>

	<table class="tableTypeC" id="watercontenttbl" name="watercontenttbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">수분 Water Content (ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water</td>
            <td><input type="text" id="water" name="water" style="width:200px; height:15px" value="<%=infoMap.get("WATER")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="particletbl" name="particletbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">입자오염도 Particle Count </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">ISO 4406</td>
            <td><input type="text" id="iso" name="iso" style="width:200px; height:15px" value="<%=infoMap.get("ISO1")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">NAS 1638</td>
            <td><input type="text" id="nas" name="nas" style="width:200px; height:15px" value="<%=infoMap.get("NAS")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">SAE AS 4059</td>
            <td><input type="text" id="sae" name="sae" style="width:200px; height:15px" value="<%=infoMap.get("SAE")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="particlenumtbl" name="particlenumtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">입자크기별(㎛) 개수(Number of particles/ml) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>4um (c)</td>
            <td><input type="text" id="p4um" name="p4um" style="width:200px; height:15px" value="<%=infoMap.get("P4UM")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>6um (c)</td>
            <td><input type="text" id="p6um" name="p6um" style="width:200px; height:15px" value="<%=infoMap.get("P6UM")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>14um (c)</td>
            <td><input type="text" id="p14um" name="p14um" style="width:200px; height:15px" value="<%=infoMap.get("P14UM")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>21um (c)</td>
            <td><input type="text" id="p21um" name="p21um" style="width:200px; height:15px" value="<%=infoMap.get("P21UM")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>38um (c)</td>
            <td><input type="text" id="p38um" name="p38um" style="width:200px; height:15px" value="<%=infoMap.get("P38UM")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>70um (c)</td>
            <td><input type="text" id="p70um" name="p70um" style="width:200px; height:15px" value="<%=infoMap.get("P70UM")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="contmetaltbl" name="contmetaltbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Contamination Metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Silicon (Si)</td>
            <td><input type="text" id="siliconrde" name="siliconrde" style="width:200px; height:15px" value="<%=infoMap.get("SILICONRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sodium (Na)</td>
            <td><input type="text" id="sodiumrde" name="sodiumrde" style="width:200px; height:15px" value="<%=infoMap.get("SODIUMRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Potassium (K)</td>
            <td><input type="text" id="potassiumrde" name="potassiumrde" style="width:200px; height:15px" value="<%=infoMap.get("POTASSIUM")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="membranetbl" name="membranetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">바니쉬 잠재 위험도 Membrane Patch Colorimetry </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">MPC Value</td>
            <td><input type="text" id="mpcval" name="mpcval" style="width:200px; height:15px" value="<%=infoMap.get("MPCVAL")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">patch</td>
            <td><input type="file" id="uPatch" name="uPatch" style="width:200px; height:15px"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="phosphatetbl" name="phosphatetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">바니쉬 잠재 위험도 MPC for Phosphate Ester Fluids (Patch wt(mg))</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">MPC weight</td>
            <td><input type="text" id="mpcweight" name="mpcweight" style="width:200px; height:15px" value="<%=infoMap.get("MPCWEIGHT")%>"></td>
        </tr>
    </table>

	<table width="100%" align="center">
	    <tr>
            <td height="10"></td>
		</tr>
	</table>

	<table class="tableTypeB" width="100%" align="center" id="weartbl" name="weartbl">
        <tr>
            <th width="100%">Wear</th>
        </tr>
    </table>

	<table class="tableTypeC" id="wearmetaltbl" name="wearmetaltbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Wear metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Iron (Fe)</td>
            <td><input type="text" id="ferde" name="ferde" style="width:200px; height:15px" value="<%=infoMap.get("FERDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chrome (Cr)</td>
            <td><input type="text" id="crrde" name="crrde" style="width:200px; height:15px" value="<%=infoMap.get("CRRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Aluminum (Al)</td>
            <td><input type="text" id="alrde" name="alrde" style="width:200px; height:15px" value="<%=infoMap.get("ALRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Copper (Cu)</td>
            <td><input type="text" id="curde" name="curde" style="width:200px; height:15px" value="<%=infoMap.get("CURDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Lead (Pb)</td>
            <td><input type="text" id="pbrde" name="pbrde" style="width:200px; height:15px" value="<%=infoMap.get("PBRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Tin (Sn)</td>
            <td><input type="text" id="snrde" name="snrde" style="width:200px; height:15px" value="<%=infoMap.get("SNRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Vanadium (V)</td>
            <td><input type="text" id="vrde" name="vrde" style="width:200px; height:15px" value="<%=infoMap.get("VRDE")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Multi-Source metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Titanium (Ti)</td>
            <td><input type="text" id="tirde" name="tirde" style="width:200px; height:15px" value="<%=infoMap.get("TIRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Molybdenum (Mo)</td>
            <td><input type="text" id="morde" name="morde" style="width:200px; height:15px" value="<%=infoMap.get("MORDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nickel (Ni)</td>
            <td><input type="text" id="nirde" name="nirde" style="width:200px; height:15px" value="<%=infoMap.get("NIRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Manganese (Mn)</td>
            <td><input type="text" id="mnrde" name="mnrde" style="width:200px; height:15px" value="<%=infoMap.get("MNRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Boron (B)</td>
            <td><input type="text" id="boronrde" name="boronrde" style="width:200px; height:15px" value="<%=infoMap.get("BORONRDE")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="ferrousdencitytbl" name="ferrousdencitytbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">철분마모분석 Particle Quantifier ; Ferrous Density</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">PQ index</td>
            <td><input type="text" id="pqindex" name="pqindex" style="width:200px; height:15px" value="<%=infoMap.get("PQINDEX")%>"></td>
        </tr>
    </table>

    <div id="additional1" name="additional1">
		<table width="100%" align="center">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
	
		<table class="tableTypeB" width="100%" align="center">
			<tr>
				<th width="100%">Additional Test</th>
			</tr>
		</table>

		<table class="tableTypeC" id="gravitytbl" name="gravitytbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">비중 Specific Gravity</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Specific Gravity</td>
				<td><input type="text" id="specificgravity" name="specificgravity" style="width:200px; height:15px" value="<%=infoMap.get("SPECIFICGRAVITY")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">유동점 Pour point (Celsius)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Pour point </td>
				<td><input type="text" id="pourpoint" name="pourpoint" style="width:200px; height:15px" value="<%=infoMap.get("POURPOINT")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">인화점 Flash point (Celsius) ; Clevenland open cup</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Flash point</td>
				<td><input type="text" id="flashpoint" name="flashpoint" style="width:200px; height:15px" value="<%=infoMap.get("FLASHPOINT")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">인화점 Flash point (Celsius) ; Pensky-martens closed cup</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Flash point</td>
				<td><input type="text" id="flashpoint2" name="flashpoint2" style="width:200px; height:15px" value="<%=infoMap.get("FLASHPOINT2")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">염소분 Chlorine (ppm)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chlorine</td>
				<td><input type="text" id="chlorine" name="chlorine" style="width:200px; height:15px" value="<%=infoMap.get("CHLORINE")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Blotter spot test</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" id="uBlotter" name="uBlotter" style="width:200px; height:15px"></td>
			</tr>
		</table>
	</div>

	<div id="additional2" name="additional2">
		<table width="100%" align="center">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
	
		<table class="tableTypeB" width="100%" align="center">
			<tr>
				<th width="100%">Additional Test</th>
			</tr>
		</table>

        <table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">FT-IR ; Additives Abs </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Amine Antioxidant</td>
				<td><input type="text" id="abs1" name="abs1" style="width:200px; height:15px" value="<%=infoMap.get("ABS1")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Amine Antioxidant Ⅱ</td>
				<td><input type="text" id="abs2" name="abs2" style="width:200px; height:15px" value="<%=infoMap.get("ABS2")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM</td>
				<td><input type="text" id="abs3" name="abs3" style="width:200px; height:15px" value="<%=infoMap.get("ABS3")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM Ⅱ</td>
				<td><input type="text" id="abs4" name="abs4" style="width:200px; height:15px" value="<%=infoMap.get("ABS4")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM Ⅲ</td>
				<td><input type="text" id="abs5" name="abs5" style="width:200px; height:15px" value="<%=infoMap.get("ABS5")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Demulsifier</td>
				<td><input type="text" id="abs6" name="abs6" style="width:200px; height:15px" value="<%=infoMap.get("ABS6")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Dispersant (Succinimide)</td>
				<td><input type="text" id="abs7" name="abs7" style="width:200px; height:15px" value="<%=infoMap.get("ABS7")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Extreme Pressure</td>
				<td><input type="text" id="abs8" name="abs8" style="width:200px; height:15px" value="<%=infoMap.get("ABS8")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phenol Antioxidant</td>
				<td><input type="text" id="abs9" name="abs9" style="width:200px; height:15px" value="<%=infoMap.get("ABS9")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phenol Antioxidant (Polyol ester fluids)</td>
				<td><input type="text" id="abs10" name="abs10" style="width:200px; height:15px" value="<%=infoMap.get("ABS10")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Pour Point Depressant/Ⅶ(Polymethacrylate)</td>
				<td><input type="text" id="abs11" name="abs11" style="width:200px; height:15px" value="<%=infoMap.get("ABS11")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Rust Inhibitor (Succinic acid)</td>
				<td><input type="text" id="abs12" name="abs12" style="width:200px; height:15px" value="<%=infoMap.get("ABS12")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index Improver (Polyisobutene)</td>
				<td><input type="text" id="abs13" name="abs13" style="width:200px; height:15px" value="<%=infoMap.get("ABS13")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index Improver (Polymethacrylate)</td>
				<td><input type="text" id="abs14" name="abs14" style="width:200px; height:15px" value="<%=infoMap.get("ABS14")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">FT-IR ; Contamination (Abs) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Detergent(sulfonate)</td>
				<td><input type="text" id="coabs1" name="coabs1" style="width:200px; height:15px" value="<%=infoMap.get("COABS1")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Diesel ASTM</td>
				<td><input type="text" id="coabs2" name="coabs2" style="width:200px; height:15px" value="<%=infoMap.get("COABS2")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Ethylene Glycol Coolant ASTM</td>
				<td><input type="text" id="coabs3" name="coabs3" style="width:200px; height:15px" value="<%=infoMap.get("COABS3")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Fatty Acids</td>
				<td><input type="text" id="coabs4" name="coabs4" style="width:200px; height:15px" value="<%=infoMap.get("COABS4")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Fluid Contamination ASTM </td>
				<td><input type="text" id="coabs5" name="coabs5" style="width:200px; height:15px" value="<%=infoMap.get("COABS5")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Gasoline ASTM</td>
				<td><input type="text" id="coabs6" name="coabs6" style="width:200px; height:15px" value="<%=infoMap.get("COABS6")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nitration ASTM</td>
				<td><input type="text" id="coabs7" name="coabs7" style="width:200px; height:15px" value="<%=infoMap.get("COABS7")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Oxidation ASTM</td>
				<td><input type="text" id="coabs8" name="coabs8" style="width:200px; height:15px" value="<%=infoMap.get("COABS8")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Soot Loading ASTM</td>
				<td><input type="text" id="coabs9" name="coabs9" style="width:200px; height:15px" value="<%=infoMap.get("COABS9")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sulfate by products ASTM</td>
				<td><input type="text" id="coabs10" name="coabs10" style="width:200px; height:15px" value="<%=infoMap.get("COABS10")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Synthetic Lue Breakdown Ⅰ ASTM</td>
				<td><input type="text" id="coabs11" name="coabs11" style="width:200px; height:15px" value="<%=infoMap.get("COABS11")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Synthetic Lue BreakdownⅡ ASTM</td>
				<td><input type="text" id="coabs12" name="coabs12" style="width:200px; height:15px" value="<%=infoMap.get("COABS12")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Petroluem  EP Fluid)</td>
				<td><input type="text" id="coabs13" name="coabs13" style="width:200px; height:15px" value="<%=infoMap.get("COABS13")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Petroluem  Lubricant)</td>
				<td><input type="text" id="coabs14" name="coabs14" style="width:200px; height:15px" value="<%=infoMap.get("COABS14")%>"></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Polyol Ester Fluids)</td>
				<td><input type="text" id="coabs15" name="coabs15" style="width:200px; height:15px" value="<%=infoMap.get("COABS15")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Patch test</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" id="uPatchTest" name="uPatchTest" style="width:200px; height:15px"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Insolubles test for Phosphate Ester Fluids </td>
			</tr>
			<tr>
			    <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Insolubles test</td>
				<td><input type="file" id="uInsoluble" name="uInsoluble" style="width:200px; height:15px"></td>
			</tr>
		</table>

    </div>
    
    <div id="additional3" name="additional3">
		<table width="100%" align="center">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
	
		<table class="tableTypeB" width="100%" align="center">
			<tr>
				<th width="100%">Additional Test</th>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">적점 Dropping Point (Celsius)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Dropping Point  </td>
				<td><input type="text" id="droppoint" name="droppoint" style="width:200px; height:15px" value="<%=infoMap.get("DROPPOINT")%>"></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">주도 Penetration (mm) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Penetration   </td>
				<td><input type="text" id="penetration" name="penetration" style="width:200px; height:15px" value="<%=infoMap.get("PENETRATION")%>"></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">이유도 Oil Separation @100℃ (wt %) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Oil Separation @100℃   </td>
				<td><input type="text" id="oilseparation" name="oilseparation" style="width:200px; height:15px" value="<%=infoMap.get("OILSEPARATION")%>"></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="contmetaltbl2" name="contmetaltbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Contamination Metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Silicon (Si)</td>
            <td><input type="text" id="siliconrde" name="siliconrde" style="width:200px; height:15px" value="<%=infoMap.get("SILICONRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sodium (Na)</td>
            <td><input type="text" id="sodiumrde" name="sodiumrde" style="width:200px; height:15px" value="<%=infoMap.get("SODIUMRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Potassium (K)</td>
            <td><input type="text" id="potassiumrde" name="potassiumrde" style="width:200px; height:15px" value="<%=infoMap.get("POTASSIUMRDE")%>"></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="addtivestbl2" name="addtivestbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Magnesium (Mg)</td>
            <td><input type="text" id="mgrde" name="mgrde" style="width:200px; height:15px" value="<%=infoMap.get("MGRDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Calcium (Ca)</td>
            <td><input type="text" id="carde" name="carde" style="width:200px; height:15px" value="<%=infoMap.get("CARDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Barium (Ba)</td>
            <td><input type="text" id="barde" name="barde" style="width:200px; height:15px" value="<%=infoMap.get("BARDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phosphorus (P)</td>
            <td><input type="text" id="prde" name="prde" style="width:200px; height:15px" value="<%=infoMap.get("PRDE")%>"></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Zinc (Zn)</td>
            <td><input type="text" id="znrde" name="znrde" style="width:200px; height:15px" value="<%=infoMap.get("ZNRDE")%>"></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="wearmetaltbl2" name="wearmetaltbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Wear metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Iron (Fe)</td>
            <td><input type="text" id="ferde" name="ferde" style="width:200px; height:15px" value="<%=infoMap.get("FERDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chrome (Cr)</td>
            <td><input type="text" id="crrde" name="crrde" style="width:200px; height:15px" value="<%=infoMap.get("CRRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Aluminum (Al)</td>
            <td><input type="text" id="alrde" name="alrde" style="width:200px; height:15px" value="<%=infoMap.get("ALRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Copper (Cu)</td>
            <td><input type="text" id="curde" name="curde" style="width:200px; height:15px" value="<%=infoMap.get("CURDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Lead (Pb)</td>
            <td><input type="text" id="pbrde" name="pbrde" style="width:200px; height:15px" value="<%=infoMap.get("PBRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Tin (Sn)</td>
            <td><input type="text" id="snrde" name="snrde" style="width:200px; height:15px" value="<%=infoMap.get("SNRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Vanadium (V)</td>
            <td><input type="text" id="vrde" name="vrde" style="width:200px; height:15px" value="<%=infoMap.get("VRDE")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="multisourcetbl2" name="multisourcetbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Multi-Source metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Titanium (Ti)</td>
            <td><input type="text" id="tirde" name="tirde" style="width:200px; height:15px" value="<%=infoMap.get("TIRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Molybdenum (Mo)</td>
            <td><input type="text" id="morde" name="morde" style="width:200px; height:15px" value="<%=infoMap.get("MORDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nickel (Ni)</td>
            <td><input type="text" id="nirde" name="nirde" style="width:200px; height:15px" value="<%=infoMap.get("NIRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Manganese (Mn)</td>
            <td><input type="text" id="mnrde" name="mnrde" style="width:200px; height:15px" value="<%=infoMap.get("MNRDE")%>"></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Boron (B)</td>
            <td><input type="text" id="boronrde" name="boronrde" style="width:200px; height:15px" value="<%=infoMap.get("BORONRDE")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="ferrousdencitytbl2" name="ferrousdencitytbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">철분마모분석 Particle Quantifier ; Ferrous Density</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">PQ index</td>
            <td><input type="text" id="pqindex" name="pqindex" style="width:200px; height:15px" value="<%=infoMap.get("PQINDEX")%>"></td>
        </tr>
    </table>
		
	</div>
	
	<table class="tableTypeC" id="additionalInfo" name="additionalInfo" width="100%" align="center" style="display:block;">
	    <tr>
	        <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">신규 항목 추가</td>
	    </tr>
	    <tr>
	        <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">항목명</td>
	        <td><input type="text" id="addField" name="addField" style="width:200px; height:15px" value="<%=infoMap.get("ADDFIELD")%>"></td>
	    </tr>
	    <tr>
	        <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">항목 내용</td>
	        <td>
	            <textarea class="classy-editor" name="content" id="content" rows="22" style="width:645px;"><%=infoMap.get("ADDFIELDCON") %></textarea>
	        </td>
	    </tr>
	</table>

<%
    } else {
%>

    <form name="infoForm" action="/info/infoWriteProcess.info" method="POST" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="<%=type%>">
    <input type="hidden" id="idx" name="idx" value="<%=idx%>">

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
                        <option value="<%=item.get("IDX")%>" ><%=item.get("COMPANYNAME")%></option>
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
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="A">A. 전체폼</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="B">B. 기본분석</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="C">C. Contamination, Wear</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="D">D. 추가분석</th>
		      <th style="font-size:12px;" align="center" width="20%"><input type="radio" id="typeChk" name="typeChk" value="E">E. 그리스분석</th>
		  </tr>
    </table>

    <table class="tableTypeB" width="100%" align="center" id="oiltbl" name="oiltbl">
        <tr>
            <th width="100%">OIL Condition</th>
        </tr>
    </table>
    
    <table class="tableTypeC" id="viscotbl" name="viscotbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">동점도 Viscosity (cSt)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity@40℃</td>
            <td><input type="text" id="viscosity40" name="viscosity40" style="width:266px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity@100℃</td>
            <td><input type="text" id="viscosity100" name="viscosity100" style="width:266px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index</td>
            <td><input type="text" id="viscosityindex" name="viscosityindex" style="width:266px; height:15px" value=""></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="acidtbl" name="acidtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">산가 Acid Number (mgKOH/g)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Acid Number</td>
            <td><input type="text" id="acidnumber" name="acidnumber" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="basetbl" name="basetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">염기가 Base Number (mgKOH/g)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Base Number</td>
            <td><input type="text" id="basenumber" name="basenumber" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="addtivestbl" name="addtivestbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Magnesium (Mg)</td>
            <td><input type="text" id="mgrde" name="mgrde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Calcium (Ca)</td>
            <td><input type="text" id="carde" name="carde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Barium (Ba)</td>
            <td><input type="text" id="barde" name="barde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phosphorus (P)</td>
            <td><input type="text" id="prde" name="prde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Zinc (Zn)</td>
            <td><input type="text" id="znrde" name="znrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

    <table class="tableTypeC" id="rulertbl" name="rulertbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">사용유 잔존 수명평가 Remaining Useful Life; RULER (%)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RUL1_Peak1</td>
            <td><input type="text" id="rul1peak" name="rul1peak" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RUL2_Peak2</td>
            <td><input type="text" id="rul2peak" name="rul2peak" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="rulertbl2" name="rulertbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">사용유 잔존 수명평가 Remaining Useful Life; RULER (R/N)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RULER NUMBER</td>
            <td><input type="text" id="rulernumber" name="rulernumber" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="foamingtbl" name="foamingtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">기포성 Foaming characteristic of oil (ml)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">24℃</td>
            <td><input type="text" id="tendency" name="tendency" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">93.5℃</td>
            <td><input type="text" id="stability" name="stability" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">24℃</td>
            <td><input type="text" id="nil" name="nil" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="watertbl" name="watertbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">항유화성 Water separability (min)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water separability</td>
            <td><input type="text" id="waterseparability" name="waterseparability" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table width="100%" align="center">
	    <tr>
            <td height="10"></td>
		</tr>
	</table>

	<table class="tableTypeB" width="100%" align="center" id="contaminationtbl" name="contaminationtbl">
        <tr>
            <th width="100%">Contamination</th>
        </tr>
    </table>

	<table class="tableTypeC" id="watercontenttbl" name="watercontenttbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">수분 Water Content (ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water</td>
            <td><input type="text" id="water" name="water" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="particletbl" name="particletbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">입자오염도 Particle Count </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">ISO 4406</td>
            <td><input type="text" id="iso" name="iso" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">NAS 1638</td>
            <td><input type="text" id="nas" name="nas" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">SAE AS 4059</td>
            <td><input type="text" id="sae" name="sae" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="particlenumtbl" name="particlenumtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">입자크기별(㎛) 개수(Number of particles/ml) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>4um (c)</td>
            <td><input type="text" id="p4um" name="p4um" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>6um (c)</td>
            <td><input type="text" id="p6um" name="p6um" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>14um (c)</td>
            <td><input type="text" id="p14um" name="p14um" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>21um (c)</td>
            <td><input type="text" id="p21um" name="p21um" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>38um (c)</td>
            <td><input type="text" id="p38um" name="p38um" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>70um (c)</td>
            <td><input type="text" id="p70um" name="p70um" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="contmetaltbl" name="contmetaltbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Contamination Metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Silicon (Si)</td>
            <td><input type="text" id="siliconrde" name="siliconrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sodium (Na)</td>
            <td><input type="text" id="sodiumrde" name="sodiumrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Potassium (K)</td>
            <td><input type="text" id="potassiumrde" name="potassiumrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="membranetbl" name="membranetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">바니쉬 잠재 위험도 Membrane Patch Colorimetry </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">MPC Value</td>
            <td><input type="text" id="mpcval" name="mpcval" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">patch</td>
            <td><input type="file" id="uPatch" name="uPatch" style="width:200px; height:15px"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="phosphatetbl" name="phosphatetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">바니쉬 잠재 위험도 MPC for Phosphate Ester Fluids (Patch wt(mg))</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">MPC weight</td>
            <td><input type="text" id="mpcweight" name="mpcweight" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table width="100%" align="center">
	    <tr>
            <td height="10"></td>
		</tr>
	</table>

	<table class="tableTypeB" width="100%" align="center" id="weartbl" name="weartbl">
        <tr>
            <th width="100%">Wear</th>
        </tr>
    </table>

	<table class="tableTypeC" id="wearmetaltbl" name="wearmetaltbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Wear metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Iron (Fe)</td>
            <td><input type="text" id="ferde" name="ferde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chrome (Cr)</td>
            <td><input type="text" id="crrde" name="crrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Aluminum (Al)</td>
            <td><input type="text" id="alrde" name="alrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Copper (Cu)</td>
            <td><input type="text" id="curde" name="curde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Lead (Pb)</td>
            <td><input type="text" id="pbrde" name="pbrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Tin (Sn)</td>
            <td><input type="text" id="snrde" name="snrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Vanadium (V)</td>
            <td><input type="text" id="vrde" name="vrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Multi-Source metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Titanium (Ti)</td>
            <td><input type="text" id="tirde" name="tirde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Molybdenum (Mo)</td>
            <td><input type="text" id="morde" name="morde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nickel (Ni)</td>
            <td><input type="text" id="nirde" name="nirde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Manganese (Mn)</td>
            <td><input type="text" id="mnrde" name="mnrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Boron (B)</td>
            <td><input type="text" id="boronrde" name="boronrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="ferrousdencitytbl" name="ferrousdencitytbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">철분마모분석 Particle Quantifier ; Ferrous Density</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">PQ index</td>
            <td><input type="text" id="pqindex" name="pqindex" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

    <div id="additional1" name="additional1">
		<table width="100%" align="center">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
	
		<table class="tableTypeB" width="100%" align="center">
			<tr>
				<th width="100%">Additional Test</th>
			</tr>
		</table>

		<table class="tableTypeC" id="gravitytbl" name="gravitytbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">비중 Specific Gravity</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Specific Gravity</td>
				<td><input type="text" id="specificgravity" name="specificgravity" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">유동점 Pour point (Celsius)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Pour point </td>
				<td><input type="text" id="pourpoint" name="pourpoint" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">인화점 Flash point (Celsius) ; Clevenland open cup</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Flash point</td>
				<td><input type="text" id="flashpoint" name="flashpoint" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">인화점 Flash point (Celsius) ; Pensky-martens closed cup</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Flash point</td>
				<td><input type="text" id="flashpoint2" name="flashpoint2" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">염소분 Chlorine (ppm)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chlorine</td>
				<td><input type="text" id="chlorine" name="chlorine" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Blotter spot test</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" id="uBlotter" name="uBlotter" style="width:200px; height:15px"></td>
			</tr>
		</table>
	</div>

	<div id="additional2" name="additional2">
		<table width="100%" align="center">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
	
		<table class="tableTypeB" width="100%" align="center">
			<tr>
				<th width="100%">Additional Test</th>
			</tr>
		</table>

        <table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">FT-IR ; Additives Abs </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Amine Antioxidant</td>
				<td><input type="text" id="abs1" name="abs1" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Amine Antioxidant Ⅱ</td>
				<td><input type="text" id="abs2" name="abs2" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM</td>
				<td><input type="text" id="abs3" name="abs3" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM Ⅱ</td>
				<td><input type="text" id="abs4" name="abs4" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM Ⅲ</td>
				<td><input type="text" id="abs5" name="abs5" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Demulsifier</td>
				<td><input type="text" id="abs6" name="abs6" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Dispersant (Succinimide)</td>
				<td><input type="text" id="abs7" name="abs7" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Extreme Pressure</td>
				<td><input type="text" id="abs8" name="abs8" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phenol Antioxidant</td>
				<td><input type="text" id="abs9" name="abs9" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phenol Antioxidant (Polyol ester fluids)</td>
				<td><input type="text" id="abs10" name="abs10" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Pour Point Depressant/Ⅶ(Polymethacrylate)</td>
				<td><input type="text" id="abs11" name="abs11" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Rust Inhibitor (Succinic acid)</td>
				<td><input type="text" id="abs12" name="abs12" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index Improver (Polyisobutene)</td>
				<td><input type="text" id="abs13" name="abs13" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index Improver (Polymethacrylate)</td>
				<td><input type="text" id="abs14" name="abs14" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">FT-IR ; Contamination (Abs) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Detergent(sulfonate)</td>
				<td><input type="text" id="coabs1" name="coabs1" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Diesel ASTM</td>
				<td><input type="text" id="coabs2" name="coabs2" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Ethylene Glycol Coolant ASTM</td>
				<td><input type="text" id="coabs3" name="coabs3" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Fatty Acids</td>
				<td><input type="text" id="coabs4" name="coabs4" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Fluid Contamination ASTM </td>
				<td><input type="text" id="coabs5" name="coabs5" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Gasoline ASTM</td>
				<td><input type="text" id="coabs6" name="coabs6" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nitration ASTM</td>
				<td><input type="text" id="coabs7" name="coabs7" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Oxidation ASTM</td>
				<td><input type="text" id="coabs8" name="coabs8" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Soot Loading ASTM</td>
				<td><input type="text" id="coabs9" name="coabs9" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sulfate by products ASTM</td>
				<td><input type="text" id="coabs10" name="coabs10" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Synthetic Lue Breakdown Ⅰ ASTM</td>
				<td><input type="text" id="coabs11" name="coabs11" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Synthetic Lue BreakdownⅡ ASTM</td>
				<td><input type="text" id="coabs12" name="coabs12" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Petroluem  EP Fluid)</td>
				<td><input type="text" id="coabs13" name="coabs13" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Petroluem  Lubricant)</td>
				<td><input type="text" id="coabs14" name="coabs14" style="width:200px; height:15px" value=""></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Polyol Ester Fluids)</td>
				<td><input type="text" id="coabs15" name="coabs15" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Patch test</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" id="uPatchTest" name="uPatchTest" style="width:200px; height:15px"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Insolubles test for Phosphate Ester Fluids </td>
			</tr>
			<tr>
			    <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Insolubles test</td>
				<td><input type="file" id="uInsoluble" name="uInsoluble" style="width:200px; height:15px"></td>
			</tr>
		</table>

    </div>
    
    <div id="additional3" name="additional3">
		<table width="100%" align="center">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
	
		<table class="tableTypeB" width="100%" align="center">
			<tr>
				<th width="100%">Additional Test</th>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">적점 Dropping Point (Celsius)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Dropping Point  </td>
				<td><input type="text" id="droppoint" name="droppoint" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">주도 Penetration (mm) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Penetration   </td>
				<td><input type="text" id="penetration" name="penetration" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">이유도 Oil Separation @100℃ (wt %) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Oil Separation @100℃   </td>
				<td><input type="text" id="oilseparation" name="oilseparation" style="width:200px; height:15px" value=""></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="contmetaltbl2" name="contmetaltbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Contamination Metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Silicon (Si)</td>
            <td><input type="text" id="siliconrde" name="siliconrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sodium (Na)</td>
            <td><input type="text" id="sodiumrde" name="sodiumrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Potassium (K)</td>
            <td><input type="text" id="potassiumrde" name="potassiumrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="addtivestbl2" name="addtivestbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Magnesium (Mg)</td>
            <td><input type="text" id="mgrde" name="mgrde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Calcium (Ca)</td>
            <td><input type="text" id="carde" name="carde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Barium (Ba)</td>
            <td><input type="text" id="barde" name="barde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phosphorus (P)</td>
            <td><input type="text" id="prde" name="prde" style="width:200px; height:15px" value=""></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Zinc (Zn)</td>
            <td><input type="text" id="znrde" name="znrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="wearmetaltbl2" name="wearmetaltbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Wear metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Iron (Fe)</td>
            <td><input type="text" id="ferde" name="ferde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chrome (Cr)</td>
            <td><input type="text" id="crrde" name="crrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Aluminum (Al)</td>
            <td><input type="text" id="alrde" name="alrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Copper (Cu)</td>
            <td><input type="text" id="curde" name="curde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Lead (Pb)</td>
            <td><input type="text" id="pbrde" name="pbrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Tin (Sn)</td>
            <td><input type="text" id="snrde" name="snrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Vanadium (V)</td>
            <td><input type="text" id="vrde" name="vrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="multisourcetbl2" name="multisourcetbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Multi-Source metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Titanium (Ti)</td>
            <td><input type="text" id="tirde" name="tirde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Molybdenum (Mo)</td>
            <td><input type="text" id="morde" name="morde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nickel (Ni)</td>
            <td><input type="text" id="nirde" name="nirde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Manganese (Mn)</td>
            <td><input type="text" id="mnrde" name="mnrde" style="width:200px; height:15px" value=""></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Boron (B)</td>
            <td><input type="text" id="boronrde" name="boronrde" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>

	<table class="tableTypeC" id="ferrousdencitytbl2" name="ferrousdencitytbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">철분마모분석 Particle Quantifier ; Ferrous Density</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">PQ index</td>
            <td><input type="text" id="pqindex" name="pqindex" style="width:200px; height:15px" value=""></td>
        </tr>
    </table>
		
	</div>
	
	<table class="tableTypeC" id="additionalInfo" name="additionalInfo" width="100%" align="center" style="display:block;">
	    <tr>
	        <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">신규 항목 추가</td>
	    </tr>
	    <tr>
	        <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">항목명</td>
	        <td><input type="text" id="addField" name="addField" style="width:200px; height:15px" value=""></td>
	    </tr>
	    <tr>
	        <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">항목 내용</td>
	        <td>
	            <textarea class="classy-editor" name="content" id="content" rows="22" style="width:645px;"> </textarea>
	        </td>
	    </tr>
	</table>

<%
    }
%>
    <table width="100%" align="center">
        <tr>
            <td height="20"></td>
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