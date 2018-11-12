<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 전 동의 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	/* background: url("img/궁전.png") 100% 100% no-repeat; */

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
	width: 1332px;
}
#header {
	height: 350px;
	position: relative;
	margin-bottom: 20px;
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
	width: 1246px;
	margin: 0 auto;
}
.terms{
	text-align: center;
	margin-bottom: 30px;	
}

#box1{
	float: left;
	width: 49%;
}
#box2{
	float: right;
	width: 49%;
}
.agree{
	box-sizing: border-box;
	position: relative;
	height: 200px;
	margin-top: 11px;
	padding: 8px 10px;
	border: 1px solid #f0f0f0;
	overflow: auto;
}
::-webkit-scrollbar {
    width: 18px;
}
::-webkit-scrollbar-button {
    display: none;
    height: 10px;
    background: #d99f9d;
}
::-webkit-scrollbar-thumb {
    height: 10px;
    width: 10px;
    background: #ff7761;
    -webkit-border-radius: 0px;
    border-radius: 0px;
}
::-webkit-scrollbar-track {
    background: #fff;
}
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

			/* 체크하는 방법 */
			/*$("#cbox").prop("checked",true); 체크 */
			/* 체크 해제 false */
		});
		$(".btn_agree").click(function() {
			var ckonly1 = $("#li1box").is(":checked");
			var ckonly2 = $("#li2box").is(":checked");
			/* alert(ckonly1+", " +ckonly2); */
			if (ckonly1 == true && ckonly2 == true) {
				alert("페이지 이동");
			} else {
				$("#err_check").css("display","block");
			}
		});
		
		/* 하단의 체크 박스가 4개 다 true면 cbox도 true
			체크박스가 1개라도 false면 cbox도 false
			:checked 4개 
			length 사용 
			*/
	});
</script>
</head>
<body>
	<header>
		<div id="header" class="divsize">
			<h1 id="princess_logo" class="d_logo">
					<img alt="공주" src="img/모아나공주들.png" width="700px" height="350px">
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
						이용약관,개인정보 수집 및 이용,
						위치정보 이용약관(선택), 프로모션 안내
						메일 수신(선택)에 모두 동의합니다.
						</label>
					</span>
					</p>
				</div>
			<div>
				<div id="box1">
					<h3>이용약관</h3>
					<div class="agreeArea">
						<div class="agree">
							<p> 제 1조 목적 </p>
							<p>&nbsp;</p>
							<p> 이 약관은 (주)디즈니 (프로젝트 학생)가 운영하는 사이버 몰
							(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하
							"서비스"라 한다)를 이용함에 있어 사이버 몰과
							 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.</p>
							 <p>「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 
							 그 성질에 반하지 않는 한 이 약관을 준용합니다」
							 </p>
							 <p>&nbsp;</p>
							 <p> 제 2조 정의 </p>
							 <p>&nbsp;</p>
							 <p> ①"몰" 이란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 
							 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 
							 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 
							 운영하는 사업자의 의미로도 사용합니다.</p>
							 <p>②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 
							 받는 회원 및 비회원을 말합니다.</p>
							 <p>③"회원"이라 함은 “몰”에 회원등록을 한 자로서, 
							 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</p>
							 <p>&nbsp;</p>
							 <p> 제3조 (약관 등의 명시와 설명 및 개정) </p>
							 <p>&nbsp;</p>
							 <p> ①"몰"은 이 약관의 내용과 상호 및 대표자 성명, 
							 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 
							 전화번호•모사전송번호•전자우편주소, 사업자등록번호, 통신판매업신고번호, 
							 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 사이버몰의 초기 
							 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 
							 통하여 볼 수 있도록 할 수 있습니다.</p>
							 <p>②"몰"은 「전자상거래 등에서의 소비자보호에 관한 법률」, 
							 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 
							 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 
							 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 
							 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 
							 개정할 수 있습니다.</p>
							 <p>&nbsp;</p>
						</div>
						<p>&nbsp;</p>
							 <p class="cheak">
							 	<span>이용약관에 동의하십니까?</span> 
							 </p>
					</div>
				</div>
					<div id="box2">
						<h3>개인정보 수집 및 이용</h3>
						<div class="agreeArea">
							<div class="agree">
								<p class="MsoNormal">■수집하는 개인정보 항목 및 수집 방법</p>
								<p>&nbsp;</p>
								<p class="MsoNormal">(1) 개인정보 수집 항목 </p>
								<p>&nbsp;</p>
								<p class="MsoNormal">1. 나는 회원가입, 원활한 고객상담, 본인 확인, 
								고지사항 전달 및 확인 등 의사소통을 위한 절차에의 이용 및 이벤트 제공을 
								위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
								<p>&nbsp;</p>
								<p class="MsoNormal">- 필수수집항목 : 아이디, 비밀번호, 비밀번호 확인 질문, 
								비밀번호 확인 답변, 이메일, 회원인증값(아이핀 또는 모바일 인증), SNS 수신여부,
								Mail 수신여부, 만 14세 이상 여부</p>
								<p class="MsoNormal">- 선택수집항목 : 주소, 휴대전화, 일반전화, 생년월일</p>
								<p>&nbsp;</p>
								<p class="MsoNormal">2. 서비스 이용 과정이나 처리과정에서 아래와 같은 정보
								들이 자동으로 생성되어 수집될 수 있습니다.</p>
								<p>&nbsp;</p>
								<p class="MsoNormal">- IP Address, 쿠키, 서비스 이용기록, 접속 로그, 
								방문 일시</p>
							<p>&nbsp;</p>
							</div>
							<p>&nbsp;</p>
							<p class="cheak">
								<span>개인정보 수집 및 이용에 동의하십니까?</span>
							</p>
						</div>
					</div>
				</div>
			</form>
		</div>
	</article>
</body>
</html>