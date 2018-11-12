<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">  
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	  #content{
	    padding-top: 300px;
    	min-height: 490px;
    	padding-bottom: 60px;
    	width: 100%;
        position: relative;
    	float: left;
}
	  #main {
    position: relative;
}
.main_sec02 {
    padding-top: 50px;
    margin: 0;
    padding-bottom: 35px;
    }
	  .title-h1{
	  	text-align: center;
   		font-size: 42px;
    	color: #666;
    	padding-top: 40px;
    	padding-bottom: 10px;
	  }   
	  .main_sec02 >  ul {
    min-height: 279px;
}
.w_custom {
    margin: 0 auto;
    text-align: center;
    width: 1100px;
    margin: 0 auto;
}

.clear {
    clear: both;
    zoom: 1;
}
.main_sec02 > ul > li {
    width: 155px;
    text-align: center;
    margin-right: 34px;
}
.fl {
    float: left;
}
.thum {
    position: relative;
    z-index: 1;
}
.main_sec02 >ul >li >.thum >span {
    position: absolute;
    left: 0;
    top: 50%;
    margin-top: -13px;
    line-height: 0px;
    height: 0px;
    text-align: center;
    width: 100%;
    font-size: 0;
    display: inline-block;
}
.main_sec02 >ul >li> a {
    color: #888;
    font-size: 12px;
    line-height: 17px;
    font-weight: 400;
}
.main_sec02 >ul >li> a> strong {
    margin: 26px 0 11px 0;
    height: 20px;
    line-height: 20px;
    color: #444;
    font-size: 13px;
    font-weight: 500;
    display: inline-block;
      }
      .main_sec02> ul> li>.last {
    margin-right: 0;
}
.item-list {
    zoom: 1;
    overflow: hidden;
    padding: 0;
    
}
.good_list_wrap > .good_lists {
    margin: 0;
    padding: 0;
    border: 0;
}
.good_lists > .pr_wrap {
    margin: 0 28px 28px 0;
    width: 254px;
    position: relative;
    z-index: 1;
    cursor: pointer;
    height: 100%;
    text-align: center;
    background: #fff;
}
.pr_wrap >.thum {
    background: #eee;
    width: 100%;
    height: 254px;
    overflow: hidden;
    position: relative;
    vertical-align: top;
    margin: 0 auto;
    padding: 0;
    text-align: center;
}
 .pr_wrap >.thum> .icons {
    position: absolute;
    left: 10px;
    top: 10px;
    width: 92%;
    z-index: 3;
    text-align: left;
}
.pr_wrap> .thum >.link_thume {
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    display: block;
    z-index: 3;
    zoom: 1;
    opacity: 0;
    background: #000;
}
 .pr_wrap > .pr_name {
    margin: 17px 0 0 0;
    line-height: 20px;
    height: 23px;
    padding: 0;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    text-align: left;
}
 .pr_wrap > .pr_price {
    font-weight: 500;
    font-size: 12px;
    color: #888;
    line-height: 19px;
    height: 19px;
    width: 100%;
    margin:0;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    text-align: left;
    padding: 5px 10px;
}
.pr_wrap > .pr_price_con {
    font-size: 12px;
    text-decoration: line-through;
    display: inline-block;
    line-height: 18px;
    margin-left: 4px;
    font-weight: 400;
    color: #a4a4a4;
}
.MS_prod_img_m{
	width: 254px;
	height: 254px;
}
.pr_wrap > .last {
    margin-right: 0 !important;
}
.item-wrap{
	margin: 0 auto;
	width: 1300px;
}
.w100{
	width: 100%;
}
</style>
</head>
<body>

