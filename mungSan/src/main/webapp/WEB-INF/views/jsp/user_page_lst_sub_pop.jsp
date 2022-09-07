<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico" -->

<title>상품 상세 관리 페이지</title>

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
.mycenterStyle{font-size: 20px; text-align:center; vertical-align:middle}
input.price1{border-right: #ffffff 1px solid; border-left: #ffffff 1px solid; border-top: #ffffff 1px solid; border-bottom: #000000 1px solid; width:70px;}
input.longstr{border-right: #ffffff 1px solid; border-left: #ffffff 1px solid; border-top: #ffffff 1px solid; border-bottom: #000000 1px solid; width:200px;}

.tableFixHead          { overflow: auto; height: 750px; width: 100%; }
.tableFixHead thead th { position: sticky; top: 0; z-index: 1; }

/* Just common table stuff. Really. */
table  { border-collapse: collapse; width: 100%; }
th, td { padding: 8px 16px; }
th     { background:#eee; }


/* hide Arrows*/
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

</style>
</head>
<body>
	
		<div class="page-header">
			<h2>상품 상세 리스트</h2>
		</div>

		<div class="row">
		  
		    <div class="col-md">
				<select class='form-control' id='selProductIdx' onchange="selectOnchange(this)">
					<option value=''>-- 상품 선택 --</option>	
		        	<c:forEach items ='${productOutDto }' var ='list1' varStatus='status'>
		        		<option value='${list1.IDX}' <c:if test='${list1.IDX eq prmproductidx}'>selected</c:if>>${list1.PRODUCTNM}</option>	
		        	</c:forEach>
		        </select>
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
		    <div class="tableFixHead">
				<table class="table table-bordered " id="itemTable" style="font-size: 20px; text-align:center; vertical-align:middle" >
					<thead style="" class="thead-light" >
						<tr>
							<th>순서</th>
							<th>쇼핑몰명(구매처) </th>
							<th>구입가 </th>
							<th>링크 </th>
						</tr>
					</thead>
					<tbody valign='bottom'>
						<c:forEach items='${outDto}' var='list' varStatus='status'>
							<tr style='font-size: 20px; text-align:center; vertical-align:middle'>
								<!-- 순서 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									${list.IDX}
								</td>
								<!-- 쇼핑몰명(구매처) -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<!-- span id='SHOPIDXSPAN${list.IDX}'>${list.SHOPIDX }</span -->
									<c:forEach items ='${shopOutDto }' var ='list1' varStatus='status'>
										<c:if test='${list1.IDX eq list.SHOPIDX}'>
											<span id='SHOPIDXSPAN${list.IDX}'>${list1.SHOPNM }</span>
										</c:if>
									</c:forEach>
								</td>
								<!-- 구입가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									${list.DTLPAYAMT }
								</td>
								<!-- 링크 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle; width:200px;'>
									<a href='${list.DTLPRODUCTLINK }' target="_blank">
										링크
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
	<!-- /.container -->

	<form id="SearchLst" method="post" action="/user-page-lst-sub-pop">
		<input type='hidden' id="PRODUCTIDX" name="PRODUCTIDX" value=''>
	</form>
	
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
  	shopCnt = ${shopCnt};
  	let prmproductidx = ${prmproductidx};
  	let prmshoidx = [];
  	let prmshonm = [];

    <c:forEach items ='${shopOutDto}' var ='list1' varStatus='status'>
    	prmshoidx.push("${list1.IDX}");
    	prmshonm.push("${list1.SHOPNM}");
    </c:forEach>
    
  	// 상품 select box 선택 이벤트
  	function selectOnchange(selectOS){
  		//console.log(selectOS.value)
  		searchItemList(selectOS.value);
  	}
  	
  	//  상품명 조회 호출
  	function searchItemList(productidxtmp){
  		debugger;
		// form 변수 초기화
		var $form = $("#SearchLst");
		
		// form 값 초기화
		$('#SearchLst [name="PRODUCTIDX"]').val(productidxtmp);

		// 조회 호출
		$form.submit()
  	}

  </script>
</body>
</html>
