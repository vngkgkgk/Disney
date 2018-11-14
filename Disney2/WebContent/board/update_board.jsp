<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
<style type="text/css">
body{
	padding-top: 300px;

}
	.container {
    	width: 1140px;
    	max-width: 100%;
    	margin: 0 auto;
	}
	.fsp-container, .body {
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
    	background-color: transparent;
	}
	tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.form-table > th {
    width: 21rem;
    padding: 1rem 1.5rem;
    font-weight: 400;
    vertical-align: top;
    letter-spacing: -0.3px;
    border-bottom: 1px solid #cccccc;
    word-break: keep-all;
}
th {
    text-align: left;
}
 .form-table td {
    letter-spacing: -0.3px;
    border-bottom: 1px solid #cccccc;
    word-break: keep-all;
    width: 60rem;
}
td, th {
    display: table-cell;
    vertical-align: inherit;
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
}   
.error{
	padding-left:20px;
	color: red;
	font-size: 14px;
	display: none;
}
	
</style>
<script type="text/javascript" src="<%=path%>/smartAditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).on("click","#btn_in",function(elClickedObj){
		var title = $("#title").val();
		//스마트 에디터로 content 부분 값 넘겨받는 부분
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
		if(title==""){
			$("#title").focus();
			$(".error").css("display","block");
			return false;
		}
		$("#write_form").submit();
	});
	
	$(document).on("change","#uploadfile",function(){
		var filesize = $(this)[0].files; /* file들을 첨부할 수 있으니 (배열) */
		if(filesize.length < 1){
			$("#file-name").text("선택된 파일 없음");
			$("#close_btn").css("display","none");
		}else{
			var filename = this.files[0].name;
			var filesize = this.files[0].size;
			
			var size = this.files[0].size;
			var maxSize = 10*1024*1024;
			if(size > maxSize){
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다");
				$("#file-name").text("선택된 파일 없음");
				/* 화면단에서는 input type ="file" 용량제한 하는 코드 없음 
				그래서 경고창은 뜨지만 실제 10mb넘는 파일이 들어가 잇음
				반드시 초기화를 시켜서 지워 줄것 !! 안그러면 Action단에서 에러발생 */
				$("#uploadfile").val("");
				
			}
		}
	});
	
	
	

</script>
</head>
<body>
	<div class="container">
		<span>질문 게시판</span>
		<!--=================================================
						바디
		==================================================-->
		<div class="board-body">
			<div class="fsp-container body">
				<form id="write_form" action="boardInsertPlay.bizpoll" method="post" enctype="multipart/form-data">
					<table class="form-table">
						<tbody><tr>
							<th>작성자</th>
							<td>
								<input type="text" class="form-control valid_input" name="bc_writer_name" value="${sessionScope.loginUser.id}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="title" class="form-control valid_input" name="bc_title" value="${boardview.title}">
								<span class="error">필수 정보입니다.</span>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea class="post_ckeditor" name="content" id="content">${boardview.content}
							</textarea>
						</tr>
						<tr>
							
						</tr>
					</tbody>
					</table>
					<div>
							<input type="button" class="btn btn-file" value="파일선택">
							<input type="button" class="btn btn-file" value="파일선택">
								<span class="files" id="file-name" style="height:29px;border:none;">${boardview.filename}</span>
								<input type="hidden" id="post-file-name" name = "post-file-name" value="${boardview.filename}">
								
								
								<c:if test="${boardview.filesize>0}">
									<i class="fa fa-close" id="close_btn" style="display:inline-block"></i>
								</c:if>
								<input type="hidden" id="now-file-name" name="now-file-name">
								<input type="hidden" id="now-file-size" name="now-file-size">
					<input type="file" name="uploadfile" id="uploadfile">
					<input type="file" name="uploadfile" id="uploadfile">
					</div>
					
					
				</form>
			</div><!--/.fsp-container-->
		</div><!--/.board-body-->

		<!--=================================================
						푸터
		==================================================-->
		<div class="board-footer">
			<div class="fsp-container text-right">
				<a href="#">
					<button type="button" id="btn_in" class="btn btn-lg submit_btn color-btn txt-h5" >
					수정</button>
				</a>
				
				<button type="button" class="btn btn-lg submit_btn color-btn txt-h5" data-form="write_form">
				취소</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef:oEditors,
			elPlaceHolder:"content",
			sSkinURI:"<%=path%>/smartAditor/SmartEditor2Skin.html",
			fCreator:"createSEditor2"	
		});
	</script>
</body>
</html>