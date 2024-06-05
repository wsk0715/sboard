<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>게시글 목록</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
	<style>
		#main {
			position: relative;
		}

		#button-write {
			position: absolute;
			right: 0;
			top: 3rem;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container custom-container">
		<div class="row justify-content-center">
			<div id="main" class="col-md-12">
				<h2 class="text-center mt-5">게시글 목록</h2>
				<br>
				<c:choose>
					<c:when test="${sessionScope.sessionId != null}">
						<a id="button-write" href="${path}/board/insert" class="btn btn-primary">게시글 작성</a>
					</c:when>
				</c:choose>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead class="thead-dark">
						<tr>
							<th class="text-center">번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th class="text-center">수정</th>
							<th class="text-center">삭제</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="board" items="${boards}">
							<tr>
								<td class="text-center">${board.boardNo}</td>
								<td>
									<a href="${path}/board/detail?boardNo=${board.boardNo}">${board.boardTitle}</a>
								</td>
								<td>${board.memberId}</td>
								<td>${board.boardDate}</td>
								<td class="text-center">
									<a href="${path}/board/modify?boardNo=${board.boardNo}">수정</a>
								</td>
								<td class="text-center">
									<a href="${path}/board/delete?boardNo=${board.boardNo}">삭제</a>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>
