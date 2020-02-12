<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    function logoutUser() {
		if(confirm("로그아웃 하시겠습니까 ? ")) {
			window.location.href="logoutUser.do";
		};
	}
    </script>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/movie/">Movies World</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
       <form action="search.do" method="get">
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" >
          <li class="nav-item">
            <a class="nav-link" href="tenmv.do">BigData</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.do">Board</a>
          </li>
          <li class='nav-item'> 
          	<a class='nav-link' href="simplemv.do">Movie</a> 
          </li>
    
          <%
          	//HttpServletRequest request;
         	//HttpSession session = request.getSession();
          	if(session.getAttribute("userId")== null){
	          	out.println("<li class='nav-item'> <a class='nav-link' href='login.do'>Login</a> </li>");
          	}else{
	         	out.println("<li class='nav-item'><a class='nav-link' href='reservation.do'>reservation</a></li>");
          		out.println("<li class='nav-item'><a class='nav-link' href='mypageUser.do' > Mypage </a></li>");
          		out.println("<li class='nav-item'> <a class='nav-link' onclick='logoutUser()' href='#'>Logout</a> </li>");
          	}
          %>
          <li class='nav-item'> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
          </li>
          <li class="input-group">
          	 
	              <input type="text" class="form-control" name="mvname"  placeholder="Search for...">
	              <span class="input-group-btn">
	                <button class="btn btn-secondary" type="submit">Go!</button>
	              </span>
              
           </li>
          
        </ul>
       
       
      </div>
      </form>
    </div>
     
  </nav>
