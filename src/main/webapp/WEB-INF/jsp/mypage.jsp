<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 사용할때 추가하기 -->
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>


<script>
	/* function delUser() {
		window.location.href="#";
	} */
	function delUser() {
		if(confirm("정말 탈퇴하시겠습니까 ? ")) {
			window.location.href="deleteUser.do";
		};
	}
</script>

<body>
<%-- <form action="updateUser.do" method="get">
	<div>
		<%
			UserVO ab = (UserVO)session.getAttribute("userVO");
			String abid=(String)session.getAttribute("userId");
		%>
		<h2>회원정보</h2>
		<p>ID: <%= abid%></p> 
		<p>Name: <%= ab.getUserName()%></p> 
		<p>Sex: <%= ab.getUserSex()%></p> 
		<p>Phone: <%= ab.getUserPhone()%></p> 
	</div>	
	<input type="submit" value="회원 정보 수정">
	<!-- <input type="button" onclick="delUser()" value="회원 탈퇴"> -->
	<a href="#" onclick="delUser()">회원 탈퇴</a>
</form> --%>



	<jsp:include page="navbar.jsp"></jsp:include>



  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">My Page
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/movie/">Home</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="/movie/" class="list-group-item">Home</a>
          <a href="mypageUser.do" class="list-group-item active">My Page</a>
          <a href="myReservation.do" class="list-group-item">My Reservation</a>
           <c:if test="${sessionScope.isAdmin eq true}">
	          <a href="movieupload.do" class="list-group-item">영화 올리기</a>
	          <a href="bookupload.do" class="list-group-item">상영표 올리기</a>
           </c:if>
        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>회원정보</h2>
        <form action="updateUser.do" method="get">
	       
			
			<p>ID: ${userId }</p> 
			<p>Name: ${userVO.userName}</p> 
			<p>Sex: ${userVO.userSex}</p> 
			<p>Phone: ${userVO.userPhone}</p> 
			
			<input type="submit" value="회원 정보 수정">
			<!-- <input type="button" onclick="delUser()" value="회원 탈퇴"> -->
			<a href="#" onclick="delUser()">회원 탈퇴</a>
		</form>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>