<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원 가입</title>
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
				<h2 class="text-center mt-5">회원 가입</h2>
				<form action="${path}/member/register" method="post">
					<input type="text" name="memberNo" value="${memberNo}" readonly hidden />
					<div class="form-group">
						<label for="memberId">아이디</label>
						<input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요">
					</div>
					<div class="form-group">
						<label for="memberPw">비밀번호</label>
						<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호를 입력하세요">
					</div>
					<div class="form-group">
						<label for="memberName">이름</label>
						<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력하세요">
					</div>
					<div class="form-group">
						<label for="memberEmail">이메일</label>
						<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일을 입력하세요">
					</div>
					<br>
					<div class="row text-center">
						<div class="col-3"></div>
						<div class="col-3 px-0">
							<button type="submit" class="px-3 btn btn-primary btn-block">등록</button>
						</div>
						<div class="col-3 px-0">
							<button type="button" class="px-3 btn btn-secondary btn-block" onclick="location.href='${path}/member/list'">취소</button>
						</div>
						<div class="col-3"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
</body>
</html>
