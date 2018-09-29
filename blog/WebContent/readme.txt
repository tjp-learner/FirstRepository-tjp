15.6寸笔记本，谷歌浏览器打开，效果最佳
数据库SQL文件：blog.sql
使用的是java1.8   tomcat 9
web版本  servlet2.5
技术： ajax，jQuery，boostrap搭一下，servlet,jsp,mysql
   	写博客用了百度的富文本编辑器

学且思博客系统 
需求和功能分析：
	首页：
		浏览文章，最新文章，不同类别的文章
	登录页面：
		用户名密码验证码登录，提供自动登录功能
	注册页面：
		手机，邮箱，用户名，密码注册，提供前端和后端的验证（如手机，邮箱，用户名是否重复，格式是否正确，按要求）
	个人中心页面：
		查看和修改个人信息（头像，用户名，其他基本信息）
		查看我的关注和粉丝对应的用户
	我的博客页面：
		主要是文章管理功能
			分类： 全部，已发表，草稿，回收站
			查找文章，文章的删除
	文章页面：
		显示某一篇文章及该文章作者的信息
			作者信息： 关注，粉丝，原创的数量
			最新文章查看
			个人分类查看
			文章标题，内容，标签的显示
			评论系统，查看该文章所有评论，发表评论

session:
	登录时，保存uid,username
	生成验证码时保存验证码
	到个人主页person.jsp person.html  将整个用户信息存入session(user)
cookie:
	登录时，如果勾上了自动登录，那么存cookie为autoLogin=yes#username#password


	
ajax异步上传文件（表单形式）
$("#upload-file").on("change", function() {
	$.ajax({
		url: 'UploadImgServlet',
		type: 'POST',
		cache: false,
		data: new FormData($('#upload-head-img')[0]), //h5的DataForm对象
		dataType: "json",
		processData: false,
		contentType: false
	})
})

使用response.sendRirect进行跳转，特别是在过滤器中，注意不能跳转到原页面，否则将无限循环跳转
