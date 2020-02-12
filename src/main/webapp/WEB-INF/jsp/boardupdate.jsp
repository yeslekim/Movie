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
<title>게시판</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom stylesjEoadp
 for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>

<script language = "javascript"> // 자바 스크립트 시작 
function writeCheck() { 
	var form = document.writeform; 
	
	if( !form.title.value ) { 
		alert( "제목을 적어주세요" ); 
		form.title.focus(); 
		return; 
		} 
	if( !form.memo.value ) { 
		alert( "내용을 적어주세요" ); 
		form.memo.focus(); 
		return; } 
	
	if(confirm("게시글을 수정하시겠습니까? ")) {
		form.submit(); 
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
        <a href="/move/">Home</a>
      </li>
      <li class="breadcrumb-item active">Board write</li>
    </ol>
	<table>
	  <tr>
	   <td>
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
	      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
	      <td>write</td>
	      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
	     </tr>
	    </table>
	    
	   <form name=writeform action ="boardup.do" method="post">
		   <input type="hidden" name="number" value="${boardread.number}">
		   <table>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">제목</td>
		      <td><input name="title" size="100" maxlength="100" value="${boardread.title}"></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">작성자</td>
		      <td>&nbsp;&nbsp;&nbsp; ${sessionScope.userId}</td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">내용</td>
		      <td><textarea name="memo" cols="100" rows="15" > ${boardread.memo }</textarea></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		     <tr align="center">
		      <td>&nbsp;</td>
		      <td colspan="2">
		       <input type=button value="수정" OnClick="javascript:writeCheck();">
		       <input type=button value="취소" OnClick="javascript:history.back(-1)">
		      <td>&nbsp;</td>
		     </tr>
		    </table>
		   </form> 
		    
		   </td>
		  </tr>
		 </table>
 		
 </div>
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