<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
$(function(){
	$(".btn-reservation").on("click",function(event){
		if(confirm("해당 예약을 취소하시겠습니까? ")) {
			var id = $(this).data("id");
			$("#hid-id").val(id);
			$("#form-id").submit();
		};
	})
})
</script>

<body>

<jsp:include page="navbar.jsp"></jsp:include>

<form action="delUserMv.do"  id="form-id" method="get">
	<input type="hidden" id="hid-id" name="ubId" value="">
</form>

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
          <a href="mypageUser.do" class="list-group-item">My Page</a>
          <a href="myReservation.do" class="list-group-item active">My Reservation</a>
           <c:if test="${sessionScope.isAdmin eq true}">
	          <a href="movieupload.do" class="list-group-item">영화 올리기</a>
	          <a href="bookupload.do" class="list-group-item">상영표 올리기</a>
           </c:if>
        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>내 예약 정보</h2>
        <hr>
    	<c:if test="${fn:length(mvList)-1>='0'}">
	       <c:forEach var="i" begin="0" end="${fn:length(mvList)-1}">
				<p><b>상영날짜: ${mvList[i].bDate} ${mvList[i].bTime}</b></p>
				<p>영화이름: ${mvList[i].mvname}</p>
				<p>좌석번호: ${userBookList[i].seats}</p>
				<p>결제금액: ${userBookList[i].totalmoney}</p>
				<p>결제일: ${userBookList[i].bookTime}</p>
				<a href="#" data-id="${userBookList[i].ubId}" class="btn btn-primary btn-reservation">예약취소
				<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
				<hr/>
				<br>
			</c:forEach>
		 </c:if>
		<c:if test="${sessionScope.isAdmin eq true}">
		<h2>모든 회원 예약 정보</h2>
        <hr>
    	<c:if test="${fn:length(mvList2)-1>='0'}">
	       <c:forEach var="i" begin="0" end="${fn:length(mvList2)-1}">
				<p><b>상영날짜: ${mvList2[i].bDate} ${mvList2[i].bTime}</b></p>
				<p>영화이름: ${mvList2[i].mvname}</p>
				<p>회원ID: ${allBookList[i].userId}</p>
				<p>좌석번호: ${allBookList[i].seats}</p>
				<p>결제금액: ${allBookList[i].totalmoney}</p>
				<p>결제일: ${allBookList[i].bookTime}</p>
				<a href="#" data-id="${allBookList[i].ubId}" class="btn btn-primary btn-reservation">예약취소
				<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
				<hr/>
				<br>
			</c:forEach>
		 </c:if>
		</c:if>	 
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