<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="list-group reply-list">
	<c:forEach var="reply" items="${replies}">
		<c:set var="isSelf" value="${sessionScope.sessionId == reply.memberId}" />
		<c:set var="isAdmin" value="${sessionScope.sessionLevel > 1}" />
		<div class="list-group-item rounded mt-3" style="position: relative;">
			<p>${reply.replyBody}</p>
			<small class="text-muted">
				<a href="${path}/board/list?searchType=m_id&searchValue=${reply.memberId}"><b>${reply.memberId}</b></a>
				| ${reply.replyDate}
			</small>
			<c:if test="${isSelf || isAdmin}">
				<div class="text-right" style="position: absolute; top: 1.5rem; right: 0.5rem">
					<a id="deleteBtn" href="${path}/board/reply/delete?replyNo=${reply.replyNo}" class="btn btn-danger btn-m">삭제</a>
				</div>
			</c:if>
		</div>
	</c:forEach>
</div>
