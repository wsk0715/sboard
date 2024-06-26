<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>게시글 작성</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<h2 class="text-center mt-5">게시글 작성</h2>
				<div id="boardFormDiv">
					<form id="boardForm" action="${path}/board/insert" method="post">
						<input type="text" name="boardNo" value="${boardNo}" readonly hidden />
						<input type="text" name="memberId" value="${sessionScope.sessionId}" readonly hidden />
						<div class="form-group">
							<label for="boardTitle">제목</label>
							<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요">
						</div>
						<div class="form-group">
							<label for="boardBody">내용</label>
							<textarea class="form-control" id="boardBody" name="boardBody" rows="10" placeholder="내용을 입력하세요"></textarea>
						</div>
						<div class="row text-center mt-4">
							<div class="col-4"></div>
							<div class="col-2 px-0">
								<button type="submit" class="px-3 btn btn-primary btn-block">등록</button>
							</div>
							<div class="col-2 px-0">
								<button type="button" class="px-3 btn btn-secondary btn-block" onclick="location.href='${path}/board/list'">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
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
		$('#replyForm').submit(function () {
			if (!checkReplyBody()) {
				return false;
			}
		});
	});
</script>
</body>
</html>
