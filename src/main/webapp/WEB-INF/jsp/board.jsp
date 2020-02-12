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

<!-- Custom stylesjEoadp for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>

<script>
function notwrite(){
	alert("로그인을 해주세요.");
}
</script>

<body>
	<jsp:include page="navbar.jsp"></jsp:include> 
	
	 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Board
      <small>자유게시판</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/move/">Home</a>
      </li>
      <li class="breadcrumb-item active">Board</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
     
     	<!-- 말머리 -->
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
			  <tr height="5"><td width="5"></td></tr>
			 <tr style="ba<repeat-x; text-align:center;">
			   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
			   <td width="73">번호</td>
			   <td width="379">제목</td>
			   <td width="73">작성자</td>
			   <td width="164">작성일</td>
			   <td width="58">조회수</td>
			<tr height="25" align="center">
			</tr>
			  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
			
			 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
		</table>
			 
		<!-- 내용 -->
				 <c:forEach var="list" items="${viewAll}">
				 	<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr height="5"><td width="5"></td></tr>
					<tr style="ba<repeat-x; text-align:center;">
				    <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
				    <td width="73">${list.number}</td>
				    <td width="379"><a href="boardread.do?number=${list.number}">${list.title}</a></td>
				    <td width="73">${list.userId }</td>
				    <td width="164">${list.time }</td>
				    <td width="58"> ${list.total }</td>
			
				  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
				  </table>
				</c:forEach>
				
			<!-- 페이징 -->
			 <div class="container">
				 <ul class="pagination justify-content-center">
				  <c:if test="${paging.startPage != 1 }">
				      <li class="page-item">
				        <a class="page-link" href="board.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" aria-label="Previous">
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
								<a class="page-link" href="board.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					
				<c:if test="${paging.endPage != paging.lastPage}">
			      <li class="page-item">
			        <a class="page-link" href="board.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" aria-label="Next">
			          <span aria-hidden="true">&raquo;</span>
			          <span class="sr-only">Next</span>
			        </a>
			      </li>
			      </c:if>
			    </ul>
			</div>
		<!-- 버튼 -->
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			  <tr><td colspan="4" height="5"></td></tr>
			  <tr align="center">
			  <% 
			  	if(session.getAttribute("userId")==null){
			  		out.println("<td><button onclick='notwrite()' value='글쓰기'>글쓰기</button></td>");
			  	}else{
			  		
			   		out.println("<form action='boardwrite.do' method='get'> <td><input type=submit value='글쓰기'></td> </form>");
			   		
			  	}
			   %>
			  </tr>
			</table>
		
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
<br/>	
	
	
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