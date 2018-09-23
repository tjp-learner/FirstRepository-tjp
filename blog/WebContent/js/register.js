$(function() {
	// 验证表单项输入正确后的处理
	function showSuccess(input) {
		input.parents(".form-group").removeClass("has-error");
		input.parents(".form-group").addClass("has-success");
		input.next().removeClass("glyphicon-remove");
		input.next().addClass("glyphicon-ok");
	}
	// 验证表单项输入错误后的处理
	function showError(input) {
		input.parents(".form-group").removeClass("has-success");
		input.parents(".form-group").addClass("has-error");
		input.next().removeClass("glyphicon-ok");
		input.next().addClass("glyphicon-remove");
	}
	// 验证邮箱输入
	function validateEmail() {
		var value = $("#email").val();
		var msg = $("#email").parent().next();
		if (!value) {
			msg.text("请输入邮箱");
			showError($("#email"));
			return false;
		}
		// 验证邮箱的正则
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if (!reg.test(value)) {
			msg.text("邮箱格式不正确");
			showError($("#email"));
			return false;
		}
		// 验证邮箱是否重复
		$.ajax({
			type : "post",
			url : "UserCheckServlet",
			data : {
				method : "email",
				email : value
			},
			dataType : "json",
			async : false,
			success : function(result) {
				if (result) {
					showError($("#email"));
					msg.text("该邮箱已经注册，请更换");
				} else {
					showSuccess($("#email"));
					msg.text("");
				}
			}
		});
	}

	// 验证手机输入
	function validatePhone() {
		var value = $("#phone").val();
		var msg = $("#phone").parent().next();
		if (!value) {
			msg.text("请输入手机");
			showError($("#phone"));
			return;
		}
		// 验证手机的正则
		var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
		if (!reg.test(value)) {
			msg.text("请输入正确的手机号");
			showError($("#phone"));
			return;
		}
		// 验证手机是否重复
		$.ajax({
			type : "post",
			url : "UserCheckServlet",
			data : {
				method : "phone",
				phone : value
			},
			dataType : "json",
			async : true,
			success : function(result) {
				if (result) {
					showError($("#phone"));
					msg.text("该手机已经被使用，请更换");
				} else {
					showSuccess($("#phone"));
					msg.text("");
				}
			}
		});
	}

	// 验证用户名
	function validateUsername() {
		var value = $("#username").val();
		var msg = $("#username").parent().next();
		if (!value) {
			msg.text("请输入用户名");
			showError($("#username"));
			return false;
		}
		if (value.length < 4) {
			msg.text("用户名至少4个字符");
			showError($("#username"));
			return false;
		}
		// 验证用户名是否重复
		$.ajax({
			type : "post",
			url : "UserCheckServlet",
			data : {
				method : "username",
				username : value
			},
			async : false,
			dataType : "json",
			success : function(result) {
				if (result) {
					showError($("#username"));
					msg.text("该用户名已经被使用，请更换");
				} else {
					showSuccess($("#username"));
					msg.text("");
				}
			}
		});
	}

	// 验证密码
	function validatePassword() {
		var value = $("#password1").val();
		var msg = $("#password1").parent().next();
		if (!value) {
			msg.text("请输入密码");
			showError($("#password1"));
			return;
		}
		if (value.length < 8) {
			msg.text("密码至少8个字符");
			showError($("#password1"));
			return;
		}
		var reg = /^(?![^a-zA-Z]+$)(?!\D+$)/;
		if (!reg.test(value)) {
			msg.text("密码必须包含字母和数字");
			showError($("#password1"));
			return;
		}
		//如果用户先输入确认密码，再输入密码并且和确认密码一致
		if ($("#password1").val() == $("#password2").val()) {
			showSuccess($("#password1"));
			showSuccess($("#password2"));
			$("#password2").parent().next().text("");
			$("#password1").parent().next().text("");
			return ;
		}
		msg.text("");
		showSuccess($("#password1"));
	}

	// 验证确认密码
	function validatePasswordAgain() {
		var pwd2 = $("#password2").val();
		var msg = $("#password2").parent().next();
		var pwd1 = $("#password1").val();
		if (!pwd2) {
			msg.text("请输入确认密码，和密码一致");
			showError($("#password2"));
			return;
		}
		if (pwd1 != pwd2) {
			msg.text("两次密码不一致");
			showError($("#password2"));
			return;
		}
		msg.text("");
		showSuccess($("#password2"));
	}

	$("#email").on("blur", function() {
		validateEmail();
	});
	$("#phone").on("blur", function() {
		validatePhone();
	});
	$("#username").on("blur", function() {
		validateUsername();
	});
	$("#password1").on("blur", function() {
		validatePassword();
	});
	$("#password2").on("blur", function() {
		validatePasswordAgain();
	});
	$("#submit").on("click",function() {
		//点击注册，所有表单必须验证一遍
		validateEmail();
		validatePhone();
		validateUsername();
		validatePassword();
		validatePasswordAgain();
		if ($("#email").parents(".form-group").hasClass("has-success")
				&& $("#phone").parents(".form-group").hasClass(
						"has-success")
				&& $("#username").parents(".form-group").hasClass(
						"has-success")
				&& $("#password1").parents(".form-group").hasClass(
						"has-success")
				&& $("#password2").parents(".form-group").hasClass(
						"has-success")) {
			return true;
		} else {
			return false;
		}
	});
})