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
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<h2>게시글 목록</h2>
	<c:choose>
		<c:when test="${sessionScope.sessionId != null}">
			<a href="${path}/board/insert">게시글 작성</a>
		</c:when>
	</c:choose>
	<br>
	<br>
	<div class="container">
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성날짜</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="board" items="${boards}">
				<tr>
					<td>${board.boardNo}</td>
					<td>
						<a href="${path}/board/detail?boardNo=${board.boardNo}">${board.boardTitle}</a>
					</td>
					<td>${board.memberId}</td>
					<td>${board.boardDate}</td>
					</td>
					<td>
						<a href="${path}/board/modify?boardNo=${board.boardNo}">수정</a>
					</td>
					<td>
						<a href="${path}/board/delete?boardNo=${board.boardNo}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section>
</body>
</html>
