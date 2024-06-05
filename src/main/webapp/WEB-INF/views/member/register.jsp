<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원 가입</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<h2>회원 가입</h2>
	<div class="container">
		<form action="${path}/member/register" method="post">
			<input type="text" name="memberNo" value="${memberNo}" readonly hidden />
			<table>
				<tr>
					<td>
						아이디
					</td>
					<td>
						<input type="text" name="memberId" />
					</td>
				</tr>
				<tr>
					<td>
						비밀번호
					</td>
					<td>
						<input type="password" name="memberPw" />
					</td>
				</tr>
				<tr>
					<td>
						이름
					</td>
					<td>
						<input type="text" name="memberName" />
					</td>
				</tr>
				<tr>
					<td>
						이메일
					</td>
					<td>
						<input type="text" name="memberEmail" />
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='${path}/member/list'">취소</button>
		</form>
	</div>
</section>
</body>
</html>
