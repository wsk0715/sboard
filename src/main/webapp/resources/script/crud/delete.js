$(document).ready(function () {
	$('#deleteBtn').click(function () {
		if (!confirm('정말로 삭제하시겠습니까?')) {
			return false;
		}
	});
});
