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

<title>상품 리스트</title>

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

img.custom:hover,
img.custom:focus {
    transform:scale(3.5);
    transition: transform.5s;
    }
    

.tableFixHead          { overflow: auto; height: 1024px; width: 100%; }
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
			<h2>상품 리스트</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		    </div>
		    <div class="col-md">
		    </div>
		    <div class="col-md" align='right'>
			  	<div class="row">
				    <div class="col-lg">
				     <input class="form-control" type="text" id='searchItemNm' placeholder="상품이름" value='${searchTxt }' onkeyup="searchItemList_enterkey()" style="font-size: 20px">
			    	</div>
				    <div class="col-auto">
				      <button type="button" class="btn btn-secondary" onclick="searchItemList()" style="font-size: 20px">검색</button>
			    	</div>
		    	</div>
		    </div>
		  </div>
		
		<div class="page-header">
			<h2></h2>
		</div>

		<div class="row">
		    <div class="tableFixHead">
				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 20px; text-align:center; vertical-align:middle">
					<thead class="thead-light">
						<tr>
							<th>순서</th>
							<th>더보기</th> 
							<th>이미지 </th>
							<th>상품명
								<c:if test="${orderNum  eq 'b'}">
									<a href="javascript:searchItemList('a')">오름차순</a>
								</c:if>
								<c:if test="${orderNum  eq 'a'}">
									<a href="javascript:searchItemList('b')">내림차순</a>
								</c:if>
							</th>
							<th>구입가 </th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody valign='bottom'>
						<c:forEach items='${outDto}' var='list' varStatus='status'>
							
							<tr style='font-size: 20px; text-align:center; vertical-align:middle'>
								<!-- 순서 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									${list.IDX}
								</td>
								<!-- 리스트 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<a href='javascript:searchProductList(${list.IDX});' >
									<img src='https://emoji-uc.akamaized.net/orig/38/9aa4151972abf59344d01195bb967e.png' width = '15px' height = '15px'>
									</a>
								</td>
								<!-- 이미지 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<img class="custom" src='${list.IMGURL} ' width='50px' height='50px'>
								</td>
								<!-- 상품명 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span id='PRODUCTNMSPAN${list.IDX}'>${list.PRODUCTNM }</span>
								</td>
								<!-- 구입가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span id='PAYAMTSPAN${list.IDX}'>${list.PAYAMT }</span>
								</td>
								<!-- 링크 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<a href='${list.PRODUCTLINK }' target="_blank">
										<span id='PRODUCTLINKSPAN${list.IDX}'>링크</span>
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
				<div class="modal-body">
				</div>
				<div class="modal-body" id="listModalBody" style="max-width: 100%; width: auto !important; display: inline-block;">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<form id="SearchLst" method="post" action="/product-lst">
		<input type='hidden' id="SEARCHPRODUCTNM" name="SEARCHPRODUCTNM" value=''>
		<input type='hidden' id="ORDERNUM" name="ORDERNUM" value='${orderNum}'>
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
  	shopCnt = ${shopCnt};
  	let prmshoidx = [];
  	let prmshonm = [];

    <c:forEach items ='${shopOutDto}' var ='list1' varStatus='status'>
    	prmshoidx.push("${list1.IDX}");
    	prmshonm.push("${list1.SHOPNM}");
    </c:forEach>
  	

  	//  상품명 조회 호출
  	function searchItemList(orderNum){
		// form 변수 초기화
		var $form = $("#SearchLst");
		
		// 조회 값체크
		var $searchItemNm = $("#searchItemNm").val();
		
		// form 값 초기화
		$("#SEARCHPRODUCTNM").val($searchItemNm);
		if(orderNum != null){
			$("#ORDERNUM").val(orderNum);
		}

		// 조회 호출
		$form.submit()
  	}

  	// 엔터키 이벤트
  	function searchItemList_enterkey(){
  		debugger;
  		if (window.event.keyCode == 13) {
  			searchItemList();
  		}
  	}

  	// 상품 상세 리스트 조회
  	function searchProductList(idx){
  		debugger;
  		/*
		// form 변수 초기화
		var $form = $("#ProductDtlLst");
		
		// form 값 초기화
		$('#ProductDtlLst [name="PRODUCTIDX"]').val(idx);

		// 조회 호출
		$form.submit()
  		*/
		
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
					  		+"<table class='table table-bordered table-responsive-sm' id='productDtlListTbl' style='font-size: 20px; text-align:center; vertical-align:middle'>"
							+"	<thead>                                         "
							+"	<tr>                                            "
							+"		<th>순서</th>                               "
							+"		<th>쇼핑몰명(구매처)</th>                             "
							+"		<th>구입가 </th>                            "
							+"		<th>링크 </th>                            "
							/*
							+"		<th>수정</th>                               "
							+"		<th>삭제</th>                               "
							*/
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
					  		;
					  		// 쇼핑몰명(구매처)
							for(let j = 0;j<shopCnt;j++){
								if(json[i].shopidx == prmshoidx[j]){
									htmlTxt = htmlTxt + prmshonm[j];
								}
							}
					  	htmlTxt = htmlTxt
					  		+"		</td>"
					  		+"		<td>"
					  		// 구입가
					  		+ 			json[i].dtlpayamt
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
							+"		<a href='"+json[i].dtlproductlink+"' target='_blank'>"
							+"			<span id='PRODUCTLINKSPAN"+json[i].idx+"'>링크</span>"
							+"		</a>"
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

  </script>
</body>
</html>
