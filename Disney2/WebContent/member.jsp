<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
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
		$("#e-mail3").change(function(){
			var selmail = $("#e-mail3").val(); /* #selmail의 value 값을 selmail 변수에 담기 */
			
			if(selmail == "directVal"){
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val(selmail);
			}
			$("#email2").val(selmail); /* #email_url의 value 속성에 selmail변수에 값을 넣음 */
		});
		
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
		$("#member_id").blur(function(){
			
			var idVal = $(this).val(); //id값 받아오기
			if(idVal !=""){ //id값이 있는 경우에만 Ajax를동작하게 만든다.
					
				$.ajax({
					// ajax db갔다.
					//View -> Controller->Model -> DB 단자 페이지전화만 안되는 것뿐
					url :"idCheck.bizpoll",
					type : "POST",
					dataType :"json",
					data :"id="+idVal,
					success : function(data){
						if(data.message==-1){
							$("#member_id").next().text("이미사용중인아이디입니다.").css("display","block").css("color","#F46665");
							$("#member_id").select();
						}else{
							$("#member_id").next().text("멋진아이디네요!").css("display","block").css("color","#0000FF");
							$("#member_pw").select();
						}
					},
					error : function(){
						alert("system error!");
					}
				});
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
		/* 우편번호, 주소 클릭했을때 다음 우편번호 api실행 */
		$(".addrbtn").click(function(){
			$("#addr_btn").click();
		});
	});
	
	
	

	$(document).on("click","#member_btn",function() {
		/* 유효성 체크하는 값을 받아온다. */
		var form = $("#frm_mem"), 
		mid = $("#member_id"), 
		mpw = $("#member_pw"), 
		mpw2 = $("#pw_confirm"), 
		mname = $("#usr_name"), 
		mphone = $("#phone"), 
		memailid = $("#email1"), 
		memanilurl = $("#email2"), 
		zipcode = $("#sample6_postcode"), 
		maddr1 = $("#sample6_address"),
		maddr2 = $("#sample6_address2"); 
		
		var id= $.trim(mid.val());
		var regid = /^[A-Za-z0-9]{4,12}$/; 
		
		if(id == ""){
			mid.focus();
			mid.next().css("display","block");
			return false;
		}else if(!regid.test(id)){
			mid.focus();
			mid.next().text("영문자와 숫자만 입력하세요").css("display","block");
			return false;
		}
		
		var pw = $.trim(mpw.val());
		var pw2= $.trim(mpw2.val());
	
		var regPass=/^.*(?=.{6,20})(?=.[0-9])(?=.*[a-zA-Z]).*$/;
		
		if(pw==""){
			mpw.focus();
			mpw.next().text("필수정보 입니다.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		}else if(!regPass.test(pw)){
			mpw.select();
			mpw.next().text("8~20자 이내 영문자, 숫자, 특수문자만 사용해주세요.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		}else if(pw2==""){
			mpw2.focus();
			mpw2.next().text("필수정보 입니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}else if(pw != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지 않습니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}
		
		var name = $.trim(mname.val());
		var regname = /^[가-힣]*$/;
		
		if(name == ""){
			mname.focus();
			mname.next().css("display","block");
			return false;
		}else if(!regname.test(name)){
			mname.focus();
			mname.next().text("한글만 입력하세요").css("display","block");
			return false;
		}
		
		var phone = $.trim(mphone.val());
		
		var regphone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		if(phone==""){
			mphone.focus();
			mphone.next().css("display","block");
			return false;
		} else if($.isNumeric(phone) == false) {
			mphone.select();
			mphone.next().text("숫자만 입력하세요").css("display","block");
			return false;	
		} else if(!regphone.test(phone)){
			mphone.select();
			mphone.next().text("정확하게 입력해주세요.").css("display","block");
			return false;
		}
		
		var zipcodeVal = $.trim(zipcode.val());
		var addr1 =$.trim(maddr1.val());
		var addr2 =$.trim(maddr2.val());
		
		if(zipcodeVal==""){
			
			maddr2.focus();
			$("#adr").text("우편번호").css("display","block");
			return false;
		}else if(addr1==""){
			maddr2.focus();
			$("#adr").text("주소").css("display","block");
			return false;
		}else if(addr2==""){
			maddr2.focus();
			$("#adr").text("상세주소").css("display","block");
			return false;
		}
		
		var mailid = $.trim(memailid.val());
		var mailurl = $.trim(memanilurl.val());
		var mail = mailid + "@" + mailurl;
		var regmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if(mailid == ""){
			memailid.focus();
			memailid.next().text("필수정보 입니다.").css("display","block");
			memailid.parent().css("margin-bottom","30px");
			return false;
		}else if(mailurl==""){
			memailurl.focus();
			memailurl.next().text("필수정보 입니다.").css("display","block");
			memailurl.parent().css("margin-bottom","30px");
			return false;
		}else if(!regmail.test(mail)){
			memailid.select();
			$("#semail").next().text("이메일 형식이 올바르지 않습니다.").css("display","block");
			memailurl.parent().css("margin-bottom","30px");
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
				<a href="#"> <img alt="회원가입 로고" src="img/iPhone_6.jpg">
				</a>
			</div>
		</header>
		<form action="memberplay.bizpoll" method="POST" name="frm_mem" id="frm_mem">
		<!-- post값은 안에 내용 안보이게 보내는것   -->
		<table>
			<tbody>
				<tr>
					<th scope="row">아이디 <img alt="필수" src="img/ico_required.png">
					</th>
					<td><input id="member_id" class="input_join" name="member_id">
							<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 <img alt="필수" src="img/ico_required.png">
					</th>
					<td><input id="member_pw" class="input_join ckeckpw" name="member_pw">
							<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 확인 <img alt="필수"
						src="img/ico_required.png">
					</th>
					<td><input id="pw_confirm" class="input_join ckeckpw" name="pw_confirm">
						<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
				<!-- <tr>
					<th scope="row">비밀번호 확인 질문 <img alt="필수"
						src="img/ico_required.png">
					</th>
					<td><select id="quetions" >
							<option>- 질문 선택 -</option>
							<option>기억에 남는 추억의 장소는?</option>
							<option>내가 태어난 장소는?</option>
							<option>가장 생각나는 친구의 이름은?</option>
							<option>내가 좋아하는 캐릭터는?</option>
							<option>자신의 보물 1호는?</option>
					</select></td>
				</tr>
				<tr>
					<th scope="row">확인 질문 답변 <img alt="필수"
						src="img/ico_required.png">
					</th>
					<td><input id="answer"></td>
				</tr> -->
				<tr>
					<th scope="row">이름 <img alt="필수" src="img/ico_required.png">
					</th>
					<td>
					<input id="usr_name" class="input_join" name="usr_name">
						<span class="error">필수 정보 입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">휴대전화 <img alt="필수" src="img/ico_required.png">
					</th>
					<td>
					<!-- <select id="phone1">
							<option>- 번호 선택 -</option>
							<option>010</option>
							<option>011</option>
							<option>012</option>
							<option>017</option>
							<option>019</option>
					</select> -
					<input id="phone2"> - -->	
					<input id="phone" name="phone">
						<span class="error">필수정보입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">주소 <img alt="필수" src="img/ico_required.png">
					</th>
					<td>
						<input type="text" name="sample6_postcode" class="addrbtn" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
						<input type="button" id="addr_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="sample6_address" class="addrbtn" id="sample6_address" placeholder="주소" readonly="readonly">
						<input type="text" name="sample6_address2"id="sample6_address2" placeholder="상세주소">
							<span id="adr" class="error">필수정보입니다</span>
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script>
   									 function sample6_execDaumPostcode() {
					       			 new daum.Postcode({
					           		 oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var fullAddr = ''; // 최종 주소 변수
					                var extraAddr = ''; // 조합형 주소 변수
					
					                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                    fullAddr = data.roadAddress;
					
					                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                    fullAddr = data.jibunAddress;
					                }
					
					                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					                if(data.userSelectedType === 'R'){
					                    //법정동명이 있을 경우 추가한다.
					                    if(data.bname !== ''){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있을 경우 추가한다.
					                    if(data.buildingName !== ''){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
					                document.getElementById('sample6_address').value = fullAddr;
					
					                // 커서를 상세주소 필드로 이동한다.
					                document.getElementById('sample6_address2').focus();
					            }
					        }).open();
					    }
					    </script>
					</td>
				</tr>
				<tr>
					<th scope="row">E-Mail <img alt="필수" src="img/ico_required.png">
				</th>
					<td>
					<input id="email1" type="text" name="email1">
					<span>@</span>
					<input id="email2"type="text" name="email2" placeholder="URL"> 
					<select id="e-mail3">
							<option>▷e-mail선택◁</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
							<option>yahoo.com</option>
					</select>
					<span class="error">필수정보입니다.</span>
					</td>
				</tr>
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