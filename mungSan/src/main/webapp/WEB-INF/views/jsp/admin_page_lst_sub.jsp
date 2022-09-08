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

<title>상품 상세 관리 페이지</title>

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

	<!-- HEAD -->
	<footer class="container">
		<%@ include file="./common/head.jsp"%>
	</footer>
	
		<div class="page-header">
			<h2>상품 상세 관리 페이지</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" id='createButton' onclick="createButton_onclick()" style="font-size: 20px">추가</button>
		      
			 	<!-- 엑셀 다운로드 
				<a href="javascript:excelDown()">
					<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmvsaMXmv3CVtqCY5Mq2eoZpWSH2AQ7TyfQNIGklhRc3qMd05pll0fS7tA5uqeVVgO24&usqp=CAU' width='55px' height='35px' alt='엑셀 다운로드'/>
				</a>
				-->
				<!-- 엑셀 업로드 
				<img src='https://www.nicepng.com/png/detail/208-2087007_excel-icon-png-upload-csv-icon.png' width='50px' height='35px' data-toggle='modal' data-target='#excelModal' alt='엑셀 업로드'/>
 				-->
		    </div>
		    <div class="col-md">
				<select class='form-control' id='selProductIdx' onchange="selectOnchange(this)">
					<option value=''>-- 상품 선택 --</option>	
		        	<c:forEach items ='${productOutDto }' var ='list1' varStatus='status'>
		        		<option value='${list1.IDX}' <c:if test='${list1.IDX eq prmproductidx}'>selected</c:if>>${list1.PRODUCTNM}</option>	
		        	</c:forEach>
		        </select>
		    </div>
		    <!-- 
		    <div class="col-md" align='right'>
			  	<div class="row">
				    <div class="col-lg">
				     <input class="form-control" type="text" id='searchItemNm' placeholder="상품이름" value='${searchTxt }' style="font-size: 20px">
			    	</div>
				    <div class="col-auto">
				      <button type="button" class="btn btn-secondary" onclick="searchItemList()" style="font-size: 20px">검색</button>
			    	</div>
		    	</div>
		    </div>
		     -->
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
					<thead style="" class="thead-light" >
						<tr>
							<th>순서</th>
							<th>처리</th>
							<th>쇼핑몰명(구매처) </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>구입가 </th>
							<th>마진 </th>
							<th>최저가 </th>
							<th>링크 </th>
						</tr>
					</thead>
					<tbody valign='bottom'>
						<c:forEach items='${outDto}' var='list' varStatus='status'>
							<!-- 정산가 : 판매가 * 수수료 + 배송비 *0.967 -->
							<c:set var='totAmt' value='${(list.DTLNOMALAMT * list.DTLCOMMITIONAMT)+(list.DTLSHIPAMT * 0.967)}'/>
							<!-- 마진 : 정산가 - 오픈마켓가격 (구입가)-->
							<c:set var='totAmtP' value='${totAmt-list.DTLPAYAMT}'/>
							
							<tr style='font-size: 20px; text-align:center; vertical-align:middle'>
								<!-- 순서 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									${list.IDX}
								</td>
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<!-- 삭제버튼 -->
									<button type='button' class='btn btn-primary' id='removeButton' onclick='removeButton_onclickData(${list.IDX})' style='font-size: 10px; margin: 1px;'>삭제</button>
								</td>
								<!-- 쇼핑몰명(구매처) -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<!-- span id='SHOPIDXSPAN${list.IDX}'>${list.SHOPIDX }</span -->
									<c:forEach items ='${shopOutDto }' var ='list1' varStatus='status'>
										<c:if test='${list1.IDX eq list.SHOPIDX}'>
											<span id='SHOPIDXSPAN${list.IDX}'>${list1.SHOPNM }</span>
										</c:if>
									</c:forEach>
									<a href="javascript:modifyProduct(${list.IDX}, '0');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='SHOPIDXIMG1${list.IDX}'>
									</a>
									<select class='form-control' id='SHOPIDX${list.IDX}' style='display:none;'>
							        	<c:forEach items ='${shopOutDto }' var ='list1' varStatus='status'>
							        		<option value='${list1.IDX}' <c:if test='${list1.IDX eq list.SHOPIDX}'>selected</c:if>>${list1.SHOPNM}</option>	
							        	</c:forEach>
							        </select>
									<!-- input type='hidden' class='longstr' id='SHOPIDX${list.IDX}' value='${list.SHOPIDX}'/ -->
									<a href="javascript:modifyProductDone(${list.IDX}, '0');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='SHOPIDXIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 판매가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLNOMALAMTSPAN${list.IDX}'>${list.DTLNOMALAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '1');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='DTLNOMALAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='DTLNOMALAMT${list.IDX}' value='${list.DTLNOMALAMT}' onkeyup='calcAmt(${list.IDX})'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '1');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='DTLNOMALAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 배송비 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLSHIPAMTSPAN${list.IDX}'>${list.DTLSHIPAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '2');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='DTLSHIPAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='DTLSHIPAMT${list.IDX}' value='${list.DTLSHIPAMT}' onkeyup='calcAmt(${list.IDX})'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '2');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='DTLSHIPAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 수수료 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLCOMMITIONAMTSPAN${list.IDX}'>${list.DTLCOMMITIONAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '3');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='DTLCOMMITIONAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='DTLCOMMITIONAMT${list.IDX}' value='${list.DTLCOMMITIONAMT}' onkeyup='calcAmt(${list.IDX})'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '3');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='DTLCOMMITIONAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 정산가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLCALCAMTSPAN${list.IDX}'><fmt:formatNumber type='number' pattern='##################' value='${totAmt}' /></span>
									<input type='hidden' class='price1' id='DTLCALCAMT${list.IDX}' value='<fmt:formatNumber type='number' pattern='##################' value='${totAmt}' /> '/>
								</td>
								<!-- 구입가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLPAYAMTSPAN${list.IDX}'>${list.DTLPAYAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '4');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='DTLPAYAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='DTLPAYAMT${list.IDX}' value='${list.DTLPAYAMT}' onkeyup='calcAmt(${list.IDX})'/>
									<a href="javascript:modifyProductDone(${list.IDX}, '4');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='DTLPAYAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 마진 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLINCOMMAMTSPAN${list.IDX}'><fmt:formatNumber type='number' pattern='##################' value='${totAmtP}' /></span>
									<input type='hidden' class='price1' id='DTLINCOMMAMT${list.IDX}' value='<fmt:formatNumber type='number' pattern='##################' value='${totAmtP}' /> '/>
								</td>
								<!-- 최저가 -->
								<td style='font-size: 20px; text-align:center; vertical-align:middle'>
									<span class='comma' id='DTLLOWAMTSPAN${list.IDX}'>${list.DTLLOWAMT }</span>
									<a href="javascript:modifyProduct(${list.IDX}, '5');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='DTLLOWAMTIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='price1' id='DTLLOWAMT${list.IDX}' value='${list.DTLLOWAMT}' onkeyup="modifyProductDoneEnter(${list.IDX}, '5')"/>
									<a href="javascript:modifyProductDone(${list.IDX}, '5');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='DTLLOWAMTIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
								<!-- 링크 -->
								<td style='font-size: 20px; text-align:left; vertical-align:middle; width:200px;'>
									<span id='DTLPRODUCTLINKSPAN${list.IDX}'>${fn:substring(list.DTLPRODUCTLINK, 0, 100) } ... </span>
									<a href="javascript:modifyProduct(${list.IDX}, '6');" >
										<img src='https://en.pimg.jp/053/138/158/1/53138158.jpg' width = '15px' height = '15px' id='DTLPRODUCTLINKIMG1${list.IDX}'>
									</a>
									<input type='hidden' class='longstr' id='DTLPRODUCTLINK${list.IDX}' value='${list.DTLPRODUCTLINK}' onkeyup="modifyProductDoneEnter(${list.IDX}, '6')"/>
									<a href="javascript:modifyProductDone(${list.IDX}, '6');" >
										<img src='https://cdn.pixabay.com/photo/2016/03/31/19/14/check-box-1294836_960_720.png' width = '15px' height = '15px' id='DTLPRODUCTLINKIMG2${list.IDX}' style='visibility:hidden;'>
									</a>
								</td>
							</tr>
									<input type='hidden' id='PRODUCTIDX${list.IDX}' value='${list.PRODUCTIDX}'/>
									<input type='hidden' id='OLDSHOPIDX${list.IDX}' value='${list.SHOPIDX}'/>
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
				<div class="modal-body" id="listModalBody"
					style="max-width: 100%; width: auto !important; display: inline-block;">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<form id="SearchLst" method="post" action="/admin-page-lst-sub">
		<input type='hidden' id="PRODUCTIDX" name="PRODUCTIDX" value=''>
	</form>
	
	<form id="ProductDtlLst" name="ProductDtlLst">
		<input type='hidden' id="IDX" name="IDX" value=''>  
		<input type='hidden' id="SHOPIDX" name="SHOPIDX" value=''>  
		<input type='hidden' id="OLDSHOPIDX" name="OLDSHOPIDX" value=''>  
		<input type='hidden' id="PRODUCTIDX" name="PRODUCTIDX" value=''>  
		<input type='hidden' id="DTLNOMALAMT" name="DTLNOMALAMT" value=''>  
		<input type='hidden' id="DTLSHIPAMT" name="DTLSHIPAMT" value=''>  
		<input type='hidden' id="DTLCOMMITIONAMT" name="DTLCOMMITIONAMT" value=''>  
		<input type='hidden' id="DTLCALCAMT" name="DTLCALCAMT" value=''>  
		<input type='hidden' id="DTLPAYAMT" name="DTLPAYAMT" value=''>  
		<input type='hidden' id="DTLINCOMMAMT" name="DTLINCOMMAMT" value=''>  
		<input type='hidden' id="DTLLOWAMT" name="DTLLOWAMT" value=''>  
		<input type='hidden' id="DTLPRODUCTLINK" name="DTLPRODUCTLINK" value=''>  
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

	// 총 조회 건수
  	let totCnt = 0;
  	totCnt = ${listCnt};
  	shopCnt = ${shopCnt};
  	let prmproductidx = ${prmproductidx};
  	let prmshoidx = [];
  	let prmshonm = [];

    <c:forEach items ='${shopOutDto}' var ='list1' varStatus='status'>
    	prmshoidx.push("${list1.IDX}");
    	prmshonm.push("${list1.SHOPNM}");
    </c:forEach>
    
  	// 상품 select box 선택 이벤트
  	function selectOnchange(selectOS){
  		//console.log(selectOS.value)
  		searchItemList(selectOS.value);
  	}
  	
  	//  상품명 조회 호출
  	function searchItemList(productidxtmp){
  		debugger;
		// form 변수 초기화
		var $form = $("#SearchLst");
		
		// form 값 초기화
		$('#SearchLst [name="PRODUCTIDX"]').val(productidxtmp);

		// 조회 호출
		$form.submit()
  	}

  	// 추가 버튼 이벤트
	function createButton_onclick(){
  		debugger;
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"	<tr style='font-size: 20px; text-align:center; vertical-align:middle'>			"
			+ "		<!-- 순서 -->                                                                 "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "		</td>                                                                       "
			+ "		<!-- 처리 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<button type='button' class='btn btn-primary' id='createButton' onclick='createProcButton_onclick(" + totCnt + ")' style='font-size: 10px'>등록</button> "
			+ "		</td>                                                                       "
			+ "		<!-- 쇼핑몰(구매처) -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "

			+ "		<select class='form-control' id='SHOPIDX" + totCnt + "'>"
			+ "				<option value='-' selected>----선택하세요.-----</option>"
			;
			
			for(let i = 0;i<shopCnt;i++){
				tmpTExt = tmpTExt
				+ "				<option value='"+prmshoidx[i]+"'>"+prmshonm[i]+"</option>";
			}
			
			tmpTExt = tmpTExt
	        + "		</select>"
	        
			//+ "			<input id='SHOPIDX" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 판매가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLNOMALAMT" + totCnt + "' value='' onkeyup='calcAmt(" + totCnt + ")'/>                         "
			+ "		</td>                                                                       "
			+ "		<!-- 배송비 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLSHIPAMT" + totCnt + "' value='' onkeyup='calcAmt(" + totCnt + ")'/>                           "
			+ "		</td>                                                                       "
			+ "		<!-- 수수료 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLCOMMITIONAMT" + totCnt + "' value='0.8' onkeyup='calcAmt(" + totCnt + ")'/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 정산가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<span id='DTLCALCAMTSPAN" + totCnt + "'></span>"		
			+ "			<input type='hidden' class='price1' id='DTLCALCAMT" + totCnt + "' value=''/>                       "
			+ "		</td>                                                                       "
			+ "		<!-- 구입가 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLPAYAMT" + totCnt + "' value='' onkeyup='calcAmt(" + totCnt + ")'/>                            "
			+ "		</td>                                                                       "
			+ "		<!-- 마진 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<span id='DTLINCOMMAMTSPAN" + totCnt + "'></span>"		
			+ "			<input type='hidden' class='price1' id='DTLINCOMMAMT" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<!-- 최저가 -->                                                                 "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='price1' id='DTLLOWAMT" + totCnt + "' value=''/>                          "
			+ "		</td>                                                                       "
			+ "		<!-- 링크 -->                                                                "
			+ "		<td style='font-size: 20px; text-align:center; vertical-align:middle'>      "
			+ "			<input class='longstr' id='DTLPRODUCTLINK" + totCnt + "' value=''/>                             "
			+ "		</td>                                                                       "
			+ "		<input type='hidden' id='PRODUCTIDX" + totCnt + "' value='" + prmproductidx + "'/>"
			+ "	</tr>"
	   			;
		$("#itemTable>tbody").prepend(tmpTExt);
	}

  	// 입력 호출
	function createProcButton_onclick(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductDtlLst");
		
		// 수정 값체크
		var $SHOPIDX 			= $("#SHOPIDX"+inkeyNum).val();
		var $PRODUCTIDX 		= $("#PRODUCTIDX"+inkeyNum).val();
		var $DTLNOMALAMT 		= checkNumber($("#DTLNOMALAMT"+inkeyNum).val());
		var $DTLSHIPAMT 		= checkNumber($("#DTLSHIPAMT"+inkeyNum).val());
		var $DTLCOMMITIONAMT 	= $("#DTLCOMMITIONAMT"+inkeyNum).val();
		var $DTLCALCAMT 		= checkNumber($("#DTLCALCAMT"+inkeyNum).val());
		var $DTLPAYAMT 			= checkNumber($("#DTLPAYAMT"+inkeyNum).val());
		var $DTLINCOMMAMT 		= checkNumber($("#DTLINCOMMAMT"+inkeyNum).val());
		var $DTLLOWAMT 			= checkNumber($("#DTLLOWAMT"+inkeyNum).val());
		var $DTLPRODUCTLINK 	= $("#DTLPRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#SHOPIDX").val($SHOPIDX);
		$('#ProductDtlLst [name="PRODUCTIDX"]').val($PRODUCTIDX);
		$("#DTLNOMALAMT").val($DTLNOMALAMT);
		$("#DTLSHIPAMT").val($DTLSHIPAMT);
		$("#DTLCOMMITIONAMT").val($DTLCOMMITIONAMT);
		$("#DTLCALCAMT").val($DTLCALCAMT);
		$("#DTLPAYAMT").val($DTLPAYAMT);
		$("#DTLINCOMMAMT").val($DTLINCOMMAMT);
		$("#DTLLOWAMT").val($DTLLOWAMT);
		$("#DTLPRODUCTLINK").val($DTLPRODUCTLINK);
		$("#GB").val("I");
		
		// 변경 호출
		procProductDtlList();
	}

  	// 삭제 호출
	function removeButton_onclickData(inkeyNum){
  		debugger;

  	    if (!confirm("삭제 하시겠습니까?\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
   	       return false;
   	    } else {
			// form 변수 초기화
			var $form = $("#ProductDtlLst");
			
			// 수정 값체크
			var $IDX 				= inkeyNum;
			var $SHOPIDX 			= $("#SHOPIDX"+inkeyNum).val();
			var $OLDSHOPIDX 		= $("#OLDSHOPIDX"+inkeyNum).val();
			var $PRODUCTIDX 		= $("#PRODUCTIDX"+inkeyNum).val();
			var $DTLNOMALAMT 		= checkNumber($("#DTLNOMALAMT"+inkeyNum).val());
			var $DTLSHIPAMT 		= checkNumber($("#DTLSHIPAMT"+inkeyNum).val());
			var $DTLCOMMITIONAMT 	= $("#DTLCOMMITIONAMT"+inkeyNum).val();
			var $DTLCALCAMT 		= checkNumber($("#DTLCALCAMT"+inkeyNum).val());
			var $DTLPAYAMT 			= checkNumber($("#DTLPAYAMT"+inkeyNum).val());
			var $DTLINCOMMAMT 		= checkNumber($("#DTLINCOMMAMT"+inkeyNum).val());
			var $DTLLOWAMT 			= checkNumber($("#DTLLOWAMT"+inkeyNum).val());
			var $DTLPRODUCTLINK 	= $("#DTLPRODUCTLINK"+inkeyNum).val();
			
			// form 값 초기화
			$("#IDX").val($IDX);
			$("#SHOPIDX").val($SHOPIDX);
			$("#OLDSHOPIDX").val($OLDSHOPIDX);
			$('#ProductDtlLst [name="PRODUCTIDX"]').val($PRODUCTIDX);
			$("#DTLNOMALAMT").val($DTLNOMALAMT);
			$("#DTLSHIPAMT").val($DTLSHIPAMT);
			$("#DTLCOMMITIONAMT").val($DTLCOMMITIONAMT);
			$("#DTLCALCAMT").val($DTLCALCAMT);
			$("#DTLPAYAMT").val($DTLPAYAMT);
			$("#DTLINCOMMAMT").val($DTLINCOMMAMT);
			$("#DTLLOWAMT").val($DTLLOWAMT);
			$("#DTLPRODUCTLINK").val($DTLPRODUCTLINK);
			$("#GB").val("D");
			
			// 변경 호출
			procProductDtlList();
   	    }
	}

  	// 수정 호출
	function modifyButton_onclickData(inkeyNum){
  		debugger;
  		
		// form 변수 초기화
		var $form = $("#ProductDtlLst");
		
		// 수정 값체크
		var $IDX 				= inkeyNum;
		var $SHOPIDX 			= $("#SHOPIDX"+inkeyNum).val();
		var $OLDSHOPIDX 		= $("#OLDSHOPIDX"+inkeyNum).val();
		var $PRODUCTIDX 		= $("#PRODUCTIDX"+inkeyNum).val();
		var $DTLNOMALAMT 		= checkNumber($("#DTLNOMALAMT"+inkeyNum).val());
		var $DTLSHIPAMT 		= checkNumber($("#DTLSHIPAMT"+inkeyNum).val());
		var $DTLCOMMITIONAMT 	= $("#DTLCOMMITIONAMT"+inkeyNum).val();
		var $DTLCALCAMT 		= checkNumber($("#DTLCALCAMT"+inkeyNum).val());
		var $DTLPAYAMT 			= checkNumber($("#DTLPAYAMT"+inkeyNum).val());
		var $DTLINCOMMAMT 		= checkNumber($("#DTLINCOMMAMT"+inkeyNum).val());
		var $DTLLOWAMT 			= checkNumber($("#DTLLOWAMT"+inkeyNum).val());
		var $DTLPRODUCTLINK 	= $("#DTLPRODUCTLINK"+inkeyNum).val();
		
		// form 값 초기화
		$("#IDX").val($IDX);
		$("#SHOPIDX").val($SHOPIDX);
		$("#OLDSHOPIDX").val($OLDSHOPIDX);
		$('#ProductDtlLst [name="PRODUCTIDX"]').val($PRODUCTIDX);
		$("#DTLNOMALAMT").val($DTLNOMALAMT);
		$("#DTLSHIPAMT").val($DTLSHIPAMT);
		$("#DTLCOMMITIONAMT").val($DTLCOMMITIONAMT);
		$("#DTLCALCAMT").val($DTLCALCAMT);
		$("#DTLPAYAMT").val($DTLPAYAMT);
		$("#DTLINCOMMAMT").val($DTLINCOMMAMT);
		$("#DTLLOWAMT").val($DTLLOWAMT);
		$("#DTLPRODUCTLINK").val($DTLPRODUCTLINK);
		$("#GB").val("U");
		
		// 변경 호출
		procProductDtlList();
	}
  	
  	// 상품 리스트 처리 호출
  	function procProductDtlList(){
  		debugger;
		//let data = JSON.stringify({"productidx":"1"});
		// form 데이터
		var formSerializeArray = $('#ProductDtlLst').serializeArray();
		var object = {};
		for (var i = 0; i < formSerializeArray.length; i++){
		    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
		}
		 
		let data = JSON.stringify(object);
		
		// 호출  url
		let url = "";
		
		if($("#GB").val() == "I"){
			url = "/create-product-dtl-lst";
		}
		if($("#GB").val() == "U"){
			url = "/modify-product-dtl-lst";
		}
		if($("#GB").val() == "D"){
			url = "/remove-product-dtl-lst";
		}
		
		$.ajax({
			url 		: url,
			method 		: 'POST',
			data 		: data,
			contentType	: 'application/json',
			dataType	: 'json',
			success : function(obj){
				debugger;
				// form 변수 초기화
				var $form = $("#SearchLst");
				
				// form 값 초기화
				$('#SearchLst [name="PRODUCTIDX"]').val(prmproductidx);

				// 조회 호출
				$form.submit()
				
				//window.location.href="/admin-page-lst-sub"
			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
  	}
  	
  	// 각 컬럼별 수정 변경
  	function modifyProduct(inkeyNum, gb){
  		debugger;
  		// 쇼핑몰명
  		if(gb == '0'){
  			$("#SHOPIDXSPAN"+inkeyNum).hide();
  			$("#SHOPIDXIMG1"+inkeyNum).hide();
  			//$("#SHOPIDX"+inkeyNum).attr("type", "text");
  			$("#SHOPIDX"+inkeyNum).css('display', ''); 
  			$("#SHOPIDXIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 판매가
  		if(gb == '1'){
  			$("#DTLNOMALAMTSPAN"+inkeyNum).hide();
  			$("#DTLNOMALAMTIMG1"+inkeyNum).hide();
  			$("#DTLNOMALAMT"+inkeyNum).attr("type", "text");
  			$("#DTLNOMALAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 배송비
  		if(gb == '2'){
  			$("#DTLSHIPAMTSPAN"+inkeyNum).hide();
  			$("#DTLSHIPAMTIMG1"+inkeyNum).hide();
  			$("#DTLSHIPAMT"+inkeyNum).attr("type", "text");
  			$("#DTLSHIPAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 수수료
  		if(gb == '3'){
  			$("#DTLCOMMITIONAMTSPAN"+inkeyNum).hide();
  			$("#DTLCOMMITIONAMTIMG1"+inkeyNum).hide();
  			$("#DTLCOMMITIONAMT"+inkeyNum).attr("type", "text");
  			$("#DTLCOMMITIONAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 구입가
  		if(gb == '4'){
  			$("#DTLPAYAMTSPAN"+inkeyNum).hide();
  			$("#DTLPAYAMTIMG1"+inkeyNum).hide();
  			$("#DTLPAYAMT"+inkeyNum).attr("type", "text");
  			$("#DTLPAYAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 최저가
  		if(gb == '5'){
  			$("#DTLLOWAMTSPAN"+inkeyNum).hide();
  			$("#DTLLOWAMTIMG1"+inkeyNum).hide();
  			$("#DTLLOWAMT"+inkeyNum).attr("type", "text");
  			$("#DTLLOWAMTIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  		// 상품링크
  		if(gb == '6'){
  			$("#DTLPRODUCTLINKSPAN"+inkeyNum).hide();
  			$("#DTLPRODUCTLINKIMG1"+inkeyNum).hide();
  			$("#DTLPRODUCTLINK"+inkeyNum).attr("type", "text");
  			$("#DTLPRODUCTLINKIMG2"+inkeyNum).css('visibility', 'visible'); 
  		}
  	}

	// 수정 엔터 이벤트
  	function modifyProductDoneEnter(inkeyNum, gb){
  		debugger;
  		if (window.event.keyCode == 13) {
  			modifyButton_onclickData(inkeyNum);
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
  		exportExcel();
  		
  	}

	// excel 업로드 호출
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
	//숫자 처리
	function checkNumber(strToInteger){
		return strToInteger.replace(/[^0-9]/g,"");	

    }
	// 금액 계산
	function calcAmt(inkeyNum){
		debugger;

  		if (window.event.keyCode == 13) {
  			modifyButton_onclickData(inkeyNum);
  		}
  		else
  		{
			// 판매가
			let nomalamt = $("#DTLNOMALAMT"+inkeyNum).val();
			// 수수료
			let commamt = $("#DTLCOMMITIONAMT"+inkeyNum).val();
			// 배송비
			let shipamt = $("#DTLSHIPAMT"+inkeyNum).val();
			// 구입가
			let payamt = $("#DTLPAYAMT"+inkeyNum).val();
			// 정산가 계산 (판매가 * 수수료 + 배송비 *0.967)
			let totAmt = Math.floor((nomalamt*commamt)+(shipamt*0.967));
			// 마진 계산 (정산가 - 오픈마켓가격)
			let totAmtP = Math.floor(totAmt-payamt);
			
			$("#DTLCALCAMT"+inkeyNum).val(totAmt);
			$("#DTLCALCAMTSPAN"+inkeyNum).text(totAmt);
			$("#DTLINCOMMAMT"+inkeyNum).val(totAmtP);
			$("#DTLINCOMMAMTSPAN"+inkeyNum).text(totAmtP);
  		}
	}
  </script>
  
<script src='/resources/js/common.js'></script>
</body>
</html>
