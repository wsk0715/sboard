<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- header start-->
<header>
	<div class="container">
		<div class="row align-items-center">
			<h1 class="col-3">
				<a href="${path}/">sboard</a>
			</h1>
			<ul class="col-9 row">
				<c:choose>
					<c:when test="${sessionScope.sessionId != null}">
						<li class="col-2 px-0">
							<a href="${path}/member/logout">로그아웃</a>
						</li>
						<c:if test="${sessionScope.sessionLevel > 1}">
							<li class="col-2 px-0">
								<a href="${path}/member/list">회원 목록</a>
							</li>
						</c:if>
					</c:when>
					<c:otherwise>
						<li class="col-2 px-0">
							<a href="${path}/member/login">로그인</a>
						</li>
						<li class="col-2 px-0">
							<a href="${path}/member/register">회원 가입</a>
						</li>
					</c:otherwise>
				</c:choose>
				<li class="col-2 px-0">
					<a href="${path}/board/list">게시글 목록</a>
				</li>
			</ul>
		</div>
	</div>
</header>
<br>
<hr>
<!-- header end -->
