<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- * 25/04/09 성유리  -->
<!-- * find_id : 아이디 찾기 -->
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">

function fn_submit() {
	alert("환영합니다 *^^*")
	var formData = $("#frm").serialize(); 
	$.ajax({
		type:"post"
		,data:formData
		,url:"searchPws"
		,success : function(data) {
			alert("찾는중입니다 ... *^^*")
		}
		,error: function(data) {
			alert("존재하지않는 이메일과 비밀번호입니다.")
		}
	});	
}
</script>
</head>
<body>
<p>find_pw : 비밀번호 찾기-판매자</p>
<body>

	<table width="500" border="1">
		<form  id="frm" method="post"  action="do_find_pws">
<!-- 					<select name="findType" class="form-control mr-2"> -->
<!-- 						<option value="">::검색 유형::</option> -->
<!-- 						<option value="1">아이디</option> -->
<!-- 						<option value="2">비밀번호</option> -->
<!-- 				</select> -->
				
				<tr>
					<th>이름</th>
				<td>
						<input  type="text" name="name" placeholder="이름">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
				<td>
					<input type="text" name="email" placeholder="이메일">
				</td>
				</tr>

		<tr>
		<th>비고</th>
			<td colspan="5">
			<input type="submit" onclick="fn_submit()" value="비밀번호찾기">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="login" type="submit">로그인</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="register" type="submit">회원가입</a>
			</td>
		</tr>
				
		</form>
	</table>

</body>
</html>