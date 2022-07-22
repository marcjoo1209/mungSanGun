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
					<a class="nav-link" href="/main">
					상품 감시 대상 리스트
					
						<span class="sr-only">(current)</span>
					
					</a>
				</li>
				<li class="nav-item <c:if test='${headGb eq \"2\"}'>active</c:if>">
					<a class="nav-link" href="/log">
					상품 감시 로그
					<c:if test='${headGb eq "2"}'>
						<span class="sr-only">(current)</span>
					</c:if>
					</a>
				</li>
				<li class="nav-item <c:if test='${headGb eq \"3\"}'>active</c:if>">
					<a class="nav-link disabled" href="#">
					관리2
					<c:if test='${headGb eq "3"}'>
						<span class="sr-only">(current)</span>
					</c:if>
					</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="https://example.com"
					id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">관리3</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="#">관리3-1</a> <a
							class="dropdown-item" href="#">관리3-2</a> <a
							class="dropdown-item" href="#">관리3-3</a>
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
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
