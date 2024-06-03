<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>List</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<h1>로그인</h1>
<form action="${path}/member/login" method="post">
	<div>
		<table>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="memberId">
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input type="password" name="memberPw">
				</td>
			</tr>
		</table>
		<br>
		<button type="submit">로그인</button>
		<button type="button" onclick="location.href='${path}/'">취소</button>
	</div>
</form>
</body>
</html>