<h1>♥♥♥♥♥♥♥♥</h1>


	<!-- 여기에 상품 띄우기  -->
	<!-- 데이터를 다루는것 = el태그  -->
	<!-- c,f => jstl태그  -->
	<!-- bestDto => 한줄 씩 꺼내옴  -->
	<div id="content">
		<div id="main">
			<div class="main_sec02">
				<ul class="clear w_custom">
					<li class="fl first">
						<div class="thum">
							<span>디즈니</span>
							<img src="img/dis_main_circle01.png" alt="">
						</div>
						<a href="#">
							<strong>디즈니</strong>
							<br>
							"미키마우스와 친구들"
						</a>
					</li>
					<li class="fl">
						<div class="thum">
							<span>마블</span>
							<img src="img/marvel_main_circle02.png" alt="">
						</div>
						<a href="#">
							<strong>마블</strong>
							<br>
							"MCU & COMICS"
						</a>
					</li>
					<li class="fl">
						<div class="thum">
							<span>픽사</span>
							<img src="img/piar_main_circle03.png" alt="">
						</div>
						<a href="#">
							<strong>픽사</strong>
							<br>
							"명작 애니메이션"
						</a>
					</li>
					<li class="fl">
						<div class="thum">
							<span>스타워즈</span>
							<img src="img/bnr_main_circle04.png" alt="">
						</div>
						<a href="#">
							<strong>스타워즈</strong>
							<br>
							"영원한 판타지"
						</a>
					</li>
					<li class="last fl">
						<div class="thum">
							<span>겨울왕국</span>
							<img src="img/winter_main_circle05.png" alt="">
						</div>
						<a href="#">
							<strong>겨울왕국</strong>
							<br>
							"안나&엘사"
						</a>
					</li>
				</ul>
			</div>
				<h1 class="title-h1">BEST 상품</h1>
				
			<div class="w100">
				<div class="item-wrap">
					<div class="item-list">
						<ul class="clear main_new good_list_wrap">
							<li class="good_lists clear first">
							<c:forEach items="${bestlist}" var="bestDto">
								<div class="pr_wrap fl ">
									<div class="thum">
										<a href="#" class="link_thume"></a>
										<img alt="pooh캐리어"src="img/상품/${bestDto.p_img}" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">${bestDto.p_name}</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">${bestDto.p_price}원</span>
									</div>
								</div>
								</c:forEach>
								<!-- <div class="pr_wrap fl">
									<div class="thum">
										<span class="icons">
											<span class="MK-product-icons"></span>
										</span>
										<a href="#" class="link_thume"></a>
										<img alt="" src="img/pooh걸이.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">푸우 캐릭터 네임택</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">15900원</span>
									</div>
								</div>
								<div class="pr_wrap fl">
									<div class="thum">
										<span class="icons">
											<span class="MK-product-icons"></span>
										</span>
										<a href="#" class="link_thume"></a>
										<img alt="" src="img/마블체중계.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">마블 체중계</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">34900원</span>
									</div>
								</div>
								<div class="pr_wrap fl last">
									<div class="thum">
										<span class="icons">
											<span class="MK-product-icons"></span>
										</span>
										<a href="#" class="link_thume"></a>
										<img alt="" src="img/밤비캐리어.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">밤비캐리어</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">129900원</span>
									</div>
								</div> -->
							</li>
						</ul>
						
					</div>
				</div>
			
				<h1 class="title-h1">NEW 상품</h1>
				<div class="item-wrap">
					<div class="item-list">
						<ul class="clear main_new good_list_wrap">
							<li class="good_lists clear first">
								<div class="pr_wrap fl ">
									<div class="thum">
										<a href="#" class="link_thume"></a>
										<img alt="스타워즈블랙"src="img/상품/스타워즈블랙.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">스타워즈 다스베이더 블루투스 스피커</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">553000원</span>
									</div>
								</div>
								<div class="pr_wrap fl">
									<div class="thum">
										<span class="icons">
											<span class="MK-product-icons"></span>
										</span>
										<a href="#" class="link_thume"></a>
										<img alt="" src="img/상품/스타워즈흰색.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">스톰투루퍼 스피커</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">553000원</span>
									</div>
								</div>
								<div class="pr_wrap fl">
									<div class="thum">
										<span class="icons">
											<span class="MK-product-icons"></span>
										</span>
										<a href="#" class="link_thume"></a>
										<img alt="" src="img/상품/아이언맨.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">마블 아이언맨 스피커</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">3870000원</span>
									</div>
								</div>
								<div class="pr_wrap fl last">
									<div class="thum">
										<span class="icons">
											<span class="MK-product-icons"></span>
										</span>
										<a href="#" class="link_thume"></a>
										<img alt="" src="img/상품/충전기.jpg" class="MS_prod_img_m thum">
									</div>
									<div class="pr_name">
										<a class="fc_basic" href="#">마블 충전기</a>
									</div>
									<div class="pr_price fc_price">
										<span class="pr_price_con fc_88">129900원</span>
									</div>
								</div>
							</li>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>