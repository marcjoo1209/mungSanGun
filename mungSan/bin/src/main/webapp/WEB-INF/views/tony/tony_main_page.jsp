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

    <title>토니상회 [ ${gameInfoOutVo.GAMENM} ]</title>

    <!-- Bootstrap core CSS 
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">-->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Bootstrap theme 
    <link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">-->
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
	
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
          <div class="navbar-brand">[ <font color='#FF5733'>${gameInfoOutVo.GAMENM} </font> ] 아이템 구매 안내 사항</div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<!-- 
            <li class="active"><a href="#">Home</a></li>
             -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">
    
      <div class="row">
        <div class="col-sm-auto">
        <h2 style="font-weight:bold">※ 아이템 구매시 유의사항</h2>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-auto">
	      <p>
	      	<span >
	     		<pre>${gameInfoOutVo.ETC1 }</pre>
	      	</span>
	      </p>
      	</div>
      </div>
      
      <div class="row">
        <div class="col-sm-auto">
        <h2 style="font-weight:bold">※ 거래순서</h2>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-auto">
	      <p>
	      	<span >
	     		<pre>${gameInfoOutVo.ETC2 }</pre>
	      	</span>
	      </p>
      	</div>
      </div>
      <div class="row">
        <div class="col-sm-auto">
        <h2 style="font-weight:bold">[ <font color='#FF5733'>${gameInfoOutVo.GAMENM} </font> ] 아이템 목록</h2>
        </div>
      </div>
      <!-- 
      <form class="navbar-form navbar-right">
        <input type="text" class="form-control" placeholder="아이템 이름">
      </form>
       -->
      <div class="row">
        <div class="col-sm-auto">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>아이템명</th>
                <th>단위가격</th>
                <th>거래가능수량</th>
                <th>거래수량</th>
                <th>거래합계</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items ="${list2 }" var ="list2" varStatus="status">
				
              <tr>
                <td>
                	<input type="text" class='diaItemNameKor' id="rowItemName${status.index }" aria-describedby="passwordHelpBlock" value='${list2.ITEMNMK}' readonly>
                	<input type="hidden" id="rowItemChiName${status.index }" value='${list2.ITEMNMC}' />
                </td>
                <td>
                	<input type="text" class='diaItemPriceNone' id="rowPrice${status.index}" aria-describedby="passwordHelpBlock" value='${list2.ITEMPRICEK}' readonly> 원
                </td>
                <td>${list2.ITEMCNT } 개</td>
                <td>
                	<input type="number" id="rowUseCnt${status.index}" aria-describedby="passwordHelpBlock" value='' placeholder="수량을 입력 하세요." onKeyup="pressNumberKey(${status.index}, this.value, ${list2cnt}, ${list2.ITEMCNT })" onchange="pressNumberKey(${status.index}, this.value, ${list2cnt}, ${list2.ITEMCNT })">
                </td>
                <td>
                	<input type="text" class='diaItemPrice' id="rowTotPrice${status.index}" aria-describedby="passwordHelpBlock" value='0' readonly>
                </td>
              </tr>
			</c:forEach>
            </tbody>
          </table>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-auto">
        <h2 style="font-weight:bold">※ 거래 아이템 정보</h2>
        </div>
      </div>
      <div class="jumbotron">
       	<p id="textArea" name='textArea'>
       		거래아이템 			 / 수량 	 / 금액 			 / <font color='red'>총주문금액 : 0 원 </font>
       	</p>
      </div>
      
      <div class="row">
        <div class="col-sm-auto">
        <h2 style="font-weight:bold">※ 아이템 받을 캐릭터 정보 입력</h2>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-auto">
			<form action="javascript:copytextArea(${list2cnt});">
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail4">배틀태그</label>
			      <input type="text" class="form-control" id="battleId" placeholder="배틀태그" value="">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputPassword4">캐릭터명</label>
			      <input type="text" class="form-control" id="userId" placeholder="캐릭터명" value="">
			    </div>
			  </div>
			  <!-- 
			  <button type="submit" class="btn btn-primary">내역서 복사하기--카톡채팅방에 붙여넣기 해주세요.</button>
			   -->
			  <!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="copyText" onClick="javascript:copytextArea(${list2cnt});">
				  주문하기
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        Info Msg
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
			</form>
		</div>
      </div>
    </div> <!-- /container -->
    <input type="hidden" id="bankInfo" value=${gameTeamInfoOutVo.BANKINFO} />
    <input type="hidden" id="bangName" value=${gameTeamInfoOutVo.GAMEBANG} />
    <input type="hidden" id="bangPwd" value=${gameTeamInfoOutVo.GAMEPWD} />
    <input type="hidden" id="admId" value=${gameTeamInfoOutVo.ETC1} />
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
	
	// 폼로드시 cookie 셋팅
  	$(document).ready(function() {
  		//debugger;
  		$("#battleId").val(getCookie("battleId"));
  		$("#userId").val(getCookie("userId"));
  	});
  	// 각 row 별 계산
  	function pressNumberKey(inkeyNum, num, sumCnt, totProduct){
  		// 단위가격 * 거래수량 = 거래합계
  		debugger;
  		// 눌려진 키 코드를 가져온다.    
  		var keyCode = num;
  		var $rowTotPrice = $("#rowTotPrice"+inkeyNum);
  		var $rowItemName = $("#rowItemName"+inkeyNum);
  		var $rowPrice = $("#rowPrice"+inkeyNum);
  		var $rowUseCnt = $("#rowUseCnt"+inkeyNum);
  		var $textArea = $("#textArea");
  		var $totProductCnt = totProduct;
  		
  		// 주문가능 수량이 없을 경우 주문 불가 처리
  		if($totProductCnt <= 0){
  			alert("주문가능 수량이 없습니다.");
  			$rowUseCnt.val("");
  			$rowTotPrice.val(0);
  			return false;
  		}
  		
  		// 주문가능 수량이 넘을 경우 주문 불가 처리
  		if($totProductCnt < $rowUseCnt.val()){
  			alert("주문가능 수량을 초과 합니다.\n주문 수량을 다시 입력하세요.");
  			$rowUseCnt.val("");
  			$rowTotPrice.val(0);
  			return false;
  		}
  		
  		// 0이상의 입력 값만 입력 받는다.
  		if($rowUseCnt.val() <= 0){
  			$rowUseCnt.val("");
  			$rowTotPrice.val(0);
  			return false;
  		}
  		
  		var sumPrice = $rowPrice.val() * keyCode;
  		$rowTotPrice.val(sumPrice);
  		
  		calctextArea(sumCnt);
  	}
  	
 	// 계산 금액 textarea 셋팅
  	function calctextArea(sumCnt){  	
  		//debugger;	
  		var $textArea = $("#textArea");
  		var $tmpText = "";
  		var $textPrice = "";
  		var $sumPrice = 0;
  		
  		for(var i = 0; i<sumCnt; i++){
  	  		var $rowTotPrice = $("#rowTotPrice"+i);
  	  		var $rowItemName = $("#rowItemName"+i);
  	  		var $rowUseCnt = $("#rowUseCnt"+i);
  			
  	  		if($rowUseCnt.val() != null && $rowUseCnt.val() != 0){
  				$tmpText += $rowItemName.val() + " \t\t\t / " + $rowUseCnt.val() + " \t / " + $rowTotPrice.val() + "<br/>";
  				$sumPrice = Number($sumPrice) + Number($rowTotPrice.val());
  	  		}
  		}
  		$textPrice = "거래아이템 \t\t\t / 수량 \t / 금액 \t\t\t <font color=red>총주문금액 : " + $sumPrice + "</font><br/><br/>";
  		$textPrice += $tmpText
  		
  		$textArea.html($textPrice);
  	}
 	

  	// 복사 버튼 클릭 이벤트
  	function copytextArea(sumCnt){
  		// 클립보드에 복사
  		//debugger;
	  	var $battleId 	= $("#battleId");
	  	var $userId 	= $("#userId");
  		var $textArea 	= $("#textArea");
  		var $modalBody  = $("#modalBody");
  		var $tmpText	= $textArea.html();
	  	// 배틀테그 입력 확인
	  	if($battleId.val() == null || $battleId.val() == ""){
	  		alert("배틀테그를 입력 하세요.");
	  		return false;
	  	}
	  	// 캐릭터명 입력 확인
	  	if($userId.val() == null || $userId.val() == ""){
	  		alert("캐릭터명을 입력 하세요.");
	  		return false;
	  	}
	  	// 복사 내용 정리
	  	calctextAreaClipboard(sumCnt);
	  	// 클립보드 복사
	  	copyClipBoard($textArea.html());
	  	// 모달 텍스트 출력
 	   	$modalBody.html($textArea.html());
	  	// 주문 메시지 입력 작업
	  	calcreateOrderItemLst($textArea.html(), $battleId.val(), '${gameInfoOutVo.GAMECODE}');
 		// 텍스트 원복
	  	$textArea.html($tmpText);
 		// 쿠키 저장 호출
 		setCookie("battleId", $battleId.val(), 60);
 		setCookie("userId", $userId.val(), 60);
 		
  	}
  	
  	// 클립 보드 복사 로직
  	function copyClipBoard(text){
	  	debugger;	
	  	// html 형태 문서 복사
	  	let $el = text;
	  	// 정규식으로 태그를 \n 으로 변경
	  	let newText = $el.replace(/<[^>]*>?/g, '\n');
	  	// 신규 textarea 생성
	  	let textAreaTarget = document.createElement('textarea');
	  	// body아래에 textarea 붙여넣기
	  	document.body.appendChild(textAreaTarget);
	  	// 정규식으로 변경 된 텍스트 textarea에 넣기
	  	textAreaTarget.value = newText;
	  	// 전부 선택
	  	textAreaTarget.select();
	  	// 클립 보드에 복사
	  	document.execCommand("copy");
	  	// textarea 삭제
	  	document.body.removeChild(textAreaTarget);
  	}
  	
 	// 계산 금액 복사 텍스트로 셋팅
  	function calctextAreaClipboard(sumCnt){  	
  		//debugger;	
  		var $textArea = $("#textArea");
  		var $tmpText 	= "";
  		var $textPrice 	= "";
  		var $sumPrice 	= 0;
  		var $bankInfo 	= '${gameTeamInfoOutVo.BANKINFO}';
  		var $bangName 	= $("#bangName").val();
  		var $bangPwd 	= '${gameTeamInfoOutVo.GAMEPWD}';
  		var $admId 		= $("#admId").val();
	  	var $admbattleId = '${gameTeamInfoOutVo.ETC1 }';
	  	var $battleId 	= $("#battleId").val();
	  	var $userId 	= $("#userId").val();
  	    
  		for(var i = 0; i<sumCnt; i++){
  	  		var $rowTotPrice 		= $("#rowTotPrice"+i);
  	  		var $rowItemName 		= $("#rowItemName"+i);
  	  		var $rowItemChiName 	= $("#rowItemChiName"+i);
  	  		var $rowUseCnt 			= $("#rowUseCnt"+i);
  			
  	  		if($rowUseCnt.val() != null && $rowUseCnt.val() != 0){
  				$tmpText += "★ "+ $rowItemName.val() + " / " + $rowItemChiName.val() + " / " + $rowUseCnt.val() + "<br/>";
  				$sumPrice = Number($sumPrice) + Number($rowTotPrice.val());
  	  		}
  		}
  		debugger;
  		$textPrice = "<h4>입금계좌 : " + $bankInfo + "<br/>"
  					+ "방 제목 : " + $bangName + "/" + $bangPwd + "<br/>"
  					+ $admbattleId + "(방입장 불가시 친추후 참가)<br/><br/>"
  					+ "배틀테그ID : " + $battleId + "<br/>"
  					+ "캐릭터명 : " + $userId + "<br/>"
  					+ "<br/>"
  					;
  		$textPrice += $tmpText;
  		$textPrice += "<br/><font color='blue'> ♥ PRICE : " + $sumPrice + "</font><br/>";
  		
  		$textArea.html($textPrice);
  	}
 	
 	// 쿠키저장
  	function setCookie(cookie_name, value, days) {
  	  var exdate = new Date();
  	  exdate.setDate(exdate.getDate() + days);
  	  // 설정 일수만큼 현재시간에 만료값으로 지정

  	  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
  	  document.cookie = cookie_name + '=' + cookie_value;
  	}
 	
	// 쿠키 가져오기
  	function getCookie(cookie_name) {
  	  var x, y;
  	  var val = document.cookie.split(';');

  	  for (var i = 0; i < val.length; i++) {
  	    x = val[i].substr(0, val[i].indexOf('='));
  	    y = val[i].substr(val[i].indexOf('=') + 1);
  	    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
  	    if (x == cookie_name) {
  	      return unescape(y); // unescape로 디코딩 후 값 리턴
  	    }
  	  }
  	}
	
	// 주문아이템생성
	function calcreateOrderItemLst(orderText, battleTag, gameCode) {
		debugger;
		let orderTxt = htmlTagReplaceBr(orderText);
		let batTag = battleTag;
		let gamecd = gameCode;
		let data ={ORDCMMANT : orderTxt, BATTLETAG : batTag, GAMECODE : gamecd};
		
		// 텔레그램 알림 호출
		telegramAlam(orderText);
		
		$.ajax({
			type		: 'POST',
			dataType 	: 'json',
			url			: "/createOrderItemLst.do", 
			data 		: data,
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			 beforeSend: function (request){request.setRequestHeader('AJAX', 'true');}, 
			success : function(obj){
				var data = JSON.stringify(obj);
				var json = JSON.parse(data);

			},
			 error:function(request,status,error){				    
				    return;
			}
		}) ;
	}
	
	let arrTelUser = new Array();
	
	<c:forEach items="${list4}" var="item">
		arrTelUser.push({
			token:"${item.TOKEN}"
			, chatId:"${item.CHATID}"
		});
	</c:forEach>
	
	// 텔레그램 알림
	function telegramAlam(msg){
		// 알람 반복수
  		let $list4cnt 	= '${list4cnt}';
  		for(let i = 0; i < $list4cnt; i++){
			let token 	= arrTelUser[i].token;
			let chatId 	= arrTelUser[i].chatId;
			//let sndMsg 	= htmlTagReplaceTab(msg);
			let sndMsg 	= htmlTagReplaceBr(msg);
			let data ={chat_id : chatId, text : sndMsg};
  			$.ajax({
  				type		: 'POST',
  				dataType 	: 'json',
  				url			: "https://api.telegram.org/bot"+token+"/sendMessage", 
  				data 		: data,
  				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
  				 beforeSend: function (request){request.setRequestHeader('AJAX', 'true');}, 
  				success : function(obj){
  					var data = JSON.stringify(obj);
  					var json = JSON.parse(data);

  				},
  				 error:function(request,status,error){				    
  					    return;
  				}
  			}) ;
  		}
	}
	
	// HTML Tag 변경 함수 개행
	function htmlTagReplaceBr(targetTxt){
		debugger;
		if(targetTxt == undefined && targetTxt == null){
			return targetTxt;
		}
		let replaceTxt = "";
		replaceTxt = targetTxt.replace(/<br\s*[\/]?>/gi, '\r\n');
		replaceTxt = replaceTxt.replace(/(<([^>]+)>)/ig,"");
		return replaceTxt;
	}

	// HTML Tag 변경 함수 tab
	function htmlTagReplaceTab(targetTxt){
		debugger;
		if(targetTxt == undefined && targetTxt == null){
			return targetTxt;
		}
		let replaceTxt = "";
		replaceTxt = targetTxt.replace(/<br\s*[\/]?>/gi, '\r\t');
		replaceTxt = replaceTxt.replace(/(<([^>]+)>)/ig,"");
		return replaceTxt;
	}

  </script>
</html>
