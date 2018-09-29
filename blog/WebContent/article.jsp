<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>${requestScope.article.title }-学而思博客</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
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
				margin-top: 30px;
			}
			
			.content .left {
				border: 1px solid #ccc;
			}
			
			.content .right {
				border: 1px solid #ccc;
				margin-left: 30px;
				width: 825px;
			}
			
			.left img {
				border-radius: 50%;
				margin-right: 25px;
			}
			
			.left .head-img {
				margin-top: 40px;
				margin-left: 16px;
			}
			
			#attention {
				margin-left: 18px;
				width: 77px;
				outline: none;
			}
			
			.nofocus {
				border: 1px solid #ca0c16;
				color: #ca0c16;
				background-color: white;
			}
			
			.nofocus:hover {
				background-color: pink;
				color: #ca0c16;
				border: 1px solid #ca0c16;
			}
			
			.hasfocus {
				color: #999;
				border: 1px solid #999;
				background-color: white;
			}
			
			.hasfocus:hover {
				color: #ca0c16;
				border: 1px solid #ca0c16;
				background-color: pink;
			}
			
			.left .personInfo {
				margin-top: 30px;
			}
			
			.left .personInfo div {
				float: left;
				width: 136px;
				font-size: 16px;
				color: #666;
			}
			
			.left .show {
				border-left: 5px solid #ca0c16;
				padding-left: 8px;
				height: 30px;
				line-height: 30px;
				font-size: 16px;
				margin-left: 20px;
				margin-top: 40px;
			}
			
			.show~p {
				margin-left: 20px;
				font-size: 16px;
				margin-top: 15px;
			}
			
			.title {
				position: relative;
				height: 100px;
				border-bottom: 1px solid #999999;
				padding: 12px 0 108px 11px;
			}
			
			.title span.h3 {
				border-radius: 50%;
				color: #ca0c16;
				border: 1px solid #ca0c16;
				padding: 7px;
			}
			
			.title .left-p {
				position: absolute;
				left: 12px;
				top: 83px;
			}
			
			.title .left-p .article_user {
				margin: 0 25px;
			}
			
			.left-p .tag {
				border: 1px solid #999;
				border-radius: 8px;
				padding: 3px;
				margin-right: 10px;
			}
			
			.title .right-p {
				position: absolute;
				right: 30px;
				top: 83px;
			}
			
			.comment {
				margin-top: 50px;
				height: 42px;
				overflow: hidden;
			}
			
			.right .content {
				padding: 20px 10px;
				border-bottom: 1px solid #999999;
				min-height: 300px;
			}
			
			.comment textarea {
				height: 38px;
				width: 790px;
				resize: none;
				border-radius: 5px;
				outline: none;
			}
			
			.comment-list div {
				border-bottom: 1px dotted #999999;
				padding: 10px 0;
			}
			
			.comment-list .username {
				font-weight: bold;
			}
			.no-count {
				font-size: 20px;
				margin-top: 30px;
				margin-bottom: 30px;
			}
			.article-item {
				overflow: hidden;
			}
			.article-item .a-title {
				font-size: 12px;
				width: 190px;
				float: left;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
			}
			.article-item .a-count {
				font-size: 12px;
				float: left;
				margin-left: 10px;
			}
			.classify-item {
				font-size: 16px;
				overflow: hidden;
			}
			.classify-item .c-title {
				float: left;
				width: 200px;
			}
			.classify-item .c-count {
				float: left;
				margin-left: 10px;
			}
		</style>
	</head>
	<body>
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
							<a href="myblog-data.html?get=all">我的博客</a>
							<span>|</span>
						</li>
						<c:choose>
							<c:when test="${sessionScope.uid == null }">
								<li>
									<a href="login.html">登录</a>
									<span>|</span>
								</li>
								<li>
									<a href="register.html">注册</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="UserServlet?method=logout">退出登录</a>
									<span>|</span>
								</li>
								<li>
									<a href="person.html">
										<span class="glyphicon glyphicon-home"></span> ${sessionScope.username } </a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<div class="container content">
			<div class="col-md-3 left">
				<div class="row head-img">
					<img src="getImage?uid=${article.uid }" width="60px" height="60px" />
					<span>${requestScope.article.username }</span>
					<c:if test="${sessionScope.uid != requestScope.article.uid }">
					<c:choose>
						<c:when test="${requestScope.hasFocus == 'yes' }">
						<button class="btn hasfocus" id="attention">已关注</button>
						</c:when>
						<c:otherwise>
						<button class="btn nofocus" id="attention">关注</button>
						</c:otherwise>
					</c:choose>
					<script type="text/javascript">
						$(function() {
							$("#attention").on("mouseover", function() {
								if ($(this).text() == "已关注") {
									$(this).text("取消关注");
								} 
							})
							$("#attention").on("mouseout", function() {
								if ($(this).text() == "取消关注") {
									$(this).text("已关注");
								} 
							})
							$("#attention").on("click", function() {
								var value = $(this).text();
								if(value == "关注") {
									$.ajax({
										type: "post",
										url: "AttentionServlet?method=focus&focus=${sessionScope.uid }&befocus=${requestScope.article.uid }",
										async: true,
									});
									console.log("关注了");
									$(this).text("取消关注");
									$(this).removeClass("nofocus").addClass("hasfocus");
									$("#befocus").text(+$("#befocus").text() + 1);
								} else {
									$.ajax({
										type: "get",
										url: "AttentionServlet?method=unfocus&focus=${sessionScope.uid }&befocus=${requestScope.article.uid }",
										async: true,
									});
									console.log("取消关注了");
									$(this).text("关注");
									$(this).removeClass("hasfocus").addClass("nofocus");
									$("#befocus").text(+$("#befocus").text() - 1);
								}
							})
						})
					</script>
					</c:if>
				</div>
				<div class="row personInfo">
					<div class="text-center"> 原创
						<br><span>${requestScope.byself_count }</span> </div>
					<div class="text-center"> 粉丝
						<br><span id="befocus">${requestScope.befocus_count }</span> </div>
					<div class="text-center"> 收藏
						<br><span>undo</span> </div>
					<div class="text-center"> 关注
						<br><span>${requestScope.focus_count }</span> </div>
				</div>
				<div class="row">
					<div class="show">最新文章</div>
					<c:choose>
						<c:when test="${fn:length(requestScope.recent_article) == 0 }">
							<p class="no-count">暂无</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.recent_article }" var="article">
								<p class="article-item">
									<a href="ArticleServlet?method=show&aid=${article.aid } " class="a-title">${article.title }</a>
									<span class="a-count">阅读：${article.readCount }</span>
								</p>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<div class="show">个人分类</div>
					<c:choose>
						<c:when test="${fn:length(requestScope.classify_count) == 0 }">
							<p class="no-count">暂无</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.classify_count }" var="item">
								<p class="classify-item">
									<span class="c-title">${item.key }</span>
									<span class="c-count">${item.value }篇</span>
								</p>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-md-8 right">
				<div class="row title">
					<h3>
						<span class="h3">${requestScope.article.type.charAt(0) }</span> ${requestScope.article.title } </h3>
					<p class="left-p">
						<span>${requestScope.article.time }</span>
						<span class="article_user">${requestScope.article.username }</span>
						<span id="article_tag">标签：</span>
					</p>
					<script type="text/javascript">
						var tagValue = new String("${requestScope.article.tag }");
						if(tagValue.length == 0) {
							$("#article_tag").remove();
						} else {
							var tags = tagValue.split(",");
							for(var i = 0; i < tags.length; i++) {
								$("#article_tag").after($("<span class='tag'>" + tags[i] + "</span>"));
							}
						}
					</script>
					<p class="right-p">
						<button class="btn btn-default btn-sm">收藏undo</button>
					</p>
				</div>
				<div class="row content">${article.content }</div>
				<div class="row comment">
					<img src="getImage?uid=${sessionScope.uid }" style="vertical-align: top; margin-top: 4px;" width="24px" height="24px" />
					<textarea id="comment" placeholder="想说点什么" data-aid="${article.aid }"></textarea>
					<div style="float: right; margin-right: 6px;">
						<span>还能输入1000个字符</span>
						<button class="btn btn-danger" id="give-comment">发表评论</button>
					</div>
				</div>
				<script type="text/javascript">
					$("#comment").on("focus", function() {
						$(this).css("height", "100px");
						$(".comment").animate({
							height: '150px'
						});
					})
					$("#comment").on("blur", function() {
						$(this).animate({
							height: '38px'
						});
						$(".comment").animate({
							height: '42px'
						});
					})
					$("#give-comment").on("click", function() {
						var comment = $("#comment").val();
						var aid = $("#comment").attr("data-aid");
						console.log("评论是:" + comment);
						console.log(aid);
						var data = {};
						data.account = comment;
						data.aid = aid;
						$.ajax({
							type: "post",
							url: "CommentServlet?method=give-comment",
							async: true,
							data: data,
							success: function() {
								$("#comment").val("");
								window.location.href = "ArticleServlet?date=" + new Date() + "&method=show&aid=${requestScope.article.aid }#comment-list";
							}
						});
					})
				</script>
				<div class="row comment-list" id="comment-list">
					<c:choose>
						<c:when test="${fn:length(requestScope.comment_list) == 0 }">
							<p>暂无评论 </c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.comment_list }" var="comment">
								<div>
									<img src="getImage?uid=${comment.uid }" width="24px" height="24px" />
									<span class="username">${comment.username }：</span>
									<span>${comment.account }</span>
									<span>(${comment.time})</span>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</body>
</html>