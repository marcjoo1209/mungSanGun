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

<title>상품 리스트</title>

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
			<h2>상품 리스트</h2>
		</div>

		<div class="row">
		  
		    <div class="col-lg">
		      <button type="button" class="btn btn-secondary" data-toggle="modal"
							data-target="#createModal" onclick="clickNewView()"
							style="font-size: 11px">추가</button>
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

				<table class="table table-bordered table-responsive-sm"
					id="itemTable" style="font-size: 11px">
					<thead>
						<tr>
							<th>순서</th>
							<th>COL1 </th>
							<th>COL2 </th>
							<th>COL3 </th>
							<th>COL4 </th>
							<th>COL5 </th>
							<th>COL6 </th>
							<th>COL7 </th>
							<th>COL8 </th>
							<th>COL9 </th>
							<th>COL10</th>
							<th>COL11</th>
							<th>COL12</th>
							<th>COL13</th>
							<th>COL14</th>
							<th>COL15</th>
							<th>COL16</th>
							<th>COL17</th>
							<th>COL18</th>
							<th>COL19</th>
							<th>COL20</th>
							<th>COL21</th>
							<th>COL22</th>
							<th>COL23</th>
							<th>COL24</th>
							<th>COL25</th>
							<th>COL26</th>
							<th>COL27</th>
							<th>COL28</th>
							<th>COL29</th>
							<th>COL30</th>
							<th>COL31</th>
							<th>COL32</th>
							<th>COL33</th>
							<th>COL34</th>
							<th>COL35</th>
							<th>COL36</th>
							<th>COL37</th>
							<th>COL38</th>
							<th>COL39</th>
							<th>COL40</th>
							<th>COL41</th>
							<th>COL42</th>
							<th>COL43</th>
							<th>COL44</th>
							<th>COL45</th>
							<th>COL46</th>
							<th>COL47</th>
							<th>COL48</th>
							<th>COL49</th>
							<th>COL50</th>
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
								  <td>${list.COLUMNA5}</td>
								  <td>${list.COLUMNA6}</td>
								  <td>${list.COLUMNA7}</td>
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
								  <td>${list.COLUMND7}</td>
								  <td>${list.COLUMND8}</td>
								  <td>${list.COLUMND9}</td>
								  <td>${list.COLUMNE1}</td>
								  <td>${list.COLUMNE2}</td>
								  <td>${list.COLUMNE3}</td>
								  <td>${list.COLUMNE4}</td>
								  <td>${list.COLUMNE5}</td>
								  <td>${list.COLUMNE6}</td>
								  <td>${list.COLUMNE7}</td>
								  <td>${list.COLUMNE8}</td>
								  <td>${list.COLUMNE9}</td>
								  <td>${list.COLUMNF1}</td>
								  <td>${list.COLUMNF2}</td>
								  <td>${list.COLUMNF3}</td>
								  <td>${list.COLUMNF4}</td>
								  <td>${list.COLUMNF5}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

	<form id="SearchLst" method="post"
		action="/">
		<input type='hidden' id="COL1" name="COL1" value=''>
	</form>

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
