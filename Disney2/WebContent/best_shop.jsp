<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	div{
		display: block;
	}
	#contentWrapper{
		padding-top: 300px;
		position: relative;
	}
	#contentWrap{
		zoom:1;
		overflow: hidden;
		position: relative;
		width: 1100px;
		margin-right: auto;
		margin-left: auto;
	}
	#content{
		min-height: 490px;
    	padding-bottom: 60px;
    	width: 100%;
    	position: relative;
    	float: left;
	}
	#productDetail >.loc_navi {
    	margin-top: 16px;
	}
	.loc_navi{
		padding: 0;
    	margin: 18px 0 20px 0;
    	position: relative;
    	float: right;	
	}
	.loc_navi > dd {
    	line-height: 18px;
    	padding: 0;
    	color: #666;
    	font-size: 9px;
    	vertical-align: top;
	}
	.loc_navi>dd>a{
    	color: #666;
    	display: inline-block;
    	padding: 0 5px;
    	font-size: 12px;
    	height: 18px;
    	line-height: 18px;
    	vertical-align: top;
	}
	
	.page-body{
	    padding-bottom: 50px;
	}
	.thumb-info{
		zoom:1;
		overflow: hidden;
	}
	.clear{
		clear: both;
	}
	.thumb-wrap{
		float: left;
		width: 48.5%;
	}
	.thumb{
		width: 100%;
	}
	a {
    	color: rgb(0, 0, 0);
    	text-decoration: none;
	}
	#zoom_image > img{
		display: block;
		width: 100%;
		height: auto;
	}
	img{
		vertical-align: top;
		border: 0 none;
	}
	.info{
		float: right;
   	 	width: 48.5%;
    	margin: 0;
   	    padding: 22px 0 0 0;
   	    border-top: 2px #222 solid;
	}
	.info > .detail_name{
		 border-bottom: 1px #d3d3d3 solid;
   		 padding: 0 0 16px 0;
  	     margin: 0 0 17px 0;
	}
	.detail_name > p{
		color: #666;
    	font-size: 16px;
    	line-height: 22px;
    	padding-bottom: 12px;
	}
	.ff_nanumB{
		font-weight: 700;
	}
	.ml_20 {
    	margin-left: 20px !important;
	}
	.detail_name > h3{
		color: #222;
   		font-size: 34px;
    	line-height: 44px;
	}
	caption {
		display : none;
	}
	tbody {
   		display: table-row-group;
    	vertical-align: middle;
    	border-color: inherit;
	}
	tr {
    	display: table-row;
    	vertical-align: inherit;
    	border-color: inherit;
	}
	.table-opt > th{
		color: #666;
    	font-size: 13px;
    	padding: 8px 0 9px 0;
    	line-height: 23px;
    	text-align: left;
	}
	.table-opt > th > .tb-left{
		padding-left: 20px;
	}
	.tb-left{
		text-align: left;
		padding: 0 10px;
	}
	.table-opt > .price{
		font-weight: 800;
		font-size: 18px;
	}
	.table-opt > td{
		padding: 8px 0 9px 0;
    	line-height: 23px;
    	font-size: 12px;
    	color: #444;
    	text-align: left;
	}
	.table-opt > td > .tb-left{
		padding-left: 0px;
	}
	#productDetail > .prd-btns {
    	border-top: 1px #d3d3d3 solid;
	}
	.pt_20{
		padding-top: 20px;
	}
	.mt_20{
		margin-top: 20px;
	}
	.opt-wrap > .opt {
    	overflow: hidden;
    	width: 100%;
    	display: inline-block;
   		padding: 0 10px;
	}
	.choose{
    	float: left;
    	width: 97px;
    	padding: 8px 0 9px 0;
    	margin-left: 20px;
    	line-height: 23px;
    	color: #666;
    	font-size: 13px;
    	font-weight: 700;
	}
	dt{
		display: inline-block;
	}
	dd{
		display: inline-block;
	}
	.opt-wrap > dd {
    	float: left;
    	width: 383px;
    	padding: 8px 0 9px 0;
    	line-height: 23px;
    	color: #444;
    	font-size: 12px;
	}
	.basic_option {
    	width: 240px;
    	height: 21px;
    	line-height: 21px;
    	border: 1px solid #e6e6e6;
    	float: left;
    	color: #444;
    	font-size: 12px;
	}
	.opt-btns {
    	position: relative;
    	width: 87px;
    	line-height: 23px;
    	height: 23px;
    	overflow: hidden;
	}
	.opt-btns > .btn-up {
    	margin: 0;
    	padding: 0;
    	position: absolute;
    	right: 0;
    	top: 0;
	}
	.opt-btns > .btn-dw {
    	margin: 0;
    	padding: 0;
    	position: absolute;
    	left: 0;
    	top: 0;
	}
	table > img {
    	vertical-align: middle;
	}
	#productDetail > .prd-btns > a{
		display: inline-block;
	} 
	.bc_wish_img{
		margin-right: 1%;
    	width: 120px;
    	height: 60px;
    	line-height: 62px;
    	background: #fff;
    	border: 1px #272727 solid;
    	color: #3e4348;
    	font-size: 16px;
    	font-weight: 500;
    	text-align: center;
	}
	.bc_wish_img > img{
		float: left;
		margin-top: 6px;
	}
	.bc_cart_img{
	    margin-right: 1%;
    	width: 120px;
    	height: 62px;
    	line-height: 62px;
    	background: #5c5c5c;
    	border: 1px #5c5c5c solid;
    	color: #fff;
    	font-size: 16px;
    	font-weight: 500;
    	text-align: center;
	}
	.bc_cart_img > img{
		float: left;
		margin-top: 6px;
	}
	.bc_buy_img{
		width: 185px;
   		height: 62px;
    	line-height: 62px;
    	background: #1f2022;
    	border: 1px #1f2022 solid;
    	color: #fff !important;
    	font-size: 16px;
    	font-weight: 500;
    	text-align: center;
	}
	.bc_buy_img > img{
		float: left;
		margin-top: 6px;
	}
	.prd-btns> a {
   	 	display: inline-block;
	}
	
