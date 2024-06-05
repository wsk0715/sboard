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
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<h2>게시글 상세</h2>
	<div class="container">
		<table>
			<tr>
				<td>
					게시글번호
				</td>
				<td>
					<div id="boardNo">${board.boardNo}</div>
				</td>
			</tr>
			<tr>
				<td>
					작성자
				</td>
				<td>
					<div id="memberId">${board.memberId}</div>
				</td>
			</tr>
			<tr>
				<td>
					제목
				</td>
				<td>
					<div id="boardTitle">${board.boardTitle}</div>
				</td>
			</tr>
			<tr>
				<td>
					내용
				</td>
				<td>
					<div id="boardBody">${board.boardBody}</div>
				</td>
			</tr>
			<tr>
				<td>
					날짜
				</td>
				<td>
					<div id="boardDate">${board.boardDate}</div>
				</td>
			</tr>
			<tr>
				<td>
					<a href="${path}/board/modify?boardNo=${board.boardNo}">수정</a>
				</td>
				<td>
					<a href="${path}/board/delete?boardNo=${board.boardNo}">삭제</a>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<div>
		<h3>댓글</h3>
		<%@ include file="/WEB-INF/views/board/reply/insert.jsp" %>
		<%@ include file="/WEB-INF/views/board/reply/list.jsp" %>
	</div>
</section>
</body>
</html>
