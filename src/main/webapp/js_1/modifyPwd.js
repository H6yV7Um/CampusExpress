function verify() {
	var code = $("input[name='randomCode']").val();
	if (code == "") {
		return false;
	}
	code = {
		"code" : code
	};
	var result = false;
	$.post("zxd/verifyCode", code, function(data) {
		if (data) {
			var username = $("input[name='username']").val();
			window.location.href = "htm/findPwd2.html?username=" + username;
		} else {
			alert("验证码错误!");
		}
	}, "json");
	return result;
}

function checkPwd() {
	var password = $("#newPwd").val();
	var reg = /^\w{3,16}$/ig;
	if (!reg.test(password)) {
		$("#errorNew").text("密码必须由3-16位的数字字母下划线组成");
	} else {
		$("#errorNew").text("");
	}
}

function confirmPwd() {
	if ($("#confirm").val() != $("#newPwd").val()) {
		$("#errorconfirm").text("两次密码不一致!");
	} else {
		$("#errorconfirm").text("");
	}
}

// 确认修改密码
function ensure() {
	var result = false;
	checkOldPwd();// 检查旧密码是否正确
	checkPwd();// 检查验证
	confirmPwd();// 检查两次密码
	if ($("#errorconfirm").text().length > 0
			|| $("#errorNew").text().length > 0
			|| $("#errorOld").text().length > 0) {
		
		return result;
	}
	var params = $("#modifyPwdForm").serialize();
	$.post("zxd/modifyPwd", params, function(data) {
		if (data) {
			alert("密码修改成功");
		} else {
			alert("密码修改失败!!");
		}
	}, "json");
	$("#confirm").val("");
	$("#newPwd").val("");
	$("#oldPwd").val("");

	return result;

}

// 检查旧密码是否
function checkOldPwd() {
	var params = $("#modifyPwdForm").serialize();
	$.post("zxd/checkUser", params, function(data) {
		if (data) {
			$("#errorOld").text("");
		} else {
			$("#errorOld").text("旧密码错误!");
		}
	}, "json");
}
