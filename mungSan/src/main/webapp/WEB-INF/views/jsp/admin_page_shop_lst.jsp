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

<title>이커머스 코드 관리 페이지</title>

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

	<!-- HEAD -->
	<footer class="container">
		<%@ include file="./common/head.jsp"%>
	</footer>
	
		<div class="page-header">
			<h2>이커머스 코드 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" id='createButton' onclick="createButton_onclick()" style="font-size: 11px">추가</button>
		    </div>
		    <div class="col-md">
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
							<th>처리</th>
							<th>쇼핑몰명(구매처)</th>
							<th>로그인id</th>
							<th>로그인pwd</th>
							<th>텔레그램tokenId</th>
							<th>URL</th>
						</tr>
					</thead>
					<tbody valign='bottom'>
						<c:forEach items='${shopOutDto}' var='list' varStatus='status'>
							<tr style='font-size: 11px; text-align:center; vertical-align:middle'>
								<!-- 순서 -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									${list.IDX}
								</td>
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<!-- 삭제버튼 -->
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclickData(${list.IDX})' style='font-size: 10px; margin: 1px;'>삭제</button>
								</td>
								<!-- 쇼핑몰명(구매처) -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='SHOPNMSPAN${list.IDX}'>${list.SHOPNM }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '0');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='SHOPNMIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='SHOPNM${list.IDX}' value='${list.SHOPNM }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '0');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='SHOPNMIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 로그인id -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='IDSPAN${list.IDX}'>${list.ID }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '1');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='IDIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='ID${list.IDX}' value='${list.ID }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '1');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='IDIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 로그인pwd -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='PWDSPAN${list.IDX}'>${list.PWD }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '2');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PWDIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='PWD${list.IDX}' value='${list.PWD }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '2');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PWDIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 텔레그램token -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='TOKENIDSPAN${list.IDX}'>${list.TOKENID }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '3');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='TOKENIDIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='TOKENID${list.IDX}' value='${list.TOKENID }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '3');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='TOKENIDIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- URL -->
								<td style='font-size: 11px; text-align:center; vertical-align:middle'>
									<span id='URLSPAN${list.IDX}'>${list.URL }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '4');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='URLIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='URL${list.IDX}' value='${list.URL }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '4');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='URLIMG2${list.IDX}' style='visibility:hidden;'>
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
				</div>
			</div>
		</div>
	</div>
	
	<form id="SearchLst" method="post" action="/admin-page-lst-main">
		<input type='hidden' id="SEARCHPRODUCTNM" name="SEARCHPRODUCTNM" value=''>
	</form>
	
	<form id="ShopLst" name="ShopLst">
		<input type='hidden' id="IDX" name="IDX" value=''>  
		<input type='hidden' id="SHOPNM" name="SHOPNM" value=''>  
		<input type='hidden' id="ID" name="ID" value=''>  
		<input type='hidden' id="PWD" name="PWD" value=''>  
		<input type='hidden' id="TOKENID" name="TOKENID" value=''>  
		<input type='hidden' id="URL" name="URL" value=''>  
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
  	totCnt = ${shopCnt};

  	// 각 컬럼별 수정 변경
  	function modifyProduct(inkeyNum, gb){
  		debugger;
  		// 쇼핑몰명
  		debugger;
  		// 쇼핑몰명
  		if(gb == '0'){
  			$("#SHOPNMSPAN"+inkeyNum).hide();
  			$("#SHOPNMIMG1"+inkeyNum).hide();
  			$("#SHOPNM"+inkeyNum).attr("type", "text");
  			//$("#SHOPNM"+inkeyNum).css('display', ''); 
  			$("#SHOPNMIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 아이디
  		if(gb == '1'){
  			$("#IDSPAN"+inkeyNum).hide();
  			$("#IDIMG1"+inkeyNum).hide();
  			$("#ID"+inkeyNum).attr("type", "text");
  			$("#IDIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 비번
  		if(gb == '2'){
  			$("#PWDSPAN"+inkeyNum).hide();
  			$("#PWDIMG1"+inkeyNum).hide();
  			$("#PWD"+inkeyNum).attr("type", "text");
  			$("#PWDIMG2"+inkeyNum).css('visibility', 'visible');  
  		}
  		// 토큰
  		if(gb == '3'){
  			$("#TOKENIDSPAN"+inkeyNum).hide();
  			$("#TOKENIDIMG1"+inkeyNum).hide();
  			$("#TOKENID"+inkeyNum).attr("type", "text");
  			$("#TOKENIDIMG2"+inkeyNum).css('visibility', 'visible');
  		}
  		// URL
  		if(gb == '4'){
  			$("#URLSPAN"+inkeyNum).hide();
  			$("#URLIMG1"+inkeyNum).hide();
  			$("#URL"+inkeyNum).attr("type", "text");
  			$("#URLIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  	}

	// 수정버튼 클릭
  	function modifyProductDone(inkeyNum, gb){
  		debugger;
  		modifyButton_onclickData(inkeyNum);
  	}

  	// 입력 호출
	function createProcButton_onclick(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ShopLst");
		
		// 수정 값체크
		var $IDX 				= $("#IDX"+inkeyNum).val();
		var $SHOPNM 			= $("#SHOPNM"+inkeyNum).val();
		var $ID 				= $("#ID"+inkeyNum).val();
		var $PWD 				= $("#PWD"+inkeyNum).val();
		var $TOKENID 			= $("#TOKENID"+inkeyNum).val();
		var $URL 				= $("#URL"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#SHOPNM").val($SHOPNM);
		$("#ID").val($ID);
		$("#PWD").val($PWD);
		$("#TOKENID").val($TOKENID);
		$("#URL").val($URL);
		$("#GB").val("I");
		
		// 변경 호출
		procShopList();
	}

  	// 삭제 호출
	function removeButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ShopLst");
		
		// 수정 값체크
		var $IDX 				= inkeyNum;
		var $SHOPNM 			= $("#SHOPNM"+inkeyNum).val();
		var $ID 				= $("#ID"+inkeyNum).val();
		var $PWD 				= $("#PWD"+inkeyNum).val();
		var $TOKENID 			= $("#TOKENID"+inkeyNum).val();
		var $URL 				= $("#URL"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#SHOPNM").val($SHOPNM);
		$("#ID").val($ID);
		$("#PWD").val($PWD);
		$("#TOKENID").val($TOKENID);
		$("#URL").val($URL);
		$("#GB").val("D");
		
		// 변경 호출
		procShopList();
	}

  	// 수정 호출
	function modifyButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ShopLst");
		
		// 수정 값체크
		var $IDX 				= inkeyNum;
		var $SHOPNM 			= $("#SHOPNM"+inkeyNum).val();
		var $ID 				= $("#ID"+inkeyNum).val();
		var $PWD 				= $("#PWD"+inkeyNum).val();
		var $TOKENID 			= $("#TOKENID"+inkeyNum).val();
		var $URL 				= $("#URL"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#SHOPNM").val($SHOPNM);
		$("#ID").val($ID);
		$("#PWD").val($PWD);
		$("#TOKENID").val($TOKENID);
		$("#URL").val($URL);
		$("#GB").val("U");
		
		// 변경 호출
		procShopList();
	}

  	// 상품 리스트 처리 호출
  	function procShopList(){
  		debugger;
		//let data = JSON.stringify({"productidx":"1"});
		// form 데이터
		var formSerializeArray = $('#ShopLst').serializeArray();
		var object = {};
		for (var i = 0; i < formSerializeArray.length; i++){
		    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
		}
		 
		let data = JSON.stringify(object);
		
		// 호출  url
		let url = "";
		
		if($("#GB").val() == "I"){
			url = "/create-shop-lst";
		}
		if($("#GB").val() == "U"){
			url = "modify-shop-lst";
		}
		if($("#GB").val() == "D"){
			url = "remove-shop-lst";
		}
		
		$.ajax({
			url 		: url,
			method 		: 'POST',
			data 		: data,
			contentType	: 'application/json',
			dataType	: 'json',
			success : function(obj){
				debugger;
				window.location.href="/admin-page-shop-code"
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}

  	// 추가 버튼 이벤트
	function createButton_onclick(){
  		debugger;
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"	<tr style='font-size: 11px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 처리 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='createButton' onclick='createProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>                                                                       "
			+ "		<!-- 쇼핑몰(구매처) -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='SHOPNM" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 로그인id -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='ID" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 로그인pwd -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='PWD" + totCnt + "' value=''/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 텔레그램tokenId -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='TOKENID" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- URL -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='URL" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "	</tr>"
	   			;
		$("#itemTable>tbody").prepend(tmpTExt);
	}
/*
	// 총 조회 건수
  	let totCnt = 0;
  	totCnt = ${listCnt};
  	let shopCnt = ${shopCnt};
  	let prmproductidx = ${prmproductidx};
  	let prmshoidx = [];
  	let prmshonm = [];

    <c:forEach items ='${shopOutDto}' var ='list1' varStatus='status'>
    	prmshoidx.push("${list1.IDX}");
    	prmshonm.push("${list1.SHOPNM}");
    </c:forEach>
  	
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
				  		+ 			"<input type='text' class='price1' id='DTLSHOPIDX${list.IDX}' value='"+json[i].shopidx+" '/>"
				  		+"		</td>"
				  		+"		<td>"
				  		// 배송비
				  		+			json[i].dtlshipamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 수수료
				  		+			json[i].dtlcommitionamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 정산가
				  		+			json[i].dtlcalcamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 구입가
				  		+			json[i].dtlpayamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 마진
				  		+			json[i].dtlincommamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 최저가
				  		+			json[i].dtllowamt
				  		+"		</td>"
				  		+"		<td>"
				  		// 링크
				  		+			json[i].dtlproductlink
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
  		debugger;
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"	<tr style='font-size: 11px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 처리 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='createButton' onclick='createProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>                                                                       "
			+ "		<!-- 쇼핑몰(구매처) -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "

			+ "		<select class='form-control' id='SHOPIDX" + totCnt + "'>"
			+ "				<option value='-' selected>----선택하세요.-----</option>"
			;
			
			for(let i = 0;i<shopCnt;i++){
				tmpTExt = tmpTExt
				+ "				<option value='"+prmshoidx[i]+"'>"+prmshonm[i]+"</option>";
			}
			
			tmpTExt = tmpTExt
	        + "		</select>"
	        
			//+ "			<input id='SHOPIDX" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 판매가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLNOMALAMT" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 배송비 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLSHIPAMT" + totCnt + "' value=''/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 수수료 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLCOMMITIONAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 정산가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLCALCAMT" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "		<!-- 구입가 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLPAYAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 마진 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLINCOMMAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 최저가 -->                                                                 "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLLOWAMT" + totCnt + "' value=''/>                          "
			+ "		</td>                                                                       "
			+ "		<!-- 링크 -->                                                                "
			+ "		<td style='font-size: 11px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='DTLPRODUCTLINK" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<input type='hidden' id='PRODUCTIDX" + totCnt + "' value='" + prmproductidx + "'/>"
			+ "	</tr>"
	   			;
		$("#itemTable>tbody").prepend(tmpTExt);
	}

  	// 입력 호출
	function createProcButton_onclick(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ShopLst");
		
		// 수정 값체크
		var $SHOPIDX 			= $("#SHOPIDX"+inkeyNum).val();
		var $PRODUCTIDX 		= $("#PRODUCTIDX"+inkeyNum).val();
		var $DTLNOMALAMT 		= checkNumber($("#DTLNOMALAMT"+inkeyNum).val());
		var $DTLSHIPAMT 		= checkNumber($("#DTLSHIPAMT"+inkeyNum).val());
		var $DTLCOMMITIONAMT 	= checkNumber($("#DTLCOMMITIONAMT"+inkeyNum).val());
		var $DTLCALCAMT 		= checkNumber($("#DTLCALCAMT"+inkeyNum).val());
		var $DTLPAYAMT 			= checkNumber($("#DTLPAYAMT"+inkeyNum).val());
		var $DTLINCOMMAMT 		= checkNumber($("#DTLINCOMMAMT"+inkeyNum).val());
		var $DTLLOWAMT 			= checkNumber($("#DTLLOWAMT"+inkeyNum).val());
		var $DTLPRODUCTLINK 	= $("#DTLPRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#SHOPIDX").val($SHOPIDX);
		$("#PRODUCTIDX").val($PRODUCTIDX);
		$("#DTLNOMALAMT").val($DTLNOMALAMT);
		$("#DTLSHIPAMT").val($DTLSHIPAMT);
		$("#DTLCOMMITIONAMT").val($DTLCOMMITIONAMT);
		$("#DTLCALCAMT").val($DTLCALCAMT);
		$("#DTLPAYAMT").val($DTLPAYAMT);
		$("#DTLINCOMMAMT").val($DTLINCOMMAMT);
		$("#DTLLOWAMT").val($DTLLOWAMT);
		$("#DTLPRODUCTLINK").val($DTLPRODUCTLINK);
		$("#GB").val("I");
		
		// 변경 호출
		procShopList();
	}

  	// 삭제 호출
	function removeButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ShopLst");
		
		// 수정 값체크
		var $IDX 				= inkeyNum;
		var $SHOPIDX 			= $("#SHOPIDX"+inkeyNum).val();
		var $OLDSHOPIDX 		= $("#OLDSHOPIDX"+inkeyNum).val();
		var $PRODUCTIDX 		= $("#PRODUCTIDX"+inkeyNum).val();
		var $DTLNOMALAMT 		= checkNumber($("#DTLNOMALAMT"+inkeyNum).val());
		var $DTLSHIPAMT 		= checkNumber($("#DTLSHIPAMT"+inkeyNum).val());
		var $DTLCOMMITIONAMT 	= checkNumber($("#DTLCOMMITIONAMT"+inkeyNum).val());
		var $DTLCALCAMT 		= checkNumber($("#DTLCALCAMT"+inkeyNum).val());
		var $DTLPAYAMT 			= checkNumber($("#DTLPAYAMT"+inkeyNum).val());
		var $DTLINCOMMAMT 		= checkNumber($("#DTLINCOMMAMT"+inkeyNum).val());
		var $DTLLOWAMT 			= checkNumber($("#DTLLOWAMT"+inkeyNum).val());
		var $DTLPRODUCTLINK 	= $("#DTLPRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#SHOPIDX").val($SHOPIDX);
		$("#OLDSHOPIDX").val($OLDSHOPIDX);
		$("#PRODUCTIDX").val($PRODUCTIDX);
		$("#DTLNOMALAMT").val($DTLNOMALAMT);
		$("#DTLSHIPAMT").val($DTLSHIPAMT);
		$("#DTLCOMMITIONAMT").val($DTLCOMMITIONAMT);
		$("#DTLCALCAMT").val($DTLCALCAMT);
		$("#DTLPAYAMT").val($DTLPAYAMT);
		$("#DTLINCOMMAMT").val($DTLINCOMMAMT);
		$("#DTLLOWAMT").val($DTLLOWAMT);
		$("#DTLPRODUCTLINK").val($DTLPRODUCTLINK);
		$("#GB").val("D");
		
		// 변경 호출
		procShopList();
	}

  	// 수정 호출
	function modifyButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ShopLst");
		
		// 수정 값체크
		var $IDX 				= inkeyNum;
		var $SHOPIDX 			= $("#SHOPIDX"+inkeyNum).val();
		var $OLDSHOPIDX 		= $("#OLDSHOPIDX"+inkeyNum).val();
		var $PRODUCTIDX 		= $("#PRODUCTIDX"+inkeyNum).val();
		var $DTLNOMALAMT 		= checkNumber($("#DTLNOMALAMT"+inkeyNum).val());
		var $DTLSHIPAMT 		= checkNumber($("#DTLSHIPAMT"+inkeyNum).val());
		var $DTLCOMMITIONAMT 	= checkNumber($("#DTLCOMMITIONAMT"+inkeyNum).val());
		var $DTLCALCAMT 		= checkNumber($("#DTLCALCAMT"+inkeyNum).val());
		var $DTLPAYAMT 			= checkNumber($("#DTLPAYAMT"+inkeyNum).val());
		var $DTLINCOMMAMT 		= checkNumber($("#DTLINCOMMAMT"+inkeyNum).val());
		var $DTLLOWAMT 			= checkNumber($("#DTLLOWAMT"+inkeyNum).val());
		var $DTLPRODUCTLINK 	= $("#DTLPRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#SHOPIDX").val($SHOPIDX);
		$("#OLDSHOPIDX").val($OLDSHOPIDX);
		$("#PRODUCTIDX").val($PRODUCTIDX);
		$("#DTLNOMALAMT").val($DTLNOMALAMT);
		$("#DTLSHIPAMT").val($DTLSHIPAMT);
		$("#DTLCOMMITIONAMT").val($DTLCOMMITIONAMT);
		$("#DTLCALCAMT").val($DTLCALCAMT);
		$("#DTLPAYAMT").val($DTLPAYAMT);
		$("#DTLINCOMMAMT").val($DTLINCOMMAMT);
		$("#DTLLOWAMT").val($DTLLOWAMT);
		$("#DTLPRODUCTLINK").val($DTLPRODUCTLINK);
		$("#GB").val("U");
		
		// 변경 호출
		procShopList();
	}
  	
  	// 상품 리스트 처리 호출
  	function procShopList(){
  		debugger;
		//let data = JSON.stringify({"productidx":"1"});
		// form 데이터
		var formSerializeArray = $('#ShopLst').serializeArray();
		var object = {};
		for (var i = 0; i < formSerializeArray.length; i++){
		    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
		}
		 
		let data = JSON.stringify(object);
		
		// 호출  url
		let url = "";
		
		if($("#GB").val() == "I"){
			url = "/create-product-dtl-lst";
		}
		if($("#GB").val() == "U"){
			url = "/modify-product-dtl-lst";
		}
		if($("#GB").val() == "D"){
			url = "/remove-product-dtl-lst";
		}
		
		$.ajax({
			url 		: url,
			method 		: 'POST',
			data 		: data,
			contentType	: 'application/json',
			dataType	: 'json',
			success : function(obj){
				debugger;
				window.location.href="/admin-page-lst-sub"
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}
  	
  	
	// 수정버튼 클릭
  	function modifyProductDone(inkeyNum, gb){
  		debugger;
  		modifyButton_onclickData(inkeyNum);
  	}

	//숫자 처리
	function checkNumber(strToInteger){
		return strToInteger.replace(/[^0-9]/g,"");	

    }
	*/
  </script>
</body>
</html>
