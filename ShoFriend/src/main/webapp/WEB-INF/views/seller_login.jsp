<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- * 25/04/08 성유리  -->
<!-- * seller_login : 판매자 로그인 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
	function fn_submit() {
		alert("01");
		alert("02");
		$.ajax({
			type:"post"
			,url:"login"
			,success : function(data) {
				alert("환영합니다 *^^*")
				response.sendRedirect("main.jsp")
			}
			,error: function(data) {
				alert("이메일이나 비밀번호 형식을 다시 적어주세요")
			}
		});	
	}
</script>

</head>
<body>
	<p>판매자 로그인 페이지 입니다</p>
	<table border="1" aling="center">
		<form method="post" action="main">
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

					<a href="register">회원가입</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>