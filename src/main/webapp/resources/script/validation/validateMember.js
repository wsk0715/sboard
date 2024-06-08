const checkId = function () {
	const memberId = $('#memberId').val();
	// 아이디 유효성 검사
	if (memberId.length === 0) {
		alert('아이디를 입력해 주세요.');
		$('#memberId').focus();
		return false;
	}
	if (memberId.length > 10) {
		alert('아이디는 10자 이하로 입력해 주세요.');
		$('#memberId').focus();
		return false;
	}

	return true;
}

const checkPw = function () {
	const memberPw = $('#memberPw').val();
	// 비밀번호 유효성 검사
	if (memberPw.length === 0) {
		alert('비밀번호를 입력해 주세요.');
		$('#memberPw').focus();
		return false;
	}
	if (memberPw.length > 20) {
		alert('비밀번호는 20자 이하로 입력해 주세요.');
		$('#memberPw').focus();
		return false;
	}

	return true;
}

const checkName = function () {
	const memberName = $('#memberName').val();
	// 이름 유효성 검사
	if (memberName.length === 0) {
		alert('이름을 입력해 주세요.');
		$('#memberName').focus();
		return false;
	}
	if (memberName.length > 10) {
		alert('이름은 10자 이하로 입력해 주세요.');
		$('#memberName').focus();
		return false;
	}

	return true;
}

const checkEmail = function () {
	const memberEmail = $('#memberEmail').val();
	// 이메일 유효성 검사
	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	if (!emailPattern.test(memberEmail)) {
		alert('올바른 이메일 형식을 입력해 주세요.');
		$('#memberEmail').focus();
		return false;
	}
	if (memberEmail.length > 20) {
		alert('이메일은 20자 이하로 입력해주세요.');
		$('#memberEmail').focus();
		return false;
	}

	return true;
}
