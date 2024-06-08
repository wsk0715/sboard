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
				<h2 class="text-center mt-5">회원 정보 수정</h2>
				<div id="memberFormDiv">
					<form id="memberForm" action="${path}/member/modify" method="post">
						<input type="text" name="memberNo" value="${member.memberNo}" readonly hidden />
						<c:if test="${sessionScope.sessionLevel > 1}">
							<div class="form-group">
								<label for="memberLevel">회원등급</label>
								<select class="form-control" name="memberLevel" id="memberLevel">
									<option value="1" ${member.memberLevel == 1 ? 'selected' : ''}>일반회원</option>
									<option value="2" ${member.memberLevel == 2 ? 'selected' : ''}>관리자</option>
								</select>
							</div>
						</c:if>
						<div class="form-group">
							<label for="memberId">아이디</label>
							<input type="text" class="form-control" id="memberId" name="memberId" value="${member.memberId}" readonly placeholder="아이디를 입력하세요" />
						</div>
						<div class="form-group">
							<label for="memberPw">비밀번호</label>
							<input type="password" class="form-control" id="memberPw" name="memberPw" value="${member.memberPw}" placeholder="비밀번호를 입력하세요" />
						</div>
						<div class="form-group">
							<label for="memberName">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" value="${member.memberName}" placeholder="이름을 입력하세요" />
						</div>
						<div class="form-group">
							<label for="memberEmail">이메일</label>
							<input type="text" class="form-control" id="memberEmail" name="memberEmail" value="${member.memberEmail}" placeholder="이메일을 입력하세요" />
						</div>
						<div class="row text-center mt-4">
							<div class="col-3"></div>
							<div class="col-3 px-0">
								<button type="submit" class="px-3 btn btn-primary btn-block">수정</button>
							</div>
							<div class="col-3 px-0">
								<button type="button" class="px-3 btn btn-secondary btn-block" onclick="location.href='${path}/member/detail?memberNo=${member.memberNo}'">취소</button>
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
	$(document).ready(function () {
		$('#memberForm').submit(function () {
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
	});
</script>
</body>
</html>
