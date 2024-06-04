<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div>
	<form action="${path}/board/reply/insert" method="post">
		<table>
			<tr>
				<td>
					<textarea name="replyBody"></textarea>
				</td>
				<td>${sessionScope.sessionId}</td>
				<td>
					<button type="submit">등록</button>
				</td>
				<input type="text" name="boardNo" value="${board.boardNo}" readonly hidden />
				<input type="text" name="memberId" value="${sessionScope.sessionId}" readonly hidden />
			</tr>
		</table>
	</form>
</div>