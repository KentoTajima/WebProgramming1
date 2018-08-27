<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/style.css">
<title>削除確認</title>
</head>
<body>
<header>
	<p>${userInfo.name} さん &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="LogoutServlet"><font color=red>ログアウト</font></a></p>
</header>
<h1 class="inner">
ユーザ削除確認<br /></h1><br />



<div class="inner">ログインID:${user.loginId} さん <br />
を本当に削除してよろしいでしょうか。<br/><br /><br />
<table style="margin:auto;"><tr><td><input type="submit"style="width: 100px; height: 30px"value="キャンセル"onclick="history.back()">
 &nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><form  action="UserDeleteServlet" method="post" >
<input name=delete type="submit"style="width: 100px; height: 30px"value="OK">
<input type="hidden" value="${id}" name="id">
 </form>
 </td></tr>
 </table>
</div>

</body>
</html>