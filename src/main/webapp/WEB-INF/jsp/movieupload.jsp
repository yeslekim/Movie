<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 사용할때 추가하기 -->
</head>
<script>

/* $(function(){
	
})
 */
	$(function() {
		$("#btn-submit").on("click", function(event){
			if(confirm("등록 하시겠습니까?"))
				$("#form-mv").submit();
		});
	})
</script>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">영화 등록
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/movie/">Home</a>
      </li>
    </ol>

    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="card">
        <div class="card-header" role="tab" id="headingOne">
          <h5 class="mb-0">
            <h5 class="mb-0">영화 등록</h5>
          </h5>
        </div>

        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
          <div class="card-body">
          
          	<form action="movieupload.do" id="form-mv" method="post" enctype="multipart/form-data">
          		<table>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">제목</td>
		      <td><input type="text" name="mvname" size="100" maxlength="100"></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">파일</td>
		      <td><input type="file" name="mvpic"></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">줄거리</td>
		      <td><textarea name="mvstory" cols="100" rows="15" ></textarea></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		     <tr align="center">
		      <td>&nbsp;</td>
		      <td colspan="2">
		       <input type=button value="등록" id= "btn-submit">
		       <input type=button value="취소" OnClick="javascript:history.back(-1)">
		      <td>&nbsp;</td>
		     </tr>
		    </table>
			</form>
          </div>
        </div>
      </div>
      
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