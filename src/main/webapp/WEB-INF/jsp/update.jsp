<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<%-- <form action="updateUser.do" method="post">
		<% String id= (String)session.getAttribute("userId");
			out.println("아이디: "+id);
		%> <br/>
		비밀번호:<input type="password" name="pw" value="" ><br/>
		이름 :<input type="text" name="name" value="" ><br/>
		
		<div class="controls">
     	성별: <input type="radio" name="sex" id="radio" value="man" checked>
      		남자
      	<input type="radio" name="sex" id="radio" value="woman">
      		여자
      	</div>
      	연락처: <input type="text" name="phone" value="">
        <br/>
		<input type="submit" value="수정">
		
	</form> --%>
	
	
	<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">회원정보수정
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
            <h5 class="mb-0">회원정보 수정</h5>
          </h5>
        </div>

        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
          <div class="card-body">
          	<form action="updateUser.do" method="post">
				<% String id= (String)session.getAttribute("userId");
					out.println("아이디: "+id);
				%> <br/>
				비밀번호:<input type="password" name="pw" value="" ><br/>
				이름 :<input type="text" name="name" value="" ><br/>
				
				<div class="controls">
		     	성별: <input type="radio" name="sex" id="radio" value="man" checked>
		      		남자
		      	<input type="radio" name="sex" id="radio" value="woman">
		      		여자
		      	</div>
		      	연락처: <input type="text" name="phone" value="">
		        <br/>
				<input type="submit" value="수정">
				
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