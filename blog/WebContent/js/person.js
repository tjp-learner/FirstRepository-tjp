//来到主页首先发送一个ajax请求来获取用户的信息
$(function() {
	$("#upload-close").on("click", function() {
		$("#upload-bg").hide();
		$("#upload-file").val("");
		if($("#showUpload").css("display") == "block") {
			$("#showUpload").hide();
			$("#addImg").show();
			$.ajax({
				type: "get",
				url: "UploadImgServlet?method=cancel",
			});
		}
	})
	$("#upload-img").on("click", function() {
		$("#upload-bg").show();
		$("#showUpload").hide();
		$("#addImg").show();
	})
	$("#add").on("click", function() {
		$("#upload-file").click();
	})
	$("#btn-cancel").on("click", function() {
		$("#upload-file").val("");
		if($("#showUpload").css("display") == "block") {
			$("#showUpload").hide();
			$("#addImg").show();
			$.ajax({
				type: "get",
				url: "UploadImgServlet?method=cancel",
			});
		}
	})
	$("#upload-file").on("change", function() {
		$.ajax({
			url: 'UploadImgServlet?method=upload',
			type: 'POST',
			data: new FormData($('#upload-head-img')[0]), //h5的DataForm对象
			async: false,
			processData: false,
			contentType: false,
			success: function(result) {
				$("#showUpload").find("img").attr("src", "UploadImgServlet?method=show&date=" + new Date());
				$("#showUpload").show();
				$("#addImg").hide();
				$("#img-btn").show();
			}
		})
	})
	$("#btn-confirm").on("click", function() {
		if($("#upload-file").val() != null && $("#upload-file").val().length != 0) {
			$.ajax({
				type: "get",
				url: "UploadImgServlet?method=confirm",
				async: true,
				success: function() {
					$("#upload-bg").hide();
					$("#head-img").attr("src", "UploadImgServlet?method=showAgain&date=" + new Date());
					$("#img-btn").hide();
				}
			});
		} else {
			$("#upload-bg").hide();
			$("#img-btn").hide();
		}
	})
	$("#modifyInfo-btn").on("click", function() {
		$("#modifyInfo-bg").show();
		//处理表单input
		$("#modifyInfo-input").find(":input").each(function() {
			var id = $(this).attr("id") + "-info";
			var initValue = $("#" + id).text();
			var value = initValue.substring(initValue.indexOf("：") + 1);
			$(this).val(value);
		});
		//单独处理select
		var sex = $("sex-info").text();
		var sexValue = sex.substring(sex.indexOf("："));
		if(sexValue == "男") {
			$("#sex").find("option[value=男]").attr("selected", "selected");
		} else {
			$("#sex").find("option[value=女]").attr("selected", "selected");
		}
	})
	$("#modifyInfo-close").on("click", function() {
		$("#modifyInfo-bg").hide();
	})
	$("#cancel-info").on("click", function() {
		$("#modifyInfo-bg").hide();
	})
	$("#confirm-info").on("click", function() {
		var personinfo = {};
		//获取所有表单的值
		$("#modifyInfo-input").find(":input").each(function() {
			personinfo[$(this).attr("id")] = $(this).val();
		})
		$.ajax({
			type: "post",
			url: "UpdateUserInfoServlet",
			async: false,
			data: personinfo,
			success: function(result) {
				console.log(result);
				if (result == "ok") {
					
				}
				//先关闭这个弹出层
				$("#modifyInfo-bg").hide();
				//然后更新页面中的值
				$("#modifyInfo-input").find(":input").each(function() {
					var id = $(this).attr("id") + "-info";
					var initValue = $("#" + id).text();
					var index = initValue.indexOf("：");
					var newValue = initValue.substring(0, index) + "：" + $(this).val();
					$("#" + id).text(newValue);
				})
			}
		});
	})
})