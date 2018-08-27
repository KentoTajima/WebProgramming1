<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/userlist.css">
<title>ユーザ一覧</title>
</head>
<body>
<header>
	<p>${userInfo.name} さん &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="LogoutServlet"><font color=red>ログアウト</font></a></p>
</header>
<h1 class="inner">
ユーザ一覧</h1><br />
<div class="right">
 <a href="UserCreateServlet">新規登録</a></div><br/>

<div class="inner">
<form method="post" action="UserListServlet">
<span>ログインID </span><span><input  name="loginId" id="login-id"class=example1 ></span><br /><br />
<span>ユーザ名 </span><span><input   name="name" id="user-name"class=example1 ></span><br /><br />
<span>生年月日 </span><span><input type="date"name="dateStart" id="date-start" class=example2>～<input type="date" name="dateEnd" id="date-start" class=example2></span><br /><br />

 <input type="submit"value="検索"style="width: 100px; height: 30px; position: relative; left: 20%; top: 50%"/><br /><br />

<p class="box"style="width: 900px; height: 10px;margin:auto;"></p>
</form>
<table  border=1 style="margin:auto;">
<c:if test="${userInfo.loginId == 'admin'}">
  <tr bgcolor="silver"><th>ログインID</th><th>ユーザ名</th><th>生年月日</th><th></th></tr>
  <c:forEach var="user" items="${userList}" >
  <tr><td>${user.loginId}</td><td>${user.name}</td><td>${user.birthDate}</td><td><form>
  <a class="btn btn-primary" href="UserDetailServlet?id=${user.id}"style="background-color:blue;color:white">詳細</a>
                       <a class="btn btn-success" href="UserUpdateServlet?id=${user.id}"style="background-color:green;color:white">更新</a>
                       <a class="btn btn-danger" href ="UserDeleteServlet?id=${user.id}"style="background-color:red;color:white">削除</a>
                      </form>
</c:forEach>
</c:if>
<c:if test="${userInfo.loginId != 'admin'}">
 <tr bgcolor="silver"><th>ログインID</th><th>ユーザ名</th><th>生年月日</th><th></th></tr>
  <c:forEach var="user" items="${userList}" >
  <tr><td>${user.loginId}</td><td>${user.name}</td><td>${user.birthDate}</td><td><form>
  <a class="btn btn-primary" href="UserDetailServlet?id=${user.id}"style="background-color:blue;color:white">詳細</a>
  <c:if test="${user.loginId == userInfo.loginId}">   <a class="btn btn-success" href="UserUpdateServlet?id=${user.id}"style="background-color:green;color:white">更新</a>
                     </c:if> </form>
</c:forEach>
</c:if>
</table>
</div>
</body>
</html>
