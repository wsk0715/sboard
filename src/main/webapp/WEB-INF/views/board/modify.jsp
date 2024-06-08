<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>게시글 수정</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<h2 class="text-center mt-5">게시글 수정</h2>
				<form action="${path}/board/modify" method="post">
					<input type="hidden" name="boardNo" value="${board.boardNo}" />
					<input type="hidden" name="memberId" value="${board.memberId}" />
					<input type="hidden" name="boardDate" value="${board.boardDate}" />
					<div class="form-group">
						<label for="boardTitle">제목</label>
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle}">
					</div>
					<div class="form-group">
						<label for="boardBody">내용</label>
						<textarea class="form-control" id="boardBody" name="boardBody" rows="10">${board.boardBody}</textarea>
					</div>
					<br>
					<div class="row text-center">
						<div class="col-3"></div>
						<div class="col-3 px-0">
							<button type="submit" class="px-3 btn btn-primary btn-block">등록</button>
						</div>
						<div class="col-3 px-0">
							<button type="button" class="px-3 btn btn-secondary btn-block" onclick="location.href='${path}/board/list'">취소</button>
						</div>
						<div class="col-3"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script src="${path}/resources/script/validation/validateBoard.js"></script>
<script>
	$(document).ready(function () {
		$('#boardForm').submit(function () {
			if (!checkBoardTitle()) {
				return false;
			}
			if (!checkBoardBody()) {
				return false;
			}
		});
	});
</script>
</body>
</html>
