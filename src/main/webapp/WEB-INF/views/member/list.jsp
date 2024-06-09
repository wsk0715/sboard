<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원 목록</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
	<style>
		th {
			text-align: center;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container custom-container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<h2 class="text-center mt-5">회원 목록</h2>
				<div id="mainDiv" class="table-responsive mt-4">
					<table class="table table-bordered table-hover">
						<colgroup>
							<col style="width: 4rem;">
							<col style="width: auto;">
							<col style="width: 5rem;">
							<col style="width: 5rem;">
							<col style="width: 12rem;">
						</colgroup>
						<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>권한</th>
							<th>이름</th>
							<th>이메일</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="member" items="${page.elements}">
							<tr>
								<td class="text-center">${member.memberNo}</td>
								<td>
									<a href="${path}/member/detail?memberNo=${member.memberNo}">${member.memberId}</a>
								</td>
								<c:choose>
									<c:when test="${member.memberLevel == 1}">
										<td class="text-center">일반회원</td>
									</c:when>
									<c:when test="${member.memberLevel == 2}">
										<td class="text-center">관리자</td>
									</c:when>
								</c:choose>
								<td class="text-center">${member.memberName}</td>
								<td>${member.memberEmail}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="pageDiv" class="container d-flex justify-content-center mt-2">
					<ul class="pagination">
						<!-- 화살표 버튼(이전) -->
						<c:choose>
							<c:when test="${page.currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="${path}/member/list?searchType=${param.searchType}&searchValue=${param.searchValue}&pageValue=${page.currentPage - 1}">
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
								<a class="page-link" href="${path}/member/list?searchType=${param.searchType}&searchValue=${param.searchValue}&pageValue=${i}">
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
									<a class="page-link" href="${path}/member/list?searchType=${param.searchType}&searchValue=${param.searchValue}&pageValue=${page.currentPage + 1}">
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
					</ul>
				</div>
				<div id="searchDiv" class="container d-flex justify-content-center mt-2">
					<div class="col-6">
						<div id="searchFormDiv" class="input-group w-100 justify-content-center">
							<form id="searchForm" action="${path}/member/list" class="d-flex" method="get">
								<select id="searchType" name="searchType" class="form-select w-auto">
									<option value="m_id">아이디</option>
									<option value="m_name">이름</option>
									<option value="m_email">이메일</option>
								</select>
								<input type="text" id="searchValue" name="searchValue" class="form-control">
								<button type="submit" class="btn btn-outline-primary w-25">검색</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
