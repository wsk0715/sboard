<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- header start-->
<h1>
	<a href="${path}/">sboard</a>
</h1>
<ul>
	<c:choose>
		<c:when test="${sessionScope.sessionId != null}">
			<li>
				<a href="${path}/member/logout">로그아웃</a>
			</li>
			<li>
				<a href="${path}/member/list">회원 목록</a>
			</li>
			<li>
				<a href="${path}/board/insert">게시글 작성</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="${path}/member/login">로그인</a>
			</li>
			<li>
				<a href="${path}/member/register">회원 가입</a>
			</li>
		</c:otherwise>
	</c:choose>
	<li>
		<a href="${path}/board/list">게시글 목록</a>
	</li>
</ul>
<!-- header end -->
