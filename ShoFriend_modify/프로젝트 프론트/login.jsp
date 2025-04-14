<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- * 25/04/08 성유리  -->
<!-- *login : 로그인 선택창 -->
<!-- * customerlogin : 구매자 로그인 -->
<!-- * sellerlogin : 판매자 로그인 -->

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">ShoFriend</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container text-center">
  <div class="row justify-content-md-center">
    <div class="col col-lg-2">
  
    </div>
    <div class="col-md-auto">
	<form method="post" action="customer_login">
		<button type="submit" style="margin-bottom: 20px" class="btn btn-secondary">구매자</button>
		
	</form>
	     <form method="post" action="seller_login">
		<button type="submit" class="btn btn-primary">판매자</button>
	</form>
	
    </div>
    <div class="col col-lg-2">
   
    </div>
  </div>
  <div class="row">
    <div class="col">
    
    </div>
    <div class="col-md-auto">
<!--      <form method="post" action="seller_login"> -->
<!-- 		<button type="submit" class="btn btn-primary">판매자</button> -->
<!-- 	</form> -->
    </div>
    <div class="col col-lg-2">
      
    </div>
  </div>
</div>

<!-- 	<form method="post" action="customer_login"> -->
<!-- 		<button type="submit" class="btn btn-secondary">구매자</button> -->
<!-- 	</form> -->
	
<!-- 	<form method="post" action="seller_login"> -->
<!-- 		<button type="submit" class="btn btn-primary">판매자</button> -->
<!-- 	</form> -->
</body>
</html>