<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="isSelf" value="${sessionScope.sessionId == board.memberId}" />
<c:set var="isAdmin" value="${sessionScope.sessionLevel > 1}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>게시글 상세</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
	<style>
		#headDiv {
			position: relative;
		}

		#board-list-btn {
			position: absolute;
			left: 1rem;
			top: 0.5rem;
		}

		#button-container {
			position: absolute;
			right: 1rem;
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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="container px-0">
					<div id="headDiv">
						<div id="board-list-btn">
							<a href="${path}/board/list">목록</a>
						</div>
						<h2 class="text-center mt-5">게시글 상세</h2>
						<c:if test="${isSelf || isAdmin}">
							<div id="button-container">
								<a href="${path}/board/modify?boardNo=${board.boardNo}" class="btn btn-warning">수정</a>
								<a id="deleteBtn" href="${path}/board/delete?boardNo=${board.boardNo}" class="btn btn-danger">삭제</a>
							</div>
						</c:if>
					</div>
				</div>
				<div id="mainDiv" class="mt-4">
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
							<pre>${board.boardBody}</pre>
						</div>
					</div>
				</div>
			</div>
			<div id="replyDiv" class="mt-4">
				<h3>댓글</h3>
				<div id="replyWrite">
					<%@ include file="/WEB-INF/views/board/reply/insert.jsp" %>
				</div>
				<div id="replyList">
					<%@ include file="/WEB-INF/views/board/reply/list.jsp" %>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${path}/resources/script/crud/delete.js"></script>
</body>
</html>
