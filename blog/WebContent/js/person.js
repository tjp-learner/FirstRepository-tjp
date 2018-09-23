//来到主页首先发送一个ajax请求来获取用户的信息
$(function() {
	$("#upload-close").on("click", function() {
		$("#upload-bg").css("display", "none");
		$("#upload-file").val("");
		if ($("#showUpload").css("display") == "block") {
			$("#showUpload").css("display", "none");
			$("#addImg").css("display", "block");
			$.ajax({
				type: "get",
				url: "UploadImgServlet?method=cancel",
			});
		}
	})
	$("#upload-img").on("click", function() {
		$("#upload-bg").css("display", "block");
		$("#showUpload").css("display", "none");
		$("#addImg").css("display", "block");
	})
	$("#add").on("click", function() {
		$("#upload-file").click();
	})
	$("#btn-cancel").on("click", function() {
		$("#upload-file").val("");
		if ($("#showUpload").css("display") == "block") {
			$("#showUpload").css("display", "none");
			$("#addImg").css("display", "block");
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
				$("#showUpload").css("display", "block");
				$("#addImg").css("display", "none");
				$("#img-btn").css("display", "block");
			}
		})
	})
	$("#btn-confirm").on("click", function() {
		if ($("#upload-file").val()!= null &&$("#upload-file").val().length!=0){
			$.ajax({
				type: "get",
				url: "UploadImgServlet?method=confirm",
				async: true,
				success: function() {
					$("#upload-bg").css("display", "none");
					$("#head-img").attr("src", "UploadImgServlet?method=showAgain&date=" + new Date());
					$("#img-btn").css("display", "none");
				}
			});
		} else {
			$("#upload-bg").css("display", "none");
			$("#img-btn").css("display", "none");
		}
	})
	$("#modify-info").on("click", function() {
		$("#modifyInfo-bg").css("display", "block");
	})
	$("#modifyInfo-close").on("click", function() {
		$("#modifyInfo-bg").css("display", "none");
	})
	$("#cancel-info").on("click", function() {
		$("#modifyInfo-bg").css("display", "none");
	})
})