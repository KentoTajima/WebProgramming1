<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/style.css">
<title>ログイン</title>
</head>
<body>
<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

<h1 class="inner">
ログイン画面</h1><br />
<form class="form-signin" action="LoginServlet" method="post">
<div class="inner">
<span>ログインID </span><input   name="loginId" id="inputLoginId" class="form-control" ><br /><br />
<span>パスワード </span><input type="password"  name="password" id="inputPassword" class="form-control" ><br /><br />

 <input type="submit"style="width: 100px; height: 30px"value="ログイン"><br /><br />
 </div>
</form>
</body>
</html>