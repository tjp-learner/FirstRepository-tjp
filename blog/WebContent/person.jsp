<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/person.css" />
		<script src="js/person.js" type="text/javascript" charset="utf-8"></script>
		<title>个人主页-学且思博客</title>
	</head>
	<body>
		<div id="modifyInfo-bg">
			<div id="modifyInfo-wrap">
				<div class="top">
					<p>资料修改</p>
					<span id="modifyInfo-close" class="glyphicon glyphicon-remove"></span>
				</div>
				<div class="container">
					<div class="row">
						实名：<input type="text" id="truename"/>
					</div>
					<div class="row">
						性别：<select id="sex">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div>
					<div class="row">
						生日：<input type="date" id="birthday"/>
					</div>
					<div class="row">
						地区：<input type="text" id="location"/>
					</div>
					<div class="row">
						职业：<input type="text" id="job"/>
					</div>
					<div class="row">
						邮箱：<input type="email" id="email"/>
					</div>
					<div class="row">
						手机：<input type="phone" id="phone" />
					</div>
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
						<a href="home.html">学且思博客</a>
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
							<a href="#">我的博客</a>
							<span>|</span>
						</li>
						<li>
							<a href="UserServlet?method=logout">退出登录</a>
							<span>|</span>
						</li>
						<li>
							<a href="person.html">
								<span class="glyphicon glyphicon-home"></span> ${user.username }</a>
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
						<li>
							<a href="#">我的关注</a>
						</li>
						<li>
							<a href="#">我的粉丝</a>
						</li>
						<li>
							<a href="#">我的博客</a>
						</li>
					</ul>
				</div>
				<div class="col-md-8 aside-content">
					<div class="row title">
						<p>个人资料</p>
					</div>
					<div class="row">
						<div class="col-md-4">
							<img id="head-img" src="" class="head-img" id="head_img" width="186px" height="186px" />
							<script type="text/javascript">
								var image = new String("${user.image }");
								if (image == null || image == ""){
									$("#head-img").attr("src", "images/no-upload.jpg");
								} else {
									$("#head-img").attr("src", "getImage");
								}
							</script>
							<button id="upload-img" class="btn btn-primary"> 修 改 头 像 </button>
						</div>
						<div class="col-md-6 img-side">
							<h1>
								<a href="person.html">${user.username }</a>
							</h1>
							<div class="focus">
								<div class="data-left">
									<p>7</p>
									<p>关注</p>
								</div>
								<div class="data-right">
									<p>0</p>
									<p>粉丝</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<hr /> </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 col-md-offset-3 personInfo">
					<div>用户名：${user.username }</div>
					<div id="truename-info">实名：${user.truename }</div>
					<div id="sex-info">性别：${user.sex }</div>
					<div id="birthday-info">生日：${user.birthday }</div>
					<div id="location-info">地区：${user.location }</div>
					<div id="job-info">职业：${user.job }</div>
					<div id="email-info">邮箱：${user.email }</div>
					<div id="phone-info">手机：${user.phone }</div>
				</div>
				<div class="col-md-1">
					<button class="btn btn-primary"> 修 改 资 料</button>
				</div>
			</div>
		</div>
	</body>
</html>