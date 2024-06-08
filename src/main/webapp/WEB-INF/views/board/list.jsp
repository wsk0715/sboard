<%@ page language="java" contentType="text/html;charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>게시글 목록</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@ include file="/WEB-INF/views/templates/style.jsp" %>
	<style>
		th {
			text-align: center;
		}

		#headDiv {
			position: relative;
		}

		#button-write {
			position: absolute;
			right: 0;
			top: 0;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<section>
	<div class="container custom-container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div id="headDiv">
					<h2 class="text-center mt-5">게시글 목록</h2>
					<c:choose>
						<c:when test="${sessionScope.sessionId != null}">
							<a id="button-write" href="${path}/board/insert" class="btn btn-primary">게시글 작성</a>
						</c:when>
					</c:choose>
				</div>
				<div id="mainDiv" class="table-responsive mt-4">
					<table class="table table-bordered table-hover">
						<colgroup>
							<col style="width: 4rem;">
							<col style="width: auto;">
							<col style="width: 6rem;">
							<col style="width: 12rem;">
						</colgroup>
						<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="board" items="${boards}">
							<tr>
								<td class="text-center">${board.boardNo}</td>
								<td>
									<a href="${path}/board/detail?boardNo=${board.boardNo}">${board.boardTitle}</a>
								</td>
								<td class="text-center">${board.memberId}</td>
								<td class="text-center">${board.boardDate}</td>
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
