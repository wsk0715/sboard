<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>게시글 상세</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
	<style>
		#head {
			position: relative;
		}

		#button-container {
			position: absolute;
			right: 0;
			top: 0;
		}

		.custom-colname {
			font-weight: bold;
			width: 4rem;
		}

		.card-body > p {
			min-height: 8rem;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container px-0">
		<div id="head">
			<h2 class="text-center mt-5">게시글 상세</h2>
			<c:if test="${sessionScope.sessionId == board.memberId}">
				<div id="button-container">
					<a href="${path}/board/modify?boardNo=${board.boardNo}" class="btn btn-warning">수정</a>
					<a id="deleteBtn" href="${path}/board/delete?boardNo=${board.boardNo}" class="btn btn-danger">삭제</a>
				</div>
			</c:if>
		</div>
	</div>
	<br>
	<div id="main">
		<div class="card">
			<div class="card-body px-3">
				<div class="row mb-2">
					<div class="col-6 d-flex">
						<div class="custom-colname">작성자</div>
						<div class="flex-grow-1">${board.memberId}</div>
					</div>
					<div class="col-6 d-flex">
						<div class="custom-colname">작성일</div>
						<div class="flex-grow-1">${board.boardDate}</div>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-12 d-flex">
						<div class="custom-colname">제목</div>
						<div class="flex-grow-1">${board.boardTitle}</div>
					</div>
				</div>
				<hr>
				<p>${board.boardBody}</p>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	<%@ include file="/WEB-INF/views/board/reply/insert.jsp" %>
	<%@ include file="/WEB-INF/views/board/reply/list.jsp" %>
</section>
<script src="${path}/resources/script/crud/delete.js"></script>
</body>
</html>
