<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 25/04/14    성유리   프론트엔드 적용 img 추가, nav바 추가, 재정렬 , 카테고리 추가, card 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/maincategory.css ">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script>
	    let searchedFriendId = null; // 전역 변수로 친구 ID 저장
	    
	    function showFriendForm() {
	        const formArea = document.getElementById("friendForm");
	        formArea.style.display = "block";
	    }

	    function checkFriendEmail() {
	        const email = document.getElementById("friend_ID").value.trim();
	        const nameInput = document.getElementById("friend_name");
	        const requestBtn = document.getElementById("friendRequestBtn");

	        if (email === "") {
	            alert("이메일을 입력해주세요.");
	            return;
	        }

	        fetch("checkFriend?email=" + encodeURIComponent(email))
	            .then(response => response.json())
	            .then(data => {
	                if (data && data.id) {
	                    nameInput.value = data.name;
	                    searchedFriendId = data.id;
	                    requestBtn.disabled = false;
	                } else {
	                    nameInput.value = "";
	                    searchedFriendId = null;
	                    alert("❌ 해당 이메일의 사용자를 찾을 수 없습니다.");
	                    requestBtn.disabled = true;
	                }
	            })
	            .catch(error => {
	                console.error("에러 발생:", error);
	                nameInput.value = "";
	                searchedFriendId = null;
	                alert("서버 오류가 발생했습니다.");
	                requestBtn.disabled = true;
	            });
	    }

	    function sendFriendRequest() {
	        if (!searchedFriendId) {
	            alert("친구 정보가 없습니다.");
	            return;
	        }

	        fetch("addFriend", {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/json"
	            },
	            body: JSON.stringify({
	                customer_id2: searchedFriendId
	            })
	        })
	        .then(res => res.json())
	        .then(data => {
	            if (data.success) {
	                alert("친구 신청이 전송되었습니다!");
	            } else {
	                alert("친구 신청 실패: " + data.message);
	            }
	        })
	        .catch(err => {
	            console.error("친구 신청 에러", err);
	            alert("친구 신청 중 오류가 발생했습니다.");
	        });
	    }
	    </script>

</head>
<body>

	          <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="friend">친구</a>
				  <a class="nav-link disabled"  aria-disabled="true">${sessionScope.loginCustomer.name} 님은 customer 입니다.</a>
				  <a class="nav-link" href="logout">로그아웃</a>
			</nav>
			<br>
			<hr>

<div class ="container">
<div class ="form-box">
    <h2 class="text-center" font-weight: bold;">친구 리스트</h2>
    
    <br>
    <br>

<div align="center" style="overflow: scroll; width: 100%; height: 100%">
	
	<c:forEach var="friend" items="${acceptedFriends}">
	    <p>
		    <strong>${friend.name}</strong> (${friend.email})님과 친구입니다.
		    
		    <form action="deleteFriend" method="post" style="display:inline;">
		        <input type="hidden" name="friend_id" value="${friend.id}" />
		        <button type="submit" onclick="return confirm('정말 친구를 삭제하시겠습니까?')">삭제</button>
		    </form>
		</p>

	</c:forEach>
	
	<h3>📬 받은 친구 신청</h3>
	<c:choose>
	    <c:when test="${empty pendingList}">
	        <p>받은 친구 신청이 없습니다.</p>
	    </c:when>
	    <c:otherwise>
	        <c:forEach var="req" items="${pendingList}">
	            <p><strong>${req.name}</strong> (${req.email}) 님이 친구 신청을 보냈습니다!</p>
	
	            <!-- 수락 -->
	            <form action="acceptFriend" method="post" style="display:inline;">
	                <input type="hidden" name="customer_id1" value="${req.id}" />
	                <button type="submit">수락</button>
	            </form>
	
	            <!-- 거절 -->
				<form action="rejectFriend" method="post" style="display:inline;">
				    <input type="hidden" name="customer_id1" value="${req.id}" />
				    <button type="submit">거절</button>
				</form>

	
	            <hr>
	        </c:forEach>
	    </c:otherwise>
	</c:choose>

	
	            
	<input type="button"  value="친구추가하기"  class="btn btn-primary"  onclick="showFriendForm()">
	<input type="button" class="btn btn-primary"  value="친구삭제하기" onclick="location.href='#'"><br><br>
		<a href="main">🏠 홈으로가기</a><br><br>



<div class="card" div id="friendForm" style="display: none; border: 1px solid #ccc;  width: 400px;" >
  <div class="card-header">
    <h5 class="text-center" font-weight: bold;">친구 추가</h5>
  </div>
  <div class="card-body">
    <h8 class="card-title">친구의 이메일을 입력</h5>
    <p class="card-text">
    	    <input type="text" style="margin-bottom: 20px" class="form-control" id="friend_ID" name="friend_ID" placeholder="친구 이메일"><br><br>
	    <button type="button" class="btn btn-primary"  onclick="checkFriendEmail()">이메일검색</button><br><br>
    </p>
    <h8 class="card-title">해당 친구의 이름</h5>
    <p class="card-text">
    	    <input type="text" style="margin-bottom: 20px" class="form-control" id="friend_name" name="friend_name" placeholder="친구 ID" disabled><br><br>
	    <button type="button" class="btn btn-primary"  id="friendRequestBtn" disabled onclick="sendFriendRequest()">친구신청하기</button>
    </p>
  </div>
</div>
	

</body>
</html>
