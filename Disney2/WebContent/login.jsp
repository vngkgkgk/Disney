<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<%
	String referer=request.getHeader("referer"); /* 전페이지 url가져와 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	body{
		margin:0;
		padding:0;
		background-color:white;
		font-family: 'Nanum Gothic', serif;
	}
	a{
		text-decoration: none;
	}
 	#modal_all{
		z-index:3;
		position:fixed;
		top:0;
		left:0;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		display: none;
	} 
	/* header 로고 */
	#content_layout{
		width: 695px;
		margin: 0 auto;
		background-color: white;
		position: relative;
	}
	#header_div img{
		display: block;
	 	margin: 0 auto; 
	 	 padding-bottom: 30px;
	}
	#close_btn{
		position: absolute;
		right: 15px;
		top: 15px;
		color : black!important;
		font-size: 25px;
		padding:5px;
		display: block;
	}
	/* section (그룹로그인, input(id,pw), 로그인 버튼,find) */
	.div_infut{
		background-color: white;
		border: 1px solid #FFBC42;
		width: 500px;
		height: 29px;
		margin-left : 70px;
		margin-bottom: 14px;
		padding : 10px 35px 10px 15px;
		cursor: pointer;
	}
	.input_login{
		width: 408px;
		height: 16px;
		border-width: 0px; /* 회색테두리 없애기 */
		padding : 7px 0px 6px 0px;
	}
	#btn_login{
		margin-left : 110px;
		width : 460px;
		height : 59px;
		font-size : 22px;
		text-align: center;
		background-color:#FFBC42;
		color:white;
		display : block;
		padding : 2px;
		line-height : 61px;
	}
	
	table{
		width:100%;		
	}
	td{
		height:26px;
	}
	.si{
		color : #D5D5D5;
	}
	hr{
		width: 98%;
		margin: 20px auto;
		border:thin solid #FFBC42;
	}
	.member{
		color:#8C8C8C;
		font-size:12px;
		text-align:center;
	}
	.member > a{
		color : inherit;
	}
	ul{
		list-style-type: none;
	}
	a:hover{
		text-decoration:undrline;
	}
	#err_check_msg{
	margin-left: 110px;
	display: inline-block;
	width: 428px;
	height: 24px;
	font-size: 20px;
	font-weight: 700;
	line-height: 24px;
	color: #f46665;
	padding: 0px 20px;
	text-align: center;
	margin-bottom: 10px;
	}
	#err_check{
		display: none;
	} 
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inputid").focus(function(){
			$("#naver_id").css("border","1px solid #dadada");
		});
	});
	$(document).ready(function(){
		$("#inputid").blur(function(){
			$("#naver_id").css("border","1px solid #FFBC42");
		});
	});
	$(document).ready(function(){
		$("#inputpw").focus(function(){
			$("#naver_pw").css("border","1px solid #dadada");
		});
	});
	$(document).ready(function(){
		$("#inputpw").blur(function(){
			$("#naver_pw").css("border","1px solid #FFBC42");
		});
		/* focus : 초점이 가게하는 것 
			blur: 초점이 해제하는 것 */
		$("#btn_login").click(function(){
			var id = $("#inputid").val();
			var pw = $("#inputpw").val();
			if(id !=""&& pw!=""){
				/* $("#frm_login").submit(); */
				$.ajax({
					url:"loginplay.bizpoll",
					type:"POST",
					datatype:"json",
					data :"id="+id+"&pw="+pw,
					success:function(data){
						if(data.message=="1"){
							location.href="<%=referer%>";
						}else{
							alert("실패");
							$("#err_check_msg").text("ID와 pw가 일치하지않습니다.");
							$("#err_check").css("display","block");
						}
					},
					error:function(){
						alert("system error");
					}
				});
			}else{/* 둘다값 x 또는 둘중에 하나라도 값이x */
				/* $("#err_check").css("display","block"); */
			return;/* java로 이동하지 않고 화면단으로 다시 돌아감 */
			}
		});
		/* modal창 켜고끄기 */
		/* $("#login_btn").click(function(){
			$("#modal_all").css("display","block");
		}); */
		/* $("#close_btn").click(function(){
			$("#inputid").val("");
			$("#inputpw").val("");
			$("#modal_all").css("display","none");
		}); */
		
	});
</script>
</head>
<body>
<!-- <div id="modal_all"> -->
	<div id="content_layout">
		<header>
		<!-- <span id="close_btn"><i class="fa fa-close"></i></span> -->
			<div id="header_div">
				<a href="#">
					<img alt="로그인 로고" src="img/미키마우스와친구들.gif" width="600">
				</a>
			</div>
		</header>
		<section>
				<div class="div_infut" id="naver_id" >
					<input type="text" placeholder="아이디" id="inputid" class="input_login" name="inputid">
				</div>
				<div class="div_infut" id="naver_pw" >
					<input type="password" placeholder="비밀번호" id="inputpw" class="input_login" name="inputpw">
				</div>
				<div id = "err_check">
					<span id="err_check_msg">ID와 pw를 입력해주세요</span>
				</div>
				<div><a href="#" id="btn_login">로그인</a></div>
			<div>
				<hr>
			</div>
			<div class="member">
				<a href="#">아이디 찾기</a>
				&nbsp;
					<span class="si">|</span>
				&nbsp;
				<a href="#">비밀번호 찾기</a>
				&nbsp;
			</div>
			<div>
				<hr>
			</div>
			<div class="member">
				<a href="member_con.jsp">
					<img alt="회원가입" src="img/JOIN222.png" width="160px" height="120px">
				</a>
			</div>
		</section>
	</div>
<!-- </div> -->
</body>
</html>