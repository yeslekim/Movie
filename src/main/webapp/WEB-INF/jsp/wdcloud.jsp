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
 <!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

 
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Word Cloud
      <small>${ten.tenname }</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Word Cloud</li>
    </ol>

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="bigmv/${ten.chart }.png" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title"><b>개봉일 : ${ten.mvdate }</b></h2>  
            <p class="card-text"><b>누적관객수 : ${ten.people } 명</b></p>
          </div>
        </div>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Word Cloud List</h5>
          <div class="card-body">
            <div class="row">
              <div>
            	<c:forEach var="tlist" items="${selectTens}">
	               	 <ul class="list-unstyled mb-0">
		                 <li>
		                   &nbsp;&nbsp;<b>#${tlist.chart}: </b> &nbsp;&nbsp;&nbsp;
		                   <a href="wdcloud.do?chart=${tlist.chart }">${tlist.tenname }</a>
		                 </li>
	                </ul>
	             </c:forEach>
		        </div>
            </div>
          </div>
        </div>
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