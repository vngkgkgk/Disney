<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 전 동의 </title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Nanum Gothic', serif;
}

body, ul, p {
	margin: 0;
	padding: 0;
}

body {
	background-color: white;

}

ul {
	list-style-type: none;
}
a {
	text-decoration: none;
}
/* header */
.divsize {
	margin: 0 auto;
	box-sizing: border-box;
	width: 768px;
}
#header {
	height: 400px;
	position: relative;
	margin-bottom: 70px;
}
#princess_logo {
	margin: 0;
	padding: 0;
	text-align: center;
}
.d_logo{
	display: block;
	margin: 0 auto;
	box-sizing: border-box;

}

/* container */
#container {
	position: relative;
}

#join_content {
	width: 460px;
	margin: 0 auto;
}

.terms {
	margin-bottom: 20px;
	background-color: white!important;
	border: 1px solid #dadada;
}

.terms_p {
	position: relative;
	margin: 0px;
	padding: 15px;
	display: block;
}

.terms_span {
	position: relative;
	display: block;
	height: 58px;
}

.terms_span>input {
	position: absolute;
	right: 1px;
	top: 50%;
	width: 22px;
	height: 22px;
	margin-top: -11px;
	visibility: hidden;
}

.terms_span>input:checked+label { /* +하면 나의 다음태그한명만 */
	background-image: url("img/check_on_yellow1.png");
}

.terms_span>label {
	font-size: 14px;
	font-weight: 700;
	top: -1px;
	height: 58px;
	line-height: 20px;
	display: block;
	cursor: pointer;
	background: url("img/check_off.gif") 100% 50% no-repeat;
}

.terms_box {
	box-sizing: border-box;
	position: relative;
	height: 88px;
	margin-top: 11px;
	padding: 8px 10px;
	border: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	overflow: auto;
}
.div_infut{
		background-color: white;
		border: 1px solid #dadada;
		width: 350px;
		height: 29px;
		margin-left : 15px;
		margin-bottom: 14px;
		padding : 10px 35px 10px 15px;
		cursor: pointer;
	}
	.input_login{
		width: 280px;
		height: 16px;
		border-width: 0px; /* 회색테두리 없애기 */
		padding : 7px 0px 6px 0px;
	}

.btn_type {
	width: :auto;
	margin: 0px 5px;
	font-size: 20px;
	font-weight: 600;
	line-height: 61px;
	display: block;
	box-sizing: border-box;
	height: 61px;
	padding-top: 1px;
	text-align: center;
}

.btn_agree {
	color: #fff;
	border: 1px solid #FFBC42;
	background-color: red;
}

.btn_default {
	color: #333;
	border: 1px solid #e7e7e7;
	background-color: #fff;
}

.btn_double_area {
	margin: 30px -5px 0px;
	overflow: hidden;
}

.btn_double_area>span {
	display: block;
	float: left;
	width: 50%;
}

#footer {
	margin-top : 20px;
	padding: 15px 0;
}

#footer * {
	font-size: 11px;
	line-height: normal;
	list-style: none;
	color: #333;
}

#footer>ul {
	text-align: center;
	margin: 0 auto 9px;
}

#footer>ul>li {
	display: inline-block;
	border-left: 1px solid #dadada;
	padding: 0 5px 0 7px;
}

#footer>ul>li:first-child {
	border-left: 0px !important; /* 최우선으로 CSS적용 */
}

a:hover {
	text-decoration: undrline;
}

#footer>ul>li a:hover {
	color: #1fbc02;
}

#err_check_msg {
	display: inline-block;
	width: 428px;
	height: 24px;
	font-size: 11px;
	font-weight: 700;
	line-height: 24px;
	color: #f46665;
	padding: 0px 15px;
	text-align: center;
}

#err_check {
	display: none;
}

