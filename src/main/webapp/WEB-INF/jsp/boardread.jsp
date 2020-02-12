<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 사용할때 추가하기 -->

<title>게시판</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom stylesjEoadp
 for this template -->
<link href="css/modern-business.css" rel="stylesheet">


<style>
	#box{
		width: 1000px;
		height: 500px;
	}
</style>
</head>

<script language = "javascript"> // 자바 스크립트 시작 
function boarddel(){
	if(confirm("삭제하시겠습니까?")){
		var number = $("#btn-del").data("number");//data값 (data-변수)
		//var abc = $("#btn-del").val(); //value값(삭제하기)
		window.location.href="boarddel.do?number="+number;
	}
}

function boardup(){
	if(confirm("수정하시겠습니까?")){
		var number = $("#btn-up").data("number");//data값 (data-변수)
		window.location.href="boardup.do?number="+number;
	}
}

function notwrite(){
	alert("로그인을 해주세요.");
	return;
}

function commetdelCheck(id) { 
	var form = document.commentdelform; 
	if(confirm("댓글을 삭제하시겠습니까? ")) {
		$("#hid-del").val(id);
		$("#form-del").submit();
	};
	
} 
</script>

<body>
<jsp:include page="navbar.jsp"></jsp:include> 

 <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Board
      <small>자유게시판</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/movie/">Home</a>
      </li>
      <li class="breadcrumb-item active">Board write</li>
    </ol>
	<table>
	  <tr>
	   <td>
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
	      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
	      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
	     </tr>
	    </table>
<%--	    
	   <form  name=writeform action ="board.do" method="get">
		   <table>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">제목</td>
		      <td>&nbsp;&nbsp;&nbsp;&nbsp;${boardread.title}</td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">작성자</td>
		      <td>&nbsp;&nbsp;&nbsp; ${boardread.userId}</td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">내용</td>
		      <td><div id=box>&nbsp;&nbsp;&nbsp;&nbsp;${boardread.memo}</div></textarea></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		     <tr align="center">
		      <td>&nbsp;</td>
		      <td colspan="2">
		       <input type=submit value="목록으로" >
		       <input type=button value="삭제하기" onclick="boarddel()">
		      <td>&nbsp;</td>
		     </tr>
		    </table>
		   </form> 
		   </td>
		  </tr>
		 </table>
 		
 </div> --%>
 
 <div class="row" style="width: 1700px;">

      <!-- Post Content Column -->
      <div class="col-lg-8">

       <form name=writeform action ="board.do" method="get">
        <!-- 제목 -->
        <p><b>제목</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${boardread.title}</p>
        <hr>
        <!-- 작성자 -->
 		<p><b>작성자</b> &nbsp;&nbsp;&nbsp;${boardread.userId}</p>
        <hr>
        <!-- 내용 -->
        <p class="lead">${boardread.memo}</p>
       <hr>
        <input type=submit value="목록으로" >
          <%--  <c:if test="${name eq '홍길동'}">
				    홍길동이 맞습니다.
				</c>--%>
		<c:if test="${sessionScope.userId eq boardread.userId || sessionScope.isAdmin eq true}">
       		<input type=button value="수정하기" id="btn-up" data-number="${boardread.number}" onclick="boardup()">
       		<input type=button value="삭제하기" id="btn-del" data-number="${boardread.number}" onclick="boarddel()">
       </c:if>
       </form>
        
        
        
        
        <!------------------------------댓글 --------------------------->
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form name=commentform action="boardComment.do" method="post">
             <input type="hidden" name="number" value="${boardread.number}">
              <div class="form-group">
                <textarea class="form-control" name="comment" rows="3"></textarea>
              </div>
              <%-- <c:if test="${sessionScope.userId eq boardread.userId}">
		       		<input type=button value="수정하기" id="btn-up" data-number="${boardread.number}" onclick="boardup()">
		       		<input type=button value="삭제하기" id="btn-del" data-number="${boardread.number}" onclick="boarddel()">
		       </c:if> --%>
		       
		      <%--  <c:choose>
					<c:when test="${adbc }">
					</c:when>
					<c:when>
						
					</c:when>
					<c:otherwise>
						
					</c:otherwise>	       		
		       </c:choose> --%>
		       
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
		


        <!-- 댓글 내용들 -->
        <c:forEach var="list" items="${commentList}"> 
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">${list.userId}</h5>
            ${list.comment}
            <p style="height:10px; font-size:15px; color: grey;">${list.time }</p>
            <c:if test="${sessionScope.userId eq list.userId || sessionScope.isAdmin eq true}">
            <form id="form-del" name=commentdelform action="commentdel.do" method="get">
            	<input type="hidden" id="hid-del" name="id" value="">
            	<input type="hidden" name="number" value="${list.number}">
            	<!-- <a href="#" OnClick="javascript:commetdelCheck();">삭제하기</a> -->
            	<!-- 전달될 때 for문안에 있으므로 하나하나 인식을 못함! 그래서 아래처럼 처리해줘야함 -->
            	<a href="#" OnClick="javascript:commetdelCheck('${list.id}');">삭제하기</a>
            </form>
            </c:if>
          </div>
        </div>
		</c:forEach>
		
		
        <!-- Comment with nested comments -->
        <!-- <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

          </div>
        </div>  -->
	 <!-- <td colspan="2"> -->
		      
		     <!--   </td> -->
       
      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
<!-- Footer -->
	  <footer class="py-5 bg-dark" style="width: 1100px;">
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