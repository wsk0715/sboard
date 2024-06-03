<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.sessionId}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>sboard</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<c:choose>
	<c:when test="${sessionScope.sessionId != null}">
		<p><c:out value="${sessionId}" />님 환영합니다.</p>
	</c:when>
	<c:otherwise>
		<p>로그인해주세요.</p>
	</c:otherwise>
</c:choose>
</body>
</html>
