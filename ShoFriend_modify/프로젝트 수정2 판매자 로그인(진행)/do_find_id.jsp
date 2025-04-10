<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>아이디</td>
		</tr>
<!-- 		조회결과 -->
<!-- 		list : 모델객체에서 보낸 이름 -->
		<c:forEach var="dto" items="${do_find_id}">
			<tr>
				<td>${dto.email}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="main">메인페이지</a>
			</td>
		</tr>
	</table>

</body>
</html>