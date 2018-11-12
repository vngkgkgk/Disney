<!-- Index 페이지에 포함되는 Header 페이지를 작성하는 곳 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include.jsp" %>
<%
	String path = request.getContextPath(); // 컨텍스트 경로
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>header.html</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	body, ul{
		margin:0px;
		padding:0px;
	}
	ul{
		display: block;
    	list-style-type: disc;
    	margin-block-start: 1em;
    	margin-block-end: 1em;
    	margin-inline-start: 0px;
    	margin-inline-end: 0px;
    	padding-inline-start: 40px;
	}
	#header_wrap{
		box-sizing: border-box;
		position: fixed;
		top: 0px;
		left: 0px;
		width: 100%;
		background-color: white;
		z-index: 99;
	}
	#header_line1{
		height:30px;
		width:100%;
		background-color:#E71D36;
		box-sizing: border-box;
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2)
					0 6px 20px 0 rgba(0,0,0,0.19);
		z-index: 1;
	}
	#header_line1_in{
		width: 80%;
		margin: 0 auto;
	}
	#header_line1_ul {
		margin: 0;
		list-style-type: none;
		float : right;
	}
	#header_line1_ul > li {
		float : left;
		height: 30px;
		position: relative;
	}
	#header_line1_ul > li:hover{
		background: #EE7785;
	} 
	#header_line1_ul > li:hover #header_line1_dropdown{
			/* #header_line1_ul > li:hover 했을 때 
			 #header_line1_dropdown을 어떻게 변경할 지 적용*/
		display:block;
	}
	#header_line1_ul > li > a {
		float:left; /* 태그들을 좌측, 우측 유동배치 */
		height: 30px;
		color: white;
	}
	#header_line1_dropdown{
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2)
					0 6px 20px 0 rgba(0,0,0,0.19);
		display : none;/* 아예 존재 자체 없음 */
		position : absolute;
		z-index:1;
		top:30px;
	}
	#header_line1_dropdown > a{
		display:block;
		font-size:12px; 
		background-color:#ef5285;
		color:white; 
		padding : 5px 10px; /* 좌측안쪽여백 + 위아래5 좌우측0  */
		border-bottom : 1px solid white;
		width : 82px;
	}
	#header_line1_dropdown > a:hover{
		background-color :#fab1ce;
		text-decoration : underline;
	}
	#header_line1_mypage{
		width:82px; /* 마이페이지 사이즈에서 20px빼면됨  */
		text-align:center;
	}
	a{
		text-decoration: none;
		font-size: 12px;
		font-weight: bold;
		height: 30px;
		display: inline-block;
		padding: 0 10px;
		line-height: 30px;
	}
	li:hover{/* li태그에 마우스를 올렸을 때 동작하는 내용 */
		background-color: #EE7785;
	}
	li{
		list-style-type: none;
	}
	#header_line2{
		width:80%;
		height:100px;
		margin:20px auto;
		box-sizing: border-box;
	}
	#header_line2 img{
		display:inline-block;
		margin-top:0px;
	}
	#header_line2_wrap_search{
		height: 34px;
		display:inline-block;
		float: right;
		padding-top: 46px;
	}
	#header_line2_search{
		border: 1px solid #EAEAEA;
		height: 34px;
		box-sizing: border-box;
		position: relative;
	}
	#search_keyword{
		width: 180px;
		height:30px;
		font-size: 13px;
		box-sizing: border-box;
		border: 0px;
		padding-left: 10px;
	}
	#search_btn{
		width: 28px;
		height: 22px;
		border: 0px;
		position: absolute;
		right: 0px;
		top: 4px;
	}
	#header_line3{
		width:100%;
		height:50px;
		background-color: rgb(66, 137, 255);
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2).
					0 6px 20px 0 rgba(0,0,0,0.19);
		box-sizing: border-box;
		text-align:center;
		position : relative;
	}
	#header_line3_ul >li{
		float : left;
		box-sizing :border-box;
		height: 49px;
	}
	#header_line3_ul > li:hover{
		background-color:rgb(130, 177, 255);
		border-top: 5px solid white;
	}
	#header_line3_ul > li > a:hover{
		background-color: rgb(130, 177, 255);
		border-top: 5px solid white; 
		
	}
	#header_line3_ul > li > a{
		width: 130px;
		color:#EFFFE9;
		line-height : 50px;
		font-size : 20px;
		padding : 0 13px;
		display : inline-block;
		height : 49px;
		text-align : center;
	}
	#header_line3_in{
		width:70%;
		margin:0 auto;
	}
	#header_line3_dropdown1{
		position : absolute;
		background-color: #a5dff9;
		display : none;
		margin-top : -5px;
	}
	#header_line3_dropdown1 > a{
		background-color: rgb(107, 162, 255);
		font-size: 13pt;
		font-weight: bolder;
		display:block;
		color: white;
		text-align: center;
		padding : 5px 0px;
		height: 22px;
		width: 156px;	
	}
	#header_line3_dropdown2{
		position : absolute;
		margin-top : -5px;
		background-color: rgb(107, 162, 255);
		display : none;
	}
	#header_line3_dropdown2 > a{
		background-color:rgb(107, 162, 255);
		font-size: 13pt;
		font-weight: bolder;
		display:block;
		color: white;
		text-align: center;
		padding : 5px 0px;
		height: 22px;
		width: 156px;	
	}
	#header_line3_dropdown2 > a:hover{
		background-color: #EE7785;
	} 
	#header_line3_ul > li:hover #header_line3_dropdown2{
		display: block;
		background-color: #A593E0;
	}
	#header_line3_ul > li:hover #header_line3_dropdown1{
		display: block;
		background-color: #A593E0;
	}
	#header_line3_dropdown1 > a:hover{
		background-color: #EE7785;
	}
	#user{
		
	}
	
	
