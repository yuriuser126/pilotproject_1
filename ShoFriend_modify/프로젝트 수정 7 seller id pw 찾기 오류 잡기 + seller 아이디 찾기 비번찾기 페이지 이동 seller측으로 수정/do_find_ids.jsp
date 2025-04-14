<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<!-- * 25/04/09 성유리  -->
<!-- * do_find_id : 판매자 아이디 찾은후 화면 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info.css ">	
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="../main">ShoFriend</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

<div class ="container">
<div class ="form-box">
<h2 class="text-center" font-weight: bold;">아이디 찾기</h2>

	<form method="post" action="../main">
        <label class="form-label mt-4" style="margin-bottom: 20px ">아이디 : ${list.email}</label>
<br>
	
			<input type="submit" class="btn btn-primary " value="메인페이지">
			&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="login" type="submit">로그인</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="seller_register" type="submit">회원가입</a>
	
	</form>
</table>

</body>
</html>