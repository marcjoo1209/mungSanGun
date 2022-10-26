
  	// 숫자 콤마 처리 class = comma
	$(window).on('load', function(){
	    $('.comma').each(function(){
	        var txt = $(this).text();
	        $(this).html(txt.replace(/,/g, ''));

	        var len = $(this).text().length;
	        for (i = 0; i < len; i ++){
	            $(this).eq(i).text(commaNum($(this).eq(i).text()));
	        }
	    });

	    function commaNum(num){
	        var len, point, str;
	        num = num + '';
	        point = num.length % 3
	        len = num.length;
	        str = num.substring(0, point);
	        while (point < len){
	            if (str != '') str += ',';
	            str += num.substring(point, point + 3);
	            point += 3;
	        }
	        return str;
	    }
	});