/* 모달  */
#confirm_drop{
	border: 1px solide black;
	width : 300px;
	height: 100px;
	padding : 10px;
	margin: 10px auto;
	background-color: white;
	border-radius: 10px;
}
#confirm_drop_title{
	width: 200px;
	margin: 20px auto;
}
#confirm_drop_answer{
	width: 200px;
	margin: 20px auto;
}
.confirm_drop_answer{
	display: inline-block;
	border: 2px solid black;
	border-radius: 10px;
}
#confirm_drop_agree{
	padding: 10px;
}
#confirm_drop_cancel{
	padding: 10px;
}
#modal_all{
	z-index: 3;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0,0,0,0.4);
	padding-top: 120px;
	display: none;	
}
/* #content_layout{
	margin-left:-230px
	margin-top:-160px
} */
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cbox").click(function() {
			var ckAll = $("#cbox").is(":checked");
			/* 얘가 불이 들어온 경우는 전부다 불꺼주고 
			불이꺼져있는 경우는 불 다 켜주고*/
			/* 체크 됬는지 확인하는 방법  */
			/* $("#cbox").is(":checked"); */
			/* 체크 ok : true
				체크 nok : false */
			/* 전체 체크 버튼 클릭 되엉ㅆ으면 ckAll true
				안되있으면 ckAll false*/
			if (ckAll == true) {
				$(".ckboxs").prop("checked", true);
			} else {
				$(".ckboxs").prop("checked", false);
			}

		});
		
		$(".btn_agree").click(function(){
			alert("클릭");
			$("#modal_all").css("display","block");
		});
		$("#confirm_drop_agree").click(function(){
			$("#modal_all").css("display","none");
		});
		
	}); 
		
		
		/* 하단의 체크 박스가 4개 다 true면 cbox도 true
			체크박스가 1개라도 false면 cbox도 false
			:checked 4개 
			length 사용 
			*/
			
	$(document).on("click",".btn_agree",function(){
		var nowPw=$("#inputpw").val();
		alert("Pw : "+nowPw);
		
		$.ajax({
			url:"memberdeletplay.bizpoll",
			type: "POST",
			dataType:"json",
			data:"id=${sessionScope.loginUser.id}&pw="+nowPw,
			success:function(data){
				if(data.message=="-1"){
					location.href="index.bizpoll";
				}else{
					$("popup").css("display","none");
					$("#err_check").text("정확한 비밀번호를 입력하세요").css("display","block");
					$("#inputpw").select();
				}
			},
			error:function(){
				alert("system error");
			}
		});
	});
</script>
</head>
<body>
	<header>
		<div id="header" class="divsize">
			<h1 id="princess_logo" class="d_logo">
					<img alt="회원탈퇴" src="img/aven.png" width="700px" height="450px">
			</h1>
		</div>
	</header>
	<article>
		<div id="container" class="divsize">
			<form id="join_content">
				<div class="terms">
					<p class="terms_p">
					<span class="terms_span">
						<input type="checkbox" id="cbox">
						<label for="cbox">
						회원탈퇴를 하시면 불이익이 있을 수 있으며<br>
						회원정보는 6개월간 보관이 됩니다. <br>
						정말로 탈퇴를 진행하시겠습니까?
						</label>
					</span>
					</p>
					<div class="div_infut" id="div_id" >
						<input type="text" id="inputid" value="${sessionScope.loginUser.id}" class="input_login" name="inputid" readonly="readonly">
					</div>
					<div class="div_infut" id="naver_pw" >
						<input type="password" placeholder="비밀번호" id="inputpw" class="input_login" name="inputpw">
					</div>
				</div>
				<div id="err_check">
					<span id="err_check_msg">
					비밀번호를 입력해 주세요.
					</span>
				</div> 
				<div class="btn_double_area">
					<span><a href="#" class="btn_type btn_default">비동의</a></span>
					<span><a href="#" class="btn_type btn_agree">동의</a></span>
				</div>
			</form>
		</div>
	</article>
	<div class="w1000">
		<div id="modal_all">
			<div id="confirm_drop">
				<div id="confirm_drop_title">
					<span>Hey! Hey! real?</span>
				</div>
				<div id="confirm_drop_answer">
					<div class="confirm_drop_answer" id="confirm_drop_agree"><a href="#">YES</a></div>
					<div class="confirm_drop_answer" id="confirm_drop_cancle"><a href="#">NO</a></div>
				</div>
			</div>
		</div>
	
	</div>
	
	<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보 처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
			</div>
		</footer>
</body>
</html>