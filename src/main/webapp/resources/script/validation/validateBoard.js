const checkBoardTitle = function () {
	const boardTitle = $('#boardTitle').val();
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

const checkSearchValue = function () {
	const searchValue = $('#searchValue').val();
	if (searchValue.length === 0) {
		alert('검색어를 입력해 주세요.');
		$('#searchValue').focus();
		return false;
	}
	if (searchValue.length > 10) {
		alert('검색어는 10자 이하로 입력해 주세요.');
		$('#searchValue').focus();
		return false;
	}

	return true;
}
