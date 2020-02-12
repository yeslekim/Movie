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
	ul.mystyle, li.mystyle {list-style-type: none; float: left; outline: 1px; margin-left: 20px;}
	li.mystyle2 {list-style-type: none;}
</style>
<body>

<jsp:include page="navbar.jsp"></jsp:include> 


 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">영화 예매
    <small>november</small>
    </h1>
	   <ol class="breadcrumb">
	<c:forEach var="date" items="${bookDate}">
	       <li class="breadcrumb-item">
				<c:choose>
					<c:when test="${day eq fn:substring(date,8,10) }">
			        	 <b><a href="reservation.do?date=${fn:substring(date,8,10)}">${fn:substring(date,8,10)}일</a></b>
			        </c:when>
			     	<c:otherwise>
			     		<a href="reservation.do?date=${fn:substring(date,8,10)}">${fn:substring(date,8,10)}일</a>
			    	</c:otherwise>
			     
			     </c:choose>
			     
			   
	       </li>
	 </c:forEach>     
	     </ol>
	    
	    
	    <hr>
	    <c:forEach var="list" items="${movieList}">
		     <ol>
		      <li class="mystyle2"><b>${list.mvname }</b></li>
		    </ol>
		    <div class="row">
		    	<ul class="mystyle">
				    <c:forEach var="blist" items="${bookList}">
				   	 <c:set var="bday" value="${fn:substring(blist.bDate,8,10)}"></c:set>
				   	 <c:if test="${list.mvname eq blist.mvname && day eq bday}">
						        <li class="mystyle"><a href="selectseat.do?bId=${blist.bId }"><b>${fn:substring(blist.bTime,0,5)}</b></a></li>
					  </c:if>
		   			 </c:forEach>  
				 </ul>
			</div>
			<hr>
	    </c:forEach>
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