<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WearCheck OilTok Report</title>
<%
	List<Map> analysisList = (List)request.getAttribute("analysisList");
	String tmpcolspan = request.getAttribute("colspan").toString();
	String searchCol = request.getAttribute("searchCol").toString();
	String[] searchColVal = searchCol.split(",");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
	String companyIdx = String.valueOf(request.getAttribute("companyIdx"));
	String specIdx = String.valueOf(request.getAttribute("specIdx"));
	String sampleIdx = String.valueOf(request.getAttribute("sampleIdx"));
	String companyName = (String)request.getAttribute("companyName");
	String specName = (String)request.getAttribute("specName");
	String sampleName = (String)request.getAttribute("sampleName");
	String smplPoint = (String)request.getAttribute("smplPoint");
	String manager = (String)request.getAttribute("manager");
	int colspan = searchColVal.length;
	Map resultMap = (Map)request.getAttribute("resultMap");
	
	if(resultMap != null) {
		Object[] dateval = (Object[])resultMap.get("regdate2");
		for(int i=0; i < dateval.length; i++) {
			System.out.println(dateval[i]);
		}
	}
%>
<script type="text/javascript">
	$(document).ready(function() {
		    
		    var chartSeries = [];
		    var categorySeries = [];
		    
		    <%
		        if(resultMap != null) {
		            for(int m=0; m < searchColVal.length; m++) {
		    %>
		        chartSeries.push({
		        	data: <%=(String)resultMap.get(searchColVal[m])%>,
		        	field: "<%=searchColVal[m]%>",
		        	name: "<%=searchColVal[m]%>"
		        });
		    <%
		        	}
		        }
		    
		        if(resultMap != null) {
		        	Object[] dateval = (Object[])resultMap.get("regdate2");
		        	for(int i=0; i < dateval.length; i++) {
		        		System.out.println("+++++++++++++" + dateval[i]);
		    %>
		        categorySeries.push("<%=dateval[i]%>");
		    <% 
		        	}
		        } 
		    %>

		    <% if(resultMap != null) {%>
			$("#analysisChart").kendoChart({
				seriesDefaults: {
	                type: "line",
	                style: "smooth"
	            },
	            legend: {
	                position: "bottom"
	            },
	            chartArea: {
	                background: "",
	                height: 300
	            },
	            valueAxis: {
	                labels: {
	                    format: "{0}%"
	                },
	                line: {
	                    visible: false
	                },
	                axisCrossingValue: -10
	            },

                series: chartSeries,
			    valueAxis: {
			        min: 0
			    },
			    categoryAxis: {
                    categories: categorySeries, //[2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011],
                    majorGridLines: {
                        visible: false
                    }
                },
			    tooltip: {
	                visible: true,
	                format: "{0}%",
	                template: "#= series.name #: #= value #"
	            }
			});
			<% } %>
		
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
    				$("#smplPoint").val(resultObj.result);
    			}
    		});
    	});
		
		$("#search").click(function(){
			var companyIdx = $("#companyIdx").val();
			var companyName = $("#companyIdx :selected").text();
			$("#companyName").val(companyName);
			var specIdx = $("#specIdx").val();
			var specName = $("#specIdx :selected").text();
			$("#specName").val(specName);
			var sampleIdx = $("#sampleIdx").val();
			var sampleName = $("#sampleIdx :selected").text();
			$("#sampleName").val(sampleName);
			var smplPoint = $("#smplPoint").val();
			var startDate = $("#datepicker").val();
			var endDate = $("#datepicker2").val();
			var searchKey = $("#searchKey").val();
			
			$("#startDate").val(startDate);
			$("#endDate").val(endDate);
			//alert($("#startDate").val());
			//alert($("#endDate").val());
			//alert($("#companyName").val());
			//alert($("#specName").val());
			//alert($("#sampleName").val());
			var chkArray = [];
			$("#checkList input:checked").each(function() {
				chkArray.push($(this).val());
			});
			
			var selected;
			selected = chkArray.join(',');
			
			if(selected.length > 1){
				//alert("You have selected " + selected);
				$("#searchCol").val(selected);
				//alert($("#searchCol").val());
			}else{
				alert("검색값을 최소 1개 이상 선택해주세요.");	
				return false;
			}
			
			$("#searchForm").submit();
		});
		
		$("#scontamination").click(function(e){
    		var chk = $(this).is(":checked");
    		if(chk) {
    			document.getElementById("contaminationtbl").style.display = "";
    		} else {
    			document.getElementById("contaminationtbl").style.display = "none";
    		}
    	});
		
		$("#soil").click(function(e){
    		var chk = $(this).is(":checked");
    		if(chk) {
    			document.getElementById("oiltbl").style.display = "";
    		} else {
    			document.getElementById("oiltbl").style.display = "none";
    		}
    	});
		
		$("#swear").click(function(e){
    		var chk = $(this).is(":checked");
    		if(chk) {
    			document.getElementById("weartbl").style.display = "";
    		} else {
    			document.getElementById("weartbl").style.display = "none";
    		}
    	});
		
		$("#infoExcelDownload").click(function(e){
			var companyIdx = $("#rsCompanyIdx").val();
			var specIdx = $("#rsSpecIdx").val();
			var sampleIdx = $("#rsSampleIdx").val();
			var searchCol = $("#searchCol").val();
			//alert(searchCol);
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var searchKey = $("#searchKey").val();
			var companyName = $("#companyName").val();
			var specName = $("#specName").val();
			var sampleName = $("#sampleName").val();
			var smplPoint = $("#rsSmplPoint").val();
			var manager = $("#rsManager").val();
			var type = "excel";
			var standardCol = "";
			var chkArray = [];
			$("#checkList2 input:checked").each(function() {
				chkArray.push($(this).val());
			});
			
			var selected;
			selected = chkArray.join(',');
			
// 			if(selected.length > 1){
// 				//alert("You have selected " + selected);
// 				$("#standardCol").val(selected);
// 				//alert($("#standardCol").val());
// 			}else{
// 				alert("검색값을 최소 1개 이상 선택해주세요.");	
// 				return false;
// 			}
			standardCol = $("#standardCol").val();
			
			var standard1 = $('input[name="standard1"]:checked').val();
			var standard2 = $('input[name="standard2"]:checked').val();
			var standard3 = $('input[name="standard3"]:checked').val();
			var standard4 = $('input[name="standard4"]:checked').val();
			var standard5 = $('input[name="standard5"]:checked').val();
			var cvalue = $("#cvalue").val();
// 			alert(standard1);
// 			alert(standard2);
// 			alert(standard3);
// 			alert(standard4);
// 			alert(standard5);
// 			alert(cvalue);

			location.href="/ajax/infoAnalysisExcel.info?companyIdx="+companyIdx+"&specIdx="+specIdx+"&sampleIdx="+sampleIdx+"&searchCol="+searchCol+"&startDate="+startDate+"&endDate="+endDate+"&searchKey="+searchKey+"&companyName="+companyName+"&specName="+specName+"&sampleName="+sampleName+"&smplPoint="+smplPoint+"&manager="+manager+"&standard1="+standard1+"&standard2="+standard2+"&standard3="+standard3+"&standard4="+standard4+"&standard5="+standard5+"&cvalue="+cvalue;
// 			$.ajax({
// 				type: "POST", 
//     			url: "/ajax/infoAnalysisExcel.info", 
//     			data: "companyIdx="+companyIdx+"&specIdx="+specIdx+"&sampleIdx="+sampleIdx+"&searchCol="+searchCol+"&startDate="+startDate+"&endDate="+endDate+"&searchKey="+searchKey+"&companyName="+companyName+"&specName="+specName+"&sampleName="+sampleName+"&smplPoint="+smplPoint+"&manager="+manager,
//     			success: function(msg){
//     				alert("성공");
//     			}
// 			});
		});
		
	});

	// datepicker
	$(function() {
		$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
		$( "#datepicker" ).datepicker(
			{
				changeMonth: true,
			    changeYear: true,
				dateFormat: "yy-mm-dd", // 날자형식 YYYY-MM-DD 
				//numberOfMonths: 3,  // 2달만 보여줌 
				showButtonPanel: true,
				//minDate : 0 //과거없음
				maxDate : 0 // 미래없음
			}
		);
		
		//$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
		$( "#datepicker2" ).datepicker(
			{
				changeMonth: true,
			    changeYear: true,
				dateFormat: "yy-mm-dd", // 날자형식 YYYY-MM-DD 
				//numberOfMonths: 3,  // 2달만 보여줌 
				showButtonPanel: true,
				//minDate : 0 //과거없음
				maxDate : 0 // 미래없음
			}
		);
	});



	//날자간 차이. (16일 이상이 되면 UI가 보기 힘들어짐)
	function chkDataDiff(){
		var stDate = $("#datepicker").val();
		var edDate = $("#datepicker2").val();
		//alert("stDate : " + stDate + " / stDate : " + edDate + " = " + parseInt( (edDate-stDate)/(1000*60*60*24) ) || 0 );
	}
