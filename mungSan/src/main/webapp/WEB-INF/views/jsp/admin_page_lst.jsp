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

<title>상품 관리 페이지</title>

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

<!-- eXCEL -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
</head>
<style>
.tableFixHead          { overflow: auto; height: 600px; }
.tableFixHead thead th { position: sticky; top: 0; z-index: 1; }

/* Just common table stuff. Really. */
table  { border-collapse: collapse; width: 100%; }
th, td { padding: 8px 16px; }
th     { background:#eee; }
</style>
<body>

		<div class="page-header">
			<h2>상품 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
			 	<button type="button" class="btn btn-secondary" onclick="createButton_onclikc()" style="font-size: 11px">추가</button>
			 	<!-- 엑셀 다운로드 -->
				<a href="javascript:excelDown()">
					<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmvsaMXmv3CVtqCY5Mq2eoZpWSH2AQ7TyfQNIGklhRc3qMd05pll0fS7tA5uqeVVgO24&usqp=CAU' width='55px' height='35px' alt='엑셀 다운로드'/>
				</a>
				<!-- 엑셀 업로드 -->
				<img src='https://www.nicepng.com/png/detail/208-2087007_excel-icon-png-upload-csv-icon.png' width='50px' height='35px' data-toggle='modal' data-target='#excelModal' alt='엑셀 업로드'/>
		    </div>
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
		
		<div class="tableFixHead">
				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 11px">
					<thead>
						<tr>
							<th>순서</th>
							<th>상품명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>롯데온 </th>
							<th>마진 </th>
							<th>최저가 </th>
							<th>참고링크 </th>
							<th>쿠팡</th>
							<th>마진</th>
							<th>최저가</th>
							<th>참고링크</th>
							<th>지마켓</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>옥션</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>티몬</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>인터파크</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>SSG</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${outDto}" var="list" varStatus="status">
							<tr>
								  <td>${list.DIDX }</td>
								  <td><input id = 'COLUMNA1${list.DIDX}' type='text' 	value='${list.COLUMNA1}'/></td>
								  <td><input id = 'COLUMNA2${list.DIDX}' type='number' 	value='${list.COLUMNA2}'/></td>
								  <td><input id = 'COLUMNA3${list.DIDX}' type='number' 	value='${list.COLUMNA3}'/></td>
								  <td><input id = 'COLUMNA4${list.DIDX}' type='number' 	value='${list.COLUMNA4}'/></td>
								  <td><input id = 'COLUMNA5${list.DIDX}' type='number' 	value='${(list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)}'/></td>
								  <td><input id = 'COLUMNA6${list.DIDX}' type='text' 	value='${list.COLUMNA6}'/></td>
								  <td><input id = 'COLUMNA7${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNA6}'/></td>
								  <td><input id = 'COLUMNA8${list.DIDX}' type='number' 	value='${list.COLUMNA8}'/></td>
								  <td><input id = 'COLUMNA9${list.DIDX}' type='text' 	value='${list.COLUMNA9}'/></td>
								  <td><input id = 'COLUMNB1${list.DIDX}' type='text' 	value='${list.COLUMNB1}'/></td>
								  <td><input id = 'COLUMNB2${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNB2}'/></td>
								  <td><input id = 'COLUMNB3${list.DIDX}' type='number' 	value='${list.COLUMNB3}'/></td>
								  <td><input id = 'COLUMNB4${list.DIDX}' type='text' 	value='${list.COLUMNB4}'/></td>
								  <td><input id = 'COLUMNB5${list.DIDX}' type='text' 	value='${list.COLUMNB5}'/></td>
								  <td><input id = 'COLUMNB6${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNB6}'/></td>
								  <td><input id = 'COLUMNB7${list.DIDX}' type='number' 	value='${list.COLUMNB7}'/></td>
								  <td><input id = 'COLUMNB8${list.DIDX}' type='text' 	value='${list.COLUMNB8}'/></td>
								  <td><input id = 'COLUMNB9${list.DIDX}' type='text' 	value='${list.COLUMNB9}'/></td>
								  <td><input id = 'COLUMNC1${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNC1}'/></td>
								  <td><input id = 'COLUMNC2${list.DIDX}' type='number' 	value='${list.COLUMNC2}'/></td>
								  <td><input id = 'COLUMNC3${list.DIDX}' type='text' 	value='${list.COLUMNC3}'/></td>
								  <td><input id = 'COLUMNC4${list.DIDX}' type='text' 	value='${list.COLUMNC4}'/></td>
								  <td><input id = 'COLUMNC5${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNC5}'/></td>
								  <td><input id = 'COLUMNC6${list.DIDX}' type='number' 	value='${list.COLUMNC6}'/></td>
								  <td><input id = 'COLUMNC7${list.DIDX}' type='text' 	value='${list.COLUMNC7}'/></td>
								  <td><input id = 'COLUMNC8${list.DIDX}' type='text' 	value='${list.COLUMNC8}'/></td>
								  <td><input id = 'COLUMNC9${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNC9}'/></td>
								  <td><input id = 'COLUMND1${list.DIDX}' type='number' 	value='${list.COLUMND1}'/></td>
								  <td><input id = 'COLUMND2${list.DIDX}' type='text' 	value='${list.COLUMND2}'/></td>
								  <td><input id = 'COLUMND3${list.DIDX}' type='text' 	value='${list.COLUMND3}'/></td>
								  <td><input id = 'COLUMND4${list.DIDX}' type='number' 	value='${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMND4}'/></td>
								  <td><input id = 'COLUMND5${list.DIDX}' type='number' 	value='${list.COLUMND5}'/></td>
								  <td><input id = 'COLUMND6${list.DIDX}' type='text' 	value='${list.COLUMND6}'/></td>
								<td>
									<button type="button" class="btn btn-primary" id="modifyButton" onclick="modifyButton_onclikc(${list.DIDX})" style="font-size: 10px">수정</button>
								</td>
								<td>
									<button type="button" class="btn btn-primary" id="removeButton" onclick="removeButton_onclikc(${list.DIDX})" style="font-size: 10px">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
</div>
	<!-- /.container -->

	<form id="modifyAdminPage" method="post" action="/modifyAdminPage">
		<input type='hidden' id="DIDX" 		name="DIDX" value=''>
		<input type='hidden' id="COLUMNA1" 	name="COLUMNA1" value=''>
		<input type='hidden' id="COLUMNA2" 	name="COLUMNA2" value=''>
		<input type='hidden' id="COLUMNA3" 	name="COLUMNA3" value=''>
		<input type='hidden' id="COLUMNA4" 	name="COLUMNA4" value=''>
		<input type='hidden' id="COLUMNA5" 	name="COLUMNA5" value=''>
		<input type='hidden' id="COLUMNA6" 	name="COLUMNA6" value=''>
		<input type='hidden' id="COLUMNA7" 	name="COLUMNA7" value=''>
		<input type='hidden' id="COLUMNA8" 	name="COLUMNA8" value=''>
		<input type='hidden' id="COLUMNA9" 	name="COLUMNA9" value=''>
		<input type='hidden' id="COLUMNB1" 	name="COLUMNB1" value=''>
		<input type='hidden' id="COLUMNB2" 	name="COLUMNB2" value=''>
		<input type='hidden' id="COLUMNB3" 	name="COLUMNB3" value=''>
		<input type='hidden' id="COLUMNB4" 	name="COLUMNB4" value=''>
		<input type='hidden' id="COLUMNB5" 	name="COLUMNB5" value=''>
		<input type='hidden' id="COLUMNB6" 	name="COLUMNB6" value=''>
		<input type='hidden' id="COLUMNB7" 	name="COLUMNB7" value=''>
		<input type='hidden' id="COLUMNB8" 	name="COLUMNB8" value=''>
		<input type='hidden' id="COLUMNB9" 	name="COLUMNB9" value=''>
		<input type='hidden' id="COLUMNC1" 	name="COLUMNC1" value=''>
		<input type='hidden' id="COLUMNC2" 	name="COLUMNC2" value=''>
		<input type='hidden' id="COLUMNC3" 	name="COLUMNC3" value=''>
		<input type='hidden' id="COLUMNC4" 	name="COLUMNC4" value=''>
		<input type='hidden' id="COLUMNC5" 	name="COLUMNC5" value=''>
		<input type='hidden' id="COLUMNC6" 	name="COLUMNC6" value=''>
		<input type='hidden' id="COLUMNC7" 	name="COLUMNC7" value=''>
		<input type='hidden' id="COLUMNC8" 	name="COLUMNC8" value=''>
		<input type='hidden' id="COLUMNC9" 	name="COLUMNC9" value=''>
		<input type='hidden' id="COLUMND1" 	name="COLUMND1" value=''>
		<input type='hidden' id="COLUMND2" 	name="COLUMND2" value=''>
		<input type='hidden' id="COLUMND3" 	name="COLUMND3" value=''>
		<input type='hidden' id="COLUMND4" 	name="COLUMND4" value=''>
		<input type='hidden' id="COLUMND5" 	name="COLUMND5" value=''>
		<input type='hidden' id="COLUMND6" 	name="COLUMND6" value=''>
		<input type='hidden' id="GBCD" 		name="GBCD" value=''>
	</form>

	<form id="removeAdminPage" method="post"
		action="/removeAdminPage">
		<input type='hidden' id="DIDX1" name="DIDX1" value=''>
	</form>

	<form id="SearchLst" method="post"
		action="/admin-page-lst">
		<input type='hidden' id="COL1" name="COL1" value=''>
	</form>
	
	<form action="/excelDownload" method="post" id="excelDownload" name="excelDownload">
	</form>
	
	<!-- excel Modal -->
	<div class="modal fade" id="excelModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">엑셀 업로드</div>
				<div class="modal-body" id="modalBody" style="max-width: 100%; width: auto !important; display: inline-block;">
					<form id="excelForm" name="excelForm" method="post" enctype="multipart/form-data" action="/excelUpload">
    					<input type="file" id="excelFileInput" name="excelFileInput"/>
    				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick='excelUp()'>저장</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer class="container">
		<%@ include file="./common/foot.jsp"%>
	</footer>
	
	<!-- Excel Export 용 테이블 hide -->
	
				<table id="excelTable" hidden>
					<thead>
						<tr>
							<th>순서</th>
							<th>상품명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>롯데온 </th>
							<th>마진 </th>
							<th>최저가 </th>
							<th>참고링크 </th>
							<th>쿠팡</th>
							<th>마진</th>
							<th>최저가</th>
							<th>참고링크</th>
							<th>지마켓</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>옥션</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>티몬</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>인터파크</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>SSG</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${outDto}" var="list" varStatus="status">
							<tr>
								  <td>${list.DIDX }</td>
								  <td>${list.COLUMNA1}</td>
								  <td>${list.COLUMNA2}</td>
								  <td>${list.COLUMNA3}</td>
								  <td>${list.COLUMNA4}</td>
								  <td>${(list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)}</td>
								  <td>${list.COLUMNA6}</td>
								  <td>${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNA6}</td>
								  <td>${list.COLUMNA8}</td>
								  <td>${list.COLUMNA9}</td>
								  <td>${list.COLUMNB1}</td>
								  <td>${list.COLUMNB2}</td>
								  <td>${list.COLUMNB3}</td>
								  <td>${list.COLUMNB4}</td>
								  <td>${list.COLUMNB5}</td>
								  <td>${list.COLUMNB6}</td>
								  <td>${list.COLUMNB7}</td>
								  <td>${list.COLUMNB8}</td>
								  <td>${list.COLUMNB9}</td>
								  <td>${list.COLUMNC1}</td>
								  <td>${list.COLUMNC2}</td>
								  <td>${list.COLUMNC3}</td>
								  <td>${list.COLUMNC4}</td>
								  <td>${list.COLUMNC5}</td>
								  <td>${list.COLUMNC6}</td>
								  <td>${list.COLUMNC7}</td>
								  <td>${list.COLUMNC8}</td>
								  <td>${list.COLUMNC9}</td>
								  <td>${list.COLUMND1}</td>
								  <td>${list.COLUMND2}</td>
								  <td>${list.COLUMND3}</td>
								  <td>${list.COLUMND4}</td>
								  <td>${list.COLUMND5}</td>
								  <td>${list.COLUMND6}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	<!--  -->

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
  	
  	// 삭제 호출
	function removeButton_onclikc(idx){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#removeAdminPage");
		
		// 수정 값체크
		// form 값 초기화
		$("#DIDX1").val(idx);
		
		// 변경 호출
		$form.submit()
	}
  	
  	// 수정 입력 호출
	function modifyButton_onclikc(inkeyNum){
  	    if (!confirm("아이템을 수정 하시겠습니까?\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
   	       return false;
   	    } else {
			// form 변수 초기화
			var $form = $("#modifyAdminPage");
			
			// 수정 값체크
			var $didx 		= inkeyNum;
			var $create0 	= $("#COLUMNA1"+inkeyNum).val();
			var $create1 	= $("#COLUMNA2"+inkeyNum).val();
			var $create2 	= $("#COLUMNA3"+inkeyNum).val();
			var $create3 	= $("#COLUMNA4"+inkeyNum).val();
			var $create4 	= $("#COLUMNA5"+inkeyNum).val();
			var $create5 	= $("#COLUMNA6"+inkeyNum).val();
			var $create6 	= $("#COLUMNA7"+inkeyNum).val();
			var $create7 	= $("#COLUMNA8"+inkeyNum).val();
			var $create8 	= $("#COLUMNA9"+inkeyNum).val();
			var $create9 	= $("#COLUMNB1"+inkeyNum).val();
			var $create10 	= $("#COLUMNB2"+inkeyNum).val();
			var $create11 	= $("#COLUMNB3"+inkeyNum).val();
			var $create12 	= $("#COLUMNB4"+inkeyNum).val();
			var $create13 	= $("#COLUMNB5"+inkeyNum).val();
			var $create14 	= $("#COLUMNB6"+inkeyNum).val();
			var $create15 	= $("#COLUMNB7"+inkeyNum).val();
			var $create16 	= $("#COLUMNB8"+inkeyNum).val();
			var $create17 	= $("#COLUMNB9"+inkeyNum).val();
			var $create18 	= $("#COLUMNC1"+inkeyNum).val();
			var $create19 	= $("#COLUMNC2"+inkeyNum).val();
			var $create20 	= $("#COLUMNC3"+inkeyNum).val();
			var $create21 	= $("#COLUMNC4"+inkeyNum).val();
			var $create22 	= $("#COLUMNC5"+inkeyNum).val();
			var $create23 	= $("#COLUMNC6"+inkeyNum).val();
			var $create24 	= $("#COLUMNC7"+inkeyNum).val();
			var $create25 	= $("#COLUMNC8"+inkeyNum).val();
			var $create26 	= $("#COLUMNC9"+inkeyNum).val();
			var $create27 	= $("#COLUMND1"+inkeyNum).val();
			var $create28 	= $("#COLUMND2"+inkeyNum).val();
			var $create29 	= $("#COLUMND3"+inkeyNum).val();
			var $create30 	= $("#COLUMND4"+inkeyNum).val();
			var $create31 	= $("#COLUMND5"+inkeyNum).val();
			var $create32 	= $("#COLUMND6"+inkeyNum).val();
			
			// form 값 초기화
			$("#DIDX").val($didx );
			$("#COLUMNA1").val($create0 );
			$("#COLUMNA2").val($create1 );
			$("#COLUMNA3").val($create2 );
			$("#COLUMNA4").val($create3 );
			$("#COLUMNA5").val($create4 );
			$("#COLUMNA6").val($create5 );
			$("#COLUMNA7").val($create6 );
			$("#COLUMNA8").val($create7 );
			$("#COLUMNA9").val($create8 );
			$("#COLUMNB1").val($create9 );
			$("#COLUMNB2").val($create10);
			$("#COLUMNB3").val($create11);
			$("#COLUMNB4").val($create12);
			$("#COLUMNB5").val($create13);
			$("#COLUMNB6").val($create14);
			$("#COLUMNB7").val($create15);
			$("#COLUMNB8").val($create16);
			$("#COLUMNB9").val($create17);
			$("#COLUMNC1").val($create18);
			$("#COLUMNC2").val($create19);
			$("#COLUMNC3").val($create20);
			$("#COLUMNC4").val($create21);
			$("#COLUMNC5").val($create22);
			$("#COLUMNC6").val($create23);
			$("#COLUMNC7").val($create24);
			$("#COLUMNC8").val($create25);
			$("#COLUMNC9").val($create26);
			$("#COLUMND1").val($create27);
			$("#COLUMND2").val($create28);
			$("#COLUMND3").val($create29);
			$("#COLUMND4").val($create30);
			$("#COLUMND5").val($create31);
			$("#COLUMND6").val($create32);
			$("#GBCD").val("U");
			
			// url 호출
			$form.submit();
   	    }
	}

	// 조회 건수
  	let totCnt = 0;
  	totCnt = ${list2cnt};

	function createButton_onclikc(){
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"<tr>																																				 "
			+ "	  <td>-</td>                                                                                                                                     "
			+ "	  <td><input id = 'COLUMNA1T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA2T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA3T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA4T' type='number' 	value='0.88'/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA5T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA6T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA7T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA8T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNA9T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB1T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB2T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB3T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB4T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB5T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB6T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB7T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB8T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNB9T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC1T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC2T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC3T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC4T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC5T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC6T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC7T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC8T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMNC9T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMND1T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMND2T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMND3T' type='text' 		value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMND4T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMND5T' type='number' 	value=''/></td>                                                                  "
			+ "	  <td><input id = 'COLUMND6T' type='text' 		value=''/></td>                                                                  "
			+ "	<td>                                                                                                                                             "
			+ "		-                                                                                                                                            "
			+ "	</td>                                                                                                                                            "
			+ "	<td>                                                                                                                                             "
			+ "		<button type='button' class='btn btn-primary' id='createButton' onclick='createButton_onclikcData()' style='font-size: 10px'>추가</button>         "
			+ "	</td>                                                                                                                                            "
			+ "</tr>                                                                                                                                               "
	   			;
		//$("#itemTable>tbody").prepend("<tr><td>Test Row Append</td></tr>");
		$("#itemTable>tbody").prepend(tmpTExt);
	}

  	// 입력 호출
	function createButton_onclikcData(){
  		debugger;
  	    if (!confirm("아이템을 추가 하시겠습니까?\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
  	       return false;
  	    } else {

  			// form 변수 초기화
  			var $form = $("#modifyAdminPage");
  			
  			// 수정 값체크
  			var $create0 	= $("#COLUMNA1T").val();
  			var $create1 	= $("#COLUMNA2T").val();
  			var $create2 	= $("#COLUMNA3T").val();
  			var $create3 	= $("#COLUMNA4T").val();
  			var $create4 	= $("#COLUMNA5T").val();
  			var $create5 	= $("#COLUMNA6T").val();
  			var $create6 	= $("#COLUMNA7T").val();
  			var $create7 	= $("#COLUMNA8T").val();
  			var $create8 	= $("#COLUMNA9T").val();
  			var $create9 	= $("#COLUMNB1T").val();
  			var $create10 	= $("#COLUMNB2T").val();
  			var $create11 	= $("#COLUMNB3T").val();
  			var $create12 	= $("#COLUMNB4T").val();
  			var $create13 	= $("#COLUMNB5T").val();
  			var $create14 	= $("#COLUMNB6T").val();
  			var $create15 	= $("#COLUMNB7T").val();
  			var $create16 	= $("#COLUMNB8T").val();
  			var $create17 	= $("#COLUMNB9T").val();
  			var $create18 	= $("#COLUMNC1T").val();
  			var $create19 	= $("#COLUMNC2T").val();
  			var $create20 	= $("#COLUMNC3T").val();
  			var $create21 	= $("#COLUMNC4T").val();
  			var $create22 	= $("#COLUMNC5T").val();
  			var $create23 	= $("#COLUMNC6T").val();
  			var $create24 	= $("#COLUMNC7T").val();
  			var $create25 	= $("#COLUMNC8T").val();
  			var $create26 	= $("#COLUMNC9T").val();
  			var $create27 	= $("#COLUMND1T").val();
  			var $create28 	= $("#COLUMND2T").val();
  			var $create29 	= $("#COLUMND3T").val();
  			var $create30 	= $("#COLUMND4T").val();
  			var $create31 	= $("#COLUMND5T").val();
  			var $create32 	= $("#COLUMND6T").val();
  			
  			// form 값 초기화
  			$("#COLUMNA1").val($create0 );
  			$("#COLUMNA2").val($create1 );
  			$("#COLUMNA3").val($create2 );
  			$("#COLUMNA4").val($create3 );
  			$("#COLUMNA5").val($create4 );
  			$("#COLUMNA6").val($create5 );
  			$("#COLUMNA7").val($create6 );
  			$("#COLUMNA8").val($create7 );
  			$("#COLUMNA9").val($create8 );
  			$("#COLUMNB1").val($create9 );
  			$("#COLUMNB2").val($create10);
  			$("#COLUMNB3").val($create11);
  			$("#COLUMNB4").val($create12);
  			$("#COLUMNB5").val($create13);
  			$("#COLUMNB6").val($create14);
  			$("#COLUMNB7").val($create15);
  			$("#COLUMNB8").val($create16);
  			$("#COLUMNB9").val($create17);
  			$("#COLUMNC1").val($create18);
  			$("#COLUMNC2").val($create19);
  			$("#COLUMNC3").val($create20);
  			$("#COLUMNC4").val($create21);
  			$("#COLUMNC5").val($create22);
  			$("#COLUMNC6").val($create23);
  			$("#COLUMNC7").val($create24);
  			$("#COLUMNC8").val($create25);
  			$("#COLUMNC9").val($create26);
  			$("#COLUMND1").val($create27);
  			$("#COLUMND2").val($create28);
  			$("#COLUMND3").val($create29);
  			$("#COLUMND4").val($create30);
  			$("#COLUMND5").val($create31);
  			$("#COLUMND6").val($create32);
  			$("#GBCD").val("I");
  			
  			// url 호출
  			$form.submit();
  	    }
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


  	function excelDown(){
  		debugger;
  		alert("엑셀다운로드를 진행 합니다.");
  		//$("#excelDownload").submit();
  		exportExcel();
  		
  	}
  	function excelUp(){
  		debugger;
  	    if (!confirm("엑셀업로드를 진행 합니다.\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
   	       return false;
   	    } else {
  			$("#excelForm").submit();
   	    }
  		/*
  		let input = event.target;
  	    let reader = new FileReader();
  	    reader.onload = function () {
  	        let data = reader.result;
  	        let workBook = XLSX.read(data, { type: 'binary' });
  	        workBook.SheetNames.forEach(function (sheetName) {
  	            console.log('SheetName: ' + sheetName);
  	            let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName]);
  	            console.log(JSON.stringify(rows));
  	        })
  	    };
  	    reader.readAsBinaryString(input.files[0]);
  	    */
  	}
  	
  	function s2ab(s) { 
  	    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  	    var view = new Uint8Array(buf);  //create uint8array as viewer
  	    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
  	    return buf;    
  	}
  	
  	function exportExcel(){ 
  	    // step 1. workbook 생성
  	    var wb = XLSX.utils.book_new();

  	    // step 2. 시트 만들기 
  	    var newWorksheet = excelHandler.getWorksheet();
  	    
  	    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
  	    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  	    // step 4. 엑셀 파일 만들기 
  	    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

  	    // step 5. 엑셀 파일 내보내기 
  	    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
  	}
  	
  	var excelHandler = {
  	        getExcelFileName : function(){
  	            return '상품리스트.xlsx';
  	        },
  	        getSheetName : function(){
  	            return '상품리스트 Sheet';
  	        },
  	        getExcelData : function(){
  	            return document.getElementById('excelTable'); 
  	        },
  	        getWorksheet : function(){
  	            return XLSX.utils.table_to_sheet(this.getExcelData());
  	        }
  	}
  	
  	$(document).ready(function() { 
  	});
  	
  </script>
</body>
</html>
