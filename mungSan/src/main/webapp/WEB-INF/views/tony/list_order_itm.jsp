<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>주문정보 관리 페이지</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
	<link rel="stylesheet" href='/resources/css/theme.css'>
	<link rel="stylesheet" href='/resources/css/dia_css.css'>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
          <a class="navbar-brand" href="#">주문정보 관리 페이지 </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li ><a href="ModifyItemList.do">信息</a></li>
            <li><a href="ModifyTeamInfo.do">游戏信息</a></li>
            <li class="active"><a href="getListOrderItemLst.do">주문정보</a></li>
            <!-- 
            <li><a href="ModifyGubun.do">구분 목록</a></li>
            <li><a href="ModifyInfo.do">게임 정보</a></li>
             -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">
      <div class="page-header">
        <h2>주문정보</h2>
      </div>
      
	  	<div class="row">
		    <div class="col-md-2">
			    <input type="text" class="form-control form-control-sm d-inline-block w-38 float-left" id="startDate" value="${searchDto.CREATEDTM }"> 
	            <span class="fa fa-calendar float-left" id="startDateFa"></span>
	    	</div>
		    <div class="col-md-2">
				<select class="form-control form-control-sm d-inline-block w-48" id="gameCd" >
					<option value="">-- 게임이름 선택 --</option>
					<c:forEach items ="${gameList }" var ="list">
					
					<option value="${list.GAMECODE }" <c:if test="${list.GAMECODE eq searchDto.GAMECODE}">selected </c:if>>${list.GAMENM }</option>
					</c:forEach>
				</select>
	    	</div>
	    	<!-- 
		    <div class="col-md-4">
	            <span class="fa fa-calendar float-right" id="endDateFa"></span> 
	            <input type="text" class="form-control form-control-sm d-inline-block w-38 float-right" id="endDate" value=""> 
	    	</div>
	    	 -->
		    <div class="col-auto">
		      <button type="button" class="btn btn-secondary" onclick="searchItemList()" style="font-size: 11px">검색</button>
	    	</div>
    	</div>

		<div class="row">
        <div class="col-md-16">
        	<table class="table">
	            <thead>
	              <tr>
	              </tr>
	            </thead>
        	</table>
        </div>
      </div>
      
      <div class="row">
        <div class="col-md-16">
          <table class="table table-bordered table-responsive-xl" id="itemTable" style="font-size: 12px">
            <thead>
              <tr>
                <th>순서</th>
                <th>게임이름</th>
                <th>주문정보</th>
                <th>주문일</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items ="${ordList }" var ="ordList" varStatus="status">				
              <tr data-toggle="modal" data-target="#exampleModal" onclick="clickOrderItemView(${ordList.IDX})">
                <td>
                	${ordList.IDX}
                </td>
                <td>
                	${ordList.GAMENM}
                </td>
                <td>
                	${ordList.ORDCMMANT}
                </td>
                <td>
                	${ordList.CREATEDTM}
                </td>
              </tr>
			</c:forEach>
            </tbody>
          </table>
        </div>
      </div>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-xl" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        주문 상세
				      </div>
				      <div class="modal-body" id="modalBody">
				        ...
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
	
       <form id="getListOrderItemLst" method="post" action="getListOrderItemLst.do">
       	<input type='hidden' id="createDate" name="createDate" value='${searchDto.CREATEDTM}'>
       	<input type='hidden' id="gameCode" name="gameCode" value='${searchDto.GAMECODE}'>
       </form> 
    </div> <!-- /container -->

  </body>
  <script>
  	function clickOrderItemView(idx){
  		debugger;
		let data ={IDX : idx};
		$.ajax({
			type		: 'POST',
			dataType 	: 'json',
			url			: "/getOrderItemLst.do", 
			data 		: data,
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			 beforeSend: function (request){request.setRequestHeader('AJAX', 'true');}, 
			success : function(obj){
				var data = JSON.stringify(obj);
				var json = JSON.parse(data);
			  	// 모달 텍스트 출력
  				let $modalBody  = $("#modalBody");
			  	let htmlTxt = 

			  		"<div class='form-group'>"
			        +    "<label for='recipient-name0' class='col-form-label'>인덱스:</label>"
			        +	"<input type='text' class='form-control' id='recipient-name0' value='"+json.rst0+"' readonly>"
			        + "</div>"

			  		+ "<div class='form-group'>"
			        +    "<label for='recipient-name0' class='col-form-label'>주문내용:</label>"
			        +	"<pre class='form-control' id='recipient-name1' style='font-size: 11px; height: 300px; ' >" + json.rst1 + "</pre>"
			        + "</div>"

			  		+ "<div class='form-group'>"
			        +    "<label for='recipient-name0' class='col-form-label'>주문일자:</label>"
			        +	"<input type='text' class='form-control' id='recipient-name2' value='"+json.rst2+"' readonly>"
			        + "</div>";

			        /*
	 	   			"<table border='1'>"
	 	   			+ "<tr>"
	 	   			+ 	"<th>인덱스"
	 	   			+ 	"</th>"
	 	   			+ 	"<th>주문내용"
	 	   			+ 	"</th>"
	 	   			+ 	"<th>주문일자"
	 	   			+ 	"</th>"
	 	   			+ "</tr>"
	 	   			+ "<tr>"
	 	   			+ 	"<td>"
	 	   			+	json.rst0
	 	   			+ 	"</td>"
	 	   			+ 	"<td><pre>"
	 	   			+	json.rst1
	 	   			+ 	"</pre></td>"
	 	   			+ 	"<td>"
	 	   			+	json.rst2
	 	   			+ 	"</td>"
	 	   			+ "</tr>"
	 	   			+ "</table>";*/
	 	   			
		 	   	$modalBody.html(htmlTxt);

			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}

  	$(document).ready(function() {
  		var formattedDate = new Date();
  		var m = ("0"+(formattedDate.getMonth()+1)).slice(-2);
  		var d = ("0"+(formattedDate.getDate())).slice(-2);
  		var y = formattedDate.getFullYear();
  		/*
  		if($("#endDate").val() == ""){
  			$("#endDate").val(y + "-" + m + "-" + d);
  			
  		}
  		*/
  		
  		// 조회 날짜
  		formattedDate.setMonth(formattedDate.getMonth());
  		m = ("0"+(formattedDate.getMonth()+1)).slice(-2);
  		d = ("0"+(formattedDate.getDate())).slice(-2);
  		y = formattedDate.getFullYear();
  		
  		if($("#startDate").val() == ""){
  			$("#startDate").val(y + "-" + m + "-" + d);
  		}
  		
  	});
  	
  	$(function() {
  	    $("#startDate").datepicker({
  	         dateFormat: "yy-mm-dd",
  	         showAnim: "fade", 
  	         showMonthAfterYear: true, 
  	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
  	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
  	    });
  	    $('#startDateFa').click(function() {
  	       $("#startDate").focus();
  	    });
  	    
  	    $("#endDate").datepicker({
  	    	 dateFormat: "yy-mm-dd",
  	         showAnim: "fade", 
  	         showMonthAfterYear: true, 
  	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
  	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
  	    });
  	    $('#endDateFa').click(function() {
  	       $("#endDate").focus();
  	    });
  	    
  	 });
  	
  	// 조회 클릭
  	function searchItemList(){
		var $form = $("#getListOrderItemLst");
		
		$('#createDate').val($('#startDate').val());
		$('#gameCode').val($('#gameCd').val());

		$form.submit()
  		
  	}
  </script>
</html>
