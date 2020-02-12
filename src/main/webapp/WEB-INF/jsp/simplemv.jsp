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
    <h1 class="mt-4 mb-3">현재 상영중인 영화
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/movie/">Home</a>
      </li>
    </ol>
	
	
	<!-- 영화 목록 -->
	<c:forEach var="list" items="${viewAll}">
	    <div class="row">
	      <div class="col-md-7">
	        <a href="#">
	          <img class="img-fluid rounded mb-3 mb-md-0" src="images/${list.id}.jpg" alt="">
	        </a> 
	      </div>
	      <div class="col-md-5">
	        <h3>${list.mvname}</h3>
	        <p>${list.mvstory}</p>
	        <%-- <input type="hidden" name="id" value="${list.id}"> --%>
	        <!-- for구문을 사용해서 list를 작성할 때엔 id값으로 하면안됨(1개이므로) 따라서 class로 넘겨줌 -->
	        <!-- class를 2개, 3개 사용하고싶으면 "" 안에 space를 해주면 구분됨! -->
	        <a href="#" data-id="${list.id}" class="btn btn-primary btn-mvpage">More View
	          <span class="glyphicon glyphicon-chevron-right"></span>
	        </a>
	      </div>
	    </div>
	    <!-- /.row -->
	
	    <hr>
	</c:forEach>
	
    
    <!-- 관리자 영화 올리기! -->
    <c:if test="${sessionScope.isAdmin eq true}">
		<button><a href="movieupload.do">영화올리기</a></button>
	</c:if>
	
	
	
    <!-- Pagination -->
    <ul class="pagination justify-content-center">
    	
		
	  <c:if test="${paging.startPage != 1 }">
	      <li class="page-item">
	        <a class="page-link" href="simplemv.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">
	          <span aria-hidden="true">&laquo;</span>
	          <span class="sr-only">Previous</span>
	        </a>
	      </li>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item">
						<b class="page-link" href="#">${p }</b>
					</li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a class="page-link" href="simplemv.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
	<c:if test="${paging.endPage != paging.lastPage}">
      <li class="page-item">
        <a class="page-link" href="simplemv.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" >
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
      </c:if>
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