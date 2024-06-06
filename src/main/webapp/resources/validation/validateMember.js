$(document).ready(function () {
	$("#memberForm").submit(function (event) {
		if (!idChecked) {
			alert('아이디 중복확인이 필요합니다.');
			return false;
		}
		return checkCanSubmit();
	});
});

const checkCanSubmit = function () {
	// 비밀번호 유효성 검사
	const memberPw = $("#memberPw").val();
	if (memberPw.length === 0) {
		alert("비밀번호를 입력해 주세요.");
		event.preventDefault();
		$("#memberPw").focus();
		return false;
	}
	if (memberPw.length > 20) {
		alert("비밀번호는 20자 이하로 입력해 주세요.");
		event.preventDefault();
		$("#memberPw").focus();
		return false;
	}

	// 이름 유효성 검사
	const memberName = $("#memberName").val();
	if (memberName.length === 0) {
		alert("이름을 입력해 주세요.");
		event.preventDefault();
		$("#memberName").focus();
		return false;
	}
	if (memberName.length > 10) {
		alert("이름은 10자 이하로 입력해 주세요.");
		event.preventDefault();
		$("#memberName").focus();
		return false;
	}

	// 이메일 유효성 검사
	const memberEmail = $("#memberEmail").val();
	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	if (!emailPattern.test(memberEmail)) {
		alert("올바른 이메일 형식을 입력해 주세요.");
		event.preventDefault();
		$("#memberEmail").focus();
		return false;
	}
	if (memberEmail.length > 20) {
		alert("이메일은 20자 이하로 입력해주세요.");
		event.preventDefault();
		$("#memberEmail").focus();
		return false;
	}

	return true;
}
