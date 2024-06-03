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
<h1>게시글 상세</h1>
<div>
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
				<a href="${path}/board/modify?boardNo=${board.boardNo}">수정</a>
			</td>
			<td>
				<a href="${path}/board/delete?boardNo=${board.boardNo}">삭제</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
