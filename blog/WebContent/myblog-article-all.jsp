<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>写博客-学而思博客</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
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
			
			.top ul li {
				height: 50px;
				line-height: 50px;
				color: #999;
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
				margin-top: 30px;
				background-color: white;
			}
			/*temp*/
			
			.content .nav-left {
				height: 700px;
				margin-left: 37px;
				border-right: 1px solid #CCCCCC;
			}
			
			.content .aside-right {
				margin-left: 54px;
				width: 914px;
			}
			
			.nav-left div {
				margin-top: 1px;
				width: 185px;
				height: 45px;
				font-size: 16px;
				line-height: 45px;
				padding-left: 20px;
			}
			
			#article {
				background-color: #C92027;
				color: white;
			}
			.nav-left div:hover {
				cursor: pointer;
				background-color: #C92027;
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
			/*以上是侧边导航栏的样式*/
			
			.aside-right {
				padding-left: 50px;
			}
			
			.article-manage {
				margin: 20px 0 30px 0;
				border-left: 3px solid blue;
				font-size: 16px;
				padding-left: 20px;
			}
			
			.aside-right ul {
				overflow: hidden;
				border-bottom: 1px solid #ccc;
			}
			
			.aside-right ul li {
				float: left;
				padding-right: 40px;
			}
			
			.aside-right ul li a {
				display: block;
				padding: 20px 0;
				color: #999;
			}
			
			.aside-right ul li.current a {
				color: black;
			}
			.aside-right ul li.current a {
				border-bottom: 3px solid blue;
			}
			
			.aside-right ul li a:hover {
				border-bottom: 3px solid blue;
			}
			
			.search-box {
				margin-top: 16px;
				padding: 16px;
				font-size: 16px;
				background-color: #f2f5f7;
			}
			
			.search-box select, .search-box input {
				height: 40px;
				font-size: 16px;
				color: #999;
				padding: 5px;
				outline: none;
				width: 150px;
				margin: 0 30px;
			}
			
			.search-box input {
				width: 250px;
				outline: none;
				margin-left: 42px;
				vertical-align: top;
			}
			
			.search-box button {
				background-color: #CA0C16;
				color: white;
				border: none;
				outline: none;
				padding: 9px 22px;
				vertical-align: top;
			}
			.article-list .no {
				text-align: center;
				margin-top: 100px;
			}
			.article .status {
				border-radius: 50%;
			    border: 1px solid #999;
			    padding: 5px;
			    font-size: 13px;
			}
			.article {
				padding: 10px 0;
			    border-bottom: 1px dotted #ddd;
			}
			.article a {
				font-size: 18px;
                color: #4f4f4f;
			}
			.article a:hover {
				color: #C92027;
			}
			.article p {
				color: #999;
				font-size: 12px;
				margin-top: 20px;
			}
			.article .byself {
				border: 1px solid #999;
				padding: 3px;
				margin-right: 10px;
			}
			.article button {
				float: right;
				margin-right: 20px;
				margin-top: -15px;
				outline: none;
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
				<div class="col-md-5 col-md-offset-1">
					<ul class="top-nav">
						<li>
							<a href="home.html">首页</a>
							<span>|</span>
						</li>
						<li>
							<a href="person.html">个人中心</a>
							<span>|</span>
						</li>
						<li class="current">
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
					<div>
						<a href="write-blog.html">
							<span class="glyphicon glyphicon-pencil"></span> 写博客</a>
					</div>
					<div>
						<a href="person.html">
							<span class="glyphicon glyphicon-home"></span> 主页</a>
					</div>
					<div>内容</div>
					<div id="article">文章管理</div>
					<script type="text/javascript">
						$("#article").on("click", function() {
							window.location.href="myblog-data.html?get=all";
						})
					</script>
					<div id="comment">评论管理undo</div>
					<script type="text/javascript">
						
					</script>
				</div>
				<div class="col-md-8 aside-right">
					<div class="row">
						<p class="article-manage">文章管理</p>
					</div>
					<ul class="row">
						<li class="current">
							<a href="myblog-data.html?get=all">全部(${requestScope.all })</a>
						</li>
						<li>
							<a href="myblog-data.html?get=enable">已发表(${requestScope.enable })</a>
						</li>
						<li>
							<a href="myblog-data.html?get=temp">草稿(${requestScope.temp })</a>
						</li>
						<li>
							<a href="myblog-data.html?get=delete">
								<span class="glyphicon glyphicon-trash"></span> 回收站(${requestScope.trash })</a>
						</li>
					</ul>
					<div class="row search-box"> 选项：
						<select id="article_type">
							<option value="0">不限类型</option>
							<option value="原创">原创</option>
							<option value="转载">转载</option>
							<option value="翻译">翻译</option>
						</select>
						<select id="article_classify">
							<option value="0">不限分类</option>
							<c:if test="${fn:length(requestScope.classify_count) != 0 }">
								<c:forEach items="${requestScope.classify_count }" var="item">
									<option value="${item.key }">${item.key }</option>
								</c:forEach>
							</c:if>
						</select>
						<input type="text" placeholder="仅支持标题关键词搜索" id="keyword"/>
						<button class="btn btn-primary" id="search">搜 索</button>
					</div>
					<script type="text/javascript">
						$(function() {
							$("#search").on("click", function() {
								var type = $("#article_type").val();
								var classify = $("#article_classify").val();
								var keyword = $("#keyword").val();
								var data = {};
								data.type = type;
								data.classify = classify;
								data.keyword = keyword;
								$.ajax({
									type: "get",
									url: "ArticleServlet?method=search",
									data: data,
									dateType: "json",
									success: function(result) {
										$("#article-list").html("");
										if (result.length == 0) {
											$("#article-list").append($("<p class='no'>没有符合条件的文章</p>" + 
													"<div style='text-align:center;'><img src='images/no.png'/></div>"));
										} else {
											for (var i = 0; i < result.length; i++) {
												$("#article-list").append($("<div class='article'><h3>" +
												"<a href='ArticleServlet?method=show&aid=" + result[i].uid + "'>"+ result[i].title+"</a>"+
												"<p><span class='byself'>"+result[i].type+"</span><span>"+result[i].time+"</span>" +
													"<button class='btn btn-danger btn-sm delete-article' article-id='" + result[i].uid+"'>删 除</button>" +
												"</p></h3></div>"));
											}
										}
									}
								})
							})
						})
					</script>
					<div class="row article-list" id="article-list">
						<c:choose>
							<c:when test="${fn:length(article_list) == 0 }">
								<p class="no">没有符合条件的文章</p>
								<div style="text-align:center;"><img src="images/no.png"/></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.article_list }" var="article">
								<div class="article">
									<h3>
										<a href="ArticleServlet?method=show&aid=${article.aid }">
										<c:if test="${article.status == '草稿' }">
										<span class="status">${article.status.charAt(0) }</span> 
										</c:if>
										${article.title }</a>
										<p>
											<span class="byself">${article.type }</span>
											<span>${article.time }</span>
											<button class="btn btn-danger btn-sm delete-article" article-id="${article.aid }">删 除</button>
										</p>
									</h3>
								</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<script type="text/javascript">
							$("#article-list").delegate(".delete-article", "click", function() {
								var res = confirm("确认删除此文章吗？");
								if (res) {
									var article = $(this).parent().parent().parent();
									var article_id = $(this).attr("article-id");
									$.ajax({
										type:"get",
										url:"ArticleServlet?method=delete&aid=" + article_id,
										async:true,
										success: function() {
											alert("删除成功");
											article.remove();
											//修改响应的数量
										}
									});
								}
							})
						</script>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>