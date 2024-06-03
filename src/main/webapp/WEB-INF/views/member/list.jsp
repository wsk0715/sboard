<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원 목록</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<h1>회원 목록</h1>
<table>
	<tr>
		<td>회원번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	<c:forEach var="member" items="${members}">
		<tr>
			<td>${member.memberNo}</td>
			<td> ${member.memberId} </td>
			<td>${member.memberId}</td>
			<td>${member.memberName}</td>
			<td>${member.memberEmail}</td>
			<td>
				<a href="${path}/member/modify?memberNo=${member.memberNo}">수정</a>
			</td>
			<td>
				<a href="${path}/member/delete?memberNo=${member.memberNo}">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
