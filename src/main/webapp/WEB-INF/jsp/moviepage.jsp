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

<script language = "javascript">

function moviedel(){
	if(confirm("삭제하시겠습니까?")){
		var id = $("#btn-del").data("id");//data값 (data-변수)
		window.location.href="moviedel.do?id="+id;
	}
}

/* function movieup(){
	if(confirm("수정하시겠습니까?")){
		var id = $("#btn-up").data("number");//data값 (data-변수)
		window.location.href="boardup.do?number="+number;
	}
} */



function notwrite(){
	alert("로그인을 해주세요.");
	return;
}

function reviewdelCheck(rvId) { 
	var form = document.reviewdelform; 
	if(confirm("댓글을 삭제하시겠습니까? ")) {
		$("#hid-del").val(rvId);
		$("#form-del").submit();
	}
}

</script>
<body>
	<jsp:include page="navbar.jsp"></jsp:include> 
	
	<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Movie
      <small>by
        <a href="#">${movieList.mvname }</a>
      </small>
    </h1>
	
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/movie/">Home</a>
      </li>
    </ol>

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="images/${movieList.id }.jpg" alt="">

        <hr>

        <!-- Date/Time -->
        <p>${movieList.mvname }</p>

        <hr>

        <!-- Post Content -->
        <p class="lead">${movieList.mvstory}</p>

		<a href="simplemv.do" class="btn btn-primary btn-mvpage">목록으로</a>
		
		<c:if test="${sessionScope.isAdmin eq true}">
       		<%-- <input type=button value="수정하기" id="btn-up" data-id="${movieList.id}" onclick="movieup()"> --%>
       		<input type=button value="삭제하기" id="btn-del" data-id="${movieList.id}" onclick="moviedel()">
       </c:if>
        <hr>
        
        
        
        
		<!------------------------------리뷰 --------------------------->
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Review:</h5>
          <div class="card-body">
            <form action="movieComment.do" method="post">
             <input type="hidden" name="id" value="${movieList.id}">
              <div class="form-group">
                <textarea class="form-control" name="review" rows="3"></textarea>
              </div>
              <c:choose> 
              	<c:when test="${empty sessionScope.userId}">
              		<button type="button" onclick='notwrite()' class="btn btn-primary">Submit</button>
              	</c:when>
	            <c:otherwise>
	              	<button type="submit" class="btn btn-primary">Submit</button>
	            </c:otherwise>
              </c:choose>
            </form>
          </div>
        </div>

		<!-- 리뷰 내용들 -->
		<c:forEach var="list" items="${reviewList2}"> 
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">${list.userId}</h5>
            ${list.review}
            <p style="height:10px; font-size:15px; color: grey;">${list.time }</p>
            <c:if test="${sessionScope.userId eq list.userId || sessionScope.isAdmin eq true}">
	            <form id="form-del" name=reviewdelform action="reviewdel.do" method="get">
	            	<input type="hidden" id="hid-del" name="rvId" value="">
	            	<input type="hidden" name="id" value="${list.id}">
	            	<!-- <a href="#" OnClick="javascript:commetdelCheck();">삭제하기</a> -->
	            	<!-- 전달될 때 for문안에 있으므로 하나하나 인식을 못함! 그래서 아래처럼 처리해줘야함 -->
	            	<a href="#" OnClick="javascript:reviewdelCheck('${list.rvId}')">삭제하기</a>
	            </form>
            </c:if>
          </div>
        </div>
		</c:forEach>
		
		
		<!-- 페이징 -->
		 <div class="container">
			 <ul class="pagination justify-content-center">
			  <c:if test="${paging.startPage != 1 }">
			      <li class="page-item">
			        <a class="page-link" href="movieread.do?id=${movieList.id}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" aria-label="Previous">
			          <span aria-hidden="true">&laquo;</span>
			          <span class="sr-only">Previous</span>
			        </a>
			      </li>
		      </c:if>
		      
		      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item">
							<b class="page-link">${p }</b>
							</li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a class="page-link" href="movieread.do?id=${movieList.id}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				
			<c:if test="${paging.endPage != paging.lastPage}">
		      <li class="page-item">
		        <a class="page-link" href="movieread.do?id=${movieList.id}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" aria-label="Next">
		          <span aria-hidden="true">&raquo;</span>
		          <span class="sr-only">Next</span>
		        </a>
		      </li>
		      </c:if>
		    </ul>
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