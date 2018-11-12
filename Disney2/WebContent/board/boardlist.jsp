<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');

* {
	font-family: 'Poor Story', cursive;
	box-sizing: border-box;
}

body {
	padding-top: 300px;
	margin: 0;
	background-color: white;
}

a {
	text-decoration: none;
	color: inherit;
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
li{
	display: inline-block;
	text-decoration: none;
}
.srch-wrap {
    margin: 25px 0 10px 0;
    width: 100%;
}
.text-right {
    text-align: right;
}
.justify-content-end {
	justify-content: flex-end!important;
	-webkit-box-pack: end!important;
}
.d-flex {
    display: flex!important;
}
select {
    height: 39px !important;
    padding: 0 15px;
    font-size: 16px;
    vertical-align: 0px;
}
.d-inline-block {
    width: auto;
    display: inline-block!important;
}
.form-control {
    line-height: 1.25;
    color: #464a4c;
    background-color: #fff;
    background-image: none;
    background-clip: padding-box;
}
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
.srch-wrap > input {
    width: 30%;
    height: 39px;
    padding: 0 17px;
    margin: 0 4px;
    font-size: 16px;
    border: 1px solid #d2d2d2;
}
button {
    width: 7%;
    height: 39px;
    vertical-align: -1px;
    padding: 0 16px;
    color: #fff;
    background-color: #111;
}
#name{
	font-size: 30px;
	font-weight: 700;
	margin: 0 auto;
}
.text-right{
	text-align: right;
	box-sizing: inherit;
}

.pagination-wrap{
	text-align: center;
	padding: 20px 0 0;
}
.pagination{
	justify-content: center;
	display: flex;
    padding-left: 0;
    list-style: none;
    border-radius: .25rem;
}
.page-item{
	border: 1px solid #d7d5d5;
	position: relative;
    display: block;
    margin-left: -1px;
    line-height: 1.25;
    background-color: #fff;
    border-radius: 50px;
}
.board_btn{
	font-size: 18px;
	display: inline-block;
    font-weight: 400;
    line-height: 1.25;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    width: auto;
    padding: 10px 2%;
    color: #111;
    border: 1px solid #ccc;
    background-color: #fff;
    margin: 10px 0 0 0;
    }
    .pagination > li>.this{
   		padding-bottom: 9px;
    	border-bottom: 0px solid #555;
    	color: #888;
    	font-weight: 700;
    	border-radius: 50px;
    }
    .pagination > li>a{
    	display: block;
    	width: auto;
    	min-width: 30px;
    	padding: 9px 0;
    	font-weight: 400;
    	color: #939393;
    	line-height: 14px;
    	background: #fff;
    }
  .pagecolor{
    	background: #f0f2f2;
    }
    

</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(document).on("click","#search_btn",function(){
		var flag=$("#sel_no").val();
		var keyword = $("#search_key").val();
		location.href="boardList.bizpoll?flag="+flag+"&keyword="+keyword;
	});
});
	
</script>
</head>
<body>
	<div id="content_layout">
		<!-- <header>
			<div id="header_div">
				<a href="#"> <img alt="q&a" src="img/풍선.png" width="100%">
				</a>
				<strong id="name">게시판</strong>
			</div>
		</header> -->
		<!-- post값은 안에 내용 안보이게 보내는것   -->
		<div class="srch-wrap text-right d-flex justify-content-end">
			<select id="sel_no" class="form-control d-inline-block srch_key txt-h5 ls-05">
				<option >-조건선택-</option>
                <option value="1" >제목</option>
                <option value="2">내용</option>
                <option value="3">제목+내용</option>
                <option value="4" >작성자</option>
            </select>
            <input type="text" id="search_key" class="form-control d-inline-block srch_text txt-h5 ls-05" value="" placeholder="검색어를 입력해주세요.">
			<button type="button" id="search_btn" class="btn btn-default d-inline-block srch_btn color-btn txt-h5 ls-1">검색</button>
			<ul>
				<li><a>최신순</a></li>
				<li>조회순</li>
				<li>추천순</li>
				<li>댓글순</li>
			</ul>
		</div>
		<table>
			<thead>
				<tr>
					<th scope="row">번호</th>
					<th scope="row">제목</th>
					<th scope="row">작성자</th>
					<th scope="row">작성일</th>
					<th scope="row">첨부파일</th>
					<th scope="row">조회수</th>
				</tr>
			<tbody>
				<c:forEach items="${boardList}" var="bDto">
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
					<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
					<tr>
						<td>${bDto.bno}</td>
						<td>
							<a href="boardViewCnt.bizpoll?bno=${bDto.bno}">${bDto.title}</a>
						<c:if test="${today2==regdate2}">
							<span class="new_time">
								<img alt="new" src="img/26.txt">
							</span>
						</c:if>
						</td>
						<td>${bDto.writer}</td>
						<td>
						<c:choose>
							<c:when test="${today2==regdate2}">
								<fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
							</c:otherwise>
						</c:choose>	
						</td>
						<td>
							<c:if test="${bDto.filesize>0}">
									<i class="fas fa-file-download"></i>
							</c:if>
						</td>
						<td>${bDto.viewcnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-right">
           total: ${pageMaker.totalCount}
        </div>
		<div class="text-right">
            <a href="boardInsert.bizpoll" class="board_btn" data-type="">글쓰기</a>
        </div>
        
		<div class="pagination-wrap custom-pagination">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a  class="this"
						href="boardList.bizpoll?page=${pageMaker.startPage-1}">&laquo;</a>
					</li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="idx">
					<li 
						<c:out value="${pageMaker.criDto.page==idx ? 'class=pagecolor':''}"/>>
						<a class="this" href="boardList.bizpoll?page=${idx}&flag=${flag}&keyword=${keyword}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="this"
						href="boardList.bizpoll?page=${pageMaker.endPage+1}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>