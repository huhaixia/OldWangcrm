<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8" />
<head>
<title>老王房源管理系统</title>
<link rel="stylesheet" type="text/css" href="Styles/base.css" />
<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript" src="Scripts/jquery.spritely-0.6.js"></script>

<link rel="stylesheet" type="text/css" href="Styles/login.css" />
</head>
<body>
	<div id="clouds" class="stage"></div>
	<div class="loginmain"></div>

	<div class="row-fluid">
		<h1>老王房源管理系统</h1>
		<form action='${pageContext.request.contextPath }/login' method="GET">
			<p>
				<label>帐&nbsp;&nbsp;&nbsp;号：<input type="text" id="uid" /></label>
			</p>
			<p>
				<label>密&nbsp;&nbsp;&nbsp;码：<input type="password" id="pwd" /></label>
			</p>
			<p class="pcode">
				<label>效验码：<input type="text" id="code" maxlength="5"
					class="code" value="e5g88" /><img src="img/code.gif" alt=""
					class="imgcode" /><a href="#">下一张</a></label>
			</p>
			<p class="tip">&nbsp;</p>
			<hr />
			<input type="submit" value=" 登 录 "
				class="btn btn-primary btn-large login" /> &nbsp;&nbsp;&nbsp;<input
				type="button" value=" 取 消 " class="btn btn-large" />
		</form>
	</div>
</body>
</html>
