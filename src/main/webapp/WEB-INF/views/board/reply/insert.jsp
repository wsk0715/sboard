<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="container reply-write">
	<h3>댓글</h3>
	<form action="${path}/board/reply/insert" method="post">
		<input type="hidden" name="boardNo" value="${board.boardNo}" />
		<input type="hidden" name="memberId" value="${sessionScope.sessionId}" />
		<div class="row">
			<div class="col-11 px-0 form-group">
				<textarea class="form-control" name="replyBody" rows="3" placeholder="댓글을 입력하세요"></textarea>
			</div>
			<div class="col-1 px-1 d-flex align-items-center">
				<button type="submit" class="btn btn-primary px-0 w-100 h-100">등록</button>
			</div>
		</div>
	</form>
</div>
