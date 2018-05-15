<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=path%>>">
<title>管理员登录</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/loginAdmin.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
			</div>
		</div>
		<!-- Related demos -->
	</div>
	
	<div id="loginDiv">
		<form id="loginForm" action="admin/login" method="post">
			<p>
				<label>${errorMsg }&nbsp;</label>
			</p>
			<c:remove var="errorMsg" scope="session" />
			<p>
				<input name="adname" value="" placeholder="请输入姓名"
					required="required" />
			</p>
			<p>
				<input type="password" value="" name="adpwd" placeholder="请输入密码"
					required="required" />
			</p>
			<p>
				<img src="randImg.jpg" alt="正在加载验证啊" title="看不清，换一张" /><input
					name="vcode" placeholder="请输入验证码" id="vcode" required="required" />
			</p>
			<p>
				<input type="submit" value="登录" id="loginBtn" />
			</p>
			<a href="page/forgetPassword.jsp">忘记密码</a>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js_1/loginAdmin.js"></script>
	<script src="js/TweenLite.min.js"></script>
	<script src="js/EasePack.min.js"></script>
	<script src="js/rAF.js"></script>
	<script src="js/demo-1.js"></script>
</body>
</html>