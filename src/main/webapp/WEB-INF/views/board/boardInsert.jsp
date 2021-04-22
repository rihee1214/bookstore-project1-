<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<link href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.min.js"></script>
<style type="text/css">
	#sample{
		display:none;
	}
</style>
</head>
<script type="text/javascript">
window.history.forward();
function noBack(){
	window.history.forward();
}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
		<h2>${pager.boardsp}작성</h2>
		<form id="frm" action="./boardInsert" method="post" enctype="multipart/form-data">
			<input type="hidden" readonly="readonly" name="boardsp" value="${pager.boardsp}">
			<div class="form-group">
				<label for="writer">Writer:</label> 
				<input type="text" readonly="readonly" value="${member.id}"
						class="form-control frmCheck" id="id" name="id">
			</div>
			<div class="form-group">
				<label for="subname">Title:</label> 
				<c:if test="${pager.boardsp eq 'qna'}">
					<select name="subname" class="frmCheck form-select form-select-sm" aria-label=".form-select-sm example">
						<option value="반품, 교환, 환불">반품, 교환, 환불</option>
						<option value="주문, 결제">주문, 결제</option>
						<option value="중고장터 신고">중고장터 신고</option>
						<option value="서비스, 기타">서비스, 기타</option>
					</select>
				</c:if>
				<c:if test="${pager.boardsp ne 'qna'}">
					<input type="text" name="subname" class="frmCheck">
				</c:if>
			</div>

			<div class="form-group">
				<label for="content">Content:</label>
				<textarea class="form-control frmCheck" rows="10" id="content" name="content"></textarea>
			</div>
			<input type="hidden" readonly="readonly" name="name" value="${pager.boardsp}" id="forimageupload">
			<input type="button" id="btn" value="WRITE" class="btn btn-primary">
		</form>
	</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/summernote.js"></script>
</body>
</html>