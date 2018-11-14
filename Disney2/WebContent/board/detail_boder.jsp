<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.container {
    padding-right: 15px;
    padding-left: 15px;
    position: relative;
    margin-left: auto;
    margin-right: auto;
    width: 1140px;
    max-width: 100%;
    }
    .top-header {
    margin: 80px 0 0 0;
}
.header-board {
    font-size: 22px;
    font-weight: 500;
    letter-spacing: -0.4px;
}
.body {
    padding: 0;
    margin: 0 0 20px 0;
    border-top: 1px solid #171717;
    border-bottom: 1px solid #ccc;
}
.form-table {
    border: none;
}
table {
    border-collapse: collapse;
    border-top: 1px solid #444444;
}
.form-table > th {
    width: 21rem;
    padding: 1rem 1.5rem;
    font-weight: 400;
    vertical-align: top;
}
th{
    text-align: left;
    width: 100px;
}
th, td{
	border-bottom: 1px solid #444444;
	padding: 10px;
}
.form-table > td {
    letter-spacing: -0.3px;
    border-bottom: 1px solid #cccccc;
    word-break: keep-all;
        width: 60rem;
    
}
.form-control {
    padding-top: 6px;
    border-radius: 0;
    border: 1px solid #DDDDDD;
    display: block;
    width: 100%;
    padding: .5rem .75rem;
    font-size: 1rem;
    line-height: 1.25;
    color: #464a4c;
    background-color: #fff;
    background-image: none;
    background-clip: padding-box;
}
#bcontent{
	height: 80px;
}
.fsp-container{
	display: inline-block;
	}
	.board-footer{
		display: inline-block;
	}
</style>
<script type="text/javascript">

	$(document).on("click","#boardupdate",function(){
		location.href="boardUpdate.bizpoll?bno=${boardview.bno}";
	});
</script>

</head>
<body>
	<div class="container">
		<!--=================================================
						헤더
		==================================================-->
		<div class="board-header">
			<div class="fsp-container">
				<!--#####===== 탑 헤더 =====#####-->
				<div class="top-header">
					<div class="d-flex align-items-center justify-content-start">
						<div class="header-board">Q&amp;A</div>
					</div>
				</div>
			</div><!--/.fsp-container-->
		</div><!--/.board-header-->

		<!--=================================================
						바디
		==================================================-->
		<div class="board-body">
			<div class="fsp-container body">
				<table class="form-table">
					<tbody>
						<tr>
							<th>글 번호</th>
							<td colspan="3">
								<span>${boardview.bno}번 글</span>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">
								<span>${boardview.title}</span>
							</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${boardview.regdate}"/>
							</td>
							<th>조회수</th>
							<td>${boardview.viewcnt}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<span>${boardview.writer}</span>
							</td>
							<th>첨부파일</th>
							<td>
							<c:if test="${bDto.filesize>0}">
								<a href="download.bizpoll?file=${boardview.filename}">${boardview.filename}
								(<fmt:formatNumber pattern="0.0" value="${boardview.filesize/1024}"/> byte)</a>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td id="bcontent" colspan="4">
								<span>${boardview.content}</span>
							</td>
						</tr>

					</tbody>
				</table>

					<div class="add_data_wrap" data-prefix="bc" data-sub="7" data-idx="" data-layout="add_form"></div>
			
			</div><!--/.fsp-container-->
		</div><!--/.board-body-->

		<!--=================================================
						푸터
		==================================================-->
		<div class="board-footer">
			<div class="fsp-container text-right">
				<button type="button" class="btn btn-lg submit_btn color-btn txt-h5">등록</button>
			</div>
			<div class="fsp-container text-right">
				<button type="button" class="btn btn-lg submit_btn color-btn txt-h5">목록</button>
			</div>
			<c:if test="${sessionScope.loginUser.id==boardview.writer}">
				<button type="button" class="btn btn-lg submit_btn color-btn txt-h5" id="boardupdate">수정</button>
				<button type="button" class="btn btn-lg submit_btn color-btn txt-h5">삭제</button>
			</c:if>
		
		</div>
		<div><!-- 댓글 -->
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<!-- 로그인 안됬을 때 디자인 출력 -->
				</c:when>
				<c:otherwise>
					<!-- 로그인 됬을 때 디자인 출력 -->
				</c:otherwise>
			
			</c:choose>
		</div>
	</div>
				
	
</body>
</html>