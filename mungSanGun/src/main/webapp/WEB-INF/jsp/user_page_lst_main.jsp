<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<title>상품 관리 페이지</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.1/examples/starter-template/">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">


<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.1/examples/starter-template/starter-template.css"
	rel="stylesheet">

<style type="text/css">
.mycenterStyle{font-size: 11px; text-align:center; vertical-align:middle}
</style>
</head>
<body>

		<div class="page-header">
			<h2>상품 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" id='createButton' onclick="createButton_onclikc()" style="font-size: 11px">추가</button>
		    </div>
		    <div class="col-md">
		    </div>
		    <div class="col-md" align='right'>
			  	<div class="row">
				    <div class="col-lg">
				     <input class="form-control" type="text" id='searchItemNm' placeholder="상품이름" value='${searchTxt }' style="font-size: 11px">
			    	</div>
				    <div class="col-auto">
				      <button type="button" class="btn btn-secondary" onclick="searchItemList()" style="font-size: 11px">검색</button>
			    	</div>
		    	</div>
		    </div>
		  </div>
		
		<div class="page-header">
			<h2></h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 11px; text-align:center; vertical-align:middle">
					<thead>
						<tr>
							<th>순서</th>
							<th>이미지 </th>
							<th>상품명 - 상품명 정렬 내림차순 오름차순 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>구입가 </th>
							<th>마진 </th>
							<th>최저가 </th>
							<th>링크</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody valign='bottom'>
							<tr style='font-size: 11px; text-align:center; vertical-align:middle'>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>1</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<img src='/static/img/downIcon.png' width='10px' height='10px' data-toggle='modal' data-target='#modifyModal' onclick='clickNewView(${list.DIDX})'>
									<img src='data:image/jpeg;base64,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' 
										width='50px' height='50px'>
								  	
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									롯데칠성 아이시스 500ml 80개 
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									23000
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									3000
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									수식
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									22800
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									20000
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									2800
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									19800
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									링크
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<button type='button' class='btn btn-primary' id='removeButton' onclick='modifyButton_onclikc(${list.DIDX})' style='font-size: 10px'>수정</button>
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclikc(${list.DIDX})' style='font-size: 10px'>삭제</button>
								</td>
							</tr>
							<!-- 
						<c:forEach items='${outDto}' var='list' varStatus='status'>
							<tr data-toggle='modal' data-target='#modifyModal'
								onclick='createButton_onclikc(${list.DIDX})'>
								<td>1</td>
								  <td><img src='../resources/img/downIcon.png'>이미지</td>
								  <td>롯데칠성 아이시스 500ml 80개 </td>
								  <td>23000</td>
								  <td>3000</td>
								  <td>수식</td>
								  <td>22800</td>
								  <td>20000</td>
								  <td>2800</td>
								  <td>19800</td>
								  <td>링크</td>
								<td>
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclikc(${list.DIDX})' style='font-size: 10px'>삭제</button>
								</td>
							</tr>
						</c:forEach>
						 -->
					</tbody>
				</table>
				</div>
			</div>
	<!-- /.container -->

	<!-- modify Modal -->
	<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">상품 상세</div>
				<div class="modal-body" id="modalBody"
					style="max-width: 100%; width: auto !important; display: inline-block;">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick='modifyButton_onclikcData()'>저장</button>
				</div>
			</div>
		</div>
	</div>

	<form id="modifyProductSearchLst" method="post"
		action="/modifyProductSearchLst">
		<input type='hidden' id="IDX" name="IDX" value=''> <input
			type='hidden' id="TARGETCOMMANT" name="TARGETCOMMANT" value=''> <input
			type='hidden' id="SHOPIDX" name="SHOPIDX" value=''> <input
			type='hidden' id="TARGETWEBURL" name="TARGETWEBURL" value=''> <input
			type='hidden' id="TARGETAMT" name="TARGETAMT" value=''> <input
			type='hidden' id="GBUPDOWN" name="GBUPDOWN" value=''> <input
			type='hidden' id="GBCARD" name="GBCARD" value=''> <input
			type='hidden' id="ALAMSOLDOUT" name="ALAMSOLDOUT" value=''> <input
			type='hidden' id="ID" name="ID" value=''> <input
			type='hidden' id="PWD" name="PWD" value=''> <input
			type='hidden' id="ALAMYN" name="ALAMYN" value=''>  <input
			type='hidden' id="AUDITID" name="AUDITID" value=''> 
	</form>

	<form id="createProductSearchLst" method="post"
		action="/createProductSearchLst">
		<input type='hidden' id="IDX1" name="IDX1" value=''> <input
			type='hidden' id="TARGETCOMMANT1" name="TARGETCOMMANT1" value=''> <input
			type='hidden' id="SHOPIDX1" name="SHOPIDX1" value=''> <input
			type='hidden' id="TARGETWEBURL1" name="TARGETWEBURL1" value=''> <input
			type='hidden' id="TARGETAMT1" name="TARGETAMT1" value=''> <input
			type='hidden' id="GBUPDOWN1" name="GBUPDOWN1" value=''> <input
			type='hidden' id="GBCARD1" name="GBCARD1" value=''> <input
			type='hidden' id="ALAMSOLDOUT1" name="ALAMSOLDOUT1" value=''> <input
			type='hidden' id="ID1" name="ID1" value=''> <input
			type='hidden' id="PWD1" name="PWD1" value=''> <input
			type='hidden' id="ALAMYN1" name="ALAMYN1" value=''>  <input
			type='hidden' id="AUDITID" name="AUDITID" value=''> 
	</form>

	<form id="removeProductSearchLst" method="post"
		action="/removeProductSearchLst">
		<input type='hidden' id="IDX2" name="IDX2" value=''> <input
			type='hidden' id="USEYN2" name="USEYN2" value=''> 
	</form>

	<form id="SearchLst" method="post"
		action="/admin-page-lst">
		<input type='hidden' id="COL1" name="COL1" value=''>
	</form>
	
	<!-- FOOTER -->
	<footer class="container">
		<%@ include file="./common/foot.jsp"%>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Placed at the end of the document so the pages load faster -->
	<script>
		window.jQuery
				|| document
						.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.slim.min.js"><\/script>')
	</script>
	<script
		src="https://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js"></script>

	<script>
		// 조회 건수
	  	let totCnt = 0;
	  	totCnt = 1;//${list2cnt};

		function createButton_onclikc(){
			totCnt = totCnt + 1;
			var tmpTExt = 	
				 "<tr style='font-size: 11px; text-align:center; vertical-align:middle'>			"
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>-</td>    "
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>          "
				+ "	</td>"
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='text' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>"
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>" 
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>"
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>" 
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>" 
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>" 
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>" 
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='number' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>" 
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "		<input type='text' class='diaItemPriceNone' id='c' value='' />"
				+ "	</td>"
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "  	-"
				+ "	</td>"
				+ "	<td style='font-size: 11px; text-align:center; vertical-align:middle'>"
				+ "  	<button type='button' class='btn btn-primary' id='createOneButton' onclick='createOneButton_onclikc()' style='font-size: 10px'>추가</button>"
				+ "	</td>"
				+ "</tr>"
		   			;
			//$("#itemTable>tbody").prepend("<tr><td>Test Row Append</td></tr>");
			$("#itemTable>tbody").prepend(tmpTExt);
		}

	  	function clickNewView(){
	  		debugger;
			let $modalBody  = $("#createmodalBody");
		  	let htmlTxt = 
		  		/*
		  		"<div class='form-group'>"
		        +    "<label for='create-name0' class='col-form-label'>순서:</label>"
		        +	"<input type='text' class='form-control' id='create-name0' >"
		        + "</div>"

		  		+*/ 
		  		"<div class='form-group'>"
		        +    "<label for='create-name1' class='col-form-label'>대상웹페이지별명:</label>"
		        +	"<input type='text' class='form-control' id='create-name1' >"
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name2' class='col-form-label'>이커머스:</label>"
		        //+	"<input type='text' class='form-control' id='create-name2' >"
		        
		        + "<select class='form-control' id='create-name2'>"
		        + "  	<option value=''>--- 이커머스선택 ---</option>"
		        + "			  	<c:forEach items ='${shopOutDto }' var ='list' varStatus='status'>"
		        + "		<option value='${list.IDX}'>${list.SHOPNM}</option>"	
		        + "			  	</c:forEach>"
		        + "</select>"
		        
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name3' class='col-form-label'>대상웹페이지주소:</label>"
		        +	"<input type='text' class='form-control' id='create-name3' >"
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name4' class='col-form-label'>기준 금액:</label>"
		        +	"<input type='text' class='form-control' id='create-name4' >"
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name5' class='col-form-label'>0:기준가이상, 1:기준가이하 구분:</label>"
		        //+	"<input type='text' class='form-control' id='create-name5' >"
		        
		        + "<select class='form-control' id='create-name5'>"
		        + "  	<option value=''>--- 기준 선택 ---</option>"
		        + "			  	<c:forEach items ='${codeOutDto }' var ='list' varStatus='status'>"
		        + " 				<c:if test='${list.CODEID eq \"GBUPDOWN\"}'>"
		        + "		<option value='${list.CODEVAL1}'>${list.CODEVAL2}</option>"	
		        + "					</c:if>"
		        + "			  	</c:forEach>"
		        + "</select>"
		        
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name6' class='col-form-label'>0:쿠폰, 1:카드 구분:</label>"
		        //+	"<input type='text' class='form-control' id='create-name6' >"
		        
		        + "<select class='form-control' id='create-name6'>"
		        + "  	<option value=''>--- 쿠폰, 카드 선택 ---</option>"
		        + "			  	<c:forEach items ='${codeOutDto }' var ='list' varStatus='status'>"
		        + " 				<c:if test='${list.CODEID eq \"GBCARD\"}'>"
		        + "		<option value='${list.CODEVAL1}'>${list.CODEVAL2}</option>"	
		        + "					</c:if>"
		        + "			  	</c:forEach>"
		        + "</select>"
		        
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name7' class='col-form-label'>품절시 알람 요청 Y:알람요청:,N:알람미요청:</label>"
		        //+	"<input type='text' class='form-control' id='create-name7' >"
		        
		        + "<select class='form-control' id='create-name7'>"
		        + "  	<option value=''>--- 품절시 알람 선택 ---</option>"
		        + "		<option value='Y'>Y</option>"
		        + "		<option value='N'>N</option>"		
		        + "</select>"
		        
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name8' class='col-form-label'>로그인id:</label>"
		        +	"<input type='text' class='form-control' id='create-name8' >"
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name9' class='col-form-label'>로그인pwd:</label>"
		        +	"<input type='text' class='form-control' id='create-name9' >"
		        + "</div>"
	/*
		  		+ "<div class='form-group'>"
		        +    "<label for='create-name10' class='col-form-label'>생성일자:</label>"
		        +	"<input type='text' class='form-control' id='create-name10' >"
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name11' class='col-form-label'>수정일자:</label>"
		        +	"<input type='text' class='form-control' id='create-name11' >"
		        + "</div>"
		   			+ "<tr>"
	*/
		  		+ "<div class='form-group'>"
		        +    "<label for='create-name12' class='col-form-label'>알람 여부:</label>"
		        //+	"<input type='text' class='form-control' id='create-name12' >"
		        	        
		        + "<select class='form-control' id='create-name12'>"
		        + "  	<option value=''>--- 알람 선택 ---</option>"
		        + "		<option value='Y'>Y</option>"
		        + "		<option value='N'>N</option>"		
		        + "</select>"
		        	        
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name13' class='col-form-label'>수정 사용자:</label>"
		        +	"<input type='text' class='form-control' id='create-name13' >"
		        + "</div>"
		   			;
		   			
	 	   	$modalBody.html(htmlTxt);
	  	}
  	// 삭제 호출
	function removeButton_onclikc(idx){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#removeProductSearchLst");
		
		// 수정 값체크
		// form 값 초기화
		$("#IDX2").val(idx);
		$("#USEYN2").val("N");
		
		// 변경 호출
		$form.submit()
	}
  	
  	// 수정 입력 호출
	function modifyButton_onclikcData(){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#modifyProductSearchLst");
		
		// 수정 값체크
		var $recipient0 = $("#recipient-name0").val();
		var $recipient1 = $("#recipient-name1").val();
		var $recipient2 = $("#recipient-name2").val();
		var $recipient3 = $("#recipient-name3").val();
		var $recipient4 = $("#recipient-name4").val();
		var $recipient5 = $("#recipient-name5").val();
		var $recipient6 = $("#recipient-name6").val();
		var $recipient7 = $("#recipient-name7").val();
		var $recipient8 = $("#recipient-name8").val();
		var $recipient9 = $("#recipient-name9").val();
		var $recipient10 = $("#recipient-name10").val();
		var $recipient11 = $("#recipient-name11").val();
		var $recipient12 = $("#recipient-name12").val();
		var $recipient13 = $("#recipient-name13").val();
		
		// form 값 초기화
		$("#IDX").val($recipient0);
		$("#TARGETCOMMANT").val($recipient1);
		$("#SHOPIDX").val($recipient2);
		$("#TARGETWEBURL").val($recipient3);
		$("#TARGETAMT").val($recipient4);
		$("#GBUPDOWN").val($recipient5);
		$("#GBCARD").val($recipient6);
		$("#ALAMSOLDOUT").val($recipient7);
		$("#ID").val($recipient8);
		$("#PWD").val($recipient9);
		$("#ALAMYN").val($recipient12);
		$("#AUDITID").val($recipient13);
		
		// 변경 호출
		$form.submit()
	}
  	
  	// 입력 호출
	function createButton_onclikcData(){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#createProductSearchLst");
		
		// 수정 값체크
		var $create0 = $("#create-name0").val();
		var $create1 = $("#create-name1").val();
		var $create2 = $("#create-name2").val();
		var $create3 = $("#create-name3").val();
		var $create4 = $("#create-name4").val();
		var $create5 = $("#create-name5").val();
		var $create6 = $("#create-name6").val();
		var $create7 = $("#create-name7").val();
		var $create8 = $("#create-name8").val();
		var $create9 = $("#create-name9").val();
		var $create10 = $("#create-name10").val();
		var $create11 = $("#create-name11").val();
		var $create12 = $("#create-name12").val();
		var $create13 = $("#create-name13").val();
		
		// form 값 초기화
		$("#IDX1").val($create0);
		$("#TARGETCOMMANT1").val($create1);
		$("#SHOPIDX1").val($create2);
		$("#TARGETWEBURL1").val($create3);
		$("#TARGETAMT1").val($create4);
		$("#GBUPDOWN1").val($create5);
		$("#GBCARD1").val($create6);
		$("#ALAMSOLDOUT1").val($create7);
		$("#ID1").val($create8);
		$("#PWD1").val($create9);
		$("#ALAMYN1").val($create12);
		$("#AUDITID1").val($create13);
		
		// 변경 호출
		$form.submit()
	}

  	function searchItemList(){
		// form 변수 초기화
		var $form = $("#SearchLst");
		
		// 조회 값체크
		var $searchItemNm = $("#searchItemNm").val();

		// form 값 초기화
		$("#COL1").val($searchItemNm);

		// 조회 호출
		$form.submit()
  	}
  
  </script>
</body>
</html>
