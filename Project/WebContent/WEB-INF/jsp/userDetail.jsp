<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/style.css">
<title>ユーザ情報</title>
</head>
<body>
<header>
	<p>${userInfo.name} さん &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="LogoutServlet"><font color=red>ログアウト</font></a></p>
</header>
<h1 class="inner">
ユーザ情報詳細参照</h1><br />
<div class="inner">
<span>ログインID </span><span>${user.loginId}</span><br /><br />
<span>ユーザー名 </span><span>${user.name}</span><br /><br />
<span>生年月日 </span><span>${user.birthDate}</span><br /><br />
<span>登録日時 </span><span>${user.createDate}</span><br /><br />
<span>更新日時 </span><span>${user.updateDate}</span><br /><br />
</div>
<a href="javascript:history.back();">戻る</a>
</body>
</html>