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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href='/resources/css/dia_css.css'>

    <title>아이템 관리 페이지</title>

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
          <a class="navbar-brand" href="#">아이템 관리 페이지 </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li ><a href="ModifyItemList.do">아이템 목록</a></li>
            <li class="active"><a href="ModifyTeamInfo.do">팀 목록</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">
      <div class="page-header">
        <h2>팀 목록</h2>
      </div>
      <div class="row">
        <div class="col-md-16">
        	<table class="table">
	            <thead>
	              <tr>
	                <th>
	                	<button type="button" class="btn btn-secondary" onclick="createButton_onclikc()">아이템 신규추가</button>
	                </th>
	                <!-- 
	                <th>
	                	<select class="form-control" id='cateSelect1'>
						  	<option value=''>--- 게임이름선택 ---</option>
            			  	<c:forEach items ="${list }" var ="list" varStatus="status">
						  		<option value='${list.GAMECODE}' <c:if test="${searchVo.GAMECODE eq list.GAMECODE}">selected</c:if>>${list.GAMENM}</option>	
            			  	</c:forEach>
						</select>
	                </th>
	                <th>
	                	<select class="form-control" id='cateSelect2'>
						  <option value=''>--- 아이템구분선택 ---</option>
            			  	<c:forEach items ="${list4 }" var ="list4" varStatus="status">	
						  		<option value='${list4.ITEMGUBUN}' <c:if test="${searchVo.ITEMGUBUN eq list4.ITEMGUBUN}">selected</c:if>>${list4.ITEMGUBUNNAME}</option>	
            			  	</c:forEach>
						</select>
	                </th>
	                <th>
	                	<input class="form-control" type="text" id='searchItemNm' placeholder="아이템명" value='${searchVo.ITEMNM }'>
	                </th>
	                <th>
	                	<button type="button" class="btn btn-secondary" onclick="searchItemList()">조회</button>
	                </th>
	                 -->
	              </tr>
	            </thead>
        	</table>
        </div>
      </div>
      <div class="row">
        <div class="col-md-16">
          <table class="table table-bordered table-responsive-xl" id="itemTable">
            <thead>
              <tr>
                <th>게임이름</th>
                <th>팀코드</th>
                <th>팀구분</th>
                <th>방 이름</th>
                <th>방 비밀번호</th>
                <th>계좌번호</th>
                <th>배틀테그</th>
                <th>수정요청</th>
                <th>삭제요청</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items ="${list3 }" var ="list3" varStatus="status">				
              <tr>
                <td>
                	<input type="text" class='diaItemPriceNoneHead' id="gameNm${status.index}" aria-describedby="passwordHelpBlock" value='${list3.GAMENM}' readonly />
                </td>
                <td>
                	<input type="text" class='diaItemPriceNoneHead70' id="teamCode${status.index}" aria-describedby="passwordHelpBlock" value='${list3.TEAMCODE}' readonly />
                </td>
                <td>
                	<input type="text" class='diaItemPriceNoneHead70' id="itemGubun${status.index}" aria-describedby="passwordHelpBlock" value='${list3.ITEMGUBUN}' readonly />
                </td>
                <td>
                	<input type="text" class='diaItemPriceNmK' id="gameBang${status.index}" aria-describedby="passwordHelpBlock" value='${list3.GAMEBANG}' />
                </td>
                <td>
                	<input type="text" class='diaItemPrice' id="gamePwd${status.index}" aria-describedby="passwordHelpBlock" value='${list3.GAMEPWD}' />
                </td>
                <td>
                	<input type="text" class='diaItemPrice300' id="bankInfo${status.index}" aria-describedby="passwordHelpBlock" value='${list3.BANKINFO}' />
                </td>
                <td>
                	<input type="text" class='diaItemPrice150' id="etc1${status.index}" aria-describedby="passwordHelpBlock" value='${list3.ETC1}' />
                </td>
                <td>
                	<button type="button" class="btn btn-primary" id="modifyButton${status.index}" onclick="modifyButton_onclikc(${status.index}, 'U')">수정</button>
                </td>
                <td>
                	<button type="button" class="btn btn-primary" id="deleteButton${status.index}" onclick="deleteButton_onclikc(${status.index})">삭제</button>
                </td>
              </tr>
              		<input type="hidden" id="gameCode${status.index}" value='${list3.GAMECODE}' />
              		<input type="hidden" id="etc2${status.index}" value='${list3.ETC2}' />
                	<input type="hidden" id="etc3${status.index}" value='${list3.ETC3}' />
                	<input type="hidden" id="etc4${status.index}" value='${list3.ETC4}' />
                	<input type="hidden" id="etc5${status.index}" value='${list3.ETC5}' />
			</c:forEach>
            </tbody>
          </table>
        </div>
      </div>
       <form id="postModifyTeam" method="post" action="postModifyTeam.do">
       	<input type='hidden' id="gameCode" name="gameCode" value=''>
       	<input type='hidden' id="gameNm" name="gameNm" value=''>
       	<input type='hidden' id="teamCode" name="teamCode" value=''>
       	<input type='hidden' id="itemGubun" name="itemGubun" value=''>
       	<input type='hidden' id="gameBang" name="gameBang" value=''>
       	<input type='hidden' id="gamePwd" name="gamePwd" value=''>
       	<input type='hidden' id="bankInfo" name="bankInfo" value=''>
       	<input type='hidden' id="etc1" name="etc1" value=''>
       	<input type='hidden' id="etc2" name="etc2" value=''>
       	<input type='hidden' id="etc3" name="etc3" value=''>
       	<input type='hidden' id="etc4" name="etc4" value=''>
       	<input type='hidden' id="etc5" name="etc5" value=''>
       	<input type='hidden' id="gbNum" name="gbNum" value=''>
       </form>
       <form id="searchModifyItemList" method="post" action="/ModifyItemList.do">
       	<input type='hidden' id="searchGameCode" name="searchGameCode" value='${searchVo.GAMECODE}'>
       	<input type='hidden' id="searchItemGubun" name="searchItemGubun" value='${searchVo.ITEMGUBUN}'>
       	<input type='hidden' id="searchItemCode" name="searchItemCode" value='${searchVo.ITEMCODE}'>
       	<input type='hidden' id="searchItemName" name="searchItemName" value='${searchVo.ITEMNM}'>
       </form> 
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
  <script>
	$('#cateSelect1').on('change', function(){
		debugger;
		var $form = $("#searchModifyItemList");
		
		$('#searchGameCode').val(this.value);
		$('#searchItemGubun').val($('#cateSelect2').val());
		$('#searchItemName').val($('#searchItemNm').val());

		$form.submit()
	});
	$('#cateSelect2').on('change', function(){
		debugger;
		var $form = $("#searchModifyItemList");

		$('#searchGameCode').val($('#cateSelect1').val());
		$('#searchItemGubun').val(this.value);
		$('#searchItemName').val($('#searchItemNm').val());

		$form.submit()
	});
	function searchItemList(){
		var $form = $("#searchModifyItemList");
		$('#searchGameCode').val($('#cateSelect1').val());
		$('#searchItemGubun').val($('#cateSelect2').val());
		$('#searchItemName').val($('#searchItemNm').val());
		$form.submit()
	}
  
  	var totCnt = 0;
  	totCnt = ${list3cnt};
  	// 수정 입력 호출
	function modifyButton_onclikc(inkeyNum, gubunCode){
  		debugger;
		// form 변수 초기화
		var $form = $("#postModifyTeam");
		// 변수 초기화
		var $gameCateSelect = $("#gameCateSelect"+inkeyNum).val();
		var $itemCateSelect = $("#itemCateSelect"+inkeyNum).val();
		
		var $gameCode = $("#gameCode"+inkeyNum).val();
		var $gameNm = $("#gameNm"+inkeyNum).val();
		var $teamCode = $("#teamCode"+inkeyNum).val();
		var $itemGubun = $("#itemGubun"+inkeyNum).val();
		var $gameBang = $("#gameBang"+inkeyNum).val();
		var $gamePwd = $("#gamePwd"+inkeyNum).val();
		var $bankInfo = $("#bankInfo"+inkeyNum).val();
		var $etc1 = $("#etc1"+inkeyNum).val();
		var $etc2 = $("#etc2"+inkeyNum).val();
		var $etc3 = $("#etc3"+inkeyNum).val();
		var $etc4 = $("#etc4"+inkeyNum).val();
		var $etc5 = $("#etc5"+inkeyNum).val();
       	
		if(gubunCode == "U"){
			$gameCateSelect = $("#gameCode"+inkeyNum).val();
			$itemCateSelect = $("#itemGubun"+inkeyNum).val();
		}
		$("#gameCode").val($gameCateSelect);
		$("#gameNm").val($gameNm);
		$("#teamCode").val($teamCode);
		$("#itemGubun").val($itemGubun);
		$("#gameBang").val($gameBang);
		$("#gamePwd").val($gamePwd);
		$("#bankInfo").val($bankInfo);
		$("#etc1").val($etc1);
		$("#etc2").val($etc2);
		$("#etc3").val($etc3);
		$("#etc4").val($etc4);
		$("#etc5").val($etc5);
		$("#gbNum").val("I");
		
		$form.submit()
	}
	
  	// 삭제 호출
	function deleteButton_onclikc(inkeyNum){
  		debugger;
		// form 변수 초기화
		var $form = $("#postModifyItemList");
		// 변수 초기화
		var $gameCode = $("#gameCode"+inkeyNum).val();
		var $itemGubun = $("#itemGubun"+inkeyNum).val();
		var $itemCode = $("#itemCode"+inkeyNum).val();
		var $itemNmKor = $("#itemNmKor"+inkeyNum).val();
		var $itemNmEng = $("#itemNmEng"+inkeyNum).val();
		var $itemNmChi = $("#itemNmChi"+inkeyNum).val();
		var $itemCnt = $("#itemCnt"+inkeyNum).val();
		var $itemPriceC = $("#itemPriceC"+inkeyNum).val();
		var $exgRate = $("#exgRate"+inkeyNum).val();
		var $itemPriceK = $("#itemPriceK"+inkeyNum).val();
		var $useYn = $("#useYn"+inkeyNum).val();
		var $itemNmEng = $("#itemNmEng"+inkeyNum).val();

		$("#gameCode").val($gameCode);
		$("#itemGubun").val($itemGubun);
		$("#itemCode").val($itemCode);
		$("#itemNmKor").val($itemNmKor);
		$("#itemNmEng").val($itemNmEng);
		$("#itemNmChi").val($itemNmChi);
		$("#itemCnt").val($itemCnt);
		$("#itemPriceC").val($itemPriceC);
		$("#exgRate").val($exgRate);
		$("#itemPriceK").val($itemPriceK);
		$("#useYn").val("N");
		$("#itemNmEng").val($itemNmEng);
		$("#gbNum").val("D");

		$form.submit()
	}
  	
	function createButton_onclikc(){
		totCnt = totCnt + 1;
		var tmpTExt = 	
			"	<tr class='table-primary'>								"
			
			+ "   <td>																																								"
        	+ "<select class='form-control' id='gameCateSelect"+totCnt+"'>							"
			+ "  	<option value=''>- 선택 -</option>                               "
			+ "  	<c:forEach items ='${list }' var ='list' varStatus='status'>            "
			+ "  		<option value='${list.GAMECODE}' >${list.GAMENM}</option>	        "
			+ "  	</c:forEach>                                                            "
			+ "</select>                                                                    "                 
			+ "   </td>                                                                                                                                                             "
			+ "   <td>                                                                                                                                                              "
        	+ "		<input type='text' class='diaItemPriceNoneHead70' id='teamCode"+totCnt+"' aria-describedby='passwordHelpBlock' value='' />"
			+ "   </td>                                                                                                                                                             "
            + "    <td>                                                                                                                                   "
            + "    	<input type='text' class='diaItemPriceNoneHead70' id='itemGubun"+totCnt+"' aria-describedby='passwordHelpBlock' value='' />                      "
            + "    </td>                                                                                                                                  "
            + "    <td>                                                                                                                                   "
            + "    	<input type='text' class='diaItemPriceNmK' id='gameBang"+totCnt+"' aria-describedby='passwordHelpBlock' value='' />                      "
            + "    </td>                                                                                                                                  "
            + "    <td>                                                                                                                                   "
            + "    	<input type='text' class='diaItemPrice' id='gamePwd"+totCnt+"' aria-describedby='passwordHelpBlock' value='' />                        "
            + "    </td>                                                                                                                                  "
            + "    <td>                                                                                                                                   "
            + "    	<input type='text' class='diaItemPrice300' id='bankInfo"+totCnt+"' aria-describedby='passwordHelpBlock' value='' />                     "
            + "    </td>                                                                                                                                  "
            + "    <td>                                                                                                                                   "
            + "    	<input type='text' class='diaItemPrice150' id='etc1"+totCnt+"' aria-describedby='passwordHelpBlock' value='' />                        "
            + "    </td>                                                                                                                                  "
            + "    <td>                                                                                                                                   "
            + "    	<button type='button' class='btn btn-primary' id='modifyButton"+totCnt+"' onclick='modifyButton_onclikc("+totCnt+")'>입력</button>                  "
            + "    </td>                                                                                                                                  "
            + "    <td>                                                                                                                                   "
            + "    	<button type='button' class='btn btn-primary' id='deleteButton"+totCnt+"' onclick='deleteButton_onclikc("+totCnt+")'>-</button>                   "
            + "    </td>                                                                                                                                  "
            + "  </tr>                                                                                                                                    "
            ;
		//$("#itemTable>tbody").prepend("<tr><td>Test Row Append</td></tr>");
		$("#itemTable>tbody").prepend(tmpTExt);
	}
  	
/*
	function getHoList(){
		
		var data ={APT_CD : $('#aptVal').val() , APT_DONG : $("#dongVal").val()};
		$.ajax({
			
			type:'POST',
			dataType : 'json',
			url: "/getHoList", 
			data : data,
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			 beforeSend: function (request){request.setRequestHeader('AJAX', 'true');}, 
			success : function(obj){
				
				
				// 기존 SELECT BOX 값 초기화 
				var hoList= document.getElementById('hoVal');
				for(var i=hoList.length-1; i>0; i--){
					hoList.remove( hoList.options[i].index );
				} 
				
				var hoData = JSON.stringify(obj);
				var hoJson = JSON.parse(hoData);

				for(key in hoJson){
				 $("#hoVal").append("<option value='"+key+"'>"+hoJson[key]+"호</option>");
				}
				$("#hoVal").val('${searchVO.APTHO}');
			},
			 error:function(request,status,error){				    
				 alert(error);
				    return;
				   }
		}) ;
	}
	*/

  </script>
</html>
