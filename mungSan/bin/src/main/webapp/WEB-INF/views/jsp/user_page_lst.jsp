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

<title>상품 페이지</title>

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
			<h2>상품 페이지</h2>
		</div>

		<div class="row">
		  
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
		
				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 11px">
					<thead>
						<tr>
							<th>순서</th>
							<th>상품명 </th>
							<th>가격 </th>
							<th>참고링크 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${outDto}" var="list" varStatus="status">
							<tr>
								  <td>${list.IDX }</td>
								  <td>${list.PRODUCTNM}</td>
								  <td>
								  	${list.LOWAMT}
								  </td>
								  <td>
								  	<c:if test="${list.URL ne null && not empty list.URL}">
								  		<a href='${list.URL}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

	<!-- /.container -->

	<form id="SearchLst" method="post"
		action="/">
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
  	function function_alert_not_link(){
  		alert("링크가 없습니다.");
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
