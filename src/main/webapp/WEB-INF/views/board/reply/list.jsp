<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="list-group reply-list">
	<c:forEach var="reply" items="${page.elements}">
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
					<a href="${path}/board/reply/delete?replyNo=${reply.replyNo}" class="deleteBtn btn btn-danger btn-m">삭제</a>
				</div>
			</c:if>
		</div>
	</c:forEach>
	<div id="pageDiv" class="container d-flex justify-content-center mt-4 mb-5">
		<ul class="pagination">
			<!-- 첫 페이지 버튼 -->
			<c:choose>
				<c:when test="${page.currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${path}/board/detail?boardNo=${param.boardNo}&pageValue=${1}">
							<span>&laquo;&laquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<span class="page-link">&laquo;&laquo;</span>
					</li>
				</c:otherwise>
			</c:choose>
			<!-- 화살표 버튼(이전) -->
			<c:choose>
				<c:when test="${page.currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${path}/board/detail?boardNo=${param.boardNo}&pageValue=${page.currentPage - 1}">
							<span>&laquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<span class="page-link">&laquo;</span>
					</li>
				</c:otherwise>
			</c:choose>
			<%-- 페이지 버튼 --%>
			<c:forEach var="i" begin="${page.beginPage}" end="${page.endPage}">
				<li class="page-item ${i == page.currentPage ? 'active' : ''}">
					<a class="page-link" href="${path}/board/detail?boardNo=${param.boardNo}&pageValue=${i}">
							${i}
					</a>
				</li>
			</c:forEach>
			<%-- 빈 페이지 --%>
			<c:if test="${page.endPage < page.beginPage + 4}">
				<c:forEach var="j" begin="1" end="${page.beginPage + 4 - page.endPage}">
					<li class="page-item disabled">
						<a class="page-link" href="#">&nbsp;</a>
					</li>
				</c:forEach>
			</c:if>
			<!-- 화살표 버튼(다음) -->
			<c:choose>
				<c:when test="${page.currentPage < page.maxPage}">
					<li class="page-item">
						<a class="page-link" href="${path}/board/detail?boardNo=${param.boardNo}&pageValue=${page.currentPage + 1}">
							<span>&raquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<span class="page-link">&raquo;</span>
					</li>
				</c:otherwise>
			</c:choose>
			<!-- 마지막 페이지 버튼-->
			<c:choose>
				<c:when test="${page.currentPage < page.maxPage}">
					<li class="page-item">
						<a class="page-link" href="${path}/board/detail?boardNo=${param.boardNo}&pageValue=${page.maxPage}">
							<span>&raquo;&raquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<span class="page-link">&raquo;&raquo;</span>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
