<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="isLogin" value="${sessionScope.sessionLevel > 0}" />
<div id="replyFormDiv" class="p-3">
	<form id="replyForm" action="${path}/board/reply/insert" method="post">
		<input type="hidden" name="boardNo" value="${board.boardNo}" />
		<input type="hidden" name="memberId" value="${sessionScope.sessionId}" />
		<div class="row">
			<div class="col-11 px-0 form-group">
				<c:choose>
					<c:when test="${isLogin}">
						<textarea class="form-control" name="replyBody" rows="3" placeholder="댓글을 입력하세요"></textarea>
					</c:when>
					<c:otherwise>
						<textarea class="form-control" name="replyBody" rows="3" placeholder="로그인이 필요한 기능입니다." disabled></textarea>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-1 px-1 d-flex align-items-center">
				<c:choose>
					<c:when test="${isLogin}">
						<button type="submit" class="btn btn-primary px-0 w-100 h-100">등록</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-primary px-0 w-100 h-100" disabled>등록</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form>
</div>