</script>
<style>
	.ui-datepicker{ font-size: 14px; width: 180px; }
	.ui-datepicker select.ui-datepicker-month{ width:38%; font-size: 11px; }
	.ui-datepicker select.ui-datepicker-year{ width:48%; font-size: 11px; }
</style>

</head>
<body>
	<table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">정보분석 챠트 및 리스트</h2></td>
        </tr>
        <tr>
            <td height="30">&nbsp;</td>
        </tr>
    </table>
    <form name="searchForm" action="/info/infoAnalysis.info" method="POST">
    <input type="hidden" id="searchCol" name="searchCol" value="<%=searchCol%>">
    <input type="hidden" id="searchKey" name="searchKey" value="1">
    <input type="hidden" id="startDate" name="startDate" value="<%=startDate%>">
    <input type="hidden" id="endDate" name="endDate" value="<%=endDate%>">
    <input type="hidden" id="rsCompanyIdx" name="rsCompanyIdx" value="<%=companyIdx%>">
    <input type="hidden" id="rsSpecIdx" name="rsSpecIdx" value="<%=specIdx%>">
    <input type="hidden" id="rsSampleIdx" name="rsSampleIdx" value="<%=sampleIdx%>">
    <input type="hidden" id="companyName" name="companyName" value="<%=companyName%>">
    <input type="hidden" id="specName" name="specName" value="<%=specName%>">
    <input type="hidden" id="sampleName" name="sampleName" value="<%=sampleName%>">
    <input type="hidden" id="rsSmplPoint" name="rsSmplPoint" value="<%=smplPoint%>">
    <input type="hidden" id="rsManager" name="rsManager" value="<%=manager%>">
    <input type="hidden" id="standardCol" name="standardCol" value="">
    <table class="tableTypeC" width="100%" align="center">
    <colgroup>
        <col width="10%" />
        <col width="15%" />
        <col width="10%" />
        <col width="15%" />
        <col width="10%" />
        <col width="15%" />
        <col width="10%" />
        <col width="15%" />
    </colgroup>
        <tr>
            <th colspan="8" align="left">- 검색 조건 설정</th>
        </tr>
        <tr>
            <th class="th02">회사명</th>
            <td>
            <%
	        	List<Map> customerList = (List)request.getAttribute("customerList");
	        	String companyIdx2 = (String)session.getAttribute("companyIdx");
	        	String membGb = (String)session.getAttribute("membGb");
	        %>
            	<select name="companyIdx" id="companyIdx">
                    <option value=""></option>
                    <%
                        if(customerList.size() <= 0) {
                    %>
                    
                    <%
                        } else {
                        	for(Map item : customerList) {
                        		if(!membGb.equals("99")) {
                        			if(companyIdx2.equals(String.valueOf(item.get("IDX")))) {
                    %>
                        <option value="<%=item.get("IDX")%>"><%=item.get("COMPANYNAME")%></option>
                    <%
	                        		} else {}
                   
	                        	} else {
	               %>
	                	<option value="<%=item.get("IDX")%>"><%=item.get("COMPANYNAME")%></option>
	              <%
		                        }
	                        }
                        }
                   %>
                </select>
            </td>
            <th class="th02">기계명</th>
            <td>
            	<select id="specIdx" name="specIdx"> 
                </select>
            </td>
            <th class="th02">시료명</th>
            <td>
                <select id="sampleIdx" name="sampleIdx">
                </select>
            </td>
            <th class="th02">샘플링포인트</th>
            <td style="font-size:12px;" align="center"><input type="text" id="smplPoint" name="smplPoint" style="width:80px; height:15px" value=""></td>
        </tr>
        <tr>
            <th class="th02">날짜</th>
            <td colspan="7"><b>시작일 :</b> <input type="text" id="datepicker"> ~ <b>종료일 :</b> <input type="text" id="datepicker2"></td>
        </tr>
        <tr>
            <th class="th02">검색값</th>
            <td colspan="7" align="center">
                <%
                    Map colMap = (Map)request.getAttribute("colMap");
           
                    if(colMap.size() > 0) {	
                %>
                    <!-- 검색설정값 part start -->
                    <table class="tableTypeE" width="100%" align="center" border="0" style="border: none;">
                        <tr>
                            <td align="center">
                                <input type="checkbox" id="scontamination" name="scontamination" value="contamination"><b>1. Contamination</b>
                                <input type="checkbox" id="soil" name="soil" value="oilcondition"><b>2. Oil Condition</b>
                                <input type="checkbox" id="swear" name="swear" value="wear"><b>3. Wear</b>
                            </td>
                        </tr>
                    </table>
                    <div id="checkList">
                    <table class="tableTypeE" width="100%" align="center" id="contaminationtbl" name="contaminationtbl" style="display:none;" border="0">
                        <tr><td height="30" colspan="2"><b>1. Contamination</b></td></tr>
				        <tr>
				            <td height="30" colspan="2" valign="bottom"><b>Particle Count : Laser Particle counter</b></td>
				        </tr>
				        <tr>
				            <!--td>- Class</td-->
				            <td colspan="2">- 입자크기별(㎛) 개수(Number of particles/ml)</td>
				        </tr>
				        <tr>
				            <!--td>
				                <input type="checkbox" value="<%=colMap.get("iso1")%>" class="chk"> ISO 4406 
								<input type="checkbox" value="<%=colMap.get("nas")%>" class="chk"> NAS 1638 
								<input type="checkbox" value="<%=colMap.get("sae")%>" class="chk"> SAE AS 4059
				            </td-->
				            <td colspan="2">
				                <input type="checkbox" value="<%=colMap.get("p4um")%>" class="chk"> 4um (c)
								<input type="checkbox" value="<%=colMap.get("p6um")%>" class="chk"> 6um (c) 
								<input type="checkbox" value="<%=colMap.get("p14um")%>" class="chk"> 14um (c) 
								<input type="checkbox" value="<%=colMap.get("p21um")%>" class="chk"> 21um (c)
								<input type="checkbox" value="<%=colMap.get("p38um")%>" class="chk"> 38um (c) 
								<input type="checkbox" value="<%=colMap.get("p70um")%>" class="chk"> 70um
				            </td>
				        </tr>
				        <tr>
				            <td height="30" colspan="2" valign="bottom"><b>20um Wear Mode</b></td>
				        </tr>
				        <tr>
				            <td>- Cutting Wear</td>
				            <td>- Severe Sliding Wear</td>
				        </tr>
				        <tr>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("ccount")%>" class="chk"> Counts 
								<input type="checkbox" value="<%=colMap.get("caverage")%>" class="chk"> Average 
								<input type="checkbox" value="<%=colMap.get("cstd")%>" class="chk"> STD 
								<input type="checkbox" value="<%=colMap.get("cmaxsize")%>" class="chk"> Max size 
				            </td>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("scount")%>" class="chk"> Counts
								<input type="checkbox" value="<%=colMap.get("saverage")%>" class="chk"> Average
								<input type="checkbox" value="<%=colMap.get("sstd")%>" class="chk"> STD
								<input type="checkbox" value="<%=colMap.get("smaxsize")%>" class="chk"> Max size
				            </td>
				        </tr>
				        <tr>
				            <td>- Fatigue</td>
				            <td>- Nonmetallic Particles</td>
				        </tr>
				        <tr>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("fcount")%>" class="chk"> Counts
								<input type="checkbox" value="<%=colMap.get("faverage")%>" class="chk"> Average
								<input type="checkbox" value="<%=colMap.get("fstd")%>" class="chk"> STD
								<input type="checkbox" value="<%=colMap.get("fmaxsize")%>" class="chk"> Max size
				            </td>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("ncount")%>" class="chk"> Counts
								<input type="checkbox" value="<%=colMap.get("naverage")%>" class="chk"> Average
								<input type="checkbox" value="<%=colMap.get("nstd")%>" class="chk"> STD
								<input type="checkbox" value="<%=colMap.get("nmaxsize")%>" class="chk"> Max size
				            </td>
				        </tr>
				        <tr>
				            <td height="30" colspan="2" valign="bottom"><b>Particle Contaminaion by the counting method using an optical microscope</b></td>
				        </tr>
				        <tr>
				            <!--td>- Class</td-->
				            <td colspan="2">- 입자크기별(㎛) 개수(Number of particles/ml)</td>
				        </tr>
				        <tr>
				            <!--td>
				                <input type="checkbox" value="<%=colMap.get("iso2")%>" class="chk"> ISO 4406
								<input type="checkbox" value="<%=colMap.get("nas2")%>" class="chk"> NAS 1638
								<input type="checkbox" value="<%=colMap.get("sae2")%>" class="chk"> SAE AS 4059
				            </td-->
				            <td colspan="2">
				                <input type="checkbox" value="<%=colMap.get("five")%>" class="chk"> 5-15um
								<input type="checkbox" value="<%=colMap.get("fifteen")%>" class="chk"> 15-25um
								<input type="checkbox" value="<%=colMap.get("twentyfive")%>" class="chk"> 25-50um
								<input type="checkbox" value="<%=colMap.get("fifty")%>" class="chk"> 50-100um
								<input type="checkbox" value="<%=colMap.get("hundred")%>" class="chk"> 100um
				            </td>
				        </tr>
				        <tr>
				            <td height="30" valign="bottom"><b>Water Content (ppm)</b></td>
				            <td height="30" valign="bottom"><b>Chlorine (ppm)</b></td>
				        </tr>
				        <tr>
				            <td><input type="checkbox" value="<%=colMap.get("water")%>" class="chk"> Water</td>
				            <td><input type="checkbox" value="<%=colMap.get("chlorine")%>" class="chk"> Chlorine</td>
				        </tr>
				        <tr>
				            <td height="30" valign="bottom"><b>Membrane Patch Colorimetry</b></td>
				            <td height="30" valign="bottom"><b>MPC for Phosphate Ester Fluids (Patch wt(mg))</b></td>
				        </tr>
				        <tr>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("impcval")%>" class="chk"> iMPC Value 
								<input type="checkbox" value="<%=colMap.get("mpcval")%>" class="chk"> MPC Value 
								<input type="checkbox" value="<%=colMap.get("eval")%>" class="chk"> 평가
				            </td>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("mpcweight")%>" class="chk"> MPC weight
				            </td>
				        </tr>
				        <tr>
				            <td height="30" colspan="2" valign="bottom"><b>Elemental analysis ; Contamination Metals(ppm)</b></td>
				        </tr>
				        <tr>
				            <td>
				                <table width="100%" align="center">
				                    <tr>
				                        <td>Silicon (Si)</td>
				                        <td>Boron (B)</td>
				                        <td>Sodium (Na)</td>
				                    </tr>
				                    <tr>
				                        <td>
				                            <input type="checkbox" value="<%=colMap.get("siliconrde")%>" class="chk"> RDE 
											<input type="checkbox" value="<%=colMap.get("siliconrfs")%>" class="chk"> RFS
				                        </td>
				                        <td>
				                            <input type="checkbox" value="<%=colMap.get("boronrde")%>" class="chk"> RDE 
											<input type="checkbox" value="<%=colMap.get("boronrfs")%>" class="chk"> RFS 
				                        </td>
				                        <td>
				                            <input type="checkbox" value="<%=colMap.get("sodiumrde")%>" class="chk"> RDE 
											<input type="checkbox" value="<%=colMap.get("sodiumrfs")%>" class="chk"> RFS
				                        </td>
				                    </tr>
				                </table>
				            </td>
				        </tr>
				        <tr>
				            <td height="30" colspan="2" valign="bottom"><b>FT-IR : Contamination (Abs)</b></td>
				        </tr>
				        <tr>
				            <td colspan="2">
				                <input type="checkbox" value="<%=colMap.get("oxidation")%>" class="chk"> Oxidation ASTM 
								<input type="checkbox" value="<%=colMap.get("detergent")%>" class="chk"> Detergent(sulfonate) 
								<input type="checkbox" value="<%=colMap.get("diesel")%>" class="chk"> Diesel ASTM 
								<input type="checkbox" value="<%=colMap.get("ethylene")%>" class="chk"> Ethylene Glycol Coolant ASTM 
								<input type="checkbox" value="<%=colMap.get("nitration")%>" class="chk"> Nitration ASTM 
								<input type="checkbox" value="<%=colMap.get("sootloading")%>" class="chk"> Soot Loading ASTM Soot (% w/w)<br>
								<input type="checkbox" value="<%=colMap.get("sulfate")%>" class="chk"> Sulfate by products ASTM 
								<input type="checkbox" value="<%=colMap.get("waterastm")%>" class="chk"> Water (ASTM Petroluem  Lubricant) 
				            </td>
				        </tr>
                    </table>
                    <table class="tableTypeE" width="100%" align="center" id="oiltbl" name="oiltbl" style="display:none;" border="0">
                        <tr><td colspan="2"><b>2. Oil Condition</b></td></tr>
                        <tr>
				            <td height="30" valign="bottom"><b>동점도 Viscosity (cSt)</b></td>
				            <td height="30" valign="bottom"><b>산가 Acid Number (mgKOH/g)</b></td>
				        </tr>
				        <tr>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("viscosity40")%>" class="chk"> Viscosity@40℃ 
								<input type="checkbox" value="<%=colMap.get("viscosity100")%>" class="chk"> Viscosity@100℃ 
								<input type="checkbox" value="<%=colMap.get("viscosityindex")%>" class="chk"> Viscosity Index 
				            </td>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("acidnumber")%>" class="chk"> Acid Number 
				            </td>
				        </tr>
				        <tr>
				            <td height="30" valign="bottom"><b>Specific Gravity</b></td>
				            <td height="30" valign="bottom"><b>Remaining Useful Life : RULER (%)</b></td>
				        </tr>
				        <tr>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("specificgravity")%>" class="chk"> Specific Gravity 
				            </td>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("rul1peak")%>" class="chk"> RUL1_Peak1 
								<input type="checkbox" value="<%=colMap.get("rul2peak")%>" class="chk"> RUL2_Peak2 
								<input type="checkbox" value="<%=colMap.get("rulareatotal")%>" class="chk"> RUL AREA_TOTAL
				            </td>
				        </tr>
				        <tr>
				            <td height="30" valign="bottom"><b>Remaining Useful Life : RULER (%)</b></td>
				            <td height="30" valign="bottom"><b>Foaming characteristic of oil (ml)</b></td>
				        </tr>
				        <tr>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("rulernumber")%>" class="chk"> RULER NUMBER
				            </td>
				            <td>
				                <input type="checkbox" value="<%=colMap.get("tendency")%>" class="chk"> 24℃ (tendency < 450ml) 
								<input type="checkbox" value="<%=colMap.get("stability")%>" class="chk"> 93.5℃ (stability 0ml(Nil)) 
								<input type="checkbox" value="<%=colMap.get("nil")%>" class="chk"> 24℃ (stability 0ml(Nil))
				            </td>
				        </tr>
				        <tr>
	                        <td height="30" valign="bottom"><b>Water separability (min)</b></td>
	                        <td height="30" valign="bottom"><b>Pour point (Celsius)</b></td>
	                    </tr>
	                    <tr>
	                        <td><input type="checkbox" value="<%=colMap.get("waterseparability")%>" class="chk"> Water separability </td>
	                        <td><input type="checkbox" value="<%=colMap.get("pourpoint")%>" class="chk"> Pour point</td>
	                    </tr>
	                    <tr>
	                        <td height="30" valign="bottom"><b>Flash point (Celsius) ; Clevenland open cup</b></td>
	                        <td height="30" valign="bottom"><b>Flash point (Celsius) ; Pensky-martens closed cup</b></td>
	                    </tr>
	                    <tr>
	                        <td><input type="checkbox" value="<%=colMap.get("flashpoint")%>" class="chk"> Flash point</td>
	                        <td><input type="checkbox" value="<%=colMap.get("flashpoint2")%>" class="chk"> Flash point</td>
	                    </tr>
	                    <tr>
	                        <td height="30" colspan="2" valign="bottom"><b>Elemental analysis : Additives Metals(ppm)</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <table width="100%" align="center">
	                                <tr>
	                                    <td>Magnesium (Mg)</td>
	                                    <td>Calcium (Ca)</td>
	                                    <td>Barium (Ba)</td>
	                                    <td>Phosphorus (P)</td>
	                                    <td>Zinc (Zn)</td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <input type="checkbox" value="<%=colMap.get("mgrde")%>" class="chk"> RDE 
											<input type="checkbox" value="<%=colMap.get("mgrfs")%>" class="chk"> RFS
	                                    </td>
	                                    <td>
	                                        <input type="checkbox" value="<%=colMap.get("carde")%>" class="chk"> RDE
											<input type="checkbox" value="<%=colMap.get("carfs")%>" class="chk"> RFS
	                                    </td>
	                                    <td>
	                                        <input type="checkbox" value="<%=colMap.get("barde")%>" class="chk"> RDE
											<input type="checkbox" value="<%=colMap.get("barfs")%>" class="chk"> RFS
	                                    </td>
	                                    <td>
	                                        <input type="checkbox" value="<%=colMap.get("prde")%>" class="chk"> RDE
											<input type="checkbox" value="<%=colMap.get("prfs")%>" class="chk"> RFS
	                                    </td>
	                                    <td>
	                                        <input type="checkbox" value="<%=colMap.get("znrde")%>" class="chk"> RDE
											<input type="checkbox" value="<%=colMap.get("znrfs")%>" class="chk"> RFS
	                                    </td>
	                                </tr>
	                            </table>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td height="30" colspan="2" valign="bottom"><b>FT-IR : Additives Abs)</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <input type="checkbox" value="<%=colMap.get("antiwater")%>" class="chk"> Antiwear ASTM 
								<input type="checkbox" value="<%=colMap.get("phenol")%>" class="chk"> Phenol Antioxidant 
								<input type="checkbox" value="<%=colMap.get("rust")%>" class="chk"> Rust Inhibitor(Succinic acid) 
								<input type="checkbox" value="<%=colMap.get("dispersant")%>" class="chk"> Dispersant(Succinimide)
	                        </td>
	                    </tr>
                    </table>
                    <table class="tableTypeE" width="100%" align="center" id="weartbl" name="weartbl" style="display:none;" border="0">
                        <tr><td colspan="4"><b>3. Wear</b></td></tr>
                        <tr>
                            <td height="30" colspan="4" valign="bottom"><b>Elemental analysis ; Wear metals(ppm)</b></td>
                        </tr>
                        <tr>
                            <td>Iron (Fe)</td>
                            <td>Chrome (Cr)</td>
                            <td>Lead (Pb)</td>
                            <td>Copper (Cu)</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("ferde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("ferfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("crrde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("crrfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("pbrde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("pbrfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("curde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("curfs")%>" class="chk"> RFS
                            </td>
                        </tr>
                        <tr>
                            <td>Tin (Sn)</td>
                            <td>Aluminum (Al)</td>
                            <td>Nickel (Ni)</td>
                            <td>Silver (Ag)</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("snrde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("snrfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("alrde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("alrfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("nirde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("nirfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("agrde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("agrfs")%>" class="chk"> RFS
                            </td>
                        </tr>
                        <tr>
                            <td>Molybdenum (Mo)</td>
                            <td>Titanium (Ti)</td>
                            <td>Vanadium (V)</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("morde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("morfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("tirde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("tirfs")%>" class="chk"> RFS
                            </td>
                            <td>
                                <input type="checkbox" value="<%=colMap.get("vrde")%>" class="chk"> RDE
								<input type="checkbox" value="<%=colMap.get("vrfs")%>" class="chk"> RFS
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td height="30" colspan="4" valign="bottom"><b>Particle Quantifier ; Ferrous Density</b></td>
                        </tr>
                        <tr>
                            <td colspan="4"><input type="checkbox" value="<%=colMap.get("pqindex")%>" class="chk"> PQ index</td>
                        </tr>
                    </table>
                    </div>
                    <!-- 검색설정값 part end -->
                <%
                    }
                %>
            </td>
        </tr>
        <tr>
            <th colspan="8" align="center"><input name="search" class="btn_style4" id="search" type="submit" value="확인"/></th>
        </tr>
    </table>
    </form>
    <table width="100%" align="center">
        <tr>
        	<td height="20"></td>
        </tr>
    </table>
    <!-- table width="100%" align="center">
        <tr>
            <td id="analysisChart" align="center"></td>
        </tr>
    </table-->
    <div id="analysisChart"></div>
    <table width="100%" align="center">
        <tr>
        	<td height="20"></td>
        </tr>
    </table>
    <% 
        if(resultMap != null) {
    %>
        <div id="checkList2">
        <table class="tableTypeC"  width="100%" align="center">
        <colgroup>
            <col width="20%" />
            <col width="*" />
        </colgroup>
            <tr>
                <th colspan="2">기준치 설정</th>
            </tr>
            <tr>
                <td><b>Contamination; Particle count</b></td>
                <td align="left">
                    <input type="radio" value="phydraulic" id="standard1" name="standard1">유압유
					<input type="radio" value="pgear" id="standard1" name="standard1">기어유
					<input type="radio" value="pengine" id="standard1" name="standard1">엔진유
					<input type="radio" value="pturbine" id="standard1" name="standard1">터빈유
					<input type="radio" value="pbearing" id="standard1" name="standard1">베어링유
                </td>
            </tr>
            <tr>
                <td><b>Contamination; Water</b></td>
                <td align="left">
                    <input type="radio" value="whydraulic" id="standard2" name="standard2">유압유     
					<input type="radio" value="wgear" id="standard2" name="standard2">기어유     
					<input type="radio" value="wengine" id="standard2" name="standard2">엔진유     
					<input type="radio" value="wturbine" id="standard2" name="standard2">터빈유     
					<input type="radio" value="wair" id="standard2" name="standard2">공기압축기 
					<input type="radio" value="weht" id="standard2" name="standard2">EHC Turbine
                </td>
            </tr>
            <tr>
                <td><b>Oil condition; AN</b></td>
                <td>
                    <input type="radio" value="zddp" id="standard3" name="standard3">ZDDP, EP and Acid Type Rust Inhibited oils(new) oil AN 0.6-1.5&nbsp;&nbsp;<input type="radio" value="kzddp" id="standard3" name="standard3">한글ver.<br>
					<input type="radio" value="aw" id="standard3" name="standard3">Other AW and R&O oils(new) oil AN 0-0.6&nbsp;&nbsp;<input type="radio" value="kaw" id="standard3" name="standard3">한글ver.<br>
					<input type="radio" value="volume" id="standard3" name="standard3">Volume Turbine oils(new) oil AN 0-0.1&nbsp;&nbsp;<input type="radio" value="kvolume" id="standard3" name="standard3">한글ver.
                </td>
            </tr>
            <tr>
                <td><b>Oil condition; Viscosity</b></td>
                <td>
                    <input type="radio" value="viscosity" id="standard4" name="standard4">영어ver.
                    <input type="radio" value="kviscosity" id="standard4" name="standard4">한글ver.
                    <input type="radio" value="cviscosity" id="standard4" name="standard4">계산ver : <input type="text" id="cvalue" name="cvalue">
                </td>
            </tr>
            <tr>
                <td><b>Wear; PQ</b></td>
                <td>
                    <input type="radio" value="engine" id="standard5" name="standard5">엔진
					<input type="radio" value="trucks" id="standard5" name="standard5">Trucks
					<input type="radio" value="loaders" id="standard5" name="standard5">Wheel loaders
					<input type="radio" value="tractors" id="standard5" name="standard5">Track type tractors
					<input type="radio" value="transmissions" id="standard5" name="standard5">Transmissions
					<input type="radio" value="oilpressure" id="standard5" name="standard5">유압시스템
					<input type="radio" value="gearbox" id="standard5" name="standard5">산업용기어박스
					<input type="radio" value="rolling" id="standard5" name="standard5">Rolling Element Bearing
                </td>
            </tr>
            <tr>
                <th colspan="2">기준치 선택 후 엑셀 다운로드를 클릭하세요. 기준치 데이터가 자동으로 엑셀에 입력됩니다.</th>
            </tr>
        </table>
        </div>
    <% 
        }
    %>
    <table width="100%" align="center">
        <tr>
            <td align="right"><input name="infoExcelDownload" class="btn_style4" id="infoExcelDownload" type="submit" value="엑셀다운"/></td>
        </tr>
    </table>
    <table class="tableTypeB" width="100%" align="left">
        <tr>
            <th width="10%">구분</th>
            <%
                if(resultMap != null) {
                	Object[] dateVal2 = (Object[])resultMap.get("regdate2");
                	for(int i=0; i < dateVal2.length; i++) {
            %>
                <th><%=dateVal2[i] %></th>
            <%
                	}
                	
                }
            %>
        </tr>
    <%
        if(analysisList == null) {
    %>
        <tr>
            <td colspan="<%=colspan%>">검색결과가 없습니다.</td>
        </tr>
    <%
        } else {
        	
        	if(searchCol != "") {
        		String fieldname = "";
        		for(int j=0; j < searchColVal.length; j++) {
					if(searchColVal[j].equals("p4um")) {
						fieldname = "4um (c)";
					} else if(searchColVal[j].equals("p6um")) {
						fieldname = "6um (c)";
					} else if(searchColVal[j].equals("p14um")) {
						fieldname = "14um (c)";
					} else if(searchColVal[j].equals("p21um")) {
						fieldname = "21um (c)";
					} else if(searchColVal[j].equals("p38um")) {
						fieldname = "38um (c)";
					} else if(searchColVal[j].equals("p70um")) {
						fieldname = "70um";
					} else {
						fieldname = searchColVal[j];
					}
    %>
        <tr>
            	<td><b><%=fieldname %></b></td>
            	<%
            	    for(Map item : analysisList) {
            	%>
            		<td><%=item.get(searchColVal[j]) %></td>
            	<%
            	    }
            	%>
        </tr>
    <%	
        		}
        	}
        }
    %>
    </table>
</body>
</html>