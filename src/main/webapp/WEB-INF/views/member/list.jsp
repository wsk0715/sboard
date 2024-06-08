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
						<c:forEach var="member" items="${members}">
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
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
