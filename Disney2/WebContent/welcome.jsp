<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="refresh" content="3; url=index.bizpoll"> -->
<title>Insert title here</title>
<script type="text/javascript">
	var cnt=3; 
	function countdown(){ // 2. 함수실행 1초단위로 
		if(cnt==0){
			clearInterval(s);
			location.href="index.bizpoll";
		}
		document.getElementById("rCnt").innerHTML=cnt;
		cnt--;
	}
	var s =setInterval(countdown,1000); //1, start!!

</script>
</head>
<body>

	<div id="join_ok">
		<div class="welcome_text text1">Disney에 오신걸 환영합니다~</div>
		<div class="welcome_text text2"><span id="rCnt">3</span>초 후 이동</div>
		
		<!-- 카운트 다운방법
			1. meta태그 활용
			2. JavaScript의 setInterval()활용 -->
	</div>
</body>
</html>