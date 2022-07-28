<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<% 
	String loginSession = (String)request.getSession().getAttribute("_loginSession_");

System.out.println("loginSession : "+loginSession);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>관리자페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/css/smp.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</head>

<body>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/admin_main.do"><img src='${pageContext.request.contextPath}/resources/img/ci.png'></a>
				<ul class="navbar-nav text-uppercase ml-auto">
					
				    <li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                 부동산팀
				      </a>
				      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				      	<a class="dropdown-item" href="/admin_main.do">위임장 리스트</a>
				      	<a class="dropdown-item" href="javascript:alert('관리자에게 문의 하세요.');">아파트 리스트</a>
				        <!-- <a class="dropdown-item" href="/getAptInfoList.do">아파트 리스트</a> -->
				        <div class="dropdown-divider"></div>
				        <a class="dropdown-item" href="/pdfAllview.do">PDF 조회</a>
				      </div>
				    </li>
				    <li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                 건설팀
				      </a>
				      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
						  <a class="dropdown-item" href="/defect_admin_main.do">하자보수 리스트</a>
						  <a class="dropdown-item" href="/viewDefect.do">하자보수 폼</a>
				        <div class="dropdown-divider"></div>
						  <a class="dropdown-item" href="/defectPdfAllview.do">PDF 조회</a>					
				      </div>
				    </li>
				    <li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                 통계
				      </a>
				      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				      	<a class="dropdown-item" href="javascript:alert('관리자에게 문의 하세요.');">통계</a>
				      	<!-- 
					  	<li class="nav-item"><a class="nav-link" href="javascript:document.chartForm.submit();">통계 차트</a></li>
					 -->
				      </div>
				    </li>
					<%if(loginSession == null){ %>
					<li class="nav-item"><a class="nav-link" href="/userLogin.do">로그인</a></li>
				 	<%} else { %>
				 	<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
				 	<%} %>
				</ul>
			     
		</div>
	</nav>
	<form name="chartForm" action="/chart.do" method="POST">
	</form>

	