<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<!-- * 25/04/09 성유리  -->
<!-- * do_find_pw : 구매자 비밀번호 찾은후 화면 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="500" border="1">
	<form method="post" action="main">
		<tr>
			<td>비밀번호</td>
		</tr>
			<tr>
				<td>${list.password}</td>
		</tr>
		<tr>
			<td colspan="5">
			<input type="submit" value="메인페이지">
			&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="login" type="submit">로그인</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="seller_register" type="submit">회원가입</a>
			</td>
		</tr>
	</form>
</table>

</body>
</html>