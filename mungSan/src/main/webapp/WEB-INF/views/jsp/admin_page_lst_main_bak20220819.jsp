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
.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}

</style>
</head>
<body>

	<!-- HEAD -->
	<footer class="container">
		<%@ include file="./common/head.jsp"%>
	</footer>
	
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
							<!-- 정산가 : 판매가 * 수수료 + 배송비 *0.967 -->
							<c:set var='totAmt' value='${(list.NOMALAMT * list.COMMITIONAMT)+(list.SHIPAMT * 0.967)}'/>
							<!-- 마진 : 정산가 - 오픈마켓가격 (구입가)-->
							<c:set var='totAmtP' value='${totAmt-list.PAYAMT}'/>
							
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
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<!-- 수정버튼 
									<button type='button' class='btn btn-primary' id='modifyButton' onclick='modifyButton_onclickData(${list.IDX})' style='font-size: 10px'>수정</button>
									-->
									<!-- 삭제버튼 -->
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclickData(${list.IDX})' style='font-size: 10px; margin: 1px;'>삭제</button>
								</td>
								<!-- 이미지 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<img src='${list.IMGURL} ' width='50px' height='50px'>
									<a href="javascript:modifyProduct(${list.IDX}, '0');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='IMGURLIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='IMGURL${list.IDX}' value='${list.IMGURL }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '0');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='IMGURLIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 상품명 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='PRODUCTNMSPAN${list.IDX}'>${list.PRODUCTNM }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '1');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PRODUCTNMIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='PRODUCTNM${list.IDX}' value='${list.PRODUCTNM }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '1');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PRODUCTNMIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 판매가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='NOMALAMTSPAN${list.IDX}'>${list.NOMALAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '2');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='NOMALAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='NOMALAMT${list.IDX}' value='${list.NOMALAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '1');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='NOMALAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 배송비 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='SHIPAMTSPAN${list.IDX}'>${list.SHIPAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '3');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='SHIPAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='SHIPAMT${list.IDX}' value='${list.SHIPAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '3');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='SHIPAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 수수료 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='COMMITIONAMTSPAN${list.IDX}'>${list.COMMITIONAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '4');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='COMMITIONAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='COMMITIONAMT${list.IDX}' value='${list.COMMITIONAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '4');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='COMMITIONAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 정산가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='CALCAMTSPAN${list.IDX}'><fmt:formatNumber type='number' pattern='##################' value='${totAmt }' /></span>
									<input type='hidden' class='price1' id='CALCAMT${list.IDX}' value='<fmt:formatNumber type='number' pattern='##################' value='${totAmt }' /> '/>
								</td>
								<!-- 구입가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='PAYAMTSPAN${list.IDX}'>${list.PAYAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '6');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PAYAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='PAYAMT${list.IDX}' value='${list.PAYAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '6');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PAYAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 마진 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='INCOMEAMTSPAN${list.IDX}'><fmt:formatNumber type='number' pattern='##################' value='${totAmtP }' /></span>
									<input type='hidden' class='price1' id='INCOMEAMT${list.IDX}' value='<fmt:formatNumber type='number' pattern='##################' value='${totAmtP }' /> '/>
								</td>
								<!-- 최저가 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='LOWAMTSPAN${list.IDX}'>${list.LOWAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '8');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='LOWAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='LOWAMT${list.IDX}' value='${list.LOWAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '8');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='LOWAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 링크 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='PRODUCTLINKSPAN${list.IDX}'>${list.PRODUCTLINK }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '9');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PRODUCTLINKIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='PRODUCTLINK${list.IDX}' value='${list.PRODUCTLINK } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '9');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PRODUCTLINKIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
	<!-- /.container -->

	<!-- modify Modal -->
	<div class="modal fade" id="listModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel">
		<div class="modal-dialog modal-80size" role="document">
			<div class="modal-content modal-content modal-80size">
				<div class="modal-header">상품 상세 리스트</div>
				<div class="modal-body">
				    <div class="col-lg">
				      <button type="button" class="btn btn-secondary" id='createProductDtlButton' onclick="createProductDtlButton_onclick()" style="font-size: 11px">추가</button>
				    </div>
				</div>
				<div class="modal-body" id="listModalBody" style="max-width: 100%; width: auto !important; display: inline-block;">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<form id="SearchLst" method="post" action="/admin-page-lst-main">
		<input type='hidden' id="SEARCHPRODUCTNM" name="SEARCHPRODUCTNM" value=''>
	</form>
	
	<form id="ProductDtlLst" method="post" action="/admin-page-lst-sub">
		<input type='hidden' id="PRODUCTIDX" name="PRODUCTIDX" value=''>
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
		// form 변수 초기화
		var $form = $("#ProductDtlLst");
		
		// form 값 초기화
		$('#ProductDtlLst [name="PRODUCTIDX"]').val(idx);

		// 조회 호출
		$form.submit()
  		/*
		let data =JSON.stringify({"productidx":idx});
		
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
							+"		<th>판매가</th>                             "
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
					  		+ 			"<input type='text' class='price1' id='DTLSHOPIDX"+json[i].idx+"' value='"+json[i].shopidx+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+ 			"<input type='text' class='price1' id='DTLNOMALAMT"+json[i].idx+"' value='"+json[i].dtlnomalamt+" '/>"
					  		+"		</td>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+ 			"<input type='text' class='price1' id='DTLSHIPAMT"+json[i].idx+"' value='"+json[i].dtlshipamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+ 			"<input type='text' class='price1' id='DTLCOMMITIONAMT"+json[i].idx+"' value='"+json[i].dtlcommitionamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+ 			"<input type='text' class='price1' id='DTLCALCAMT"+json[i].idx+"' value='"+json[i].dtlcalcamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 구입가
					  		+ 			"<input type='text' class='price1' id='DTLPAYAMT"+json[i].idx+"' value='"+json[i].dtlpayamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+ 			"<input type='text' class='price1' id='DTLINCOMMAMT"+json[i].idx+"' value='"+json[i].dtlincommamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+ 			"<input type='text' class='price1' id='DTLLOWAMT"+json[i].idx+"' value='"+json[i].dtllowamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+ 			"<input type='text' class='longstr' id='DTLPRODUCTLINK"+json[i].idx+"' value='"+json[i].dtlproductlink+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 수정
							+			"<button type='button' class='btn btn-primary' id='modifyButton' onclick='modifyDtlButton_onclickData("+json[i].idx+")' style='font-size: 10px'>수정</button>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 삭제
							+			"<button type='button' class='btn btn-primary' id='modifyButton' onclick='removeDtlButton_onclickData("+json[i].idx+")' style='font-size: 10px'>삭제</button>"
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
		*/
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

  	// 상세 추가 버튼 이벤트
	function createProductDtlButton_onclick(){
		totCnt = totCnt + 1;

		var tmpTExt = 	
			"	<tr style='font-size: 11px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 쇼핑몰명(구매처) -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='SHOPIDX" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 배송비 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='IMGURL" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 수수료 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PRODUCTNM" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 정산가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='NOMALAMT" + totCnt + "' value=''/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 구입가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='SHIPAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 마진 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='COMMITIONAMT" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "		<!-- 최저가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='CALCAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 링크 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PAYAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 수정 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='INCOMEAMT" + totCnt + "' value=''/>                          "
			+ "		</td>                                                                       "
			+ "		<!-- 등록버튼 -->                                                               "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='removeButton' onclick='createDtlProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>"
			+ "	</tr>"
	   			;
		$("#productDtlListTbl>tbody").prepend(tmpTExt);
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
  	
  	// 각 컬럼별 수정 변경
  	function modifyProduct(inkeyNum, gb){
  		debugger;
  		// 이미지 변경
  		if(gb == '0'){
  			$("#IMGURLIMG1"+inkeyNum).hide();
  			//$("#PRODUCTNMIMG1"+inkeyNum).hide();
  			$("#IMGURL"+inkeyNum).attr("type", "text");
  			$("#IMGURLIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품명
  		if(gb == '1'){
  			$("#PRODUCTNMSPAN"+inkeyNum).hide();
  			$("#PRODUCTNMIMG1"+inkeyNum).hide();
  			$("#PRODUCTNM"+inkeyNum).attr("type", "text");
  			$("#PRODUCTNMIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 판매가
  		if(gb == '2'){
  			$("#NOMALAMTSPAN"+inkeyNum).hide();
  			$("#NOMALAMTIMG1"+inkeyNum).hide();
  			$("#NOMALAMT"+inkeyNum).attr("type", "text");
  			$("#NOMALAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 배송비
  		if(gb == '3'){
  			$("#SHIPAMTSPAN"+inkeyNum).hide();
  			$("#SHIPAMTIMG1"+inkeyNum).hide();
  			$("#SHIPAMT"+inkeyNum).attr("type", "text");
  			$("#SHIPAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 수수료
  		if(gb == '4'){
  			$("#COMMITIONAMTSPAN"+inkeyNum).hide();
  			$("#COMMITIONAMTIMG1"+inkeyNum).hide();
  			$("#COMMITIONAMT"+inkeyNum).attr("type", "text");
  			$("#COMMITIONAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 구입가
  		if(gb == '6'){
  			$("#PAYAMTSPAN"+inkeyNum).hide();
  			$("#PAYAMTIMG1"+inkeyNum).hide();
  			$("#PAYAMT"+inkeyNum).attr("type", "text");
  			$("#PAYAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 최저가
  		if(gb == '8'){
  			$("#LOWAMTSPAN"+inkeyNum).hide();
  			$("#LOWAMTIMG1"+inkeyNum).hide();
  			$("#LOWAMT"+inkeyNum).attr("type", "text");
  			$("#LOWAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품링크
  		if(gb == '9'){
  			$("#PRODUCTLINKSPAN"+inkeyNum).hide();
  			$("#PRODUCTLINKIMG1"+inkeyNum).hide();
  			$("#PRODUCTLINK"+inkeyNum).attr("type", "text");
  			$("#PRODUCTLINKIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  	}
  	
	// 수정버튼 클릭
  	function modifyProductDone(inkeyNum, gb){
  		debugger;
  		modifyButton_onclickData(inkeyNum);
  	}

	// excel 다운로드 호출
  	function excelDown(){
  		debugger;
  		alert("엑셀다운로드를 진행 합니다.");
  		//$("#excelDownload").submit();
  		exportExcel();
  		
  	}

	// excel 업로드 호출
  	function excelUp(){
  		debugger;
  	    if (!confirm("엑셀업로드를 진행 합니다.\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
   	       return false;
   	    } else {
  			$("#excelForm").submit();
   	    }
  		/*
  		let input = event.target;
  	    let reader = new FileReader();
  	    reader.onload = function () {
  	        let data = reader.result;
  	        let workBook = XLSX.read(data, { type: 'binary' });
  	        workBook.SheetNames.forEach(function (sheetName) {
  	            console.log('SheetName: ' + sheetName);
  	            let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName]);
  	            console.log(JSON.stringify(rows));
  	        })
  	    };
  	    reader.readAsBinaryString(input.files[0]);
  	    */
  	}
  </script>
</body>
</html>