</style>
</head>
<body>
		<div id="contentWrapper">
			<div id="contentWrap">
				<div id="content">
					<div id="productDetail">
						<dl class="loc_navi clear mb_20">
                        <dt class="dis_none fl"></dt>
                        	<dd class="mt_0 fr">
                        	<a href="#" class="home">Home</a>&gt; 
                        	<a href="#">ADULTS</a>&gt; 
                        	<a href="#">디지털</a> &gt; 
                        	<strong>마블 스마트 체중계</strong>
                        	</dd>
                    	</dl>
						<div class="page-body">
							<div class="thumb-info clear">
								<div class="thumb-wrap">
									<div class="thumb">
										<div class="zoom_img">
											<a id="zoom_image"> <img class="detail_image"
												id="lens_img" src="img/상품/마블 체중계.jpg" border="0" width="300">
											</a>
										</div>
									</div>
								</div>
								<form>
									<div class="info">
										<div class="detail_name">
											<p class="ml_20 ff_nanumB">
												"마블 스마트 체중계&nbsp;" <span class="MK-product-icons"> <img
													class="MK-product-icon-1" src=""> <img
													class="MK-product-icon-3" src="">
												</span>
											</p>
											<h3 class="ml_20 ff_nanumB">마블 스마트 체중계</h3>
										</div>
										<div class="table-opt">
											<table>
												<caption>상품옵션</caption>
												<tbody>
													<tr>
														<th scope="row">
															<div class="tb-left">판매가</div>
														</th>
														<td class="price">
															<div class="tb-left">29000원</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">적립금</div>
														</th>
														<td>
															<div class="tb-left">3%</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">브랜드</div>
														</th>
														<td>
															<div class="tb-left">디즈니</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">상품코드</div>
														</th>
														<td>
															<div class="tb-left">029001000028</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">제조사</div>
														</th>
														<td>
															<div class="tb-left">쩰리(주)</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">모델</div>
														</th>
														<td>
															<div class="tb-left">9808687010165</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">원산지</div>
														</th>
														<td>
															<div class="tb-left">상상의나라</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<div class="tb-left">재고</div>
														</th>
														<td>
															<div class="tb-left">꿈에서만큼은 무한</div>
														</td>
													</tr>
													<tr>
														<td colspan="2" class="pt_0 pb_0">
															<div class="opt-wrap">
																<dl class="opt">
																	<dt class="choose">선택</dt>
																	<dd>
																		<select name="optionlist[]" label="선택"
																			opt_type="SELECT" opt_id="1" class="basic_option">
																			<option value="">옵션 선택</option>
																			<option value="0" title="아이언맨" matrix="1"
																				sto_id="0">아이언맨</option>
																			<option value="1" title="캡틴쉴드" matrix="2"
																				sto_id="0">캡틴쉴드</option>
																			<option value="2" title="마블코믹스" matrix="3" 
																				sto_id="0">마블코믹스</option>
																		</select>
																	</dd>
																</dl>
																<dl>
																	<dt class="choose">수량</dt>
																	<dd>
																		<div class="opt-btns">
																			<input type="text" id="MS_amount_basic_0"
																				name="amount[]" value="1" class="MS_amount_basic"
																				size="4">
																			<a href="#"> 
																				<img class="btn-up" src="img/btn_count_up.gif" alt="수량증가" title="수량증가">
																			</a> 
																			<a href="#"> 
																				<img class="btn-dw" src="img/btn_count_down.gif" alt="수량감소" title="수량감소">
																			</a>
																		</div>
																	</dd>
																</dl>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="prd-btns mt_20 pt_20">
											<a href="#" class="bc_wish_img">
												<img src="img/wish_list.png" width="26.5%" height="50px" >
												위시리스트</a>
											<a href="#" class="bc_cart_img" >
												<img src="img/shopping-cart.png" width="26.5%" height="50px" >
												장바구니</a>
											<a href="#" class="bc_buy_img">
												<img src="img/credit-card.png" width="26.5%" height="50px" >
												바로구매</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>