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
							<th>롯데온 </th>
							<th>최저가 </th>
							<th>참고링크 </th>
							<th>쿠팡</th>
							<th>최저가</th>
							<th>참고링크</th>
							<th>지마켓</th>
							<th>최저가</th>
							<th>링크</th>
							<th>옥션</th>
							<th>최저가</th>
							<th>링크</th>
							<th>티몬</th>
							<th>최저가</th>
							<th>링크</th>
							<th>인터파크</th>
							<th>최저가</th>
							<th>링크</th>
							<th>SSG</th>
							<th>최저가</th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${outDto}" var="list" varStatus="status">
							<tr>
								  <td>${list.DIDX }</td>
								  <td>${list.COLUMNA1}</td>
								  <td>${list.COLUMNA6}</td>
								  <td>${list.COLUMNA8}</td>
								  <td>
								  	<c:if test="${list.COLUMNA9 ne null && not empty list.COLUMNA9}">
								  		<a href='${list.COLUMNA9}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
								  <td>${list.COLUMNB1}</td>
								  <td>${list.COLUMNB3}</td>
								  <td>
								  	<c:if test="${list.COLUMNB4 ne null && not empty list.COLUMNB4}">
								  		<a href='${list.COLUMNB4}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
								  <td>${list.COLUMNB5}</td>
								  <td>${list.COLUMNB7}</td>
								  <td>
								  	<c:if test="${list.COLUMNB8 ne null && not empty list.COLUMNB8}">
								  		<a href='${list.COLUMNB8}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
								  <td>${list.COLUMNB9}</td>
								  <td>${list.COLUMNC2}</td>
								  <td>
								  	<c:if test="${list.COLUMNC3 ne null && not empty list.COLUMNC3}">
								  		<a href='${list.COLUMNC3}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
								  <td>${list.COLUMNC4}</td>
								  <td>${list.COLUMNC6}</td>
								  <td>
								  	<c:if test="${list.COLUMNC7 ne null && not empty list.COLUMNC7}">
								  		<a href='${list.COLUMNC7}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
								  <td>${list.COLUMNC8}</td>
								  <td>${list.COLUMND1}</td>
								  <td>
								  	<c:if test="${list.COLUMND2 ne null && not empty list.COLUMND2}">
								  		<a href='${list.COLUMND2}' target='_blank'>링크</a>
								  	</c:if>
								  </td>
								  <td>${list.COLUMND3}</td>
								  <td>${list.COLUMND5}</td>
								  <td>
								  	<c:if test="${list.COLUMND6 ne null && not empty list.COLUMND6}">
								  		<a href='${list.COLUMND6}' target='_blank'>링크</a>
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
