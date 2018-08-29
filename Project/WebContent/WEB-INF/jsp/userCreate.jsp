<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/style.css">
<title>新規登録</title>
</head>
<body>
<header>
	<p>${userInfo.name} さん &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="LogoutServlet"><font color=red>ログアウト</font></a></p>
</header>
<h1 class="inner">
ユーザ新規登録</h1><br />
<c:if test="${errMsg != null}" >
	    <div class=inner role="alert">
		<font color=red>  ${errMsg}
		</font>
		</div>

	</c:if>

<div class="inner">
<form  action="UserCreateServlet" method="post">
<span>ログインID </span><input name="loginId" id="inputLoginId" class="form-control"><br /><br />
<span>パスワード </span><input type="password"  name="password" id="inputPassword" class="form-control" ><br /><br />
<span>パスワード(確認) </span><input  type="password"  name="password2" id="inputPassword" class="form-control"  ><br /><br />
<span>ユーザ名 </span><input  name="name" id="inputName" class="form-control" ><br /><br />
<span>生年月日 </span><input  name="birthDate" id="inputBirthDate" class="form-control" type=date style="width: 168px;height: 17px" ><br /><br />

 <input type="submit"style="width: 100px; height: 30px"value="登録"><br /><br />
 </form>
 </div>
 <a href="javascript:history.back();">戻る</a>

</body>
</html>