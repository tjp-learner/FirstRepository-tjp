<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>写博客-学而思博客</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.js"></script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<style type="text/css">
			body {
				background-color: rgb(245, 246, 247);
			}
			
			a:hover {
				text-decoration: none;
			}
			
			h1 {
				margin: 0;
				padding: 0;
				line-height: 50px;
			}
			
			.top {
				background-color: #F8F8F8;
				height: 50px;
			}
			
			ul {
				list-style: none;
				margin: 0;
				padding: 0;
			}
			
			.top-nav li {
				float: left;
			}
			
			.top-nav li a {
				font-size: 16px;
				line-height: 50px;
				padding: 18px;
			}
			/*重新设置row*/
			
			.row {
				margin-left: -52px;
			}
			
			.content {
				background-color: white;
			}
			/*temp*/
			
			.content .nav-left {
				height: 1274px;
				margin-left: 37px;
				border-right: 1px solid #CCCCCC;
			}
			
			.content .aside-right {
				margin-left: 54px;
				width: 914px;
			}
			
			.nav-left div {
				width: 185px;
				height: 45px;
				font-size: 16px;
				line-height: 45px;
				padding-left: 20px;
				margin-top: 1px;
			}
			
			.nav-left div:hover {
				cursor: pointer;
				background-color: #C92027;
				color: white;
			}
			/*当前页选项的相关设置*/
			
			.nav-left .current {
				background-color: #C92027;
			}
			
			.nav-left .current a {
				color: white;
			}
			
			.nav-left div a {
				display: block;
				height: 100%;
				color: #4D4D4D;
			}
			
			.nav-left div a:hover {
				color: white;
			}
			
			.nav-left div:nth-child(3) {
				border-top: 1px solid #CCCCCC;
				cursor: auto;
				font-size: 15px;
				color: #CCCCCC;
				padding-left: 19px;
			}
			
			.nav-left div:nth-child(3):hover {
				background-color: white;
				color: #CCCCCC;
			}
			
			#article-title {
				background-color: #efefef;
				border-radius: 0;
				outline: none;
				margin: 20px 0;
			}
			
			input[type=submit] {
				border: 1px solid #C92027;
				color: #C92027;
				font-size: 16px;
				margin: 15px 48px 0 0;
			}
			
			input[type=submit]:hover {
				background-color: #C92027;
				color: white;
			}
			
			select {
				width: 138px;
				height: 32px;
				line-height: 32px;
				border: 1px solid #ddd;
				border-radius: 4px;
				background-color: #f4f4f4;
				box-sizing: border-box;
				padding-left: 16px;
			}
			
			.btn-add-tag {
				padding: 0;
				background-color: transparent;
				border: none;
				color: #349EDF;
				font-size: 14px;
				line-height: 32px;
				outline: none;
				margin: 10px 0;
			}
			
			select {
				margin-right: 30px;
			}
			
			.tag {
				background-color: orange;
				padding: 6px;
				border-radius: 2px;
				font-size: 12px;
			}
			
			.tag-remove {
				margin-right: 10px;
				cursor: pointer;
				color: #ccc;
				font-size: 16px;
				margin-right: 10px;
			}
			
			.classify-list {
				border: 1px solid #999;
				background-color: #FAFAFA;
				padding: 10px 30px;
				display: inline-block;
				font-size: 14px;
			}
			
			.classify-list label {
				margin-right: 30px;
				font-weight: normal;
			}
			
			.classify-list input {
				height: 19px;
				width: 19px;
				vertical-align: bottom;
			}
			
			.classify {
				background-color: orange;
				padding: 6px;
				border-radius: 2px;
				font-size: 12px;
			}
			
			.classify-remove {
				margin-right: 10px;
				cursor: pointer;
				color: #ccc;
				font-size: 16px;
				margin-right: 10px;
			}
		</style>
	</head>
	<body>
		<div class="container-fluid top">
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<h1>
						<a href="home.html">学而思博客</a>
					</h1>
				</div>
				<div class="col-md-5 col-md-offset-2">
					<ul class="top-nav">
						<li>
							<a href="home.html">首页</a>
							<span>|</span>
						</li>
						<li>
							<a href="person.html">个人中心</a>
							<span>|</span>
						</li>
						<li>
							<a href="myblog-data.html?get=all">我的博客</a>
							<span>|</span>
						</li>
						<li>
							<a href="UserServlet?method=logout">退出登录</a>
							<span>|</span>
						</li>
						<li>
							<a href="person.html">
								<span class="glyphicon glyphicon-home"></span> ${sessionScope.username }</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container content">
			<div class="row">
				<div class="col-md-2 nav-left">
					<div class="current">
						<a href="#">
							<span class="glyphicon glyphicon-pencil"></span> 写博客</a>
					</div>
					<div>
						<a href="person.html">
							<span class="glyphicon glyphicon-home"></span> 主页</a>
					</div>
					<div>内容</div>
					<div id="article-manage">文章管理</div>
					<script type="text/javascript">
						$("#article-manage").on("click", function() {
						window.location.href = "myblog-data.html?get=all";
						})
					</script>
					<div>评论管理undo</div>
				</div>
				<div class="col-md-8 aside-right">
					<form class="form-horizontal" id="form">
						<div class="form-group">
							<input type="text" autocomplete="off" class="input-lg form-control" name="title" placeholder="输入文章标题" id="article-title" required /> </div>
						<div class="form-group">
							<script id="editor" type="text/plain" style="width:100%;height:700px;"></script>
						</div>
						<div class="form-group" id="tag-group">文章标签：
							<input type="hidden" name="tag" id="hide-tags" value="" />
							<button id="add-tag" class="btn-add-tag">
								<span class="glyphicon glyphicon-plus"></span> 添加标签 </button>
							<div style="margin-left: 73px;">最多添加4个标签 </div>
						</div>
						<script type="text/javascript">
							//点击添加标签按钮，就在这个按钮前面加一个文本框
							$("#add-tag").on("click", function(event) {
								event.stopPropagation();
								event.preventDefault(); //先取消默认行为，不让表单提交
								if($("#tag").val() == null || $("#tag").val() == "") {
									$("#tag").remove();
								}
								$("<input type='text' id='tag' />").insertBefore($(this));
								$("#tag").css("width", "100px").focus();
							})
							$(document).on("click", function() {
								if($("#tag").val() == null || $("#tag").val() == "") {
									$("#tag").remove();
								} else {
									var value = $("#hide-tags").val();
									if(value == null || value == "") {
										value = $("#tag").val();
									} else {
										value = value + "," + $("#tag").val();
									}
									$("#hide-tags").val(value);
									$("#tag").replaceWith($("<span class='tag'>" + $("#tag").val() + "</span><span class='glyphicon glyphicon-remove tag-remove'></span>"));
								}
								if($("#tag-group .tag").length == 4) {
									$("#add-tag").css("visibility", "hidden");
								}
							})
							$("#tag-group").delegate(".tag-remove", "click", function() {
								//先去掉相应的tag
								var temp = $(this).prev().text();
								$(this).prev().remove();
								//再修改隐藏表单中的value值
								var value = $("#hide-tags").val();
								if(value == temp) {
									value = "";
								} else if(value.startsWith(temp)) {
									value = value.replace(temp + ",", "");
								} else {
									value = value.replace("," + temp, "");
								}
								$("#hide-tags").val(value);
								//再把这个叉取消
								$(this).remove();
								if($("#tag-group .tag").length < 4) {
									$("#add-tag").css("visibility", "visible");
								}
							})
						</script>
						<div class="form-group" id="classify-group">个人分类：
							<input type="hidden" name="classify" id="hide-classify" />
							<button class="btn-add-tag" id="add-classify">
								<span class="glyphicon glyphicon-plus"></span> 添加分类 </button>
							<br>
						</div>
						<script type="text/javascript">
							$(function() {
								$("#add-classify").on("click", function() {
									event.stopPropagation();
									event.preventDefault(); //先取消默认行为，不让表单提交
									if($("#classify").val() == null || $("#classify").val() == "") {
										$("#classify").remove();
									}
									$("<input type='text' id='classify' />").insertBefore($(this));
									$("#classify").css("width", "100px").focus();
								})
							})
							$(document).on("click", function() {
								if($("#classify").val() == null || $("#classify").val() == "") {
									$("#classify").remove();
								} else {
									var value = $("#hide-classify").val();
									if(value == null || value == "") {
										value = $("#classify").val();
									} else {
										value = value + "," + $("#classify").val();
									}
									$("#hide-classify").val(value);
									$("#classify").replaceWith($("<span class='classify'>" + $("#classify").val() + "</span><span class='glyphicon glyphicon-remove classify-remove'></span>"));
								}
							})
							$("#classify-group").delegate(".classify-remove", "click", function() {
								//先去掉相应的tag
								var temp = $(this).prev().text();
								$(this).prev().remove();
								//再修改隐藏表单中的value值
								var value = $("#hide-classify").val();
								if(value == temp) {
									value = "";
								} else if(value.startsWith(temp)) {
									value = value.replace(temp + ",", "");
								} else {
									value = value.replace("," + temp, "");
								}
								$("#hide-classify").val(value);
								//再把这个叉取消
								$(this).remove();
							})
							$(".classify-list input").on("click", function() {
								var value = $("#hide-classify").val();
								var temp = $(this).val();
								if($(this).prop("checked") == true) {
									console.log(true);
									if(value == null || value == "") {
										value = temp;
									} else {
										value = value + "," + temp;
									}
								} else {
									if(value.indexOf(temp) > -1) {
										if(value == temp) {
											value = "";
										} else if(value.startsWith(temp)) {
											value = value.replace(temp + ",", "");
										} else {
											value = value.replace("," + temp, "");
										}
									}
								}
								$("#hide-classify").val(value);
							})
						</script>
						<div class="form-group"> 文章类型：
							<select name="type" required>
								<option value="0" selected>请选择</option>
								<option value="1">原创</option>
								<option value="2">转载</option>
								<option value="3">翻译</option>
							</select> 博客分类：
							<select name="all-classify" required>
								<option value="0" selected>选择分类</option>
								<option value='1'>云计算/大数据</option>
								<option value='2'>游戏开发</option>
								<option value='3'>运维</option>
								<option value='4'>数据库</option>
								<option value='5'>前端</option>
								<option value='6'>后端</option>
								<option value='7'>编程语言</option>
								<option value='8'>网络安全</option>
							</select>
						</div>
						<div class="form-group">
							<input id="publish" type="submit" class="btn btn-default" value="发布博客" />
							<input id="save" type="submit" class="btn btn-default" value="保存为草稿" />
						</div>
					</form>
					<script type="text/javascript">
						$(function() {
							$("#publish").on("click", function(event) {
								event.preventDefault();
								$.ajax({
									type:"post",
									url:"UeditorServlet?method=publish",
									data: $("#form").serialize(),
									success: function(result) {
										console.log(result);
										if (result.startsWith('ok')) {
											window.location.href="ArticleServlet?method=show&aid=" + result.substring(2);
										}
									}
								});
							})
							$("#save").on("click", function(event) {
								event.preventDefault();
								$.ajax({
									type:"post",
									url:"UeditorServlet?method=save",
									data: $("#form").serialize(),
									success: function(result) {
										if (result.startsWith('ok')){
											console.log(result);
											window.location.href="myblog-data.html?get=temp";
										}
									}
								});
							})
						})
					</script>
				</div>
			</div>
		</div>
		<!-- <div id="btns">
		<div>
			<button onclick="getAllHtml()">获得整个html的内容</button>
			<button onclick="getContent()">获得内容</button>
			<button onclick="setContent()">写入内容</button>
			<button onclick="setContent(true)">追加内容</button>
			<button onclick="getContentTxt()">获得纯文本</button>
			<button onclick="getPlainTxt()">获得带格式的纯文本</button>
			<button onclick="hasContent()">判断是否有内容</button>
			<button onclick="setFocus()">使编辑器获得焦点</button>
			<button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
			<button onmousedown="setblur(event)">编辑器失去焦点</button>

		</div>
		<div>
			<button onclick="getText()">获得当前选中的文本</button>
			<button onclick="insertHtml()">插入给定的内容</button>
			<button id="enable" onclick="setEnabled()">可以编辑</button>
			<button onclick="setDisabled()">不可编辑</button>
			<button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
			<button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
			<button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
		</div>

		<div>
			<button onclick="getLocalData()">获取草稿箱内容</button>
			<button onclick="clearLocalData()">清空草稿箱</button>
		</div>

	</div>
	<div>
		<button onclick="createEditor()">创建编辑器</button>
		<button onclick="deleteEditor()">删除编辑器</button>
	</div> -->
		<script type="text/javascript">
			//实例化编辑器
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			var ue = UE.getEditor('editor');
			/* 
			function isFocus(e) {
				alert(UE.getEditor('editor').isFocus());
				UE.dom.domUtils.preventDefault(e)
			}
			function setblur(e) {
				UE.getEditor('editor').blur();
				UE.dom.domUtils.preventDefault(e)
			}
			function insertHtml() {
				var value = prompt('插入html代码', '');
				UE.getEditor('editor').execCommand('insertHtml', value)
			}
			function createEditor() {
				enableBtn();
				UE.getEditor('editor');
			}
			function getAllHtml() {
				alert(UE.getEditor('editor').getAllHtml())
			}
			function getContent() {
				var arr = [];
				arr.push("使用editor.getContent()方法可以获得编辑器的内容");
				arr.push("内容为：");
				arr.push(UE.getEditor('editor').getContent());
				alert(arr.join("\n"));
			}
			function getPlainTxt() {
				var arr = [];
				arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
				arr.push("内容为：");
				arr.push(UE.getEditor('editor').getPlainTxt());
				alert(arr.join('\n'))
			}
			function setContent(isAppendTo) {
				var arr = [];
				arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
				UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
				alert(arr.join("\n"));
			}
			function setDisabled() {
				UE.getEditor('editor').setDisabled('fullscreen');
				disableBtn("enable");
			}

			function setEnabled() {
				UE.getEditor('editor').setEnabled();
				enableBtn();
			}

			function getText() {
				//当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
				var range = UE.getEditor('editor').selection.getRange();
				range.select();
				var txt = UE.getEditor('editor').selection.getText();
				alert(txt)
			}

			function getContentTxt() {
				var arr = [];
				arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
				arr.push("编辑器的纯文本内容为：");
				arr.push(UE.getEditor('editor').getContentTxt());
				alert(arr.join("\n"));
			}
			function hasContent() {
				var arr = [];
				arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
				arr.push("判断结果为：");
				arr.push(UE.getEditor('editor').hasContents());
				alert(arr.join("\n"));
			}
			function setFocus() {
				UE.getEditor('editor').focus();
			}
			function deleteEditor() {
				disableBtn();
				UE.getEditor('editor').destroy();
			}
			function disableBtn(str) {
				var div = document.getElementById('btns');
				var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
				for (var i = 0, btn; btn = btns[i++];) {
					if (btn.id == str) {
						UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
					} else {
						btn.setAttribute("disabled", "true");
					}
				}
			}
			function enableBtn() {
				var div = document.getElementById('btns');
				var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
				for (var i = 0, btn; btn = btns[i++];) {
					UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
				}
			}

			function getLocalData() {
				alert(UE.getEditor('editor').execCommand("getlocaldata"));
			}

			function clearLocalData() {
				UE.getEditor('editor').execCommand("clearlocaldata");
				alert("已清空草稿箱")
			} */
		</script>
	</body>
</html>