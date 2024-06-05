<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="isLogin" value="${sessionScope.sessionLevel > 0}" />
<div class="list-group reply-list">
	<c:forEach var="reply" items="${replies}">
		<br>
		<div class="list-group-item rounded" style="position: relative;">
			<p>${reply.replyBody}</p>
			<small class="text-muted"><b>${reply.memberId}</b> | ${reply.replyDate}</small>
			<c:if test="${isLogin}">
				<div class="text-right" style="position: absolute; top: 1.5rem; right: 0.5rem">
					<a href="${path}/board/reply/delete?replyNo=${reply.replyNo}" class="btn btn-danger btn-m">삭제</a>
				</div>
			</c:if>
		</div>
	</c:forEach>
</div>
