<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>写博客-学而思博客</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
</script>
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

.bottom {
	margin-top: 40px;
}

.left-nav a {
	margin-top: 1px;
	display: block;
	width: 140px;
	height: 40px;
	color: #888;
	font-size: 16px;
	line-height: 40px;
	background-color: white;
	text-align: center;
}

.left-nav .current a {
	background-color: #f44444;
	color: white;
}

.left-nav a:hover {
	background-color: #f44444;
	color: white;
}

.right-content {
	border: 1px solid #ccc;
	margin-left: 140px;
}

.article-list {
	padding: 0 20px;
}

.article {
	height: 123px;
	border-bottom: 1px solid #999;
}

.article .title {
	font: bold 18px/24px arial;
	color: #3d3d3d;
}

.article .title:hover {
	color: #ca0c16;
}

.article .summary {
	margin: 15px 0;
	font-size: 13px;
	color: #8a8a8a;
	line-height: 24px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.fl {
	float: left;
}

.fr {
	float: right;
}

.article .info {
	line-height: 24px;
}

.article .info .interval {
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background-color: #adadad;
	margin-top: 10px;
	margin-left: 12px;
	margin-right: 12px;
}

.info .username {
	margin-left: 10px;
}

.info .txt {
	margin-right: 5px;
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
					<li><a href="home.html">首页</a> <span>|</span></li>
					<li><a href="person.html">个人中心</a> <span>|</span></li>
					<li><a href="myblog-data.html?get=all">我的博客</a> <span>|</span></li>
					<c:choose>
						<c:when test="${sessionScope.uid == null }">
							<li><a href="login.html">登录</a> <span>|</span>
							</li>
							<li><a href="register.html">注册</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="UserServlet?method=logout">退出登录</a> <span>|</span>
							</li>
							<li><a href="person.html"> <span
									class="glyphicon glyphicon-home"></span>
									${sessionScope.username }
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	<div class="container bottom">
		<div class="col-md-1 left-nav">
			<div>
				<a href="/blog">最新文章</a>
			</div>
			<div>
				<a href="home.html?get=云计算/大数据">云计算/大数据</a>
			</div>
			<div>
				<a href="home.html?get=游戏开发">游戏开发</a>
			</div>
			<div>
				<a href="home.html?get=运维">运维</a>
			</div>
			<div>
				<a href="home.html?get=数据库">数据库</a>
			</div>
			<div>
				<a href="home.html?get=前端">前端</a>
			</div>
			<div>
				<a href="home.html?get=后端">后端</a>
			</div>
			<div>
				<a href="home.html?get=编程语言">编程语言</a>
			</div>
			<div>
				<a href="home.html?get=网络安全">网络安全</a>
			</div>
			<script type="text/javascript">
			var keyword = new String("${requestScope.keyword }");
			if (keyword.length == 0) {
				$(".left-nav a").eq(0).parent().addClass("current");
			} else {
				$(".left-nav a").each(function() {
					var value = $(this).attr("href");
					value = value.substring(value.indexOf("=") + 1);
					if (value == keyword) {
						$(this).parent().addClass("current");
					}
				})
			}
		</script>
		</div>
		<div class="col-md-9 col-md-offset-2 right-content">
			<div class="row advert">
				<img src="images/advert.png" width="853px" height="130px" />
			</div>
			<div class="row">
				<div class="article-list">
					<c:choose>
						<c:when test="${fn:length(recent_article) != 0 || fn:length(related_article) != 0 }">
							<c:choose>
								<c:when test="${fn:length(recent_article) != 0 }">
								<c:forEach items="${requestScope.recent_article }" var="article">
								<div class="article">
									<h2>
										<a class="title" href="ArticleServlet?method=show&aid=${article.aid }">${article.title }</a>
									</h2>
									<div class="summary">${article.summary }</div>
									<div class="info">
										<img class="fl" src="getImage?uid=${article.uid }"
											width="24px" height="24px" /> <a class="username fl" href="#">${article.username }</a>
										<span class="interval fl"></span> <span class="time fl">${article.time }</span>
										<span class="interval fl"></span> <span class="time fl">${article.all_classify }</span>
										<span class="fr">${article.commentCount }</span> <span
											class="fr txt">评论</span> <span class="interval fr"></span> <span
											class="fr">${article.readCount }</span> <span class="fr txt">阅读</span>
									</div>
								</div>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<c:forEach items="${requestScope.related_article }" var="article">
								<div class="article">
									<h2>
										<a class="title" href="ArticleServlet?method=show&aid=${article.aid }">${article.title }</a>
									</h2>
									<div class="summary">${article.summary }</div>
									<div class="info">
										<img class="fl" src="getImage?uid=${article.uid }"
											width="24px" height="24px" /> <a class="username fl" href="#">${article.username }</a>
										<span class="interval fl"></span> <span class="time fl">${article.time }</span>
										<span class="interval fl"></span> <span class="time fl">${article.all_classify }</span>
										<span class="fr">${article.commentCount }</span> <span
											class="fr txt">评论</span> <span class="interval fr"></span> <span
											class="fr">${article.readCount }</span> <span class="fr txt">阅读</span>
									</div>
								</div>
								</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<img src="images/no.png" style="display: block;margin: 100px auto;"/>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>