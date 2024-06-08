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
				<div id="memberFormDiv">
					<form id="memberForm" action="${path}/member/register" method="post">
						<input type="text" name="memberNo" value="${memberNo}" readonly hidden />
						<label for="memberId">아이디</label>
						<div class="input-group">
							<input type="text" class="form-control" id="memberId" name="memberId" value="${member.memberId}" placeholder="아이디를 입력하세요" />
							<div class="input-group-append">
								<button type="button" id="checkIdBtn" class="btn btn-warning">중복 확인</button>
							</div>
						</div>
						<small id="idCheckResult" class="form-text text-muted"></small>
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
							<input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일을 입력하세요">
						</div>
						<div class="row text-center mt-4">
							<div class="col-3"></div>
							<div class="col-3 px-0">
								<button type="submit" class="px-3 btn btn-primary btn-block">등록</button>
							</div>
							<div class="col-3 px-0">
								<button type="button" class="px-3 btn btn-secondary btn-block" onclick="location.href='${path}/'">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
<script src="${path}/resources/script/validation/validateMember.js"></script>
<script>
	let isCheckedIdDuplicated = false;
	$(document).ready(function () {
		$('#memberForm').submit(function () {
			if (!isCheckedIdDuplicated) {
				alert("아이디 중복 확인을 해주세요.");
				$('#memberId').focus();
				return false;
			}
			if (!checkPw()) {
				return false;
			}
			if (!checkName()) {
				return false;
			}
			if (!checkEmail()) {
				return false;
			}
		});

		// 아이디 중복 확인 버튼
		$('#checkIdBtn').click(function () {
			if (!checkId()) {
				return false;
			}
			return checkIdDuplicated({memberId: $('#memberId').val()});
		});

		// 아이디 수정 시 중복확인 여부 false 변경
		$('#memberId').change(function () {
			$("#idCheckResult").text("").css("color", "red");
			isCheckedIdDuplicated = false;
		});
	});

	// 아이디 중복 확인(서버)
	const checkIdDuplicated = function (data) {
		$.ajax({
			url: '/member/checkId',
			method: 'POST',
			contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			data: JSON.stringify(data),
			success: function (response) {
				if (!response.exists) {
					$("#idCheckResult").text("사용 가능한 아이디입니다.").css("color", "green");
					isCheckedIdDuplicated = true;
					return true;
				} else {
					$("#idCheckResult").text("아이디가 이미 존재합니다.").css("color", "red");
					isCheckedIdDuplicated = false;
					return false;
				}
			},
			error: function (jqXHR, status, error) {
				alert('에러가 발생했습니다. 다시 시도해주세요.');
				return true;
			}
		});
	}
</script>
</body>
</html>
