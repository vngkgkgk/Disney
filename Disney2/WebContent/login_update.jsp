<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	background-color: white;
	font-family: 'Nanum Gothic', serif;
}

a {
	text-decoration: none;
}
/* 곰돌이 푸 로고  */
#content_layout {
	width: 695px;
	margin: 0 auto;
}

#header_div img {
	display: block;
	margin: 0 auto;
	padding-bottom: 50px;
}

/* 회원가입  */
table {
	width: 100%;
	border-top: 2px solid #FFBC42;
	border-collapse: collapse;
}

th, td {
	border-bottom: 2px solid #FFBC42;
	padding: 10px;
}
th{
	text-align: left;
}
td {
	padding-left: 25px;
	height: 26px;
}

.member {
	color: #8C8C8C;
	font-size: 12px;
	text-align: center;
}

.member>a {
	color: inherit;
}
select {
	height: 22px;
}
.error{
	margin-top: 5px;
	display: none;
	color : red;
	font-size: 11px;
}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".input_join").blur(function(){
			/* input태그에 입력된 값을 가져옴 */
			var inputval = $(this).val();
			/* input태그값이 없으면 경고메세지 출력 */
			if (inputval =="") {
				/* $(".error").css("display", "block"); */
				$(this).next().text("필수 정보 입니다.").css("display","block");
				$(this).parent().css("margin-bottom", "30px");
				/* $(this).next(".mem").css("display",""); */
			}else{
				/* $(".error").css("display", "none"); */
				$(this).next().css("display","none");
				/* $(this).next(".mem").css("display","block"); */
			}
		});
		/* 비밀번호 재확인 input태그를 blur했을때 
		비밀번호와 비밀번호 재확인 값을 비교 */
		$("#pw_confirm").blur(function(){
			/* 비밀번호와 비밀번호 확인값이 다르면 경고메세지 출력 */
			var pw1=$("#member_pw").val();
			var pw2=$("#pw_confirm").val();
			if(pw1 != "" && pw2 !=""){
				if(pw1 == pw2){
					$(".ckeckpw").next().css("display","none");
				}else{ /* 값이 일치하지 않는 경우 */
					/* 선행 조건 : 둘다 값이 존재할때만 적용가능
					
					비밀번호와 비밀번호확인 값이 다를 때 동작
					1. 비밀번호 확인 메세지에 "비밀번호가 일치하지않습니다.
					2. 비밀번호 확인(input)==> focus가 가고
					3. 값을 초기화 */
					$(this).next().text("비밀번호가 일치하지 않습니다.").css("display","block");
					$(this).select();
				}
			}
		});
	});
	$(document).on("blur","#inputto",function(){
		var nowPw=$("#inputto").val();
		//현재 비밀번호 입력받은 값이 일치한지 확인하는 과정
		if(nowPw !=""){
			$.ajax({
				url: "pwCheck.bizpoll",
				type: "POST",
				dataType: "json",
				data: "id=${sessionScope.loginUser.id}&pw=" + nowPw,
				success: function(data){
					alert("ajax 성공");
					if(data.message=="-1"){
						alert("비밀번호 일치");
						$("#inputto").next().text("비밀번호가 일치합니다.").css("display","block").css("color","blue");
						 $("#inputto").parent().css("margin-bottom","30px");
					}else{
						alert("비밀번호 일치x");
						$("#inputto").next().text("비밀번호가 일치하지 않습니다.").css("display","block");
						$("#inputto").parent().css("margin-bottom","30px"); 
					}
				},
				error:function(){
					alert("시스템 에러");
				}
			});
		}else{
			//ajax
		}
	});
	$(document).on("click","#member_btn",function() {
		/* 유효성 체크하는 값을 받아온다. */
		var form = $("#frm_mem"), 
		mpw = $("#inputto"), 
		mpw1 = $("#member_pw"), 
		mpw2 = $("#pw_confirm"); 
		

		var checkTest = $("#inputto").next().text();
		/* checkTest =  */
		var pw= $.trim(mpw.val());
		var regPass=/^.*(?=.{6,20})(?=.[0-9])(?=.*[a-zA-Z]).*$/; 
		if(pw == ""){
			mpw.focus();
			mpw.next().css("display","block");
			return false;
		}else if(!regPass.test(pw)){
			mpw.focus();
			mpw.next().text("올바른 비밀번호를 입력해주세요.").css("display","block");
			return false;
		}
		
		var pw1= $.trim(mpw1.val());
		var pw2= $.trim(mpw2.val());
	
		var regPass=/^.*(?=.{6,20})(?=.[0-9])(?=.*[a-zA-Z]).*$/;
		
		if(pw1==""){
			mpw1.focus();
			mpw1.next().text("필수정보 입니다.").css("display","block");
			mpw1.parent().css("margin-bottom","30px");
			return false;
		}else if(!regPass.test(pw1)){
			mpw1.select();
			mpw1.next().text("8~20자 이내 영문자, 숫자, 특수문자만 사용해주세요.").css("display","block");
			mpw1.parent().css("margin-bottom","30px");
			return false;
		}else if(pw2==""){
			mpw2.focus();
			mpw2.next().text("필수정보 입니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}else if(pw1 != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지 않습니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}
		
		if(pw==pw1){
			mpw1.focus();
			mpw1.val("");
			mpw2.val("");
			mpw1.next().text("현재비밀번호와 동일합니다.").css("display","block");
			mpw1.parent().css("margin-bottom","30px");
			return false;
		}
		/*디비로 보내기 전에 컨트롤러로 보내기 위해  유효성 체크 한것 
		   유효성 체크 완료 */
 		 form.submit(); 
	});
</script>
</head>
<body>
	<div id="content_layout">
		<header>
			<div id="header_div">
				<a href="#"> <img alt="회원가입 로고" src="img/halloween.png">
				</a>
			</div>
		</header>
		<form action="memberpwplay.bizpoll" method="POST" name="frm_mem" id="frm_mem">
		<!-- post값은 안에 내용 안보이게 보내는것   -->
		<table>
			<tbody>
				<tr>
					<th scope="row">현재비밀번호 <img alt="필수" src="img/ico_required.png">
					</th>
					<td><input id="inputto" class="input_join" name="inputto">
							<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">새 비밀번호<img alt="필수" src="img/ico_required.png">
					</th>
					<td><input id="member_pw" class="input_join ckeckpw" name="member_pw">
							<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">새비밀번호 확인 <img alt="필수"
						src="img/ico_required.png">
					</th>
					<td><input id="pw_confirm" class="input_join ckeckpw" name="pw_confirm">
						<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
					<input type="hidden" name="updateId" value="${sessionScope.loginUser.id}">
			</tbody>
		</table>
		</form>
		<div class="member">
			<a href="#"> <!-- 여기에 주소 적으면 안됨 why?유효성체크하고 넘어가야하는데 여기적으면 유효성안거치고 넘어감 -->
				<img id="member_btn" alt="회원가입" src="img/JOIN222.png" width="160px" height="120px">
			</a>
		</div>
	</div>
</body>

</html>