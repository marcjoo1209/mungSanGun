var proi = 0;
function move() {
  if (proi == 0) {
	  proi = 1;
    var elem = document.getElementById("myBar");
    var width = 10;
    var id = setInterval(frame, 50);
    function frame() {
      if (width >= 100) {
        clearInterval(id);
        proi = 0;
      } else {
        width++;
        elem.style.width = width + "%";
        elem.innerHTML = width + "%";
      }
    }
  }
}

		// 폼 로드 후 작성 날짜 자동 셋팅
		function loadMyFunction()
		{
			var d = new Date();
			$("#year_1").val(d.getFullYear());
			$("#mon_1").val(d.getMonth()+1);
			$("#day_1").val(d.getDate());
			$("#year_2").val(d.getFullYear());
			$("#mon_2").val(d.getMonth()+1);
			$("#day_2").val(d.getDate());
			$("#year_3").val(d.getFullYear());
			$("#mon_3").val(d.getMonth()+1);
			$("#day_3").val(d.getDate());
			
		}
		
		// 밸류체킹 확인
		function F_change_agree()
		{
			var $dong            = $("#dong");
			var $ho              = $("#ho");
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $nicknm1         = $("#nicknm1");
			var $nicknm2         = $("#nicknm2");
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");
			var $sign_name2      = $("#sign_name2");
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			var $postCode1       = $("#postCode1");
			var $myFile          = $("#myFile");

			if($myFile.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				console.log($myFile.val());
				var reg = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile.val().match(reg)) {
					alert("계약서는 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
		
			if($dong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($ho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("전매 체크를 해야 합니다.");
					return false;
				}
			}
			else if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
		
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree1()
		{
			var $dong            = $("#dong");
			var $ho              = $("#ho");
			var $seldong            = $("#seldong");
			var $selho              = $("#selho");
			var $acc_nm1         = $("#acc_nm1");
			var $acc_nm1_1       = $("#acc_nm1_1");
			var $acc_nm2         = $("#acc_nm2");
			var $acc_nm3         = $("#acc_nm3");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");
			var $sign_name2      = $("#sign_name2");
			var $sign_name3      = $("#sign_name3");
			var $chk_agree2      = $("#chk_agree2");
			var $chk_agree22      = $("#chk_agree22");
			var $chk_agree3      = $("#chk_agree3");
			var $chk_agree33      = $("#chk_agree33");
			var $postCode1       = $("#postCode1");


			if($acc_nm1.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($dong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($ho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("휴대전화를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			else if($acc_nm1_1.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm1_1').focus();
				return false;
			}	
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($chk_agree2.is(":checked") == false || $chk_agree22.is(":checked") == true)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree1').focus();
				return false;
			}
			else if($chk_agree3.is(":checked") == false || $chk_agree33.is(":checked") == true)
			{
				alert("제3자 제공에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			*/
			else if($acc_nm2.val().length == 0 )
			{
				alert("개인정보 수집동의 성명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($sign_name2.val().length == 0)
			{
				alert("개인정보 수집동의 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($acc_nm3.val().length == 0 )
			{
				alert("제3자 제공 성명을 입력 해야 합니다.");
				$('#signBtn3').focus();
				return false;
			}
			else if($sign_name3.val().length == 0)
			{
				alert("제3자 제공 전자서명을 입력 해야 합니다.");
				$('#signBtn3').focus();
				return false;
			}
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree6()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $nicknm1         = $("#nicknm1");
			var $nicknm2         = $("#nicknm2");
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");
			var $sign_name2      = $("#sign_name2");
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			var $postCode1       = $("#postCode1");
			var $myFile          = $("#myFile");

			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
		
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("전매 체크를 해야 합니다.");
					return false;
				}
			}
			else if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
		
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0 || $nicknm2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree7()
		{
			var $acc_nm1         = $("#acc_nm1");
			var $nicknm1         = $("#nicknm1");
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $jun_agree       = $("#jun_agree");
			var $pho_no          = $("#pho_no");
			var $postCode1       = $("#postCode1");
			var $sign_name1      = $("#sign_name1");
			var $chk_agree1      = $("#chk_agree1");
			var $chk_agree11     = $("#chk_agree11");
			var $myFile          = $("#myFile");

			if($myFile.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				console.log($myFile.val());
				var reg = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile.val().match(reg)) {
					alert("계약서는 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			if($acc_nm1.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($nicknm1.val().length == 0)
			{
				alert("카페닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}

			if($seldong.val().length == 0 || $seldong.val() == "0000")
			{
				alert("계약동를 입력 해야 합니다.");
				$('#seldong').focus();
				return false;
			}
			
			if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("계약호를 입력 해야 합니다.");
				$('#selho').focus();
				return false;
			}
			
			if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			
			if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("전매 체크를 해야 합니다.");
					return false;
				}
			}
			
			if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			else if($chk_agree1.is(":checked") == false || $chk_agree11.is(":checked") == true)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree1').focus();
				return false;
			}
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree8()
		{
			var $radio1         = $("#radio1");
			var $radio2         = $("#radio2");
			var $checkbox1      = $("#checkbox1");
			var $checkbox2      = $("#checkbox2");
			
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			
			var $acc_nm1          = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");

			var $pho_no          = $("#pho_no");
			
			var $birth_day1      = $("#birth_day1");


			if($radio1.is(":checked") == false && $radio2.is(":checked") == false)
			{
				alert("아파트 명칭을 선택 해야 합니다.");
				$('#radio1').focus();
				return false;
			}

			if($checkbox1.is(":checked") == false || $checkbox2.is(":checked") == true)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree1').focus();
				return false;
			}

			if($seldong.val().length == 0 || $seldong.val() == "0000")
			{
				alert("계약동를 입력 해야 합니다.");
				$('#seldong').focus();
				return false;
			}else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("계약호를 입력 해야 합니다.");
				$('#selho').focus();
				return false;
			}
			
			if($acc_nm1.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			
			if($birth_day1.val().length == 0)
			{
				alert("생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			
			if($pho_no.val().length == 0)
			{
				alert("전화번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			
			return true;

		}

		// 밸류체킹 확인
		function F_change_agree9()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			//var $nicknm1         = $("#nicknm1");
			//var $nicknm2         = $("#nicknm2");
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");
			var $sign_name2      = $("#sign_name2");
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			//var $postCode1       = $("#postCode1");
			var $myFile1          = $("#myFile1");
			var $myFile2          = $("#myFile2");

			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			else if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree9_2()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			//var $nicknm1         = $("#nicknm1");
			//var $nicknm2         = $("#nicknm2");
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");
			var $sign_name2      = $("#sign_name2");
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			//var $postCode1       = $("#postCode1");
			var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");
			var $etc1          		= $("#etc1");
			//var $etc2          		= $("#etc2");

			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			/*
			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			else if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree9_1() 
		{
			var $acc_nm1         = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $birth_day1      = $("#birth_day1");
			var $pho_no          = $("#pho_no");
			var $birth_day2      = $("#birth_day2");
			var $chk_agree2      = $("#chk_agree2");
			var $acc_nm2         = $("#acc_nm2");
			var $sign_name2      = $("#sign_name2");
			var $postCode1       = $("#postCode1");
			var $cname1       	 = $("#CNAME1");
			var $cname2       	 = $("#CNAME2");
			var cn1				 = $("input[name='CNAME1']").is(':checked');;
			var cn2				 = $("input[name='CNAME2']").is(':checked');;
			//var $nicknm1         = $("#nicknm1");
			//var $nicknm2         = $("#nicknm2");
			//var $jun_agree       = $("#jun_agree");
			
			//var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");

			if($acc_nm1.val().length == 0)
			{
				alert("위임인 계약자 성명을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			

			else if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			
			
			else if($birth_day1.val().length == 0)
			{
				alert("위임인의 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("위임인의 연락처를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}

			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}

			else if(cn1 == false)
			{
				alert("대리 구분을 선택 해야 합니다.");
				$('#CNAME1').focus();
				return false;
			}

			else if(cn2 == false)
			{
				alert("전매 구분을 선택 해야 합니다.");
				$('#CNAME2').focus();
				return false;
			}
			
			else if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			
			else if($acc_nm2.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm2').focus();
				return false;
			}
			else if($sign_name2.val().length == 0)
			{
				alert("서명을 입력 해야 합니다.");
				$('#sign_name2').focus();
				return false;
			}
			
			else
			{
				return true;
			}
			
			
			/*
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			

		}

		// 밸류체킹 확인
		function F_change_agree10()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $acc_nm1          = $("#acc_nm1");
			var $pho_no          = $("#pho_no");
			var $birth_day1      = $("#birth_day1");


			if($seldong.val().length == 0 || $seldong.val() == "0000")
			{
				alert("계약동를 입력 해야 합니다.");
				$('#seldong').focus();
				return false;
			}else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("계약호를 입력 해야 합니다.");
				$('#selho').focus();
				return false;
			}
			
			if($acc_nm1.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			
			if($pho_no.val().length == 0)
			{
				alert("연락처를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			
			return true;

		}

		// 밸류체킹 확인
		function F_change_agree10_1()
		{
			/*
			var $postCode1       = $("#postCode1");
			var $detailAddress1  = $("#detailAddress1");
			*/
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $acc_nm1         = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");
			var $pho_no          = $("#pho_no");
			var $acc_nm2         = $("#acc_nm2");
			var $sign_name2      = $("#sign_name2");
			var $myFile1          = $("#myFile1");
			var $myFile2          = $("#myFile2");
/*
			if($postCode1.val().length == 0 || $postCode1.val() == "")
			{
				alert("주소를 입력 해야 합니다.");
				$('#jusoBtn1').focus();
				return false;
			}

			if($detailAddress1.val().length == 0 || $detailAddress1.val() == "")
			{
				alert("상세주소를 입력 해야 합니다.");
				$('#detailAddress1').focus();
				return false;
			}
			*/
			if($seldong.val().length == 0 || $seldong.val() == "")
			{
				alert("동을 입력 해야 합니다.");
				$('#seldong').focus();
				return false;
			}else if($selho.val().length == 0 || $selho.val() == "")
			{
				alert("호를 입력 해야 합니다.");
				$('#selho').focus();
				return false;
			}
			
			if($acc_nm1.val().length == 0)
			{
				alert("성명을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}

			if($sign_name1.val().length == 0)
			{
				alert("서명을 입력 해야 합니다.");
				$('#sign_name1').focus();
				return false;
			}
			
			if($acc_nm2.val().length != 0)
			{
				if($sign_name2.val().length == 0)
				{
					alert("공동소유자 서명을 입력 해야 합니다.");
					$('#sign_name2').focus();
					return false;
				}
			}	

			if($sign_name2.val().length != 0)
			{
				if($acc_nm2.val().length == 0)
				{
					alert("공동소유자 성명을 입력 해야 합니다.");
					$('#acc_nm2').focus();
					return false;
				}
			}

			if($pho_no.val().length == 0)
			{
				alert("연락처를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}

			if($myFile1.val().length == 0) 
			{	 
				alert("신분증1 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("신분증1 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			// 공동소유자 입력 했을경우 신분증 첨부 안내 alert 정의
			if($sign_name2.val().length != 0 && $acc_nm2.val().length != 0)
			{
				if($myFile2.val().length == 0) 
				{	 
					alert("신분증2 파일 선택 해 주세요.");
					
					return false;
				}
				// 이미지 파일 확인
				else
				{
					//console.log($myFile.val());
					var reg2 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;
	
					if(!$myFile2.val().match(reg2)) {
						alert("신분증2 파일은 이미지 파일만 선택 가능 합니다.");
						return false;
					}
				}
			}

			return true;

		}

		// 밸류체킹 확인
		function F_change_agree12()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			//var $nicknm1         = $("#nicknm1");
			//var $nicknm2         = $("#nicknm2");
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");
			var $sign_name2      = $("#sign_name2");
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			//var $postCode1       = $("#postCode1");
			var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");
			var $etc1          		= $("#etc1");
			//var $etc2          		= $("#etc2");

			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			/*
			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			else if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}
			else if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			else if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			/*
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			*/
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/
			else
			{
				return true;
			}

		}

		// 밸류체킹 확인
		function F_change_agree13()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");
			
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $sign_name2      = $("#sign_name2");
			
			var $pho_no          = $("#pho_no");
			var $em_pho_no       = $("#em_pho_no");
			
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			var $postCode1       = $("#postCode1");
			
			var $radio1			 = $("#radio1");
			var $cname1			 = $("#cname1");
			var $cname2			 = $("#cname2");
			var $cname3			 = $("#cname3");
			var $cname4			 = $("#cname4");
			var $cyear1			 = $("#cyear1");
			var $cyear2			 = $("#cyear2");
			var $cyear3			 = $("#cyear3");
			var $cyear4			 = $("#cyear4");
			//var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");
			//var $etc1          		= $("#etc1");
			//var $etc2          		= $("#etc2");

			/* 개인정보 수집 및 이용에 동의 체크 */
			if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			
			/* 동 호 선택 체크 */
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			
			/* 소유자 정보 체크 */
			if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}

			/* 공동 소유자 정보 체크 */
			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			
			/* 연락처 정보 체크 */
			if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			
			/* 현 주 소 체크*/
			if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}

			/* 미성년 자녀 출생 년도 체크 (자녀 선택시 출생년도 입력 없으면 에러 처리)*/
			if($cname1.is(":checked") == true)
			{
				if($cyear1.val().length == 0)
				{
					alert("미성년 자녀1 출생 년도 입력 해야 합니다.");
					$('#$cyear1').focus();
					return false;
					
				}
			}
			if($cname2.is(":checked") == true)
			{
				if($cyear2.val().length == 0)
				{
					alert("미성년 자녀2 출생 년도 입력 해야 합니다.");
					$('#$cyear2').focus();
					return false;
					
				}
			}
			if($cname3.is(":checked") == true)
			{
				if($cyear3.val().length == 0)
				{
					alert("미성년 자녀3 출생 년도 입력 해야 합니다.");
					$('#$cyear3').focus();
					return false;
					
				}
			}
			if($cname4.is(":checked") == true)
			{
				if($cyear4.val().length == 0)
				{
					alert("미성년 자녀4 출생 년도 입력 해야 합니다.");
					$('#$cyear4').focus();
					return false;
					
				}
			}
			
			if($cyear1.val().length > 0)
			{
				if($cname1.is(":checked") == false)
				{
					alert("미성년 자녀1 체크 해야 합니다.");
					$('#$cname1').focus();
					return false;
					
				}
			}
			if($cyear2.val().length > 0)
			{
				if($cname2.is(":checked") == false)
				{
					alert("미성년 자녀2 체크 해야 합니다.");
					$('#$cname2').focus();
					return false;
					
				}
			}
			if($cyear3.val().length > 0)
			{
				if($cname3.is(":checked") == false)
				{
					alert("미성년 자녀3 체크 해야 합니다.");
					$('#$cname3').focus();
					return false;
					
				}
			}
			if($cyear4.val().length > 0)
			{
				if($cname4.is(":checked") == false)
				{
					alert("미성년 자녀4 체크 해야 합니다.");
					$('#$cname4').focus();
					return false;
					
				}
			}

			/*
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}

			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			/*
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			*/
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/

			return true;

		}

		// 밸류체킹 확인
		function F_change_agree14()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");

			var $acc_nm1         = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");
			var $radio1			 = $("#radio1");
			var $radio2			 = $("#radio2");
			var $radio3			 = $("#radio3");
			var $radio4			 = $("#radio4");
			var $radio5			 = $("#radio5");
			var $radio6			 = $("#radio6");
			/*
			var $birth_day1      = $("#birth_day1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $sign_name2      = $("#sign_name2");
			
			var $pho_no          = $("#pho_no");
			var $em_pho_no       = $("#em_pho_no");
			
			var $chk_agree2      = $("#chk_agree2");
			var $jun_agree       = $("#jun_agree");
			var $postCode1       = $("#postCode1");
			
			var $radio1			 = $("#radio1");
			var $cname1			 = $("#cname1");
			var $cname2			 = $("#cname2");
			var $cname3			 = $("#cname3");
			var $cname4			 = $("#cname4");
			var $cyear1			 = $("#cyear1");
			var $cyear2			 = $("#cyear2");
			var $cyear3			 = $("#cyear3");
			var $cyear4			 = $("#cyear4");
			//var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");
			//var $etc1          		= $("#etc1");
			//var $etc2          		= $("#etc2");
			 */
			/* 개인정보 수집 및 이용에 동의 체크 
			if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}*/
			
			/* 동 호 선택 체크 */
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			
			/* 소유자 정보 체크 
			if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else */if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}

			/* 공동 소유자 정보 체크 
			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}*/
			
			/* 연락처 정보 체크 
			if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			*/
			/* 현 주 소 체크
			if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}*/

			/* 미성년 자녀 출생 년도 체크 (자녀 선택시 출생년도 입력 없으면 에러 처리)
			if($cname1.is(":checked") == true)
			{
				if($cyear1.val().length == 0)
				{
					alert("미성년 자녀1 출생 년도 입력 해야 합니다.");
					$('#$cyear1').focus();
					return false;
					
				}
			}
			if($cname2.is(":checked") == true)
			{
				if($cyear2.val().length == 0)
				{
					alert("미성년 자녀2 출생 년도 입력 해야 합니다.");
					$('#$cyear2').focus();
					return false;
					
				}
			}
			if($cname3.is(":checked") == true)
			{
				if($cyear3.val().length == 0)
				{
					alert("미성년 자녀3 출생 년도 입력 해야 합니다.");
					$('#$cyear3').focus();
					return false;
					
				}
			}
			if($cname4.is(":checked") == true)
			{
				if($cyear4.val().length == 0)
				{
					alert("미성년 자녀4 출생 년도 입력 해야 합니다.");
					$('#$cyear4').focus();
					return false;
					
				}
			}
			
			if($cyear1.val().length > 0)
			{
				if($cname1.is(":checked") == false)
				{
					alert("미성년 자녀1 체크 해야 합니다.");
					$('#$cname1').focus();
					return false;
					
				}
			}
			if($cyear2.val().length > 0)
			{
				if($cname2.is(":checked") == false)
				{
					alert("미성년 자녀2 체크 해야 합니다.");
					$('#$cname2').focus();
					return false;
					
				}
			}
			if($cyear3.val().length > 0)
			{
				if($cname3.is(":checked") == false)
				{
					alert("미성년 자녀3 체크 해야 합니다.");
					$('#$cname3').focus();
					return false;
					
				}
			}
			if($cyear4.val().length > 0)
			{
				if($cname4.is(":checked") == false)
				{
					alert("미성년 자녀4 체크 해야 합니다.");
					$('#$cname4').focus();
					return false;
					
				}
			}*/

			/*
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}

			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			/*
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			*/
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/

			return true;

		}

		// 밸류체킹 확인
		function F_change_agree15()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");

			var $acc_nm1         = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");
			var $radio1			 = $("#radio1");
			var $radio2			 = $("#radio2");
			var $radio3			 = $("#radio3");
			var $radio4			 = $("#radio4");
			var $radio5			 = $("#radio5");
			var $radio6			 = $("#radio6");
			var $chk_agree2      = $("#chk_agree2");
			/*
			var $birth_day1      = $("#birth_day1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $sign_name2      = $("#sign_name2");
			
			var $pho_no          = $("#pho_no");
			var $em_pho_no       = $("#em_pho_no");
			
			var $jun_agree       = $("#jun_agree");
			var $postCode1       = $("#postCode1");
			
			var $radio1			 = $("#radio1");
			var $cname1			 = $("#cname1");
			var $cname2			 = $("#cname2");
			var $cname3			 = $("#cname3");
			var $cname4			 = $("#cname4");
			var $cyear1			 = $("#cyear1");
			var $cyear2			 = $("#cyear2");
			var $cyear3			 = $("#cyear3");
			var $cyear4			 = $("#cyear4");
			//var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");
			//var $etc1          		= $("#etc1");
			//var $etc2          		= $("#etc2");
			 */
			/* 개인정보 수집 및 이용에 동의 체크  */
			if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			
			/* 동 호 선택 체크 */
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			
			/* 소유자 정보 체크 
			if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else */if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}

			/* 공동 소유자 정보 체크 
			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}*/
			
			/* 연락처 정보 체크 
			if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			*/
			/* 현 주 소 체크
			if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}*/

			/* 미성년 자녀 출생 년도 체크 (자녀 선택시 출생년도 입력 없으면 에러 처리)
			if($cname1.is(":checked") == true)
			{
				if($cyear1.val().length == 0)
				{
					alert("미성년 자녀1 출생 년도 입력 해야 합니다.");
					$('#$cyear1').focus();
					return false;
					
				}
			}
			if($cname2.is(":checked") == true)
			{
				if($cyear2.val().length == 0)
				{
					alert("미성년 자녀2 출생 년도 입력 해야 합니다.");
					$('#$cyear2').focus();
					return false;
					
				}
			}
			if($cname3.is(":checked") == true)
			{
				if($cyear3.val().length == 0)
				{
					alert("미성년 자녀3 출생 년도 입력 해야 합니다.");
					$('#$cyear3').focus();
					return false;
					
				}
			}
			if($cname4.is(":checked") == true)
			{
				if($cyear4.val().length == 0)
				{
					alert("미성년 자녀4 출생 년도 입력 해야 합니다.");
					$('#$cyear4').focus();
					return false;
					
				}
			}
			
			if($cyear1.val().length > 0)
			{
				if($cname1.is(":checked") == false)
				{
					alert("미성년 자녀1 체크 해야 합니다.");
					$('#$cname1').focus();
					return false;
					
				}
			}
			if($cyear2.val().length > 0)
			{
				if($cname2.is(":checked") == false)
				{
					alert("미성년 자녀2 체크 해야 합니다.");
					$('#$cname2').focus();
					return false;
					
				}
			}
			if($cyear3.val().length > 0)
			{
				if($cname3.is(":checked") == false)
				{
					alert("미성년 자녀3 체크 해야 합니다.");
					$('#$cname3').focus();
					return false;
					
				}
			}
			if($cyear4.val().length > 0)
			{
				if($cname4.is(":checked") == false)
				{
					alert("미성년 자녀4 체크 해야 합니다.");
					$('#$cname4').focus();
					return false;
					
				}
			}*/

			/*
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}

			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			/*
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			*/
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/

			return true;

		}

		// 밸류체킹 확인
		function F_change_agree16()
		{
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");

			var $acc_nm1         = $("#acc_nm1");
			var $sign_name1      = $("#sign_name1");
			var $radio1			 = $("#radio1");
			var $radio2			 = $("#radio2");
			var $radio3			 = $("#radio3");
			var $radio4			 = $("#radio4");
			var $radio5			 = $("#radio5");
			var $radio6			 = $("#radio6");
			var $chk_agree2      = $("#chk_agree2");
			/*
			var $birth_day1      = $("#birth_day1");
			var $birth_day2      = $("#birth_day2");
			var $acc_nm2         = $("#acc_nm2");
			var $sign_name2      = $("#sign_name2");
			
			var $pho_no          = $("#pho_no");
			var $em_pho_no       = $("#em_pho_no");
			
			var $jun_agree       = $("#jun_agree");
			var $postCode1       = $("#postCode1");
			
			var $radio1			 = $("#radio1");
			var $cname1			 = $("#cname1");
			var $cname2			 = $("#cname2");
			var $cname3			 = $("#cname3");
			var $cname4			 = $("#cname4");
			var $cyear1			 = $("#cyear1");
			var $cyear2			 = $("#cyear2");
			var $cyear3			 = $("#cyear3");
			var $cyear4			 = $("#cyear4");
			//var $myFile1          = $("#myFile1");
			//var $myFile2          = $("#myFile2");
			//var $etc1          		= $("#etc1");
			//var $etc2          		= $("#etc2");
			 */
			/* 개인정보 수집 및 이용에 동의 체크  */
			if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			
			/* 동 호 선택 체크 */
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			
			/* 소유자 정보 체크 
			if($birth_day1.val().length == 0)
			{
				alert("소유자 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}
			else */if($acc_nm1.val().length == 0)
			{
				alert("소유자 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}

			/* 공동 소유자 정보 체크 
			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("공동 소유자 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("공동 소유자 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("공동 소유자정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}*/
			
			/* 연락처 정보 체크 
			if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			*/
			/* 현 주 소 체크
			if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}*/

			/* 미성년 자녀 출생 년도 체크 (자녀 선택시 출생년도 입력 없으면 에러 처리)
			if($cname1.is(":checked") == true)
			{
				if($cyear1.val().length == 0)
				{
					alert("미성년 자녀1 출생 년도 입력 해야 합니다.");
					$('#$cyear1').focus();
					return false;
					
				}
			}
			if($cname2.is(":checked") == true)
			{
				if($cyear2.val().length == 0)
				{
					alert("미성년 자녀2 출생 년도 입력 해야 합니다.");
					$('#$cyear2').focus();
					return false;
					
				}
			}
			if($cname3.is(":checked") == true)
			{
				if($cyear3.val().length == 0)
				{
					alert("미성년 자녀3 출생 년도 입력 해야 합니다.");
					$('#$cyear3').focus();
					return false;
					
				}
			}
			if($cname4.is(":checked") == true)
			{
				if($cyear4.val().length == 0)
				{
					alert("미성년 자녀4 출생 년도 입력 해야 합니다.");
					$('#$cyear4').focus();
					return false;
					
				}
			}
			
			if($cyear1.val().length > 0)
			{
				if($cname1.is(":checked") == false)
				{
					alert("미성년 자녀1 체크 해야 합니다.");
					$('#$cname1').focus();
					return false;
					
				}
			}
			if($cyear2.val().length > 0)
			{
				if($cname2.is(":checked") == false)
				{
					alert("미성년 자녀2 체크 해야 합니다.");
					$('#$cname2').focus();
					return false;
					
				}
			}
			if($cyear3.val().length > 0)
			{
				if($cname3.is(":checked") == false)
				{
					alert("미성년 자녀3 체크 해야 합니다.");
					$('#$cname3').focus();
					return false;
					
				}
			}
			if($cyear4.val().length > 0)
			{
				if($cname4.is(":checked") == false)
				{
					alert("미성년 자녀4 체크 해야 합니다.");
					$('#$cname4').focus();
					return false;
					
				}
			}*/

			/*
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}

			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			/*
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			*/
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/

			return true;

		}

		// 밸류체킹 확인
		function F_change_agree17()
		{
			// 활용동의 (필수)
			var $chk_agree2      = $("#chk_agree2");
			// 동 (필수)
			var $seldong         = $("#seldong");
			// 호 (필수)
			var $selho           = $("#selho");
			// 소유자 생년월일 (필수)
			var $birth_day1      = $("#birth_day1");
			// 소유자 이름 (필수)
			var $acc_nm1         = $("#acc_nm1");
			// 소유자 사인 파일 (필수)
			var $sign_name1      = $("#sign_name1");
			// 공동 소유자 생년월일
			var $birth_day2      = $("#birth_day2");
			// 공동 소유자 이름
			var $acc_nm2         = $("#acc_nm2");
			// 공동 소유자 사인 파일
			var $sign_name2      = $("#sign_name2");
			// 휴대폰 (필수)
			var $pho_no          = $("#pho_no");
			// 비상연락처
			var $em_pho_no       = $("#em_pho_no");
			// 현 주소
			var $postCode1       = $("#postCode1");
			// 네이버 아이디 (필수)
			var $etc1          		= $("#etc1");
			// 네이버 배우자 아이디
			var $etc2          		= $("#etc2");
			// 계약서 파일 (필수)
			var $myFile1          = $("#myFile1");
			// 입주후 자동차 운영대수
			var $radio1			 = $("#radio1");
			// 미성년 자녀 
			var $cname1			 = $("#cname1");
			var $cname2			 = $("#cname2");
			var $cname3			 = $("#cname3");
			var $cname4			 = $("#cname4");
			var $cyear1			 = $("#cyear1");
			var $cyear2			 = $("#cyear2");
			var $cyear3			 = $("#cyear3");
			var $cyear4			 = $("#cyear4");
			var $nicknm1		 = $("#nicknm1");
			//var $myFile2          = $("#myFile2");

			/* 개인정보 수집 및 이용에 동의 체크 */
			if($chk_agree2.is(":checked") == false)
			{
				alert("개인정보 수집 및 이용에 동의 해야 합니다.");
				$('#chk_agree2').focus();
				return false;
			}
			
			/* 동 호 선택 체크 */
			if($seldong.val().length == 0 || $seldong.val() == "000")
			{
				alert("동을 입력 해야 합니다.");
				$('#dong').focus();
				return false;
			}
			else if($selho.val().length == 0 || $selho.val() == "0000")
			{
				alert("호을 입력 해야 합니다.");
				$('#ho').focus();
				return false;
			}
			
			/* 소유자 정보 체크 */
			if($birth_day1.val().length == 0)
			{
				alert("대표회원 생년월일을 입력 해야 합니다.");
				$('#birth_day1').focus();
				return false;
			}

			if($nicknm1.val().length == 0)
			{
				alert("대표회원 네이버ID 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			
			else if($acc_nm1.val().length == 0)
			{
				alert("대표회원 이름을 입력 해야 합니다.");
				$('#acc_nm1').focus();
				return false;
			}
			else if($sign_name1.val().length == 0)
			{
				alert("대표회원 전자서명을 입력 해야 합니다.");
				$('#signBtn1').focus();
				return false;
			}

			/* 공동 소유자 정보 체크 */
			if($sign_name2.val().length > 0) 
			{	 
				if($acc_nm2.val().length == 0) {
					 alert("가족회원 이름을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
				 
				 if($birth_day2.val().length == 0) {
					 alert("가족회원 생년월일을 입력하세요.");
					 $('#$acc_nm2').focus();
						return false;
				 }
			}
			else if(($acc_nm2.val().length > 0 || $birth_day2.val().length > 0) && $sign_name2.val().length == 0)
			{
				alert("가족회원 정보가 입력된 경우 전자서명을 입력 해야 합니다.");
				$('#signBtn2').focus();
				return false;
			}
			
			/* 연락처 정보 체크 */
			if($pho_no.val().length == 0)
			{
				alert("휴대폰번호를 입력 해야 합니다.");
				$('#pho_no').focus();
				return false;
			}
			
			/* 현 주 소 체크
			if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			 
			if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			else if($etc2.val().length == 0 )
			{
				alert("공동소유자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/
			
			// 계약서 파일 체크
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			
			/* 미성년 자녀 출생 년도 체크 (자녀 선택시 출생년도 입력 없으면 에러 처리)*/
			if($cname1.is(":checked") == true)
			{
				if($cyear1.val().length == 0)
				{
					alert("미성년 자녀1 정보를 입력 해야 합니다.");
					$('#$cyear1').focus();
					return false;
					
				}
			}
			if($cname2.is(":checked") == true)
			{
				if($cyear2.val().length == 0)
				{
					alert("미성년 자녀2 정보를 입력 해야 합니다.");
					$('#$cyear2').focus();
					return false;
					
				}
			}
			if($cname3.is(":checked") == true)
			{
				if($cyear3.val().length == 0)
				{
					alert("미성년 자녀3 정보를 입력 해야 합니다.");
					$('#$cyear3').focus();
					return false;
					
				}
			}
			if($cname4.is(":checked") == true)
			{
				if($cyear4.val().length == 0)
				{
					alert("미성년 자녀4 정보를 입력 해야 합니다.");
					$('#$cyear4').focus();
					return false;
					
				}
			}
			
			if($cyear1.val().length > 0)
			{
				if($cname1.is(":checked") == false)
				{
					alert("미성년 자녀1 체크 해야 합니다.");
					$('#$cname1').focus();
					return false;
					
				}
			}
			if($cyear2.val().length > 0)
			{
				if($cname2.is(":checked") == false)
				{
					alert("미성년 자녀2 체크 해야 합니다.");
					$('#$cname2').focus();
					return false;
					
				}
			}
			if($cyear3.val().length > 0)
			{
				if($cname3.is(":checked") == false)
				{
					alert("미성년 자녀3 체크 해야 합니다.");
					$('#$cname3').focus();
					return false;
					
				}
			}
			if($cyear4.val().length > 0)
			{
				if($cname4.is(":checked") == false)
				{
					alert("미성년 자녀4 체크 해야 합니다.");
					$('#$cname4').focus();
					return false;
					
				}
			}

			/*
			if($myFile1.val().length == 0) 
			{	 
				alert("계약서 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile1.val().match(reg1)) {
					alert("계약서 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}

			if($myFile2.val().length == 0) 
			{	 
				alert("신분증 파일 선택 해 주세요.");
				
				return false;
			}
			// 이미지 파일 확인
			else
			{
				//console.log($myFile.val());
				var reg1 = /(.*?)\.(BMP|RLE|DIB|JPG|GIF|PNG|TIF|TIFF|bmp|rle|dib|jpg|gif|png|tif|tiff|pjp|pjpeg|jtif|svgz|web)$/;

				if(!$myFile2.val().match(reg1)) {
					alert("신분증 파일은 이미지 파일만 선택 가능 합니다.");
					return false;
				}
			}
			*/
			/*
			else if(gc_check_jun_yn != "Y")
			{
				alert("중복 체크 해야 합니다.");
				$('#button2').focus();
				return false;
			}
			else if(gc_check_jun_yn == "Y" && gc_check_jm_yn != "Y")
			{
				if(gc_check_jm_yn != "Y")
				{
					alert("이미 동의서를 제출 하셨습니다.\n"
						      + "추가 동의서 제출 하고자 하시면, \n"
						      //+ "전매란에 체크해 주시고, 동의서를 제출해 주시기 바랍니다."
						      + "담당자에게 문의 하여 이전 동의서를 삭제 하시고,\n"
						      + "동의서를 제출해 주시기 바랍니다."
								);
					return false;
				}
			}
			*/
			/*
			else if($nicknm1.val().length == 0)
			{
				alert("소유자카페 닉네임을 입력 해야 합니다.");
				$('#nicknm1').focus();
				return false;
			}
			*/
			/*
			else if($postCode1.val().length == 0)
			{
				alert("주소를 입력 해야 합니다.");
				$('#postCode1').focus();
				return false;
			}
			*/
			/*
			else if($etc1.val().length == 0 )
			{
				alert("네이버 아이디를 입력 해야 합니다.");
				$('#etc1').focus();
				return false;
			}
			*/
			/*
			else if($etc2.val().length == 0 )
			{
				alert("배우자 네이버 아이디를 입력 해야 합니다.");
				$('#etc2').focus();
				return false;
			}
			*/

			return true;

		}

		//event 발생 처리
		$(document).ready(function(){

			var $dong            = $("#dong");
			var $ho              = $("#ho");
			var $seldong         = $("#seldong");
			var $selho           = $("#selho");
			var $birth_day1      = $("#birth_day1");
			var $acc_nm1         = $("#acc_nm1");
			var $pho_no          = $("#pho_no");
			var $sign_name1      = $("#sign_name1");

			var $jun_agree      = $("#jun_agree");
			var $jun_agreelb    = $("#jun_agreelb");
			var $button2        = $("#button2");

			var $chk_agree1      = $("#chk_agree1");
			var $chk_agree11     = $("#chk_agree11");
			var $chk_agree2      = $("#chk_agree2");
			var $chk_agree22     = $("#chk_agree22");
			var $chk_agree3      = $("#chk_agree3");
			var $chk_agree33     = $("#chk_agree33");
			
			var apt_cd           = $("#apt_cd");
			
			var $radio1         = $("#radio1");
			var $radio2         = $("#radio2");
			var $checkbox1      = $("#checkbox1");
			var $checkbox2      = $("#checkbox2");
			
			$("#jun_agree").change(function(){
				if($("#jun_agree").is(":checked")){
					gc_check_jm_yn = "Y";
		    		$('#JUN_YN').val('Y');
		        }else{
		        	gc_check_jm_yn = "N";
		    		$('#JUN_YN').val('N');
		        }
		    });

			$("#checkbox1").change(function(){
				if($("#checkbox1").is(":checked")){
		    		$('#AGREE_PRIVACY_YN').val('Y');
		    		$("#checkbox1").prop("checked", true); 
		    		$("#checkbox2").prop("checked", false); 
		        }else{
		        	$('#AGREE_PRIVACY_YN').val('N');
		        }
		    });
			$("#checkbox2").change(function(){
				if($("#checkbox2").is(":checked")){
		    		$('#AGREE_PRIVACY_YN').val('N');
		    		$("#checkbox1").prop("checked", false); 
		    		$("#checkbox2").prop("checked", true); 
		        }else{
		        	$('#AGREE_PRIVACY_YN').val('Y');
		        }
		    });

			$("#radio1").change(function(){
				if($("#radio1").is(":checked")){
		    		$("#radio1").prop("checked", true); 
		    		$("#radio2").prop("checked", false); 
		        }
		    });
			$("#radio2").change(function(){
				if($("#radio2").is(":checked")){
		    		$("#radio1").prop("checked", false); 
		    		$("#radio2").prop("checked", true); 
				}
		    });
			
			$("#chk_agree1").change(function(){
				if($("#chk_agree1").is(":checked")){
		    		$('#AGREE_PRIVACY_YN').val('Y');
		    		$("#chk_agree1").prop("checked", true); 
		    		$("#chk_agree11").prop("checked", false); 
		        }else{
		        	$('#AGREE_PRIVACY_YN').val('N');
		        }
		    });

			$("#chk_agree11").change(function(){
				if($("#chk_agree11").is(":checked")){
		    		$('#AGREE_PRIVACY_YN').val('N');
		    		$("#chk_agree1").prop("checked", false); 
		    		$("#chk_agree11").prop("checked", true); 
		        }else{
		        	$('#AGREE_PRIVACY_YN').val('Y');
		        }
		    });

			$("#chk_agree2").change(function(){
				if($("#chk_agree2").is(":checked")){
		    		$('#AGREE_PRIVACY_YN').val('Y');
		    		$("#chk_agree2").prop("checked", true); 
		    		$("#chk_agree22").prop("checked", false); 
		        }else{
		        	$('#AGREE_PRIVACY_YN').val('N');
		        }
		    });

			$("#chk_agree22").change(function(){
				if($("#chk_agree22").is(":checked")){
		    		$('#AGREE_PRIVACY_YN').val('N');
		    		$("#chk_agree2").prop("checked", false); 
		    		$("#chk_agree22").prop("checked", true); 
		        }else{
		        	$('#AGREE_PRIVACY_YN').val('Y');
		        }
		    });

			$("#chk_agree3").change(function(){
				if($("#chk_agree3").is(":checked")){
		    		$('#AGREE_PRIVACY_YN2').val('Y');
		    		$("#chk_agree3").prop("checked", true); 
		    		$("#chk_agree33").prop("checked", false); 
		        }else{
		        	$('#AGREE_PRIVACY_YN2').val('N');
		        }
		    });

			$("#chk_agree33").change(function(){
				if($("#chk_agree33").is(":checked")){
		        	$('#AGREE_PRIVACY_YN2').val('N');
		    		$("#chk_agree3").prop("checked", false); 
		    		$("#chk_agree33").prop("checked", true); 
		        }else{
		    		$('#AGREE_PRIVACY_YN2').val('Y');
		        }
		    });
			
			//핸드폰 길이 처리
			$("#pho_no").keyup(function(){
				$("#pho_no").val($("#pho_no").val().replace(/[^0-9]/g,""));
				if($("#pho_no").val().length >= 12)
			    {
			    	$('#em_pho_no').focus();
			    }
				
		    });
			//비상연락처 길이 처리
			$("#em_pho_no").keyup(function(){
				$("#em_pho_no").val($("#em_pho_no").val().replace(/[^0-9]/g,""));
				if($("#em_pho_no").val().length >= 12)
			    {
			    	$('#etc1').focus();
			    }
				
		    });

			//생년월일 길이 처리
			$("#birth_day1").keyup(function(){
				$("#birth_day1").val($("#birth_day1").val().replace(/[^0-9]/g,""));
				if($("#birth_day1").val().length >= 12)
			    {
			    	$('#acc_nm1').focus();
			    }
				
		    });

			//생년월일 길이 처리
			$("#birth_day2").keyup(function(){
				$("#birth_day2").val($("#birth_day2").val().replace(/[^0-9]/g,""));
				if($("#birth_day2").val().length >= 12)
			    {
			    	$('#acc_nm2').focus();
			    }
				
		    });
			
			//dong 숫자 처리
			$("#dong").keyup(function(){
				$("#dong").val($("#dong").val().replace(/[^0-9]/g,""));				
		    });

			//ho 숫자 처리
			$("#ho").keyup(function(){
				$("#ho").val($("#ho").val().replace(/[^0-9]/g,""));				
		    });

			//seldong 숫자 처리
			$("#seldong").keyup(function(){
				$("#seldong").val($("#seldong").val().replace(/[^0-9]/g,""));
				
				if($("#seldong").val().length >= 5)
			    {
					alert('동은 4자리 까지 입력 가능 합니다.');
			    	$('#seldong').val($("#seldong").val().substring(0,4));
			    }
		    });

			//selho 숫자 처리
			$("#selho").keyup(function(){
				$("#selho").val($("#selho").val().replace(/[^0-9]/g,""));	

				if($("#selho").val().length >= 5)
			    {
					alert('호는 4자리 까지 입력 가능 합니다.');
			    	$('#selho').val($("#selho").val().substring(0,4));
			    }		
		    });

			//acc_nm1 숫자 처리
			$("#acc_nm1").keyup(function(){
				
				if($("#acc_nm1").val().length >= 11)
			    {
					alert('성명은 10자 까지 입력 가능 합니다.');
			    	$('#acc_nm1').val($("#acc_nm1").val().substring(0,10));
			    }
		    });

			//acc_nm2 숫자 처리
			$("#acc_nm2").keyup(function(){
				
				if($("#acc_nm2").val().length >= 11)
			    {
					alert('성명은 10자 까지 입력 가능 합니다.');
			    	$('#acc_nm2').val($("#acc_nm2").val().substring(0,10));
			    }
		    });

		    //전자 서명 파일 받기
		    $("#signBtn1").click(function(){
		    	var apt_Cd = $("#apt_Cd").val();
		    	if($("#sign_name1").val() == null || $("#sign_name1").val() == ""){
			    	window.name = "parentForm1";
			    	window.open("/input_sign.do?apt_Cd=" + apt_Cd, "childForm1", "width=800,height=600");
			    	//windowObj.document.getElementById("apt_Cd").value = apt_Cd;
		    	}
	        });
		    
		    $("#signBtn2").click(function(){
		    	var apt_Cd = $("#apt_Cd").val();
		    	if($("#sign_name2").val() == null || $("#sign_name2").val() == ""){
			    	window.name = "parentForm2";
			    	window.open("/input_sign2.do?apt_Cd=" + apt_Cd, "childForm2", "width=800,height=600");
		    	}
	        });

		    $("#signBtn3").click(function(){
		    	var apt_Cd = $("#apt_Cd").val();
		    	if($("#sign_name3").val() == null || $("#sign_name3").val() == ""){
			    	window.name = "parentForm3";
			    	window.open("/input_sign3.do?apt_Cd=" + apt_Cd, "childForm3", "width=800,height=600");
		    	}
	        });
		});