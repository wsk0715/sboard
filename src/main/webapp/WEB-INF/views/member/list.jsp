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
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container custom-container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<h2 class="text-center mt-5">회원 목록</h2>
				<br>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>권한</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="member" items="${members}">
							<tr>
								<td>${member.memberNo}</td>
								<c:choose>
									<c:when test="${member.memberLevel == 1}">
										<td>일반회원</td>
									</c:when>
									<c:when test="${member.memberLevel == 2}">
										<td>관리자</td>
									</c:when>
								</c:choose>
								<td>${member.memberId}</td>
								<td>${member.memberPw}</td>
								<td>${member.memberName}</td>
								<td>${member.memberEmail}</td>
								<td>
									<a href="${path}/member/modify?memberNo=${member.memberNo}">수정</a>
								</td>
								<td>
									<a href="${path}/member/delete?memberNo=${member.memberNo}">삭제</a>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>
