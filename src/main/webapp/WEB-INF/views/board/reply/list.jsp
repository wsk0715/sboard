<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="container">
	<table>
		<tr>
			<td>댓글</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="reply" items="${replies}">
			<tr>
				<td>${reply.replyBody}</td>
				<td>${reply.memberId}</td>
				<td>${reply.replyDate}</td>
				<td>
					<a href="${path}/board/reply/delete?replyNo=${reply.replyNo}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
