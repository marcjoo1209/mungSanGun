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
</head>
<body>

		<div class="page-header">
			<h2>상품 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" data-toggle="modal"
							data-target="#createModal" onclick="clickNewView()"
							style="font-size: 11px">추가</button>
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

				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 11px">
					<thead>
						<tr>
							<th>순서</th>
							<th>COL1 </th>
							<th>COL2 </th>
							<th>COL3 </th>
							<th>COL4 </th>
							<th>COL5 </th>
							<th>COL6 </th>
							<th>COL7 </th>
							<th>COL8 </th>
							<th>COL9 </th>
							<th>COL10</th>
							<th>COL11</th>
							<th>COL12</th>
							<th>COL13</th>
							<th>COL14</th>
							<th>COL15</th>
							<th>COL16</th>
							<th>COL17</th>
							<th>COL18</th>
							<th>COL19</th>
							<th>COL20</th>
							<th>COL21</th>
							<th>COL22</th>
							<th>COL23</th>
							<th>COL24</th>
							<th>COL25</th>
							<th>COL26</th>
							<th>COL27</th>
							<th>COL28</th>
							<th>COL29</th>
							<th>COL30</th>
							<th>COL31</th>
							<th>COL32</th>
							<th>COL33</th>
							<th>COL34</th>
							<th>COL35</th>
							<th>COL36</th>
							<th>COL37</th>
							<th>COL38</th>
							<th>COL39</th>
							<th>COL40</th>
							<th>COL41</th>
							<th>COL42</th>
							<th>COL43</th>
							<th>COL44</th>
							<th>COL45</th>
							<th>COL46</th>
							<th>COL47</th>
							<th>COL48</th>
							<th>COL49</th>
							<th>COL50</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${outDto}" var="list" varStatus="status">
							<tr data-toggle="modal" data-target="#modifyModal"
								onclick="clickOrderItemView(${list.DIDX})">
								<td>${list.DIDX }</td>
								  <td>${list.COLUMNA1}</td>
								  <td>${list.COLUMNA2}</td>
								  <td>${list.COLUMNA3}</td>
								  <td>${list.COLUMNA4}</td>
								  <td>${list.COLUMNA5}</td>
								  <td>${list.COLUMNA6}</td>
								  <td>${list.COLUMNA7}</td>
								  <td>${list.COLUMNA8}</td>
								  <td>${list.COLUMNA9}</td>
								  <td>${list.COLUMNB1}</td>
								  <td>${list.COLUMNB2}</td>
								  <td>${list.COLUMNB3}</td>
								  <td>${list.COLUMNB4}</td>
								  <td>${list.COLUMNB5}</td>
								  <td>${list.COLUMNB6}</td>
								  <td>${list.COLUMNB7}</td>
								  <td>${list.COLUMNB8}</td>
								  <td>${list.COLUMNB9}</td>
								  <td>${list.COLUMNC1}</td>
								  <td>${list.COLUMNC2}</td>
								  <td>${list.COLUMNC3}</td>
								  <td>${list.COLUMNC4}</td>
								  <td>${list.COLUMNC5}</td>
								  <td>${list.COLUMNC6}</td>
								  <td>${list.COLUMNC7}</td>
								  <td>${list.COLUMNC8}</td>
								  <td>${list.COLUMNC9}</td>
								  <td>${list.COLUMND1}</td>
								  <td>${list.COLUMND2}</td>
								  <td>${list.COLUMND3}</td>
								  <td>${list.COLUMND4}</td>
								  <td>${list.COLUMND5}</td>
								  <td>${list.COLUMND6}</td>
								  <td>${list.COLUMND7}</td>
								  <td>${list.COLUMND8}</td>
								  <td>${list.COLUMND9}</td>
								  <td>${list.COLUMNE1}</td>
								  <td>${list.COLUMNE2}</td>
								  <td>${list.COLUMNE3}</td>
								  <td>${list.COLUMNE4}</td>
								  <td>${list.COLUMNE5}</td>
								  <td>${list.COLUMNE6}</td>
								  <td>${list.COLUMNE7}</td>
								  <td>${list.COLUMNE8}</td>
								  <td>${list.COLUMNE9}</td>
								  <td>${list.COLUMNF1}</td>
								  <td>${list.COLUMNF2}</td>
								  <td>${list.COLUMNF3}</td>
								  <td>${list.COLUMNF4}</td>
								  <td>${list.COLUMNF5}</td>
								<td>
									<button type="button" class="btn btn-primary" id="removeButton" onclick="removeButton_onclikc(${list.DIDX})" style="font-size: 10px">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

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

	<!-- create Modal -->
	<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">상품 신규 생성</div>
				<div class="modal-body" id="createmodalBody"
					style="max-width: 100%; width: auto !important; display: inline-block;">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick='createButton_onclikcData()'>저장</button>
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
	
  	function clickOrderItemView(idx){
  		debugger;
		let data = {"didx" : idx};
	  	let htmlTxt = "";
		$.ajax({
			type		: 'POST',
			dataType 	: 'json',
			url			: "/get-mng-shop-product-tmp-tbl", 
			data 		: JSON.stringify(data),
			contentType:'application/json',
			// beforeSend: function (request){request.setRequestHeader('AJAX', 'true');},
			dataType: "json",
			success : function(data){
				console.log(data);
				/*
				var data = JSON.stringify(obj);
				var json = JSON.parse(data);*/
			  	// 모달 텍스트 출력
  				let $modalBody  = $("#modalBody");
				
				// 정렬
				console.log(JSON.stringify(data));
				const ordered = {};
				Object.keys(data).sort().forEach(function(key) {
				  ordered[key] = data[key];
				});

				console.log(JSON.stringify(ordered));

			  	for (var key in ordered) {
			  	  console.log("key " + key + " has value " + data[key]);
			  	  

		  			htmlTxt = htmlTxt + "<div class='form-group'>"
			  			+    "<label for='"+key+"' class='col-form-label'>"+key+":</label>"
			  			+	"<input type='text' class='form-control' id='"+key+"' value="+data[key]+">"
				        + "</div>"
		 	   			;
			  	}
			  	
			  	/*
		  		data.forEach(function (index, item){
		  			console.log(data)
		  			
		  			htmlTxt =+ "<div class='form-group'>"
			  			+    "<label for='createColumn"+i+"' class='col-form-label'>"+i+":</label>"
			  			+	"<input type='text' class='form-control' id='createColumn"+i+"' value="+rowData+">"
				        + "</div>"
		 	   			;
				    i++;
		  		}
			    */
	 	   			
		 	   	$modalBody.html(htmlTxt);

			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
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
