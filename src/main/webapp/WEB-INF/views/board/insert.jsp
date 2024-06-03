<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Register</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<h1>게시글 작성 화면</h1>
<form action="${path}/board/insert" method="post">
	<div>
		<table>
			<tr>
				<td>
					게시글번호
				</td>
				<td>
					<input type="text" name="boardNo" value="${boardNo}" readonly />
				</td>
			</tr>
			<tr>
				<td>
					작성자
				</td>
				<td>
					<input type="text" name="memberId" value="${sessionScope.sessionId}" readonly />
				</td>
			</tr>
			<tr>
				<td>
					제목
				</td>
				<td>
					<input type="text" name="boardTitle" />
				</td>
			</tr>
			<tr>
				<td>
					내용
				</td>
				<td>
					<textarea name="boardBody"></textarea>
				</td>
			</tr>
		</table>
		<br>
		<button type="submit">등록</button>
		<button type="button" onclick="location.href='${path}/board/list'">취소</button>
	</div>
</form>
</body>
</html>
