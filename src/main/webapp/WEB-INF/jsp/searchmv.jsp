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
	$(function(){
		$(".btn-mvpage").on("click",function(event){
			var id = $(this).data("id");
			$("#hid-id").val(id);
			$("#form-id").submit();
		})
	})
</script>
<body>
<jsp:include page="navbar.jsp"></jsp:include> 

<!-- form 태그를 for문 밖으로 빼줌-->
	<form action="movieread.do" id="form-id" method="get">
		<input type="hidden" id="hid-id" name="id" value="">
	</form>
	
	
<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${scname}
      <small>을(를) 검색한 결과</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
    </ol>

	<!-- 검색 결과 -->
    <div class="row">
    
    
    <c:forEach var="list" items="${movieSearchList}">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <div class="card-body">
            <h4 class="card-title">
              <a href="#" data-id="${list.id}" class="btn-mvpage">${list.mvname }</a>
            </h4>
            <p class="card-text">${list.mvstory}</p>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>

    <!-- Pagination -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

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