<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<script src="js/person.js" type="text/javascript" charset="utf-8"></script>
		<title>个人主页-学而思博客</title>
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
			
			.content {
				background-color: white;
				margin-top: 30px;
			}
			
			.aside-nav {
				width: 180px;
			}
			
			.aside-nav ul {
				width: 180px;
				border-right: 1px solid #CCCCCC;
				margin-left: -15px;
			}
			
			.aside-nav ul li {
				width: 180px;
				height: 35px;
			}
			
			.aside-nav a {
				margin-top: 1px;
				display: block;
				width: 180px;
				height: 35px;
				line-height: 35px;
				font-size: 16px;
				color: #4d4d4d;
				padding-left: 10px;
			}
			
			.current a {
				background-color: pink;
				color: red;
			}
			
			.aside-nav a:hover {
				background-color: pink;
				color: red;
			}
			
			.content .title {
				height: 90px;
				border-bottom: 1px solid #CCCCCC;
				color: black;
				font: normal bold 20px/90px arial;
				margin-bottom: 30px;
			}
			
			.aside-content {
				margin-left: 30px;
			}
			
			.aside-content .head-img {
				padding: 2px;
				border: 1px solid #CCCCCC;
			}
			
			.aside-content .focus {
				font-size: 16px;
				margin-top: 24px;
			}
			
			.aside-content .focus .data-left, .aside-content .focus .data-right {
				float: left;
				width: 40px;
				height: 49px;
			}
			
			.aside-content .focus .data-left {
				border-right: 1px solid #CCCCCC;
				margin-right: 15px;
			}
			
			.aside-content h1 {
				font-size: 30px;
			}
			
			.aside-content h1 a {
				color: black;
			}
			
			.aside-content h1 {
				margin-top: -20px;
			}
			
			.aside-content a:hover {
				text-decoration: underline;
			}
			
			.aside-content button {
				margin: 10px 0 0 38px;
			}
			
			.aside-content .img-side {
				margin: 37px 0 0 29px;
			}
			
			.personInfo {
				padding-left: 32px;
				font-size: 20px;
				font-family: arial;
			}
			
			.personInfo div {
				margin: 10px 0;
			}
			
			.row hr {
				height: 0;
				border: 1px solid #CCCCCC;
				outline: none;
			}
			
			#upload-bg {
				display: none;
				position: fixed;
				width: 100%;
				height: 100%;
				z-index: 10;
				background-color: rgba(0, 0, 0, 0.65);
			}
			
			#upload-wrap {
				width: 500px;
				height: 400px;
				position: absolute;
				left: 50%;
				top: 50%;
				background-color: white;
				transform: translateX(-250px) translateY(-200px);
			}
			
			#upload-wrap #add {
				display: block;
				position: absolute;
				cursor: pointer;
				padding: 2px;
				border: 2px solid #CCCCCC;
				height: 208px;
				width: 208px;
			}
			
			#upload-wrap #add:hover {
				border: 2px dashed #ccc;
			}
			
			#upload-wrap .upload-content {
				margin: 50px 0 0 100px;
			}
			
			#img-btn {
				display: none;
				margin: 230px 0 0 20px;
			}
			
			#showUpload {
				display: none;
			}
			
			#upload-close {
				position: absolute;
				right: 10px;
				top: 10px;
				cursor: pointer;
				font-size: 16px;
				color: #4d4d4d;
			}
			
			#modifyInfo-bg {
				display: none;
				position: fixed;
				width: 100%;
				height: 100%;
				z-index: 10;
				background-color: rgba(0, 0, 0, 0.65);
			}
			
			#modifyInfo-wrap {
				overflow: hidden;
				width: 500px;
				height: 450px;
				position: absolute;
				left: 50%;
				top: 50%;
				background-color: white;
				transform: translateX(-250px) translateY(-225px);
			}
			
			#modifyInfo-wrap .top {
				position: relative;
				height: 50px;
				line-height: 50px;
				font-size: 16px;
				background-color: #F8F8F8;
				border-bottom: 1px solid #CCCCCC;
			}
			
			#modifyInfo-wrap .top p {
				position: absolute;
				left: 20px;
			}
			
			#modifyInfo-wrap .top span {
				position: absolute;
				right: 10px;
				top: 17px;
			}
			
			#modifyInfo-wrap .container {
				margin-top: 30px;
				padding-left: 50px;
			}
			
			#modifyInfo-wrap .row {
				font-size: 16px;
			}
			
			#modifyInfo-wrap input, #modifyInfo-wrap select {
				width: 350px;
				height: 30px;
				padding-left: 5px;
				margin: 5px;
			}
			
			#modifyInfo-wrap .info-btn {
				margin: 20px 0 0 130px;
			}
			
			.info-btn button:first-child {
				margin-right: 35px;
			}
			.aside-content .focus-list .item {
				height: 82px;
				padding: 10px;
				border-bottom: 1px dashed #ccc;
				position: relative;
			}
			.title .count {
				position: absolute;
				right: 30px;
				top: 0;
			}
			.item button {
				position: absolute;
				top: 20px;
				right: 30px;
				outline: none;
			}
		</style>
	</head>
	<body>
		<div id="modifyInfo-bg">
			<div id="modifyInfo-wrap">
				<div class="top">
					<p>资料修改</p>
					<span id="modifyInfo-close" class="glyphicon glyphicon-remove"></span>
				</div>
				<div id="modifyInfo-input" class="container">
					<div class="row"> 实名：
						<input type="text" id="truename" /> </div>
					<div class="row"> 性别：
						<select id="sex">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div>
					<div class="row"> 生日：
						<input type="date" id="birthday" /> </div>
					<div class="row"> 地区：
						<input type="text" id="location" /> </div>
					<div class="row"> 职业：
						<input type="text" id="job" /> </div>
					<div class="row"> 邮箱：
						<input type="email" id="email" /> </div>
					<div class="row"> 手机：
						<input type="phone" id="phone" /> </div>
					<div class="row info-btn">
						<button class="btn btn-primary" id="confirm-info">确认</button>
						<button class="btn btn-primary" id="cancel-info">取消</button>
					</div>
				</div>
			</div>
		</div>
		<div id="upload-bg">
			<div id="upload-wrap">
				<div id="upload-close">
					<span class="glyphicon glyphicon-remove"></span>
				</div>
				<div class="upload-content">
					<p style="font-size: 16px;">上传头像</p>
					<form id="upload-head-img" enctype="multipart/form-data">
						<input type="file" name="head-img" id="upload-file" style="display: none" /> </form>
					<div id="add">
						<div id="showUpload">
							<img src="" width="200px" height="200px" /> </div>
						<div id="addImg">
							<img src="images/add.jpg" width="200px" height="200px" /> </div>
					</div>
					<div id="img-btn">
						<button id="btn-confirm" class="btn btn-primary">确认</button>
						<button id="btn-cancel" class="btn btn-primary">取消</button>
					</div>
				</div>
			</div>
		</div>
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
							<a href="/blog">首页</a>
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
								<span class="glyphicon glyphicon-home"></span> ${sessionScope.user.username }</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container content">
			<div class="row">
				<div class="col-md-2 col-md-offset-1 aside-nav">
					<ul>
						<li>
							<a href="person.html">个人资料</a>
						</li>
						<li>
							<a href="#">我的收藏</a>
						</li>
						<li class="current">
							<a href="#">我的关注</a>
						</li>
						<li>
							<a href="#">我的粉丝</a>
						</li>
						<li>
							<a href="myblog-data.html?get=all">我的博客</a>
						</li>
					</ul>
				</div>
				<div class="col-md-8 aside-content">
					<div class="row title">
						<p>我的关注</p>
						<span class="count">共${fn:length(requestScope.focus_list) }人</span>
					</div>
					<div class="row focus-list">
						<c:choose>
							<c:when test="${fn:length(requestScope.focus_list) == 0}">
								<img src="images/no.png">
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.focus_list }" var="user">
								<div class="item" uid="${user.uid }">
									<img src="getImage?uid=${user.uid }" width="50px" height="50px" class="left"/>
									<span class="left">${user.username }</span>
									<button class="btn btn-default">取消关注</button>
								</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<script type="text/javascript">
							$(".item button").on("click", function() {
								var uid = $(this).parent().attr("uid");
								var data = {};
								data.focus = "${sessionScope.uid }";
								data.befocus = uid;
								console.log(data.focus);
								console.log(data.befocus);
								$.ajax({
									type:"get",
									url:"AttentionServlet?method=unfocus",
									data: data,
									async:true,
								});
								console.log("取消关注了");
								$(this).parent().remove();
							})
						</script>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>