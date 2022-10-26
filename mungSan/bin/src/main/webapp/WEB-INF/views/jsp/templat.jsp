<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>안내 사항</title>

    <!-- Bootstrap core CSS 
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">-->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Bootstrap theme 
    <link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">-->
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
	
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Custom styles for this template -->
	<link rel="stylesheet" href='/resources/css/theme.css'>

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body role="document">
    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">아이템 구매 안내 사항</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <!--
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
            -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action 
      <div class="jumbotron">
        <a href="./example.html" role="button" data-slide="prev">
          example
        </a>
        <a href="./write.html" role="button" data-slide="prev">
          write
        </a>
      </div>
-->
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>아이템 구매시 유의사항</h1>
        <p> # 입금계좌 : 754801-01-460608국민은행/윤영민 </p>
        <p> * 방제목 : tony88/1 </p>
        <p> * 아이템 받을 케릭터 명 : <input></p>
        <button type="button" class="btn btn-sm btn-danger">아이템 구매 요청</button>
        <p></p>
        <p> ******* 아래 요청 사항이 맞습니까? ******* </p>
        <textarea  rows="4" cols="50" value="">
          조드룬 * 3= 6000 원, 참룬 *2 = 2000 원
          총 합 금액 : 8000 원
        </textarea>
      </div>

      <div class="page-header">
        <h1>아이템 목록</h1>
      </div>
      <!-- 
      <form class="navbar-form navbar-right">
        <input type="text" class="form-control" placeholder="아이템 이름">
      </form>
       -->
      <div class="row">
        <div class="col-md-6">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>순번</th>
                <th>아이템 명</th>
                <th>단가</th>
                <th>수량</th>
                <th>총합</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>조드룬</td>
                <td>2000 원</td>
                <td><input></td>
                <td>0원</td>
              </tr>
              <tr>
                <td>2</td>
                <td>참룬</td>
                <td>1000 원</td>
                <td><input></td>
                <td>0원</td>
              </tr>
              <tr>
                <td>3</td>
                <td>자룬</td>
                <td>5400 원</td>
                <td><input></td>
                <td>0원</td>
              </tr>
              <tr>
                <td>4</td>
                <td>베르룬</td>
                <td>7600 원</td>
                <td><input></td>
                <td>0원</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div> <!-- /container -->
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<!-- 
    <script src="../../dist/js/bootstrap.min.js"></script> -->
    <script src="/resources/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->

  </body>
</html>
