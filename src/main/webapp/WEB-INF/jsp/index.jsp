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
	function join() {
		window.location.href="addUser.do"; // get방식
	}
	
	
</script>

<body>	
	<jsp:include page="navbar.jsp"></jsp:include> 



  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <!-- <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')"> -->
        <div class="carousel-item active" style="width:1500px; background-image: url('images/frozen.jpg');  background-size: 1500px 500px;"> 
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('images/ter1.jpg'); background-size: 1500px 500px;"> 
        </div>
        
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('images/82.jpg'); background-size: 1500px 500px; ">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
      
    	
    </div>
    
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">Movie List</h1>

   

    <!-- Portfolio Section -->
    <h2>현재 상영중인 영화</h2>
	
    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="images/822.png" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="movieread.do?id=10">82년생 김지영</a>
            </h4>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="images/ter2.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="movieread.do?id=9">터미네이터</a>
            </h4>
            <p class="card-text">${movieList.mvstory}</p>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="images/frozen3.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="movieread.do?id=8">겨울왕국2</a>
            </h4>
            <p class="card-text">${movieList.mvstory}</p>
          </div>
        </div>
      </div>
      
      
    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
      
    </div>

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