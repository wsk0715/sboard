<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>로그인</title>
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
				<h2 class="text-center mt-5">로그인</h2>
				<form id="memberForm" action="${path}/member/login" method="post">
					<div class="form-group">
						<label for="memberId">아이디</label>
						<input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요">
					</div>
					<div class="form-group">
						<label for="memberPw">비밀번호</label>
						<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호를 입력하세요">
					</div>
					<br>
					<div class="row text-center">
						<div class="col-3"></div>
						<div class="col-3 px-0">
							<button type="submit" id="loginBtn" class="px-3 btn btn-primary btn-block">로그인</button>
						</div>
						<div class="col-3 px-0">
							<button type="button" class="px-3 btn btn-secondary btn-block" onclick="location.href='${path}/'">취소</button>
						</div>
						<div class="col-3"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script src="${path}/resources/validation/validateMember.js"></script>
<script>
	$(document).ready(function () {
		$('#memberForm').submit(function (event) {
			const memberId = $('#memberId').val();
			const memberPw = $('#memberPw').val()

			if (!checkId(event)) {
				return false;
			}
			if (!checkPw(event)) {
				return false;
			}

			event.preventDefault();
			requestLogin({memberId: memberId, memberPw: memberPw});
		});
	});

	// 아이디 비밀번호 확인(서버)
	function requestLogin(data) {
		$.ajax({
			url: '/member/login',
			method: 'POST',
			contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			data: JSON.stringify(data),
			success: function (response) {
				if (response.answer === 'success') {
					alert('로그인 성공!');
					window.location.href = '${path}/';
				} else if (response.answer === 'id') {
					alert('해당하는 아이디가 없습니다.');
				} else if (response.answer === 'pw') {
					alert('비밀번호가 틀렸습니다.');
				}
			},
			error: function (jqXHR, status, error) {
				alert('에러가 발생했습니다. 다시 시도해주세요.');
			}
		});
	}
</script>
</body>
</html>
