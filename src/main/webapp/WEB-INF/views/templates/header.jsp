<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- header start-->
<h1>
	<a href="${path}/">Hello world!</a>
</h1>
<ul>
	<li>
		<a href="${path}/member/login">로그인</a>
	</li>
	<li>
		<a href="${path}/member/register">회원가입</a>
	</li>
	<li>
		<a href="${path}/member/list">회원목록</a>
	</li>
	<li>
		<a href="${path}/board/list">글 목록</a>
	</li>
	<li>
		<a href="${path}/board/insert">글 작성</a>
	</li>
</ul>
<!-- header end -->
