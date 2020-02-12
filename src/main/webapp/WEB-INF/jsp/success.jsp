<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- substring 사용하기 위함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom stylesjEoadp for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>
<style>
	.button{
    height:30px; 
    width:100px; 
    margin: -20px -50px; 
    position:relative;
    top:50%; 
    left:50%;
}
</style>
<body>

<jsp:include page="navbar.jsp"></jsp:include> 
	<br>
	<br>
	<h1 style="text-align: center;">결제가 완료되었습니다.</h1>
	<br>
	<div>
		<form action="myReservation.do" method="get">
		<input type="hidden" name="userId" value="${sessionScope.userId }">
		<input type="submit" class="button" value="예약확인">
		</form>
	</div>
	<br/><br/>
	
	
	
	
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