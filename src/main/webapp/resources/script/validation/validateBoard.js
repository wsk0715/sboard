const checkBoardTitle = function () {
	const boardTitle = $('#boardTitle').val();
	// 아이디 유효성 검사
	if (boardTitle.length === 0) {
		alert('제목을 입력해 주세요.');
		$('#boardTitle').focus();
		return false;
	}
	if (boardTitle.length > 40) {
		alert('제목은 40자 이하로 입력해 주세요.');
		$('#boardTitle').focus();
		return false;
	}

	return true;
}

const checkBoardBody = function () {
	const boardBody = $('#boardBody').val();
	// 비밀번호 유효성 검사
	if (boardBody.length === 0) {
		alert('내용을 입력해 주세요.');
		$('#boardBody').focus();
		return false;
	}
	if (boardBody.length > 160) {
		alert('내용은 160자 이하로 입력해 주세요.');
		$('#boardBody').focus();
		return false;
	}

	return true;
}

const checkReplyBody = function () {
	const replyBody = $('#replyBody').val();
	// 이름 유효성 검사
	if (replyBody.length === 0) {
		alert('댓글 내용을 입력해 주세요.');
		$('#replyBody').focus();
		return false;
	}
	if (replyBody.length > 80) {
		alert('댓글 내용은 80자 이하로 입력해 주세요.');
		$('#replyBody').focus();
		return false;
	}

	return true;
}
