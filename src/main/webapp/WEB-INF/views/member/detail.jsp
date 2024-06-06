<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원 정보 수정</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h2 class="text-center mt-5">회원 상세 정보</h2>
				<input type="text" name="memberNo" value="${member.memberNo}" readonly hidden />
				<c:if test="${sessionScope.sessionLevel > 1}">
					<div class="form-group">
						<label for="memberLevel">회원등급</label>
						<c:choose>
							<c:when test="${member.memberLevel == 1}">
								<input type="text" class="form-control" id="memberLevel" name="memberLevel" value="일반회원" readonly />
							</c:when>
							<c:when test="${member.memberLevel == 2}">
								<input type="text" class="form-control" id="memberLevel" name="memberLevel" value="관리자" readonly />
							</c:when>
						</c:choose>
						<div></div>
					</div>
				</c:if>
				<div class="form-group">
					<label for="memberId">아이디</label>
					<input type="text" class="form-control" id="memberId" name="memberId" value="${member.memberId}" readonly />
				</div>
				<div class="form-group">
					<label for="memberPw">비밀번호</label>
					<input type="password" class="form-control" id="memberPw" name="memberPw" value="${member.memberPw}" readonly />
				</div>
				<div class="form-group">
					<label for="memberName">이름</label>
					<input type="text" class="form-control" id="memberName" name="memberName" value="${member.memberName}" readonly />
				</div>
				<div class="form-group">
					<label for="memberEmail">이메일</label>
					<input type="text" class="form-control" id="memberEmail" name="memberEmail" value="${member.memberEmail}" readonly />
				</div>
				<br>
				<div class="row text-center">
					<div class="col-3"></div>
					<div class="col-3 px-0">
						<a href="${path}/member/modify?memberNo=${member.memberNo}" class="btn btn-warning">수정</a>
					</div>
					<div class="col-3 px-0">
						<a id="deleteBtn" href="${path}/member/delete?memberNo=${member.memberNo}" class="btn btn-danger">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${path}/resources/script/crud/delete.js"></script>
</body>
</html>
