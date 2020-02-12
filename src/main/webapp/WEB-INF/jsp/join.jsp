<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">
	<!--  <form action="addUser.do" method="post">
		아이디:<input type="text" name="id" value="" placeholeder="아이디"><br/>
		비밀번호:<input type="password" name="pw" value="" placeholeder="비밀번호"><br/>
		<!-- 새로생성 -->
		
		<!--이름 :<input type="text" name="name" value="" ><br/>
		
		<div class="controls">
     	성별: <input type="radio" name="sex" id="radio" value="man" checked>
      		남자
      	<input type="radio" name="sex" id="radio" value="woman">
      		여자
      	</div>
        연락처:-->
        <!-- 
        <div class="controls">
        <select name="phone"> 
          <option>010</option>
          <option>011</option>
          <option>016</option>
          <option>017</option>
          <option>018</option>
          <option>019</option>
        </select>-
        <input type="text" name="phone" value="">-
        <input type="text" name="phone" value=""> 
        </div> -->
       <!-- <input type="text" name="phone" value="">
        <br/>
		<input type="submit" value="확인">
	</form>
	 --> 
	<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user" action="addUser.do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="exampleFirstName" name="id" placeholder="ID">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" name="pw" placeholder="Password">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="exampleInputEmail" name="name" placeholder="Your Name">
                </div>
                <div>
		     		&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" id="radio" value="man" checked>man &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		     		<input type="radio" name="sex" id="radio" value="woman">woman
		      	</div><br>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="exampleInputEmail" name="phone" placeholder="Phone Number">
                </div>
                <input type="submit" class="btn btn-primary btn-user btn-block" value="Register Account">
                <hr>
                
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
	
</body>
</html>