<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/style.css">
<title>情報更新</title>
</head>
<body>
<header>
	<p>${userInfo.name} さん &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="LogoutServlet"><font color=red>ログアウト</font></a></p>
</header>
<h1 class="inner">
ユーザ情報更新</h1><br />
<c:if test="${errMsg != null}" >
	    <div class=inner role="alert">
		<font color=red>  ${errMsg}
		</font>
		</div>
	</c:if>
<div class="inner">
<form  action="UserUpdateServlet" method="post">
<span>ログインID </span><span>${user.loginId} </span><br /><br />
<span>パスワード </span><span><input name=password type="password" id="inputPassword" class="form-control"  ></span><br /><br />
<span>パスワード(確認) </span><span><input  name=password2 type=password id="inputId" class="form-control" ></span><br /><br />
<span>ユーザ名 </span><span><input name=name id="inputId" class="form-control"value="${user.name}" ></span><br /><br />
<span>生年月日 </span><span><input name=birthDate type=date id="inputId" class="form-control"value="${user.birthDate}" ></span><br /><br />
<input type="hidden" value="${id}" name="id">
 <input type="submit"value="更新"style="width: 100px; height: 30px"><br /><br />
 </form>
 </div>
 <a href="javascript:history.back();">戻る</a>
</body>
</html>