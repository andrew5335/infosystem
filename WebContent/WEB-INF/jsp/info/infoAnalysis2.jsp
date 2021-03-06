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
	String examChk = (String)request.getAttribute("examChk");
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
					//alert(resultObj.examYn);
					
					var result = $("#specIdx");
					var examChk = $("#examChk");
					examChk.val(resultObj.examYn);
					//alert(examChk.val());
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
		
		$("#infoResultDownload").click(function(e){
			var companyIdx = $("#rsCompanyIdx").val();
			var companyIdx2 = $("#companyIdx").val();
			var examChk = $("#examChk").val();
			alert(companyIdx);
			alert(examChk);
			if(companyIdx == "" || companyIdx == "0") {
				if(companyIdx2 == "" || companyIdx2 == "0") {
					alert("시험성적서를 다운받을 회사를 선택해주세요.");
					return false;
				} else {
					if(examChk == "" || examChk == "N") {
						alert("시험성적서가 없습니다.");
						return false;
					} else {
						location.href="/ajax/infoAnalysisExcel2.info?companyIdx="+companyIdx2;
					}
				}
			} else {
				if(examChk == "" || examChk == "N") {
					alert("시험성적서가 없습니다.");
					return false;
				} else {
					location.href="/ajax/infoAnalysisExcel2.info?companyIdx="+companyIdx;
				}
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

			var standard1 = $('input[name="standard"]:checked').val();
// 			var standard2 = $('input[name="pgear"]:checked').val();
// 			var standard3 = $('input[name="pengine"]:checked').val();
// 			var standard4 = $('input[name="pturbine"]:checked').val();
// 			var standard5 = $('input[name="pbearing"]:checked').val();
// 			var standard6 = $('input[name="pairpress"]:checked').val();
// 			var standard7 = $('input[name="pehc"]:checked').val();
			var viscoval = $("#viscoval").val();
			var acidval = $("#acidval").val();
// 			alert(standard1);
// 			alert(standard2);
// 			alert(standard3);
// 			alert(standard4);
// 			alert(standard5);
// 			alert(cvalue);

			//location.href="/ajax/infoAnalysisExcel.info?companyIdx="+companyIdx+"&specIdx="+specIdx+"&sampleIdx="+sampleIdx+"&searchCol="+searchCol+"&startDate="+startDate+"&endDate="+endDate+"&searchKey="+searchKey+"&companyName="+companyName+"&specName="+specName+"&sampleName="+sampleName+"&smplPoint="+smplPoint+"&manager="+manager+"&standard="+standard+"&standard2="+standard2+"&standard3="+standard3+"&standard4="+standard4+"&standard5="+standard5+"&standard6="+standard6+"&standard7="+standard7+"&viscoval="+viscoval+"&acidval="+acidval;
			location.href="/ajax/infoAnalysisExcel.info?companyIdx="+companyIdx+"&specIdx="+specIdx+"&sampleIdx="+sampleIdx+"&searchCol="+searchCol+"&startDate="+startDate+"&endDate="+endDate+"&searchKey="+searchKey+"&companyName="+companyName+"&specName="+specName+"&sampleName="+sampleName+"&smplPoint="+smplPoint+"&manager="+manager+"&standard="+standard+"&viscoval="+viscoval+"&acidval="+acidval;
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
    <input type="hidden" id ="examChk" name="examChk" value="<%=examChk%>">
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
                    <div id="checkList">
                        <table class="tableTypeE" width="100%" align="center" id="oiltbl" name="oiltbl" style="display:;" border="0">
                            <tr>
                                <td><b>1. Oil Condition Search Value</b></td>
                            </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="oiltbl" name="oiltbl" style="display:;" border="0">
                            <!-- 동점도 및 산가 -->
                            <tr>
					            <td height="30" valign="bottom">Viscosity (cSt)</td>
					            <td height="30" valign="bottom">Acid Number (mgKOH/g)</td>
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
					        
					        <!-- 염기가 및 원소분석 -->
					        <tr>
					            <td height="30" valign="bottom">염기가 Base Number (mgKOH/g)</td>
					            <td height="30" valign="bottom">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
					        </tr>
					        <tr>
					            <td><input type="checkbox" value="<%=colMap.get("basenumber")%>" class="chk">Base Number</td>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("mgrde")%>" class="chk">Magnesium (Mg)
	                                <input type="checkbox" value="<%=colMap.get("carde")%>" class="chk">Calcium (Ca)
	                                <input type="checkbox" value="<%=colMap.get("barde")%>" class="chk">Barium (Ba)<br>
	                                <input type="checkbox" value="<%=colMap.get("prde")%>" class="chk">Phosphorus (P)
	                                <input type="checkbox" value="<%=colMap.get("znrde")%>" class="chk">Zinc (Zn)
					            </td>
					        </tr>
					        
					        <!-- 사용유 잔존 수명평가 -->
					        <tr>
					            <td height="30" valign="bottom">사용유 잔존 수명평가 Remaining Useful Life; RULER (%)</td>
					            <td height="30" valign="bottom">사용유 잔존 수명평가 Remaining Useful Life; RULER (R/N)</td>
					        </tr>
					        <tr>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("rul1peak")%>" class="chk"> RUL1_Peak1 
								    <input type="checkbox" value="<%=colMap.get("rul2peak")%>" class="chk"> RUL2_Peak2
					            </td>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("rulernumber")%>" class="chk"> RULER NUMBER
					            </td>
					        </tr>
					        
					        <!-- 기포성 및 항유화성 -->
					        <tr>
					            <td height="30" valign="bottom">기포성 Foaming characteristic of oil (ml)</td>
					            <td height="30" valign="bottom">항유화성 Water separability (min)</td>
					        </tr>
					        <tr>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("tendency")%>" class="chk"> 24℃ (tendency < 450ml) 
									<input type="checkbox" value="<%=colMap.get("stability")%>" class="chk"> 93.5℃ (stability 0ml(Nil))<br>
									<input type="checkbox" value="<%=colMap.get("nil")%>" class="chk"> 24℃ (stability 0ml(Nil))
					            </td>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("waterseparability")%>" class="chk"> Water separability
					            </td>
					        </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="oiltbl" name="oiltbl" style="display:;" border="0">
                            <tr>
                                <td><b>2. Contamination Search Value</b></td>
                            </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="contaminationtbl" name="contaminationtbl" style="display:;" border="0">
                            <!-- 수분 및 입자오염도 -->
                            <tr>
					            <td height="30" valign="bottom">수분 Water Content (ppm)</td>
					            <td height="30" valign="bottom">입자오염도 Particle Count </td>
					        </tr>
					        <tr>
					            <td><input type="checkbox" value="<%=colMap.get("water")%>" class="chk"> Water</td>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("p4um")%>" class="chk"> 4um (c)
									<input type="checkbox" value="<%=colMap.get("p6um")%>" class="chk"> 6um (c) 
									<input type="checkbox" value="<%=colMap.get("p14um")%>" class="chk"> 14um (c) 
									<input type="checkbox" value="<%=colMap.get("p21um")%>" class="chk"> 21um (c)
									<input type="checkbox" value="<%=colMap.get("p38um")%>" class="chk"> 38um (c) 
									<input type="checkbox" value="<%=colMap.get("p70um")%>" class="chk"> 70um
					            </td>
					        </tr>
					        <!-- 원소분석 및 바니쉬 잠재위험도 -->
					        <tr>
					            <td height="30" valign="bottom">원소분석 Elemental analysis ; Contamination Metals(ppm)</td>
					            <td height="30" valign="bottom">바니쉬 잠재 위험도 Membrane Patch Colorimetry</td>
					        </tr>
					        <tr>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("siliconrde")%>" class="chk"> Silicon (Si) 
									<input type="checkbox" value="<%=colMap.get("sodiumrde")%>" class="chk"> Sodium (Na)
									<input type="checkbox" value="<%=colMap.get("potassium")%>" class="chk"> Potassium (K) 
					            </td>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("mpcval")%>" class="chk"> MPC Value 
					            </td>
					        </tr>
					        
					        <!-- 바니쉬 잠재위험도 -->
					        <tr>
					            <td height="30" valign="bottom">바니쉬 잠재 위험도 MPC for Phosphate Ester Fluids (Patch wt(mg))</td>
					            <td height="30" valign="bottom"></td>
					        </tr>
					        <tr>
					            <td><input type="checkbox" value="<%=colMap.get("mpcweight")%>" class="chk"> MPC weight</td>
					            <td></td>
					        </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="oiltbl" name="oiltbl" style="display:;" border="0">
                            <tr>
                                <td><b>3. Wear Search Value</b></td>
                            </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="weartbl" name="weartbl" style="display:;" border="0">
                            <!-- 원소분석 -->
                            <tr>
					            <td height="30" valign="bottom">원소분석 Elemental analysis ; Wear metals(ppm)</td>
					        </tr>
					        <tr>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("ferde")%>" class="chk"> Iron (Fe)
					                <input type="checkbox" value="<%=colMap.get("crrde")%>" class="chk"> Chrome (Cr)
					                <input type="checkbox" value="<%=colMap.get("alrde")%>" class="chk"> Aluminum (Al)
					                <input type="checkbox" value="<%=colMap.get("curde")%>" class="chk"> Copper (Cu)<br>
					                <input type="checkbox" value="<%=colMap.get("pbrde")%>" class="chk"> Lead (Pb)
					                <input type="checkbox" value="<%=colMap.get("snrde")%>" class="chk"> Tin (Sn)
					                <input type="checkbox" value="<%=colMap.get("vrde")%>" class="chk"> Vanadium (V)
					            </td>
					        </tr>
					        
					        <!-- 원소분석 -->
					        <tr>
					            <td height="30" valign="bottom">원소분석 Elemental analysis ; Multi-Source metals(ppm)</td>
					        </tr>
					        <tr>
					            <td>
					                <input type="checkbox" value="<%=colMap.get("tirde")%>" class="chk"> Titanium (Ti)
					                <input type="checkbox" value="<%=colMap.get("morde")%>" class="chk"> Molybdenum (Mo)
					                <input type="checkbox" value="<%=colMap.get("nirde")%>" class="chk"> Nickel (Ni)<br>
					                <input type="checkbox" value="<%=colMap.get("mnrde")%>" class="chk"> Manganese (Mn)
					                <input type="checkbox" value="<%=colMap.get("boronrde")%>" class="chk"> Boron (B)
					            </td>
					        </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="oiltbl" name="oiltbl" style="display:;" border="0">
                            <tr>
                                <td><b>4. Additional Search Value</b></td>
                            </tr>
                        </table>
                        <table class="tableTypeE" width="100%" align="center" id="additionaltbl" name="additionaltbl" style="display:;" border="0">
                            <!-- 비중 및 유동점 -->
                            <tr>
                                <td height="30" valign="bottom">비중 Specific Gravity</td>
					            <td height="30" valign="bottom">유동점 Pour point (Celsius)</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("specificgravity")%>" class="chk"> Specific Gravity </td>
                                <td><input type="checkbox" value="<%=colMap.get("pourpoint")%>" class="chk"> Pour point</td>
                            </tr>
                            
                            <!-- 인화점 -->
                            <tr>
                                <td height="30" valign="bottom">인화점 Flash point (Celsius) ; Clevenland open cup</td>
					            <td height="30" valign="bottom">인화점 Flash point (Celsius) ; Pensky-martens closed cup</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("flashpoint")%>" class="chk"> Flash point</td>
                                <td><input type="checkbox" value="<%=colMap.get("flashpoint2")%>" class="chk"> Flash point</td>
                            </tr>
                            
                            <!-- 염소분 -->
                            <tr>
                                <td height="30" valign="bottom">염소분 Chlorine (ppm)</td>
					            <td height="30" valign="bottom"></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("chlorine")%>" class="chk"> Chlorine</td>
                                <td></td>
                            </tr>
                            
                            <!-- FT-IR ; Additives Abs -->
                            <tr>
                                <td height="30" valign="bottom">FT-IR ; Additives Abs</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" value="<%=colMap.get("abs1")%>" class="chk"> Amine Antioxidant
                                    <input type="checkbox" value="<%=colMap.get("abs2")%>" class="chk"> Amine Antioxidant Ⅱ
                                    <input type="checkbox" value="<%=colMap.get("abs3")%>" class="chk"> Antiwear ASTM
                                    <input type="checkbox" value="<%=colMap.get("abs4")%>" class="chk"> Antiwear ASTM Ⅱ<br>
                                    <input type="checkbox" value="<%=colMap.get("abs5")%>" class="chk"> Antiwear ASTM Ⅲ
                                    <input type="checkbox" value="<%=colMap.get("abs6")%>" class="chk"> Demulsifier
                                    <input type="checkbox" value="<%=colMap.get("abs7")%>" class="chk"> Dispersant (Succinimide)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" value="<%=colMap.get("abs8")%>" class="chk"> Extreme Pressure
                                    <input type="checkbox" value="<%=colMap.get("abs9")%>" class="chk"> Phenol Antioxidant
                                    <input type="checkbox" value="<%=colMap.get("abs10")%>" class="chk"> Phenol Antioxidant (Polyol ester fluids)<br>
                                    <input type="checkbox" value="<%=colMap.get("abs11")%>" class="chk"> Pour Point Depressant/Ⅶ (Polymethacrylate)
                                    <input type="checkbox" value="<%=colMap.get("abs12")%>" class="chk"> Rust Inhibitor (Succinic acid)<br>
                                    <input type="checkbox" value="<%=colMap.get("abs13")%>" class="chk"> Viscosity Index Improver (Polyisobutene)
                                    <input type="checkbox" value="<%=colMap.get("abs14")%>" class="chk"> Viscosity Index Improver (Polymethacrylate)
                                </td>
                            </tr>
                            
                            <!-- FT-IR ; Contamination (Abs) -->
                            <tr>
                                <td height="30" valign="bottom">FT-IR ; Contamination (Abs)</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" value="<%=colMap.get("coabs1")%>" class="chk"> Detergent(sulfonate)
                                    <input type="checkbox" value="<%=colMap.get("coabs2")%>" class="chk"> Diesel ASTM
                                    <input type="checkbox" value="<%=colMap.get("coabs3")%>" class="chk"> Ethylene Glycol Coolant ASTM<br>
                                    <input type="checkbox" value="<%=colMap.get("coabs4")%>" class="chk"> Fatty Acids
                                    <input type="checkbox" value="<%=colMap.get("coabs5")%>" class="chk"> Fluid Contamination ASTM 
                                    <input type="checkbox" value="<%=colMap.get("coabs6")%>" class="chk"> Gasoline ASTM
                                    <input type="checkbox" value="<%=colMap.get("coabs7")%>" class="chk"> Nitration ASTM
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" value="<%=colMap.get("coabs8")%>" class="chk"> Oxidation ASTM
                                    <input type="checkbox" value="<%=colMap.get("coabs9")%>" class="chk"> Soot Loading ASTM
                                    <input type="checkbox" value="<%=colMap.get("coabs10")%>" class="chk"> Sulfate by products ASTM<br>
                                    <input type="checkbox" value="<%=colMap.get("coabs11")%>" class="chk"> Synthetic Lue Breakdown Ⅰ ASTM
                                    <input type="checkbox" value="<%=colMap.get("coabs12")%>" class="chk"> Synthetic Lue BreakdownⅡ ASTM<br>
                                    <input type="checkbox" value="<%=colMap.get("coabs13")%>" class="chk"> Water (ASTM Petroluem  EP Fluid)
                                    <input type="checkbox" value="<%=colMap.get("coabs14")%>" class="chk"> Water (ASTM Petroluem  Lubricant)<br>
                                    <input type="checkbox" value="<%=colMap.get("coabs15")%>" class="chk"> Water (ASTM Polyol Ester Fluids)
                                </td>
                            </tr>
                            
                            <!-- 적점 Dropping Point (Celsius) -->
                            <tr>
                                <td height="30" valign="bottom">적점 Dropping Point (Celsius)</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("droppoint")%>" class="chk"> Dropping Point</td>
                            </tr>
                            
                            <!-- 주도 Penetration (mm) -->
                            <tr>
                                <td height="30" valign="bottom">주도 Penetration (mm) </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("penetration")%>" class="chk"> Penetration</td>
                            </tr>
                            
                            <!-- 이유도 Oil Separation @100℃ (wt %) -->
                            <tr>
                                <td height="30" valign="bottom">이유도 Oil Separation @100℃ (wt %)</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("oilseparation")%>" class="chk"> Oil Separation @100℃</td>
                            </tr>
                            
                            <!-- 철분마모분석 Particle Quantifier ; Ferrous Density -->
                            <tr>
                                <td height="30" valign="bottom">철분마모분석 Particle Quantifier ; Ferrous Density</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" value="<%=colMap.get("pqindex")%>" class="chk"> PQ index</td>
                            </tr>
                        </table>
                    </div>
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
        <!--div id="checkList2">
        <table class="tableTypeC"  width="100%" align="center">
        <colgroup>
            <col width="20%" />
            <col width="*" />
        </colgroup>
            <tr>
                <th colspan="2">기준치 설정</th>
            </tr>
            <tr>
                <td colspan="2">
	                <input type="radio" id="standard" name="standard" value="phydraulic" class="chk"> 유압유
	                <input type="radio" id="standard" name="standard" value="pgear" class="chk"> 기어유
	                <input type="radio" id="standard" name="standard" value="pengine" class="chk"> 엔진유
	                <input type="radio" id="standard" name="standard" value="pturbine" class="chk"> 터빈유
	                <input type="radio" id="standard" name="standard" value="pbearing" class="chk"> 베어링유
	                <input type="radio" id="standard" name="standard" value="pairpress" class="chk"> 공기압축기유
	                <input type="radio" id="standard" name="standard" value="pehc" class="chk"> EHC유
                </td>
            </tr>
            <div id="viscosityview">
	            <tr>
	                <td>동점도 Viscosity</td>
	                <td>
	                    <input type="radio" id="viscosity" name="viscosity" value="auto">자동
	                    <input type="radio" id="viscosity" name="viscosity" value="manual">수동 : <input type="text" id="viscoval" name="viscoval" value="">
	                </td>
	            </tr>
            </div>
            <div id="acidview">
	            <tr>
	                <td>산가 Acid Number</td>
	                <td>
	                    <input type="radio" id="acidno" name="acidno" value="auto">자동
	                    <input type="radio" id="acidno" name="acidno" value="manual">수동 : <input type="text" id="acidval" name="acidval" value="">
	                </td>
	            </tr>
            </div>
<!--             <div id="basenoview"> -->
<!--                 <tr> -->
<!--                     <td>염기가 Base Number</td> -->
<!--                     <td><input type="radio" id="baseno" name="baseno" value="apply">기준치 적용</td> -->
<!--                 </tr> -->
<!--             </div> -->
<!--             <div id="rulerview"> -->
<!--                 <tr> -->
<!--                     <td>사용유 잔존 수명평가 Remaining Useful Life; RULER (%)</td> -->
<!--                     <td><input type="radio" id="rulerap" name="rulerap" value="apply">기준치 적용</td> -->
<!--                 </tr> -->
<!--             </div> -->
<!--             <div id="rulerview2"> -->
<!--                 <tr> -->
<!--                     <td>사용유 잔존 수명평가 Remaining Useful Life; RULER (R/N)</td> -->
<!--                     <td><input type="radio" id="rulerap2" name="rulerap2" value="apply">기준치 적용</td> -->
<!--                 </tr> -->
<!--             </div> -->
<!--             <div id="waterseparabilityview"> -->
<!--                 <tr> -->
<!--                     <td>항유화성 Water separability</td> -->
<!--                     <td><input type="radio" id="waterap" name="waterap" value="apply">기준치 적용</td> -->
<!--                 </tr> -->
<!--             </div> -->
<!--             <div id="foamingview"> -->
<!--                 <tr> -->
<!--                     <td>기포성 Foaming characteristic of oil</td> -->
<!--                     <td><input type="radio" id="foamingap" name="foamingap" value="apply">기준치 적용</td> -->
<!--                 </tr> -->
<!--             </div> -->
<!--             <div id="foamingview"> -->
<!--                 <tr> -->
<!--                     <td>기포성 Foaming characteristic of oil</td> -->
<!--                     <td><input type="radio" id="foamingap" name="foamingap" value="apply">기준치 적용</td> -->
<!--                 </tr> -->
<!--             </div> -->
        <!--/table>
        </div-->
    <%
        }
    %>
    <!--table width="100%" align="center">
        <tr>
            <td align="right">
            	<input name="infoResultDownload" class="btn_style4" id="infoResultDownload" type="submit" value="성적서다운"/>
            	<input name="infoExcelDownload" class="btn_style4" id="infoExcelDownload" type="submit" value="결과서다운"/>
            </td>
        </tr>
    </table-->
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