</style>

</head>
<body>
	<header>
		<div id="header_wrap">
			<div id="header_line1">
				<div id="header_line1_in">
					<ul id="header_line1_ul">
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
						<li><a href="<%=path%>/login.bizpoll" >로그인</a></li>
						<li><a href="<%=path%>/constract.bizpoll">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li id="user">
								${sessionScope.loginUser.name}
								(${sessionScope.loginUser.id})
							</li>
						<li><a href="<%=path%>/loginOut.bizpoll">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					
						<li><a id="header_line1_mypage" href="">마이페이지▼</a>
							<div id="header_line1_dropdown">
								<a href="#">주문/배송조회</a>
								 <a href="#">장바구니</a> 
								 <a href="#">위시리스트</a>
							<c:choose>
								<c:when test="${empty sessionScope.loginUser}"></c:when>
								<c:otherwise>
								<a href="<%=path%>/memberUpdate.bizpoll">나의 회원정보</a>
								<a href="<%=path%>/pwChange.bizpoll">비밀번호 정보</a>
								<a href="<%=path%>/memberDelete.bizpoll">회원 탈퇴</a>
								</c:otherwise>
							</c:choose>
							</div></li>
					</ul>
				</div>
			</div>
			<div id="header_line2">
				<a href="<%=path%>/index.bizpoll">
				 	<img id="header_logo" alt="디즈니월드" src="<%=path%>/img/지니.png" width="120px" height="110px">
				</a>
				<div id="header_line2_wrap_search">
					<div id="header_line2_search">
						<input id="search_keyword" type="text" placeholder="검색어를 입력">
						<input type="image" src="<%=path%>/img/search2.png" alt="검색" id="search_btn" onclick="checkSearch1();">
					</div>
				</div>
			</div>
			<div id="header_line3">
				<div id="header_line3_in">
					<ul id="header_line3_ul">
						<li><a href="#">Special</a></li>
						<li><a href="#">Disney Baby</a>
							<div id="header_line3_dropdown1">
								<a href="">신생아</a> <a href="">유아</a>
							</div></li>
						<li><a href="#">Disney Jun</a>
							<div id="header_line3_dropdown2">
								<a href="">색칠공부</a> <a href="">프로그램</a> <a href="">동영상</a>
							</div></li>
						<li><a href="#">Disney Jone</a></li>
						<li><a href="<%=path%>/boardList.bizpoll">게시판</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
<!-- float: left, right -->
<!-- 태그들을 배치할 때 사용 -->
<!-- : 태그들을 항상 왼편이나 오른편으로 배치 시킬 수 있다. -->
<!-- {clear:both;} 사용하면 중간에 끊을 수 있음  -->
</html>
