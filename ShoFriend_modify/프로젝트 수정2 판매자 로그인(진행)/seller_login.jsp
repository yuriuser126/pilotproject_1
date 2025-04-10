<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- * 25/04/08 성유리  -->
<!-- * seller_login : 판매자 로그인 -->

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

</head>
<body>
	<p>판매자 로그인 페이지 입니다</p>
	
	<table border="1" aling="center">
	<form id="frm2" method="post" action="main" >
				<tr height="30">
				<td width="100">
					사용자ID
				</td>
				<td width="100">
					<input type="text" name="email">
				</td>
			</tr>
			<tr height="30">
				<td width="100">
					비밀번호
				</td>
				<td width="100">
					<input type="text" name="password">
				</td>
			</tr>
			<tr height="30">
				<td colspan="2" align="center">
					<input type="submit" onclick="fn_submit()" value="로그인">
					<a href="find_id" type="submit">ID찾기</a>
					<a href="find_id" type="submit">비밀번호찾기</a>
					<a href="register">회원가입</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>