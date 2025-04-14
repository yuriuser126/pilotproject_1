<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- * 25/04/08 성유리  -->
<!-- * seller_login : 판매자 로그인 -->

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>

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

<div class="container text-center" style="margin-top: 20px">
  <div class="row">
    <div class="col">
    </div>
    			<div border="1" align="center">
		<form method="post" action="../login_yns">
			<tr height="30">
				<label for="inputPassword5" class="form-label">사용자ID (email)</label>
	<input type="text"  name="email" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock">
			</tr>
		<tr height="30">
				<label for="inputPassword5" class="form-label">Password</label>
	<input type="password" style="margin-bottom: 20px"  name="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock">
			</tr>
			<tr height="30">
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-primary"  value="로그인">	
   					 <button class="btn btn-primary" onclick="location.href='../logout'">로그아웃</button>
   					 <br>
   					 <br>
					<a href="find_ids" type="submit">ID찾기</a>
					<a href="find_pws" type="submit">비밀번호찾기</a>
					<a href="customer_register">회원가입</a>
				</td>
			</tr>
		</form>
	</div>
    <div class="col">
    </div>
  </div>
</div>
</body>
</html>