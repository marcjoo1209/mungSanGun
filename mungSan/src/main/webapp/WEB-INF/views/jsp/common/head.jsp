<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Carousel Template for Bootstrap</title>

</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" href="#">관리페이지</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item <c:if test='${headGb eq \"1\"}'>active</c:if>">
					<a class="nav-link" href="/admin-page-lst-main">
					상품 관리 페이지
					<c:if test='${headGb eq "2"}'>
						<span class="sr-only">(current)</span>
					</c:if>
					</a>
				</li>
				<li class="nav-item <c:if test='${headGb eq \"2\"}'>active</c:if>">
					<a class="nav-link" href="/admin-page-lst-sub">
					상품 상세 관리 페이지
					<c:if test='${headGb eq "2"}'>
						<span class="sr-only">(current)</span>
					</c:if>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/product-lst">
					사용자 상품 리스트
					</a>
				</li>
				<li class="nav-item dropdown <c:if test='${headGb eq \"3\" || headGb eq \"4\"}'>active</c:if>">
					<a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						코드관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="/admin-page-product-code">상품 코드 관리</a> 
						<a class="dropdown-item" href="/admin-page-shop-code">이커머스 코드 관리</a>
					</div>
				</li>
				<li class="nav-item dropdown <c:if test='${headGb eq \"3\" || headGb eq \"4\"}'>active</c:if>">
					<a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						OLD
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="/admin-page-lst">관리자</a> 
						<a class="dropdown-item" href="/user-main">사용자</a>
					</div>
				</li>
			</ul>
			<!-- 
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			-->
		</div>
	</nav>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
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
</body>
</html>
