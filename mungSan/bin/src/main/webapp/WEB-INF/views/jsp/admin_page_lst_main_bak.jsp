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
<!-- link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico" -->

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
input.price1{border-right: #ffffff 1px solid; border-left: #ffffff 1px solid; border-top: #ffffff 1px solid; border-bottom: #000000 1px solid; width:70px;}
input.longstr{border-right: #ffffff 1px solid; border-left: #ffffff 1px solid; border-top: #ffffff 1px solid; border-bottom: #000000 1px solid; width:200px;}

</style>
</head>
<body>

		<div class="page-header">
			<h2>상품 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" id='createButton' onclick="createButton_onclick()" style="font-size: 11px">추가</button>
		      
			 	<!-- 엑셀 다운로드 -->
				<a href="javascript:excelDown()">
					<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmvsaMXmv3CVtqCY5Mq2eoZpWSH2AQ7TyfQNIGklhRc3qMd05pll0fS7tA5uqeVVgO24&usqp=CAU' width='55px' height='35px' alt='엑셀 다운로드'/>
				</a>
				<!-- 엑셀 업로드 -->
				<img src='https://www.nicepng.com/png/detail/208-2087007_excel-icon-png-upload-csv-icon.png' width='50px' height='35px' data-toggle='modal' data-target='#excelModal' alt='엑셀 업로드'/>
		    
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
		  	<!--
		  	1. 이미지 상품명 판매가 배송비 수수료 정산가 구입가 마진 최저가 링크 중 알바와 공유하는 웹사이트로 노출되는걸 선택 할수 있습니다.
		  	2. 상품 정보등 입력 수정 시 "연필" 클릭 후 별도 모달 창에서 수정 후 "체크"클릭시 바로 수정, 저장 되도록   
		  	 -->
		    <div class="col-lg">
				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 11px; text-align:center; vertical-align:middle">
					<thead>
						<tr>
							<th>순서</th>
							<!-- 더보기를 누르면 내가 기록한 해당 제품의 여러 오픈마켓의 정보가 나옵니다. 
							더보기를 누르면 오픈마켓 중 구입가가 가장 저렴한 것부터 순서대로 보여집니다. 
							이곳에서도 상품명 가격 등 수정이 바로 이뤄지면 좋겠습니다 -->
							<th>더보기</th> 
							<th>처리</th>
							<th>이미지 </th>
							<th>상품명 </th> <!-- 상품명을 정렬해서 볼 수 있습니다.(내-외부용 모두) -->
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>구입가 </th>	<!-- 상품 검색시 여러 오픈마켓의 정보중 구입가가 가장 저렴한 코드의 정보를 노출시켜줍니다. -->
							<th>마진 </th>
							<th>최저가 </th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody valign='bottom'>
						<c:forEach items='${outDto}' var='list' varStatus='status'>
							<tr style='font-size: 11px; text-align:center; vertical-align:middle'>
								<!-- 순서 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									${list.IDX}
								</td>
								<!-- 리스트 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<a href='javascript:searchProductList(${list.IDX});' >
									<img src='https://emoji-uc.akamaized.net/orig/38/9aa4151972abf59344d01195bb967e.png' width = '15px' height = '15px'>
									</a>
								</td>
								<!-- 수정버튼 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<button type='button' class='btn btn-primary' id='modifyButton' onclick='modifyButton_onclickData(${list.IDX})' style='font-size: 10px'>수정</button>
								<!-- 삭제버튼 -->
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclickData(${list.IDX})' style='font-size: 10px; margin: 1px;'>삭제</button>
								</td>
								<!-- 이미지 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<img src='${list.IMGURL} '  width='50px' height='50px'>
								</td>
								<!-- 상품명 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='longstr' id='PRODUCTNM${list.IDX}' value='${list.PRODUCTNM }'/>
								</td>
								<!-- 판매가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='NOMALAMT${list.IDX}' value='${list.NOMALAMT } '/>
								</td>
								<!-- 배송비 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='SHIPAMT${list.IDX}' value='${list.SHIPAMT } '/>
								</td>
								<!-- 수수료 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='COMMITIONAMT${list.IDX}' value='${list.COMMITIONAMT } '/>
								</td>
								<!-- 정산가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='CALCAMT${list.IDX}' value='${list.CALCAMT } '/>
								</td>
								<!-- 구입가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='PAYAMT${list.IDX}' value='${list.PAYAMT } '/>
								</td>
								<!-- 마진 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='INCOMEAMT${list.IDX}' value='${list.INCOMEAMT } '/>
								</td>
								<!-- 최저가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='price1' id='LOWAMT${list.IDX}' value='${list.LOWAMT } '/>
								</td>
								<!-- 링크 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<input class='longstr' id='PRODUCTLINK${list.IDX}' value='${list.PRODUCTLINK } '/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
	<!-- /.container -->

	<!-- modify Modal -->
	<div class="modal fade" id="listModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">상품 상세 리스트</div>
				<div class="modal-body" id="listModalBody"
					style="max-width: 100%; width: auto !important; display: inline-block;">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
						<!-- 
					<button type="button" class="btn btn-primary" onclick='modifyButton_onclickData()'>저장</button>
					 -->
				</div>
			</div>
		</div>
	</div>
	
	<form id="SearchLst" method="post" action="/admin-page-lst-main">
		<input type='hidden' id="SEARCHPRODUCTNM" name="SEARCHPRODUCTNM" value=''>
	</form>
	
	<form id="ProductLst" name="ProductLst">
		<input type='hidden' id="IDX" name="IDX" value=''>  
		<input type='hidden' id="IMGURL" name="IMGURL" value=''>  
		<input type='hidden' id="PRODUCTNM" name="PRODUCTNM" value=''>  
		<input type='hidden' id="NOMALAMT" name="NOMALAMT" value=''>  
		<input type='hidden' id="SHIPAMT" name="SHIPAMT" value=''>  
		<input type='hidden' id="COMMITIONAMT" name="COMMITIONAMT" value=''>  
		<input type='hidden' id="CALCAMT" name="CALCAMT" value=''>  
		<input type='hidden' id="PAYAMT" name="PAYAMT" value=''>  
		<input type='hidden' id="INCOMEAMT" name="INCOMEAMT" value=''>  
		<input type='hidden' id="LOWAMT" name="LOWAMT" value=''>  
		<input type='hidden' id="PRODUCTLINK" name="PRODUCTLINK" value=''>  
		<input type='hidden' id="GB" name="GB" value=''>  
	</form>
<!-- 
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


	<form id="removeProductSearchLst" method="post"
		action="/removeProductSearchLst">
		<input type='hidden' id="IDX2" name="IDX2" value=''> <input
			type='hidden' id="USEYN2" name="USEYN2" value=''> 
	</form>

	-->
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

	// 총 조회 건수
  	let totCnt = 0;
  	totCnt = ${listCnt};
  	
  	// 상품 상세 리스트 조회
  	function searchProductList(idx){
  		debugger;
		let data =JSON.stringify({"productidx":"1"});
		
		//let data ={PRODUCTIDX : idx};
		$.ajax({
			url : '/get-list-product-dtl-lst',
			method : 'POST',
			data 		: data,
			contentType:'application/json',
			dataType:'json',
			// beforeSend: function (request){request.setRequestHeader('AJAX', 'true');}, 
			success : function(obj){
				var data = JSON.stringify(obj);
				var json = JSON.parse(data);
				debugger;
			  	// 모달 텍스트 출력
  				let $modalBody  = $("#listModalBody");
			  	let htmlTxt = "";
			  	
			  	htmlTxt = htmlTxt
			  		+"<table class='table table-bordered table-responsive-sm' id='productDtlListTbl' style='font-size: 11px; text-align:center; vertical-align:middle'>"
					+"	<thead>                                         "
					+"	<tr>                                            "
					+"		<th>순서</th>                               "
					+"		<th>쇼핑몰명(구매처)</th>                             "
					+"		<th>배송비 </th>		"
					+"		<th>수수료 </th>                            "
					+"		<th>정산가 </th>                            "
					+"		<th>구입가 </th>                            "
					+"		<th>마진 </th>                            "
					+"		<th>최저가 </th>                            "
					+"		<th>링크 </th>                            "
					+"		<th>수정</th>                               "
					+"		<th>삭제</th>                               "
					+"	</tr>                                           "
					+"</thead>                                          "
					+"<tbody valign='bottom'>							"
			  	;
			  		
			  	for(let i = 0; i<json.length; i++){
			  		htmlTxt = htmlTxt
				  		+"	<tr>"
				  		+"		<td>"
				  		// 순서
				  		+			json[i].idx
				  		+"		</td>"
				  		+"		<td>"
				  		// 쇼핑몰명(구매처)
				  		+			json[i].shopidx
				  		+"		</td>"
				  		+"		<td>"
				  		// 배송비
				  		+			json[i].productidx
				  		+"		</td>"
				  		+"		<td>"
				  		// 수수료
				  		+			json[i].productnm
				  		+"		</td>"
				  		+"		<td>"
				  		// 정산가
				  		+			json[i].cardamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 구입가
				  		+			json[i].couponamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 마진
				  		+			json[i].nomalamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 최저가
				  		+			json[i].lowamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 링크
				  		+			json[i].useyn
				  		+"		</td>"
				  		+"		<td>"
				  		// 수정
				  		+			json[i].useyn
				  		+"		</td>"
				  		+"		<td>"
				  		// 삭제
				  		+			json[i].useyn
				  		+"		</td>"
				  		+"	</tr>"
				  		;
			  	}
			  	
			  	htmlTxt = htmlTxt
			  		+"</table>";
	 	   			
		 	   	$modalBody.html(htmlTxt);

		 	   	// modal 활성화
		 	   	$('#listModal').modal('show');
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}

  	//  상품명 조회 호출
  	function searchItemList(){
		// form 변수 초기화
		var $form = $("#SearchLst");
		
		// 조회 값체크
		var $searchItemNm = $("#searchItemNm").val();

		// form 값 초기화
		$("#SEARCHPRODUCTNM").val($searchItemNm);

		// 조회 호출
		$form.submit()
  	}

  	// 추가 버튼 이벤트
	function createButton_onclick(){
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"	<tr style='font-size: 11px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 리스트 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 이미지 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='IMGURL" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 상품명 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PRODUCTNM" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 판매가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='NOMALAMT" + totCnt + "' value=''/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 배송비 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='SHIPAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 수수료 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='COMMITIONAMT" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "		<!-- 정산가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='CALCAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 구입가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PAYAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 마진 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='INCOMEAMT" + totCnt + "' value=''/>                          "
			+ "		</td>                                                                       "
			+ "		<!-- 최저가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='LOWAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 링크 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PRODUCTLINK" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 수정버튼 -->                                                               "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 등록버튼 -->                                                               "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='removeButton' onclick='createProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>"
			+ "	</tr>"
	   			;
		$("#itemTable>tbody").prepend(tmpTExt);
	}

  	// 입력 호출
	function createProcButton_onclick(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductLst");
		
		// 수정 값체크
		var $IMGURL = $("#IMGURL"+inkeyNum).val();
		var $PRODUCTNM = $("#PRODUCTNM"+inkeyNum).val();
		var $NOMALAMT = $("#NOMALAMT"+inkeyNum).val();
		var $SHIPAMT = $("#SHIPAMT"+inkeyNum).val();
		var $COMMITIONAMT = $("#COMMITIONAMT"+inkeyNum).val();
		var $CALCAMT = $("#CALCAMT"+inkeyNum).val();
		var $PAYAMT = $("#PAYAMT"+inkeyNum).val();
		var $INCOMEAMT = $("#INCOMEAMT"+inkeyNum).val();
		var $LOWAMT = $("#LOWAMT"+inkeyNum).val();
		var $PRODUCTLINK = $("#PRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#IMGURL").val($IMGURL);
		$("#PRODUCTNM").val($PRODUCTNM);
		$("#NOMALAMT").val($NOMALAMT);
		$("#SHIPAMT").val($SHIPAMT);
		$("#COMMITIONAMT").val($COMMITIONAMT);
		$("#CALCAMT").val($CALCAMT);
		$("#PAYAMT").val($PAYAMT);
		$("#INCOMEAMT").val($INCOMEAMT);
		$("#LOWAMT").val($LOWAMT);
		$("#PRODUCTLINK").val($PRODUCTLINK);
		$("#GB").val("I");
		
		// 변경 호출
		procProductList();
	}

  	// 삭제 호출
	function removeButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductLst");
		
		// 수정 값체크
		var $IDX = inkeyNum;
		var $IMGURL = $("#IMGURL"+inkeyNum).val();
		var $PRODUCTNM = $("#PRODUCTNM"+inkeyNum).val();
		var $NOMALAMT = $("#NOMALAMT"+inkeyNum).val();
		var $SHIPAMT = $("#SHIPAMT"+inkeyNum).val();
		var $COMMITIONAMT = $("#COMMITIONAMT"+inkeyNum).val();
		var $CALCAMT = $("#CALCAMT"+inkeyNum).val();
		var $PAYAMT = $("#PAYAMT"+inkeyNum).val();
		var $INCOMEAMT = $("#INCOMEAMT"+inkeyNum).val();
		var $LOWAMT = $("#LOWAMT"+inkeyNum).val();
		var $PRODUCTLINK = $("#PRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#IMGURL").val($IMGURL);
		$("#PRODUCTNM").val($PRODUCTNM);
		$("#NOMALAMT").val($NOMALAMT);
		$("#SHIPAMT").val($SHIPAMT);
		$("#COMMITIONAMT").val($COMMITIONAMT);
		$("#CALCAMT").val($CALCAMT);
		$("#PAYAMT").val($PAYAMT);
		$("#INCOMEAMT").val($INCOMEAMT);
		$("#LOWAMT").val($LOWAMT);
		$("#PRODUCTLINK").val($PRODUCTLINK);
		$("#GB").val("D");
		
		// 변경 호출
		procProductList();
	}

  	// 수정 호출
	function modifyButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductLst");
		
		// 수정 값체크
		var $IDX = inkeyNum;
		var $IMGURL = $("#IMGURL"+inkeyNum).val();
		var $PRODUCTNM = $("#PRODUCTNM"+inkeyNum).val();
		var $NOMALAMT = $("#NOMALAMT"+inkeyNum).val();
		var $SHIPAMT = $("#SHIPAMT"+inkeyNum).val();
		var $COMMITIONAMT = $("#COMMITIONAMT"+inkeyNum).val();
		var $CALCAMT = $("#CALCAMT"+inkeyNum).val();
		var $PAYAMT = $("#PAYAMT"+inkeyNum).val();
		var $INCOMEAMT = $("#INCOMEAMT"+inkeyNum).val();
		var $LOWAMT = $("#LOWAMT"+inkeyNum).val();
		var $PRODUCTLINK = $("#PRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#IMGURL").val($IMGURL);
		$("#PRODUCTNM").val($PRODUCTNM);
		$("#NOMALAMT").val($NOMALAMT);
		$("#SHIPAMT").val($SHIPAMT);
		$("#COMMITIONAMT").val($COMMITIONAMT);
		$("#CALCAMT").val($CALCAMT);
		$("#PAYAMT").val($PAYAMT);
		$("#INCOMEAMT").val($INCOMEAMT);
		$("#LOWAMT").val($LOWAMT);
		$("#PRODUCTLINK").val($PRODUCTLINK);
		$("#GB").val("U");
		
		// 변경 호출
		procProductList();
	}
  	
  	// 상품 리스트 처리 호출
  	function procProductList(){
  		debugger;
		//let data = JSON.stringify({"productidx":"1"});
		// form 데이터
		var formSerializeArray = $('#ProductLst').serializeArray();
		var object = {};
		for (var i = 0; i < formSerializeArray.length; i++){
		    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
		}
		 
		let data = JSON.stringify(object);
		
		// 호출  url
		let url = "";
		
		if($("#GB").val() == "I"){
			url = "/create-product-lst";
		}
		if($("#GB").val() == "U"){
			url = "/modify-product-lst";
		}
		if($("#GB").val() == "D"){
			url = "/remove-product-lst";
		}
		
		$.ajax({
			url 		: url,
			method 		: 'POST',
			data 		: data,
			contentType	: 'application/json',
			dataType	: 'json',
			success : function(obj){
				debugger;
				window.location.href="/admin-page-lst-main"
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}
  	/*


	  	function clickNewView(){
	  		debugger;
			let $modalBody  = $("#createmodalBody");
		  	let htmlTxt = 
		  		"<div class='form-group'>"
		        +    "<label for='create-name1' class='col-form-label'>대상웹페이지별명:</label>"
		        +	"<input type='text' class='form-control' id='create-name1' >"
		        + "</div>"

		  		+ "<div class='form-group'>"
		        +    "<label for='create-name2' class='col-form-label'>이커머스:</label>"
		        
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
		  		+ "<div class='form-group'>"
		        +    "<label for='create-name12' class='col-form-label'>알람 여부:</label>"
		        	        
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
	function removeButton_onclick(idx){
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
	function modifyButton_onclickData(){
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
  	

  	*/
  </script>
</body>
</html>
