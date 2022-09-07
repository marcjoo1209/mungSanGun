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

<!-- bootstrap sticky -->
<link href="https://unpkg.com/bootstrap-table@1.21.0/dist/bootstrap-table.min.css" rel="stylesheet">
<link href="https://unpkg.com/bootstrap-table@1.21.0/dist/extensions/sticky-header/bootstrap-table-sticky-header.css" rel="stylesheet">

<script src="https://unpkg.com/bootstrap-table@1.21.0/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.21.0/dist/extensions/sticky-header/bootstrap-table-sticky-header.min.js"></script>

<style type="text/css">
.mycenterStyle{font-size: 20px; text-align:center; vertical-align:middle}
input.price1{border-right: #ffffff 1px solid; border-left: #ffffff 1px solid; border-top: #ffffff 1px solid; border-bottom: #000000 1px solid; width:70px;}
input.longstr{border-right: #ffffff 1px solid; border-left: #ffffff 1px solid; border-top: #ffffff 1px solid; border-bottom: #000000 1px solid; width:200px;}

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

.modal-xl {
    max-width: 90% !important;
}
</style>

<!-- eXCEL -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
</head>
<body>

	<!-- HEAD -->
	<footer class="container">
		<%@ include file="./common/head.jsp"%>
	</footer>
	
		<div class="page-header">
			<h2>상품 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" id='createButton' onclick="createButton_onclick()" style="font-size: 20px">추가</button>
		      
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
		  	<!--
		  	1. 이미지 상품명 판매가 배송비 수수료 정산가 구입가 마진 최저가 링크 중 알바와 공유하는 웹사이트로 노출되는걸 선택 할수 있습니다.
		  	2. 상품 정보등 입력 수정 시 "연필" 클릭 후 별도 모달 창에서 수정 후 "체크"클릭시 바로 수정, 저장 되도록   
		  	 -->
		    <div class="tableFixHead">
				<table class="table table-bordered table-responsive-sm" id="itemTable" style="font-size: 20px; text-align:center; vertical-align:middle">
					<!-- 
				<table class="table table-bordered table-responsive-sm" id="itemTable" style="font-size: 20px; text-align:center; vertical-align:middle">
					<caption>제목셀이 고정된 표입니다.</caption>
					<colgroup>
						<col width="1%">
						<col width="1%">
						<col width="5%">
						<col width="5%">
						<col width="38%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					 -->
					<thead style="" class="thead-light" >
						<tr>
							<th>순서</th>
							<!-- 더보기를 누르면 내가 기록한 해당 제품의 여러 오픈마켓의 정보가 나옵니다. 
							더보기를 누르면 오픈마켓 중 구입가가 가장 저렴한 것부터 순서대로 보여집니다. 
							이곳에서도 상품명 가격 등 수정이 바로 이뤄지면 좋겠습니다 -->
							<th>더보기</th> 
							<th>처리</th>
							<th>이미지 </th>
							<th>
								상품명 
								<c:if test="${orderNum  eq 'b'}">
									<a href="javascript:searchItemList('a')">오름차순</a>
								</c:if>
								<c:if test="${orderNum  eq 'c'}">
									<a href="javascript:searchItemList('a')">오름차순</a>
								</c:if>
								<c:if test="${orderNum  eq 'a'}">
									<a href="javascript:searchItemList('b')">내림차순</a>
								</c:if>
							</th> <!-- 상품명을 정렬해서 볼 수 있습니다.(내-외부용 모두) -->
							<th>Lead Price </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>구입가 </th>	<!-- 상품 검색시 여러 오픈마켓의 정보중 구입가가 가장 저렴한 코드의 정보를 노출시켜줍니다. -->
							<th>마진 </th>
							<th>최저가 </th>
							<th>링크</th>
							<th>메모</th>
						</tr>
					</thead>
					<tbody valign='bottom'>
						<c:forEach items='${outDto}' var='list' varStatus='status'>
							<!-- 정산가 : 판매가 * 수수료 + 배송비 *0.967 -->
							<c:set var='totAmt' value='${(list.NOMALAMT * list.COMMITIONAMT)+(list.SHIPAMT * 0.967)}'/>
							<!-- 마진 : 정산가 - 오픈마켓가격 (구입가)-->
							<c:set var='totAmtP' value='${totAmt-list.PAYAMT}'/>
							
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
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<!-- 수정버튼 
									<button type='button' class='btn btn-primary' id='modifyButton' onclick='modifyButton_onclickData(${list.IDX})' style='font-size: 10px'>수정</button>
									-->
									<!-- 삭제버튼 -->
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclickData(${list.IDX})' style='font-size: 10px; margin: 1px;'>삭제</button>
								</td>
								<!-- 이미지 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<img class="custom" src='${list.IMGURL} ' width='50px' height='50px'>
									<a href="javascript:modifyProduct(${list.IDX}, '0');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='IMGURLIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='IMGURL${list.IDX}' value='${list.IMGURL }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '0');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='IMGURLIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 상품명 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span id='PRODUCTNMSPAN${list.IDX}'>${fn:substring(list.PRODUCTNM, 0, 50) } ...</span>
									<a href="javascript:modifyProduct(${list.IDX}, '1');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PRODUCTNMIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='PRODUCTNM${list.IDX}' value='${list.PRODUCTNM }'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '1');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PRODUCTNMIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- leadPrice -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='LEADAMTSPAN${list.IDX}'>${list.LEADAMT}</span>
									<a href="javascript:modifyProduct(${list.IDX}, '10');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='LEADAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='LEADAMT${list.IDX}' value='${list.LEADAMT}'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '10');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='LEADAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 판매가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma"  id='NOMALAMTSPAN${list.IDX}'>${list.NOMALAMT }</span>
									<!-- 
									<a href="javascript:modifyProduct(${list.IDX}, '2');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='NOMALAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='NOMALAMT${list.IDX}' value='${list.NOMALAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '1');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='NOMALAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
									-->
								</td>
								<!-- 배송비 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='SHIPAMTSPAN${list.IDX}'>${list.SHIPAMT }</span>
									<!-- 
									<a href="javascript:modifyProduct(${list.IDX}, '3');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='SHIPAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='SHIPAMT${list.IDX}' value='${list.SHIPAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '3');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='SHIPAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
									-->
								</td>
								<!-- 수수료 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='COMMITIONAMTSPAN${list.IDX}'>${list.COMMITIONAMT }</span>
									<!-- 
									<a href="javascript:modifyProduct(${list.IDX}, '4');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='COMMITIONAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='COMMITIONAMT${list.IDX}' value='${list.COMMITIONAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '4');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='COMMITIONAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
									 -->
								</td>
								<!-- 정산가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='CALCAMTSPAN${list.IDX}'><fmt:formatNumber type='number' pattern='##################' value='${totAmt }' /></span>
									<!-- 
									<input type='hidden' class='price1' id='CALCAMT${list.IDX}' value='<fmt:formatNumber type='number' pattern='##################' value='${totAmt }' /> '/>
									 -->
								</td>
								<!-- 구입가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='PAYAMTSPAN${list.IDX}'>${list.PAYAMT }</span>
									<!-- 
									<a href="javascript:modifyProduct(${list.IDX}, '6');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PAYAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='PAYAMT${list.IDX}' value='${list.PAYAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '6');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PAYAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
									 -->
								</td>
								<!-- 마진 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='INCOMEAMTSPAN${list.IDX}'><fmt:formatNumber type='number' pattern='##################' value='${totAmtP }' /></span>
									<!-- 
									<input type='hidden' class='price1' id='INCOMEAMT${list.IDX}' value='<fmt:formatNumber type='number' pattern='##################' value='${totAmtP }' /> '/>
									 -->
								</td>
								<!-- 최저가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class="comma" id='LOWAMTSPAN${list.IDX}'>${list.LOWAMT }</span>
									<!--  
									<a href="javascript:modifyProduct(${list.IDX}, '8');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='LOWAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='LOWAMT${list.IDX}' value='${list.LOWAMT } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '8');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='LOWAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
									-->
								</td>
								<!-- 링크 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<a href='${list.PRODUCTLINK }' target="_blank">
										<span id='PRODUCTLINKSPAN${list.IDX}'>링크</span>
									</a>
								</td>
								<!-- memo -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span id='MEMOSPAN${list.IDX}'>${list.MEMO }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '11');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='MEMOIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='MEMO${list.IDX}' value='${list.MEMO } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '11');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='MEMOIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
									<!-- 
									<span id='PRODUCTLINKSPAN${list.IDX}'>${list.PRODUCTLINK }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '9');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='PRODUCTLINKIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='PRODUCTLINK${list.IDX}' value='${list.PRODUCTLINK } '/>
									<a href="javascript:modifyProductDone(${list.IDX}, '9');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='PRODUCTLINKIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
									 -->
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
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<!-- 
				<div class="modal-header">상품 상세 리스트</div>
				<div class="modal-body">
				    <div class="col-lg">
				      <button type="button" class="btn btn-secondary" id='createProductDtlButton' onclick="createProductDtlButton_onclick()" style="font-size: 20px">추가</button>
				    </div>
				</div>
				 -->
				<div class="modal-body" id="listModalBody" style="max-width: 100%; width: auto !important; display: inline-block; ">
					<iframe id='adminPageListSubIframe'
							name='adminPageListSubIframe'
							title='상품상세관리 페이지'
							width = '100%' 
							height = '1000px'
							style='border:none'
					src="">
					    <p>현재 사용 중인 브라우저는 iframe 요소를 지원하지 않습니다!</p>
					</iframe>
				</div>
					<!-- 
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
				 -->
			</div>
		</div>
	</div>
	
	<!-- excel down table -->
	<!-- Excel Export 용 테이블 hide -->
	
				<table id="excelTable" hidden>
					<thead>
						<tr>
							<th>순서</th>
							<th>상품명 </th>
							<th>url </th>
							<th>lead price </th>
							<th>memo </th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<!-- 
							<th>상세순서 </th>
							<th>쇼핑몰순서 </th>
							<th>쇼핑몰명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료</th>
							<th>정산가</th>
							<th>구매가</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							 -->
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

	<!-- excel Modal -->
	<div class="modal fade" id="excelModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">엑셀 업로드</div>
				<div class="modal-body" id="modalBody" style="max-width: 100%; width: auto !important; display: inline-block;">
					<form id="excelForm" name="excelForm" method="post" enctype="multipart/form-data" action="/excelUploadMain">
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
	
	<!-- progressModal -->
	<div class="modal fade" id="progressModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<center>
					<img src='/resources/img/progress-icon-gif-1.gif' width = '300px' height = '300px'>
				</center>
			</div>
		</div>
	</div>
	
	<form id="SearchLst" method="post" action="/admin-page-lst-main">
		<input type='hidden' id="SEARCHPRODUCTNM" name="SEARCHPRODUCTNM" value=''>
		<input type='hidden' id="ORDERNUM" name="ORDERNUM" value='${orderNum}'>
		
	</form>
	
	<form id="ProductDtlLst" method="post" action="/admin-page-lst-sub">
		<input type='hidden' id="PRODUCTIDX" name="PRODUCTIDX" value=''>
	</form>
	
	<form id="ProductDtlLstPop" method="post" action="/admin-page-lst-sub-pop" target='adminPageListSubIframe'>
		<input type='hidden' id="PRODUCTIDX" name="PRODUCTIDX" value=''>
	</form>
	
	<form id="ProductLst" name="ProductLst">
		<input type='hidden' id="IDX" name="IDX" value=''>  
		<input type='hidden' id="IMGURL" name="IMGURL" value=''>  
		<input type='hidden' id="LEADAMT" name="LEADAMT" value=''>  
		<input type='hidden' id="PRODUCTNM" name="PRODUCTNM" value=''>  
		<input type='hidden' id="NOMALAMT" name="NOMALAMT" value=''>  
		<input type='hidden' id="SHIPAMT" name="SHIPAMT" value=''>  
		<input type='hidden' id="COMMITIONAMT" name="COMMITIONAMT" value=''>  
		<input type='hidden' id="CALCAMT" name="CALCAMT" value=''>  
		<input type='hidden' id="PAYAMT" name="PAYAMT" value=''>  
		<input type='hidden' id="INCOMEAMT" name="INCOMEAMT" value=''>  
		<input type='hidden' id="LOWAMT" name="LOWAMT" value=''>  
		<input type='hidden' id="MEMO" name="MEMO" value=''>  
		<input type='hidden' id="PRODUCTLINK" name="PRODUCTLINK" value=''>  
		<input type='hidden' id="GB" name="GB" value=''>  
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
function test(){
	   	// progress modal 활성화
	   	$('#progressModal').modal('show');
}
	// 총 조회 건수
  	let totCnt = 0;
  	totCnt = ${listCnt};
  	
  	// 상품 상세 리스트 조회
  	function searchProductList(idx){
  		debugger;
  		
		var $form = $("#ProductDtlLstPop");
		
		// form 값 초기화
		$('#ProductDtlLstPop [name="PRODUCTIDX"]').val(idx);

		// 조회 호출
		$form.submit()
		
 	   	// modal 활성화
 	   	$('#listModal').modal('show');
  		/*
		// form 변수 초기화
		var $form = $("#ProductDtlLst");
		
		// form 값 초기화
		$('#ProductDtlLst [name="PRODUCTIDX"]').val(idx);

		// 조회 호출
		$form.submit()
*/
		/*
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
							+"		<th>판매가</th>                             "
							+"		<th>배송비 </th>		"
							+"		<th>수수료 </th>                            "
							+"		<th>정산가 </th>                            "
							+"		<th>구입가 </th>                            "
							+"		<th>마진 </th>                            "
							+"		<th>최저가 </th>                            "
							+"		<th>링크 </th>                            "
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
					  		// 쇼핑몰명(구매처)
					  		+ 			"<input type='text' class='price1' id='DTLSHOPIDX"+json[i].idx+"' value='"+json[i].shopidx+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+ 			"<input type='text' class='price1' id='DTLNOMALAMT"+json[i].idx+"' value='"+json[i].dtlnomalamt+" '/>"
					  		+"		</td>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+ 			"<input type='text' class='price1' id='DTLSHIPAMT"+json[i].idx+"' value='"+json[i].dtlshipamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+ 			"<input type='text' class='price1' id='DTLCOMMITIONAMT"+json[i].idx+"' value='"+json[i].dtlcommitionamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+ 			"<input type='text' class='price1' id='DTLCALCAMT"+json[i].idx+"' value='"+json[i].dtlcalcamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 구입가
					  		+ 			"<input type='text' class='price1' id='DTLPAYAMT"+json[i].idx+"' value='"+json[i].dtlpayamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+ 			"<input type='text' class='price1' id='DTLINCOMMAMT"+json[i].idx+"' value='"+json[i].dtlincommamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+ 			"<input type='text' class='price1' id='DTLLOWAMT"+json[i].idx+"' value='"+json[i].dtllowamt+" '/>"
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+ 			"<input type='text' class='longstr' id='DTLPRODUCTLINK"+json[i].idx+"' value='"+json[i].dtlproductlink+" '/>"
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
		*/
  	}

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

  	// 추가 버튼 이벤트
	function createButton_onclick(){
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"	<tr style='font-size: 20px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 리스트 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 등록버튼 -->                                                               "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='createButton' onclick='createProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>"
			+ "		<!-- 이미지 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='IMGURL" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 상품명 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='PRODUCTNM" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- LEADAMT -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='LEADAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 판매가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='NOMALAMT" + totCnt + "' value=''/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 배송비 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='SHIPAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 수수료 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='COMMITIONAMT" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "		<!-- 정산가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='CALCAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 구입가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='PAYAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 마진 -->                                                                 "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='INCOMEAMT" + totCnt + "' value=''/>                          "
			+ "		</td>                                                                       "
			+ "		<!-- 최저가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='LOWAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 링크 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			//+ "			<input id='PRODUCTLINK" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 메모 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='MEMO" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "	</tr>"
	   			;
		$("#itemTable>tbody").prepend(tmpTExt);
	}

  	// 상세 추가 버튼 이벤트
	function createProductDtlButton_onclick(){
		totCnt = totCnt + 1;

		var tmpTExt = 	
			"	<tr style='font-size: 20px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 쇼핑몰명(구매처) -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='SHOPIDX" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- LEADAMT -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='LEADMAT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 배송비 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='IMGURL" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 수수료 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PRODUCTNM" + totCnt + "' value=''/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 정산가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='NOMALAMT" + totCnt + "' value=''/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 구입가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='SHIPAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 마진 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='COMMITIONAMT" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "		<!-- 최저가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='CALCAMT" + totCnt + "' value=''/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 링크 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='PAYAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 수정 -->                                                                 "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input id='INCOMEAMT" + totCnt + "' value=''/>                          "
			+ "		</td>                                                                       "
			+ "		<!-- 등록버튼 -->                                                               "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='createButton' onclick='createDtlProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>"
			+ "	</tr>"
	   			;
		$("#productDtlListTbl>tbody").prepend(tmpTExt);
	}

  	// 입력 호출
	function createProcButton_onclick(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductLst");
		
		// 수정 값체크
		var $IMGURL = $("#IMGURL"+inkeyNum).val();
		var $PRODUCTNM = $("#PRODUCTNM"+inkeyNum).val();
		var $LEADAMT = $("#LEADAMT"+inkeyNum).val();
		var $NOMALAMT = $("#NOMALAMT"+inkeyNum).val();
		var $SHIPAMT = $("#SHIPAMT"+inkeyNum).val();
		var $COMMITIONAMT = $("#COMMITIONAMT"+inkeyNum).val();
		var $CALCAMT = $("#CALCAMT"+inkeyNum).val();
		var $PAYAMT = $("#PAYAMT"+inkeyNum).val();
		var $INCOMEAMT = $("#INCOMEAMT"+inkeyNum).val();
		var $LOWAMT = $("#LOWAMT"+inkeyNum).val();
		var $PRODUCTLINK = $("#PRODUCTLINK"+inkeyNum).val();
		var $MEMO = $("#MEMO"+inkeyNum).val();
		
		// form 값 초기화
		$("#IMGURL").val($IMGURL);
		$("#PRODUCTNM").val($PRODUCTNM);
		$("#LEADAMT").val($LEADAMT);
		$("#NOMALAMT").val($NOMALAMT);
		$("#SHIPAMT").val($SHIPAMT);
		$("#COMMITIONAMT").val($COMMITIONAMT);
		$("#CALCAMT").val($CALCAMT);
		$("#PAYAMT").val($PAYAMT);
		$("#INCOMEAMT").val($INCOMEAMT);
		$("#LOWAMT").val($LOWAMT);
		$("#PRODUCTLINK").val($PRODUCTLINK);
		$("#MEMO").val($MEMO);
		$("#GB").val("I");
		
		// 변경 호출
		procProductList();
	}

  	// 삭제 호출
	function removeButton_onclickData(inkeyNum){
  		debugger;
  	    if (!confirm("삭제 하시겠습니까?\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
   	       return false;
   	    } else {
	  		
			// form 변수 초기화
			var $form = $("#ProductLst");
			
			// 수정 값체크
			var $IDX = inkeyNum;
			var $IMGURL = $("#IMGURL"+inkeyNum).val();
			var $PRODUCTNM = $("#PRODUCTNM"+inkeyNum).val();
			var $LEADAMT = $("#LEADAMT"+inkeyNum).val();
			var $NOMALAMT = $("#NOMALAMT"+inkeyNum).val();
			var $SHIPAMT = $("#SHIPAMT"+inkeyNum).val();
			var $COMMITIONAMT = $("#COMMITIONAMT"+inkeyNum).val();
			var $CALCAMT = $("#CALCAMT"+inkeyNum).val();
			var $PAYAMT = $("#PAYAMT"+inkeyNum).val();
			var $INCOMEAMT = $("#INCOMEAMT"+inkeyNum).val();
			var $LOWAMT = $("#LOWAMT"+inkeyNum).val();
			var $PRODUCTLINK = $("#PRODUCTLINK"+inkeyNum).val();
			var $MEMO = $("#MEMO"+inkeyNum).val();
			
			// form 값 초기화
			$("#IDX").val($IDX);
			$("#IMGURL").val($IMGURL);
			$("#PRODUCTNM").val($PRODUCTNM);
			$("#LEADAMT").val($LEADAMT);
			$("#NOMALAMT").val($NOMALAMT);
			$("#SHIPAMT").val($SHIPAMT);
			$("#COMMITIONAMT").val($COMMITIONAMT);
			$("#CALCAMT").val($CALCAMT);
			$("#PAYAMT").val($PAYAMT);
			$("#INCOMEAMT").val($INCOMEAMT);
			$("#LOWAMT").val($LOWAMT);
			$("#PRODUCTLINK").val($PRODUCTLINK);
			$("#MEMO").val($MEMO);
			$("#GB").val("D");
			
			// 변경 호출
			procProductList();
   	    }
	}

  	// 수정 호출
	function modifyButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductLst");
		
		// 수정 값체크
		var $IDX = inkeyNum;
		var $IMGURL = $("#IMGURL"+inkeyNum).val();
		var $PRODUCTNM = $("#PRODUCTNM"+inkeyNum).val();
		var $LEADAMT = $("#LEADAMT"+inkeyNum).val();
		var $NOMALAMT = $("#NOMALAMT"+inkeyNum).val();
		var $SHIPAMT = $("#SHIPAMT"+inkeyNum).val();
		var $COMMITIONAMT = $("#COMMITIONAMT"+inkeyNum).val();
		var $CALCAMT = $("#CALCAMT"+inkeyNum).val();
		var $PAYAMT = $("#PAYAMT"+inkeyNum).val();
		var $INCOMEAMT = $("#INCOMEAMT"+inkeyNum).val();
		var $LOWAMT = $("#LOWAMT"+inkeyNum).val();
		var $PRODUCTLINK = $("#PRODUCTLINK"+inkeyNum).val();
		var $MEMO = $("#MEMO"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#IMGURL").val($IMGURL);
		$("#PRODUCTNM").val($PRODUCTNM);
		$("#LEADAMT").val($LEADAMT);
		$("#NOMALAMT").val($NOMALAMT);
		$("#SHIPAMT").val($SHIPAMT);
		$("#COMMITIONAMT").val($COMMITIONAMT);
		$("#CALCAMT").val($CALCAMT);
		$("#PAYAMT").val($PAYAMT);
		$("#INCOMEAMT").val($INCOMEAMT);
		$("#LOWAMT").val($LOWAMT);
		$("#PRODUCTLINK").val($PRODUCTLINK);
		$("#MEMO").val($MEMO);
		$("#GB").val("U");
		
		// 변경 호출
		procProductList();
	}
  	
  	// 상품 리스트 처리 호출
  	function procProductList(){
  		debugger;
		//let data = JSON.stringify({"productidx":"1"});
		// form 데이터
		var formSerializeArray = $('#ProductLst').serializeArray();
		var object = {};
		for (var i = 0; i < formSerializeArray.length; i++){
		    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
		}
		 
		let data = JSON.stringify(object);
		
		// 호출  url
		let url = "";
		
		if($("#GB").val() == "I"){
			url = "/create-product-lst";
		}
		if($("#GB").val() == "U"){
			url = "/modify-product-lst";
		}
		if($("#GB").val() == "D"){
			url = "/remove-product-lst";
		}
		
		$.ajax({
			url 		: url,
			method 		: 'POST',
			data 		: data,
			contentType	: 'application/json',
			dataType	: 'json',
			success : function(obj){
				debugger;
				window.location.href="/admin-page-lst-main"
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}
  	
  	// 각 컬럼별 수정 변경
  	function modifyProduct(inkeyNum, gb){
  		debugger;
  		// 이미지 변경
  		if(gb == '0'){
  			$("#IMGURLIMG1"+inkeyNum).hide();
  			//$("#PRODUCTNMIMG1"+inkeyNum).hide();
  			$("#IMGURL"+inkeyNum).attr("type", "text");
  			$("#IMGURLIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품명
  		if(gb == '1'){
  			$("#PRODUCTNMSPAN"+inkeyNum).hide();
  			$("#PRODUCTNMIMG1"+inkeyNum).hide();
  			$("#PRODUCTNM"+inkeyNum).attr("type", "text");
  			$("#PRODUCTNMIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 판매가
  		if(gb == '2'){
  			$("#NOMALAMTSPAN"+inkeyNum).hide();
  			$("#NOMALAMTIMG1"+inkeyNum).hide();
  			$("#NOMALAMT"+inkeyNum).attr("type", "text");
  			$("#NOMALAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 배송비
  		if(gb == '3'){
  			$("#SHIPAMTSPAN"+inkeyNum).hide();
  			$("#SHIPAMTIMG1"+inkeyNum).hide();
  			$("#SHIPAMT"+inkeyNum).attr("type", "text");
  			$("#SHIPAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 수수료
  		if(gb == '4'){
  			$("#COMMITIONAMTSPAN"+inkeyNum).hide();
  			$("#COMMITIONAMTIMG1"+inkeyNum).hide();
  			$("#COMMITIONAMT"+inkeyNum).attr("type", "text");
  			$("#COMMITIONAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 구입가
  		if(gb == '6'){
  			$("#PAYAMTSPAN"+inkeyNum).hide();
  			$("#PAYAMTIMG1"+inkeyNum).hide();
  			$("#PAYAMT"+inkeyNum).attr("type", "text");
  			$("#PAYAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 최저가
  		if(gb == '8'){
  			$("#LOWAMTSPAN"+inkeyNum).hide();
  			$("#LOWAMTIMG1"+inkeyNum).hide();
  			$("#LOWAMT"+inkeyNum).attr("type", "text");
  			$("#LOWAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품링크
  		if(gb == '9'){
  			$("#PRODUCTLINKSPAN"+inkeyNum).hide();
  			$("#PRODUCTLINKIMG1"+inkeyNum).hide();
  			$("#PRODUCTLINK"+inkeyNum).attr("type", "text");
  			$("#PRODUCTLINKIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품링크
  		if(gb == '10'){
  			$("#LEADAMTSPAN"+inkeyNum).hide();
  			$("#LEADAMTIMG1"+inkeyNum).hide();
  			$("#LEADAMT"+inkeyNum).attr("type", "text");
  			$("#LEADAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품링크
  		if(gb == '11'){
  			$("#MEMOSPAN"+inkeyNum).hide();
  			$("#MEMOIMG1"+inkeyNum).hide();
  			$("#MEMO"+inkeyNum).attr("type", "text");
  			$("#MEMOIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  	}
  	
	// 수정버튼 클릭
  	function modifyProductDone(inkeyNum, gb){
  		debugger;
  		modifyButton_onclickData(inkeyNum);
  	}

	// excel 다운로드 호출
  	function excelDown(){
  		debugger;
  		alert("엑셀다운로드를 진행 합니다.");
  		//$("#excelDownload").submit();
  		createExcelData();
  		
  	}

  	function excelUp(){
  		debugger;
  	    if (!confirm("엑셀업로드를 진행 합니다.\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
   	       return false;
   	    } else {
  			$("#excelForm").submit();

	 	   	// excel modal non 활성화
	 	   	$('#excelModal').modal('hide');
	 	   	
	 	   	// progress modal 활성화
	 	   	$('#progressModal').modal('show');
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
  	
  	function inputSizeAuto(){
  		debugger;
  		var get_text_input = $("#itemTable input[type=text]");
  		var get_number_input = $("#itemTable input[type=number]");
  		/*
  		console.log(get_text_input);
  		console.log('이녀석 타입은 뭐야? ' + typeof (get_text_input)); // object
  		console.log('이녀석 Array이니? ' + Array.isArray(get_text_input)); //false
  		console.log(get_number_input);
  		console.log('이녀석 타입은 뭐야? ' + typeof (get_number_input)); // object
  		console.log('이녀석 Array이니? ' + Array.isArray(get_number_input)); //false
  		*/
  		$.each(get_text_input, function (index, value) {
  			/*
  			console.log('인덱스값:' + index);
  			console.log(value);
  			console.log('id =' + $(value).attr("id"));
  			console.log('name =' + $(value).attr("name"));
  			console.log('value =' + $(value).val());
  			*/
  			if(value.value.length > 0){
  				/*
  				//console.log('==============================');
  				let valuetmp = $(value).val();
  				//console.log('valuetmp =' + valuetmp);
  				$("#inputTmp").append('<span id="virtual_dom">' + valuetmp + '</span>');
  				let inputWidth =  $('#virtual_dom').width(); // 글자 하나의 대략적인 크기
  				//console.log('inputWidth =' + inputWidth);
  				$(value).css('width', inputWidth)
  			  	$('#virtual_dom').remove();
  				//console.log('==============================');
  				*/
  				value.style.width = (value.value.length+1) + 'em';
  			} else {
  				value.style.width = 5 + 'em';
  			}
  		});
  		$.each(get_number_input, function (index, value) {
  			/*
  			console.log('인덱스값:' + index);
  			console.log(value);
  			console.log('id =' + $(value).attr("id"));
  			console.log('name =' + $(value).attr("name"));
  			console.log('value =' + $(value).val());
  			*/
  			if(value.value.length > 0){
  				/*
  				//console.log('==============================');
  				let valuetmp = $(value).val();
  				//console.log('valuetmp =' + valuetmp);
  				$("#inputTmp").append('<span id="virtual_dom">' + valuetmp + '</span>');
  				let inputWidth =  $('#virtual_dom').width(); // 글자 하나의 대략적인 크기
  				//console.log('inputWidth =' + inputWidth);
  				$(value).css('width', inputWidth)
  			  	$('#virtual_dom').remove();
  				//console.log('==============================');
  				*/
  				value.style.width = (value.value.length+1) + 'em';
  			} else {
  				value.style.width = 5 + 'em';
  			}
  		});
  	}

  	// 엑셀 내용 추가 이벤트
	function createExcelData(){
		debugger;
		let data =JSON.stringify({"productidx":""});
		$.ajax({
			url 		: '/getlst-excel-lst',
			method 		: 'POST',
			data 		: data,
			contentType	: 'application/json',
			dataType	: 'json',
			success : function(obj){
				var data = JSON.stringify(obj);
				var json = JSON.parse(data);
				debugger;
			  	let htmlTxt = "";

				$("#excelTable>tbody").prepend(htmlTxt);
				
			  	for(let i = 0; i<json.length; i++){
			  		htmlTxt = htmlTxt
					  		+"	<tr>"
					  		+"		<td>"
					  		// 순서
					  		+			json[i].idx
					  		+"		</td>"
					  		+"		<td>"
					  		// 상품명
					  		+			json[i].productnm
					  		+"		</td>"
					  		+"		<td>"
					  		// url
					  		+			json[i].imgurl
					  		+"		</td>"
					  		+"		</td>"
					  		+"		<td>"
					  		// lead price
					  		+			json[i].leadamt
					  		+"		</td>"
					  		+"		<td>"
					  		// memo
					  		+			json[i].memo
					  		+"		</td>"
					  		
					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl1PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl1SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl1SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl1DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl1DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl1DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl1DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl1DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl1DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl1DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl1DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl2PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl2SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl2SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl2DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl2DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl2DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl2DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl2DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl2DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl2DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl2DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl3PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl3SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl3SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl3DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl3DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl3DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl3DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl3DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl3DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl3DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl3DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl4PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl4SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl4SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl4DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl4DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl4DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl4DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl4DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl4DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl4DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl4DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl5PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl5SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl5SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl5DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl5DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl5DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl5DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl5DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl5DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl5DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl5DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl6PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl6SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl6SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl6DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl6DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl6DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl6DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl6DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl6DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl6DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl6DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl7PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl7SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl7SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl7DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl7DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl7DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl7DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl7DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl7DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl7DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl7DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl8PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl8SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl8SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl8DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl8DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl8DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl8DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl8DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl8DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl8DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl8DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl9PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl9SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl9SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl9DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl9DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl9DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl9DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl9DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl9DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl9DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl9DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl10PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl10SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl10SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl10DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl10DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl10DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl10DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl10DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl10DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl10DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl10DTLPRODUCTLINK
					  		+"		</td>"

					  		
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl11PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl11SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl11SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl11DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl11DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl11DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl11DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl11DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl11DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl11DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl11DTLPRODUCTLINK
					  		+"		</td>"
					  		/*
					  		+"		<td>"
					  		// 상세순서
					  		+			json[i].pdl12PDLIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰 순서
					  		+			json[i].pdl12SHOPIDX
					  		+"		</td>"
					  		+"		<td>"
					  		// 쇼핑몰명
					  		+			json[i].pdl12SHOPNM
					  		+"		</td>"
					  		+"		<td>"
					  		// 판매가
					  		+			json[i].pdl12DTLNOMALAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 배송비
					  		+			json[i].pdl12DTLSHIPAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 수수료
					  		+			json[i].pdl12DTLCOMMITIONAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 정산가
					  		+			json[i].pdl12DTLCALCAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 구매가
					  		+			json[i].pdl12DTLPAYAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 마진
					  		+			json[i].pdl12DTLINCOMMAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 최저가
					  		+			json[i].pdl12DTLLOWAMT
					  		+"		</td>"
					  		+"		<td>"
					  		// 링크
					  		+			json[i].pdl12DTLPRODUCTLINK
					  		+"		</td>"
					  		*/
					  		+"	</tr>"
				  		;
			  	}

				$("#excelTable>tbody").prepend(htmlTxt);
				
		  		exportExcel();
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;

	}
  	
  </script>
  
<script src='/resources/js/common.js'></script>
</body>
</html>
