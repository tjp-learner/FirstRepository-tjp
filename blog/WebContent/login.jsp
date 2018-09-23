<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="renderer" content="webkit">
		<meta name="force-rendering" content="webkit">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
		<title>学且思博客登录</title>
	</head>
	<body>
		<div class="container">
			<div class="row top">
				<div class="col-md-5 col-md-offset-1 slideImg">
					<img src="images/slide-man.png" width="400px" height="500px" /> </div>
				<div class="slide-line"></div>
				<div class="col-md-4 login-part">
					<div class="row">
						<div class="col-md-4">
							<h3>账号登录</h3>
						</div>
					</div>
					<form action="UserServlet?method=login" method="post">
						<div class="login-msg">${requestScope.login_msg }</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</div>
								<input type="text" id="username" placeholder="用户名" name="username" required class="form-control input-lg" value="${requestScope.username }"/> </div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock"></span>
								</div>
								<input type="password" id="password" placeholder="密码" name="password" required class="form-control input-lg" value="${requestScope.password }"/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-record"></span>
								</div>
								<input type="text" id="ver-code" placeholder="验证码" required name="ver-code" class="form-control input-lg" />
								<div class="input-group-addon" style="padding: 0;">
									<img src="" alt="yanzhenma" id="code-img" width="50px" />
								</div>
								<script type="text/javascript">
									var date = new Date();
									$("#code-img").attr("src", "VertificationCodeServlet?" + date.getTime());
									$("#code-img").on("click", function() {
										var date = new Date();
										$(this).attr("src", "VertificationCodeServlet?" + date.getTime());
									});
								</script>
							</div>
						</div>
						<div class="form-group select">
							<div class="col-md-5">
								<div class="checkbox">
									<label>
										<input type="checkbox" name="autologin" value="yes">自动登录</label>
								</div>
							</div>
							<div class="col-md-4 col-md-offset-3">
								<a href="#" class="forget">忘记密码?</a>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary btn-lg" value="登录" />
						</div>
					</form>
					<div class="row">
						<div class="col-md-4" class="noaccount">还没有账号?</div>
						<div class="col-md-3">
							<a href="register.html" class="register">立即注册</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<hr /> </div>
			<div class="row footer">
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">公司简介 | </a>
				</div>
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">招纳贤士 | </a>
				</div>
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">广告服务 | </a>
				</div>
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">公司简介 | </a>
				</div>
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">博客咨询 | </a>
				</div>
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">文章发布 | </a>
				</div>
				<div class="col-xs-1">
					<a href="javascritp:void(0)" target="_blank">公司简介</a>
				</div>
			</div>
		</div>
	</body>
</html>