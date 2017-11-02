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
	String membGb = (String)session.getAttribute("membGb");
	Map<String, Object> infoMap = (Map<String, Object>)request.getAttribute("infoMap");
	String companyIdx = (String)infoMap.get("COMPANYIDX");
	String infoIdx = (String)request.getAttribute("infoIdx");
%>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
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
    	
    	$("#companyIdx").change(function(){
    		var companyIdx = $(this).val();
    		
    		$.ajax({
    			type: "POST", 
    			url: "/info/machineList.info", 
    			data: "companyIdx="+companyIdx, 
    			success: function(msg){
    				var resultObj = $.parseJSON(msg);
    				var result = $("#specIdx");
    				result.empty();
    				result.append($("<option value=''></option>"));
    				//alert(resultObj.result.length);
    				for(i=0; i < resultObj.result.length; i++) {
    					//alert(resultObj.result[i].IDX);
    					//result +="<option value='"+resultObj.result[i].IDX+"'>"+resultObj.result[i].IDX+"</option>";
    					result.append(
    			                $('<option></option>').val(resultObj.result[i].IDX).html(resultObj.result[i].MACHINENAME)
    			        );

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
    			url: "/info/smplList.info", 
    			data: "specIdx="+specIdx, 
    			success: function(msg){
    				var resultObj = $.parseJSON(msg);
    				var result = $("#sampleIdx");
    				result.empty();
    				result.append($("<option value=''></option>"));
    				//alert(resultObj.result.length);
    				for(i=0; i < resultObj.result.length; i++) {
    					//alert(resultObj.result[i].IDX);
    					//result +="<option value='"+resultObj.result[i].IDX+"'>"+resultObj.result[i].IDX+"</option>";
    					result.append(
    			                $('<option></option>').val(resultObj.result[i].IDX).html(resultObj.result[i].SPECINAME)
    			        );

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
    			url: "/info/smplPoint.info", 
    			data: "sampleIdx="+sampleIdx, 
    			success: function(msg){
    				var resultObj = $.parseJSON(msg);
    				//alert(resultObj.result);
    				$("#smplpoint").val(resultObj.result);
    			}
    		});
    	});
    	
    	$("#modify").click(function(e) {
    		var modify;
    		modify = confirm("수정하시겠습니까?");
    		
    		if(modify == true) {
    			location.href="/info/infoWrite.info?idx=<%=idx%>";
    		} else {
    			alert("수정이 취소되었습니다.");
    		} 
    	});
    	
    	$("#delete").click(function(e) {
    		var del;
    		del = confirm("삭제하시겠습니까?");
    		
    		if(del == true) {
    			location.href="/info/infoDelete.info?idx=<%=idx%>";
    		} else {
    			alert("삭제가 취소되었습니다.");
    		}
    	});
    	
    	$("#list").click(function(e) {
    		location.href="/info/infoList.info";
    	});
    	
    	$("#exam").click(function(e) {
    		var write;
    		write = confirm("시험성적서를 입력하시겠습니까?");
    		
    		if(write == true) {
    			location.href="/exam/examWrite.info?idx=<%=idx%>&companyIdx=<%=companyIdx%>&type=insert";
    		} else {
    			alert("시험성적서 입력이 취소되었습니다.");
    		}
    		
    	});
    	
    	$("#infoExcelDownload").click(function(e) {
    		location.href="/info/infoExcelDownload.info?idx=<%=idx%>";
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
    
    function examView(idx, companyIdx) {
    	if(idx == "") {
    		alert("시험성적이 발급되지 않았습니다."); 
    	} else {
    		location.href="/exam/examView.info?idx="+idx+"&companyIdx="+companyIdx;
    	}
    }
</script>
</head>
<body>
    <table width="100%" align="center">
        <tr>
            <td align="left"><h2 class="pageTitleH1">Report Data 보기</h2></td>
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
        <!--tr>
            <td align="right"><input name="infoExcelDownload" class="btn_style4" id="infoExcelDownload" type="submit" value="엑셀다운"/></td>
        </tr-->
    </table>
    
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
            <td style="font-size:12px;" align="center"><%=infoMap.get("COMPANYNAME")%><%=infoMap.get("COMPANYIDX")%></td>
            <td style="font-size:12px;" align="center"><%=infoMap.get("MACHINENAME")%></td>
            <td style="font-size:12px;" align="center"><%=infoMap.get("SAMPLENAME")%></td>
            <td style="font-size:12px;" align="center"><%=infoMap.get("SMPLPOINT")%></td>
            <td style="font-size:12px;" align="center"><%=infoMap.get("OILTYPE")%></td>
            <td style="font-size:12px;" align="center"><%=infoMap.get("AUTHORIZER")%></td>
        </tr>
    </table>

    <table class="tableTypeB" width="100%" align="center" id="oiltbl" name="oiltbl">
        <tr>
            <th width="100%">OIL Condition</th>
        </tr>
    </table>
    
    <table class="tableTypeC" id="viscotbl" width="100%" align="center" style="display:block;">
        <tr>
            <th width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">동점도 Viscosity (cSt)</th>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity@40℃</td>
            <td width="80%"><%=infoMap.get("VISCOSITY40")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity@100℃</td>
            <td width="80%"><%=infoMap.get("VISCOSITY100")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index</td>
            <td width="80%"><%=infoMap.get("VISCOSITYINDEX")%></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="acidtbl" name="acidtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">산가 Acid Number (mgKOH/g)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Acid Number</td>
            <td width="80%"><%=infoMap.get("ACIDNUMBER")%></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="basetbl" name="basetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">염기가 Base Number (mgKOH/g)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Base Number</td>
            <td width="80%"><%=infoMap.get("BASENUMBER")%></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="addtivestbl" name="addtivestbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Magnesium (Mg)</td>
            <td width="80%"><%=infoMap.get("MGRDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Calcium (Ca)</td>
            <td width="80%"><%=infoMap.get("CARDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Barium (Ba)</td>
            <td width="80%"><%=infoMap.get("BARDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phosphorus (P)</td>
            <td width="80%"><%=infoMap.get("PRDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Zinc (Zn)</td>
            <td width="80%"><%=infoMap.get("ZNRDE")%></td>
        </tr>
    </table>

    <table class="tableTypeC" id="rulertbl" name="rulertbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">사용유 잔존 수명평가 Remaining Useful Life; RULER (%)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RUL1_Peak1</td>
            <td width="80%"><%=infoMap.get("RUL1PEAK")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RUL2_Peak2</td>
            <td width="80%"><%=infoMap.get("RUL2PEAK")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="rulertbl2" name="rulertbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">사용유 잔존 수명평가 Remaining Useful Life; RULER (R/N)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">RULER NUMBER</td>
            <td width="80%"><%=infoMap.get("RULERNUMBER")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="foamingtbl" name="foamingtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">기포성 Foaming characteristic of oil (ml)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">24℃</td>
            <td width="80%"><%=infoMap.get("TENDENCY")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">93.5℃</td>
            <td width="80%"><%=infoMap.get("STABILITY")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">24℃</td>
            <td width="80%"><%=infoMap.get("NIL")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="watertbl" name="watertbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">항유화성 Water separability (min)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water separability</td>
            <td width="80%"><%=infoMap.get("WATERSEPARABILITY")%></td>
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
            <td width="80%"><%=infoMap.get("WATER")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="particletbl" name="particletbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">입자오염도 Particle Count </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">ISO 4406</td>
            <td width="80%"><%=infoMap.get("ISO1")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">NAS 1638</td>
            <td width="80%"><%=infoMap.get("NAS")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">SAE AS 4059</td>
            <td width="80%"><%=infoMap.get("SAE")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="particlenumtbl" name="particlenumtbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">입자크기별(㎛) 개수(Number of particles/ml) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>4um (c)</td>
            <td width="80%"><%=infoMap.get("P4UM")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>6um (c)</td>
            <td width="80%"><%=infoMap.get("P6UM")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>14um (c)</td>
            <td width="80%"><%=infoMap.get("P14UM")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>21um (c)</td>
            <td width="80%"><%=infoMap.get("P21UM")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>38um (c)</td>
            <td width="80%"><%=infoMap.get("P38UM")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">>70um (c)</td>
            <td width="80%"><%=infoMap.get("P70UM")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="contmetaltbl" name="contmetaltbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Contamination Metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Silicon (Si)</td>
            <td width="80%"><%=infoMap.get("SILICONRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sodium (Na)</td>
            <td width="80%"><%=infoMap.get("SODIUMRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Potassium (K)</td>
            <td width="80%"><%=infoMap.get("POTASSIUM")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="membranetbl" name="membranetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">바니쉬 잠재 위험도 Membrane Patch Colorimetry </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">MPC Value</td>
            <td width="80%"><%=infoMap.get("MPCVAL")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">patch</td>
            <td width="80%"><img width="100" src="<%=infoMap.get("UPATCH")%>"></td>
        </tr>
    </table>

	<table class="tableTypeC" id="phosphatetbl" name="phosphatetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">바니쉬 잠재 위험도 MPC for Phosphate Ester Fluids (Patch wt(mg))</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">MPC weight</td>
            <td width="80%"><%=infoMap.get("MPCWEIGHT")%></td>
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
            <td width="80%"><%=infoMap.get("FERDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chrome (Cr)</td>
            <td width="80%"><%=infoMap.get("CRRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Aluminum (Al)</td>
            <td width="80%"><%=infoMap.get("ALRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Copper (Cu)</td>
            <td width="80%"><%=infoMap.get("CURDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Lead (Pb)</td>
            <td width="80%"><%=infoMap.get("PBRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Tin (Sn)</td>
            <td width="80%"><%=infoMap.get("SNRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Vanadium (V)</td>
            <td width="80%"><%=infoMap.get("VRDE")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Multi-Source metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Titanium (Ti)</td>
            <td width="80%"><%=infoMap.get("TIRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Molybdenum (Mo)</td>
            <td width="80%"><%=infoMap.get("MORDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nickel (Ni)</td>
            <td width="80%"><%=infoMap.get("NIRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Manganese (Mn)</td>
            <td width="80%"><%=infoMap.get("MNRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Boron (B)</td>
            <td width="80%"><%=infoMap.get("BORONRDE")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="ferrousdencitytbl" name="ferrousdencitytbl" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">철분마모분석 Particle Quantifier ; Ferrous Density</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">PQ index</td>
            <td width="80%"><%=infoMap.get("PQINDEX")%></td>
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
				<td width="80%"><%=infoMap.get("SPECIFICGRAVITY")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">유동점 Pour point (Celsius)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Pour point </td>
				<td width="80%"><%=infoMap.get("POURPOINT")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">인화점 Flash point (Celsius) ; Clevenland open cup</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Flash point</td>
				<td width="80%"><%=infoMap.get("FLASHPOINT")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">인화점 Flash point (Celsius) ; Pensky-martens closed cup</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Flash point</td>
				<td width="80%"><%=infoMap.get("FLASHPOINT2")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">염소분 Chlorine (ppm)</td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chlorine</td>
				<td width="80%"><%=infoMap.get("CHLORINE")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Blotter spot test</td>
			</tr>
			<tr>
				<td width="100%" colspan="2"><img width="100" src="<%=infoMap.get("UBLOTTER")%>"></td>
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
				<td width="80%"><%=infoMap.get("ABS1")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Amine Antioxidant Ⅱ</td>
				<td width="80%"><%=infoMap.get("ABS2")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM</td>
				<td width="80%"><%=infoMap.get("ABS3")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM Ⅱ</td>
				<td width="80%"><%=infoMap.get("ABS4")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Antiwear ASTM Ⅲ</td>
				<td width="80%"><%=infoMap.get("ABS5")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Demulsifier</td>
				<td width="80%"><%=infoMap.get("ABS6")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Dispersant (Succinimide)</td>
				<td width="80%"><%=infoMap.get("ABS7")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Extreme Pressure</td>
				<td width="80%"><%=infoMap.get("ABS8")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phenol Antioxidant</td>
				<td width="80%"><%=infoMap.get("ABS9")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phenol Antioxidant (Polyol ester fluids)</td>
				<td width="80%"><%=infoMap.get("ABS10")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Pour Point Depressant/Ⅶ(Polymethacrylate)</td>
				<td width="80%"><%=infoMap.get("ABS11")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Rust Inhibitor (Succinic acid)</td>
				<td width="80%"><%=infoMap.get("ABS12")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index Improver (Polyisobutene)</td>
				<td width="80%"><%=infoMap.get("ABS13")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Viscosity Index Improver (Polymethacrylate)</td>
				<td width="80%"><%=infoMap.get("ABS14")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="multisourcetbl" name="multisourcetbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">FT-IR ; Contamination (Abs) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Detergent(sulfonate)</td>
				<td width="80%"><%=infoMap.get("COABS1")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Diesel ASTM</td>
				<td width="80%"><%=infoMap.get("COABS2")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Ethylene Glycol Coolant ASTM</td>
				<td width="80%"><%=infoMap.get("COABS3")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Fatty Acids</td>
				<td width="80%"><%=infoMap.get("COABS4")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Fluid Contamination ASTM </td>
				<td width="80%"><%=infoMap.get("COABS5")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Gasoline ASTM</td>
				<td width="80%"><%=infoMap.get("COABS6")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nitration ASTM</td>
				<td width="80%"><%=infoMap.get("COABS7")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Oxidation ASTM</td>
				<td width="80%"><%=infoMap.get("COABS8")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Soot Loading ASTM</td>
				<td width="80%"><%=infoMap.get("COABS9")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sulfate by products ASTM</td>
				<td width="80%"><%=infoMap.get("COABS10")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Synthetic Lue Breakdown Ⅰ ASTM</td>
				<td width="80%"><%=infoMap.get("COABS11")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Synthetic Lue BreakdownⅡ ASTM</td>
				<td width="80%"><%=infoMap.get("COABS12")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Petroluem  EP Fluid)</td>
				<td width="80%"><%=infoMap.get("COABS13")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Petroluem  Lubricant)</td>
				<td width="80%"><%=infoMap.get("COABS14")%></td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Water (ASTM Polyol Ester Fluids)</td>
				<td width="80%"><%=infoMap.get("COABS15")%></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Patch test</td>
			</tr>
			<tr>
				<td colspan="2"><img width="100" src="<%=infoMap.get("UPATCHTEST")%>"></td>
			</tr>
		</table>

		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">Insolubles test for Phosphate Ester Fluids </td>
			</tr>
			<tr>
			    <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Insolubles test</td>
				<td width="80%"><img width="100" src="<%=infoMap.get("INSOLUBLE")%>"></td>
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
				<td width="80%"><%=infoMap.get("DROPPOINT")%></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">주도 Penetration (mm) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Penetration   </td>
				<td width="80%"><%=infoMap.get("PENETRATION")%></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="ferroustbl" name="ferroustbl" width="100%" align="center" style="display:block;">
			<tr>
				<td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">이유도 Oil Separation @100℃ (wt %) </td>
			</tr>
			<tr>
				<td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Oil Separation @100℃   </td>
				<td width="80%"><%=infoMap.get("OILSEPARATION")%></td>
			</tr>
		</table>
		
		<table class="tableTypeC" id="contmetaltbl2" name="contmetaltbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Contamination Metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Silicon (Si)</td>
            <td width="80%"><%=infoMap.get("SILICONRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Sodium (Na)</td>
            <td width="80%"><%=infoMap.get("SODIUMRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Potassium (K)</td>
            <td width="80%"><%=infoMap.get("POTASSIUMRDE")%></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="addtivestbl2" name="addtivestbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Additives Metals(ppm)</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Magnesium (Mg)</td>
            <td width="80%"><%=infoMap.get("MGRDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Calcium (Ca)</td>
            <td width="80%"><%=infoMap.get("CARDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Barium (Ba)</td>
            <td width="80%"><%=infoMap.get("BARDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Phosphorus (P)</td>
            <td width="80%"><%=infoMap.get("PRDE")%></td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Zinc (Zn)</td>
            <td width="80%"><%=infoMap.get("ZNRDE")%></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="wearmetaltbl2" name="wearmetaltbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Wear metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Iron (Fe)</td>
            <td width="80%"><%=infoMap.get("FERDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Chrome (Cr)</td>
            <td width="80%"><%=infoMap.get("CRRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Aluminum (Al)</td>
            <td width="80%"><%=infoMap.get("ALRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Copper (Cu)</td>
            <td width="80%"><%=infoMap.get("CURDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Lead (Pb)</td>
            <td width="80%"><%=infoMap.get("PBRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Tin (Sn)</td>
            <td width="80%"><%=infoMap.get("SNRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Vanadium (V)</td>
            <td width="80%"><%=infoMap.get("VRDE")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="multisourcetbl2" name="multisourcetbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">원소분석 Elemental analysis ; Multi-Source metals(ppm) </td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Titanium (Ti)</td>
            <td width="80%"><%=infoMap.get("TIRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Molybdenum (Mo)</td>
            <td width="80%"><%=infoMap.get("MORDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Nickel (Ni)</td>
            <td width="80%"><%=infoMap.get("NIRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Manganese (Mn)</td>
            <td width="80%"><%=infoMap.get("MNRDE")%></td>
        </tr>
		<tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">Boron (B)</td>
            <td width="80%"><%=infoMap.get("BORONRDE")%></td>
        </tr>
    </table>

	<table class="tableTypeC" id="ferrousdencitytbl2" name="ferrousdencitytbl2" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">철분마모분석 Particle Quantifier ; Ferrous Density</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee">PQ index</td>
            <td width="80%"><%=infoMap.get("PQINDEX")%></td>
        </tr>
    </table>
    
    <table class="tableTypeC" id="additionalcon" name="additionalcon" width="100%" align="center" style="display:block;">
        <tr>
            <td width="100%" style="font-size:12px; height:18px; background-color: #eeeeee" colspan="2">추가항목</td>
        </tr>
        <tr>
            <td width="20%" style="font-size:12px; height:18px; background-color: #eeeeee"><%=infoMap.get("ADDFIELD") %></td>
            <td width="80%"><%=infoMap.get("ADDFIELDCON")%></td>
        </tr>
    </table>
		
	</div>
    <table width="100%" align="center">
        <tr>
            <td height="20"></td>
        </tr>
    </table>
    <table width="100%" align="center">
        <tr>
            <!--td style="font-size:12px; height:30px;" align="center" valign="bottom"><a href="/info/infoWrite.info?idx=<%=idx%>">수정</a></td>
            <td style="font-size:12px; height:30px;" align="center" valign="bottom"><a href="">삭제</a></td>
            <td style="font-size:12px; height:30px;" align="center" valign="bottom"><a href="/info/infoList.info">목록</a></td-->
            <%
                if(membGb != null && membGb != "" && Integer.parseInt(membGb) > 80) {
            %>
            <td align="center" style="font-size: 12px"><input name="modify" class="btn_style4" id="modify" type="submit" value="정보수정"/></td>
            <td align="center" style="font-size: 12px"><input name="delete" class="btn_style4" id="delete" type="submit" value="정보삭제"/></td>
            <%
                } else {
            %>
                <td></td>
                <td></td>
            <%
                }
            %>
            <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="list" type="submit" value="목록보기"/></td>
            <%
                if(membGb != null && membGb != "" && Integer.parseInt(membGb) > 80) {
            %>
            <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="exam" type="submit" value="성적작성"/></td>
            <%
                } else {
            %>
                <td></td>
            <%
                }
            %>
            <td align="center" style="font-size: 12px"><input name="list" class="btn_style4" id="examview" type="submit" onClick="examView('<%=idx %>','<%=companyIdx %>')" value="성적보기"/></td>
        </tr>
    </table>
</body>
</html>