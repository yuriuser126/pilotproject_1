<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript">
	function fn_submit2() {
		var formData = $("#frm2").serialize();//form 요소 자체
		
		$.ajax({
			type:"post"
			,data:formData
			,url:"seller_registerOk"
			,success: function(data) {
				alert("가입이 완료되었습니다")
				location.href="login";
			}
			,error: function(){
				alert("중복된 이메일입니다. 다시 입력해주세요")
				location.href="seller_register";
			}
		});
	}
	</script>
</head>
<body>
	<table border="1" align="center">
		<form name="reg_frm2" id="frm2" method="post" action="seller_registerOk">
			<tr height="50">
				<td colspan="2">
					<h1>판매자 가입 신청</h1>
				</td>
			<tr height="30">
				<td width="80">
					이름
				</td>
				<td>
					<input type="text" size="20" name="name">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					USERID(이메일)
				</td>
				<td>
					<input type="text" size="20" name="email">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					암호
				</td>
				<td>
					<input type="text" size="20" name="password">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					암호 확인
				</td>
				<td>
					<input type="text" size="20" name="password_check">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					연락처
				</td>
				<td>
					<input type="text" size="20" name="phone">
				</td>
			</tr>
			<tr height="30">
				<td colspan="2">
					<input type="button" onclick="check_ok2()" value="등록">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>