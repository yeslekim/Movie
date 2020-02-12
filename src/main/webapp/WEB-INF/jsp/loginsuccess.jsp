<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function update(){
		window.locate.href="updateUser.do"
	}
</script>
</head>
<body>
	
	<form action="logoutUser.do" method="post">
	<% String userId = (String)session.getAttribute("userId"); %>
	<%=userId %>님 안녕하세요! <br/>
	<input type="submit" value="로그아웃">
	<input type="button" onclick="update()" value="회원정보 수정"> 
	</form>
</body>
</html>