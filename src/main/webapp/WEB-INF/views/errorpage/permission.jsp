<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Error - Permission</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center">
				<h2 class="mt-5">오류</h2>
				<p class="mt-5">해당 요청에 대한 권한이 없습니다.</p>
				<p><span><b id="countdown">3</b></span>초 후 메인 페이지로 이동합니다.</p>
			</div>
		</div>
	</div>
</section>
<script>
	const countdownElement = document.getElementById('countdown');
	let countdown = 3;

	const countdownInterval = setInterval(function () {
		countdownElement.textContent = --countdown;

		if (countdown <= 0) {
			clearInterval(countdownInterval);
			window.location.href = '${path}/';
		}
	}, 1000);
</script>
</body>
</html>
