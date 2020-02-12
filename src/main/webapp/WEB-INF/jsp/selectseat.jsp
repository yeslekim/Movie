<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- substring 사용하기 위함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 사용할때 추가하기 -->
<link rel="stylesheet" type="text/css" href="index.css">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom stylesjEoadp for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>
<style>
.seat{width:50px; height:50px; text-align: center; margin:1px; background-color: gray;}
#sample{margin: 5%;}
</style>


<script>
	
   $(function() {
	  var adult=0;
	  var kid=0;
	  var list = new Array();
      var temp=0;	//버튼 누름의 갯수
      //var select ="${selectSeat}";
      <c:forEach var="select" items="${selectSeat}">
	      $("#${select}").css("background-color", "black");
	      $("#${select}").attr("title", "black");
      </c:forEach>
	 /*  $("#adult").on("change", function(event){
		  adult = parseInt($(this).val());
		  //alert(adult);
	  }) ;
	  $("#kid").on("change", function(event){
		  kid = parseInt($(this).val());
		  //alert(kid);
	  }) ; */
	  $(".person").on("change", function(event){
		  adult = parseInt($("#adult").val());
		  kid = parseInt($("#kid").val());
		  var html1 = "총 금액: "+(adult*8000+kid*5000)+"원";
		  $("#money").html(html1);
	  }) ;
	  
      $(".seat").on("click", function(event) {
    	  var color = $(this).attr("title");
	      list = new Array();
	      
	      if(color=="black"){
	    	  alert("이미 예약된 좌석입니다.")
	      }else if(adult+kid==temp){
    		  if(color == "gray"){
    			  alert("선택한 인원보다 많은 좌석을 예약할 수 없습니다.");
    		  }else{
    			  $(this).css("background-color", "gray");
 	        	  $(this).attr("title", "gray");
 	        	  temp--;
    		  } 
    	  }else if(adult+kid>temp){
	         //var color = $(this).css("background-color"); //이렇게 하면 color값이 rgb타입으로 넘어와서 오류!
	          if(color == "gray"){
	            $(this).css("background-color", "red"); //버튼 색 red로 변경
	            $(this).attr("title", "red"); // title값을 red로 변경해서 if문에 걸러지게함
	            temp++;
	          }else {            
	        	 $(this).css("background-color", "gray");
	        	 $(this).attr("title", "gray");
	        	 temp--;
	         }
    	  }else{
    		  alert("선택한 인원보다 많은 좌석을 예약할 수 없습니다.");
    	  }
    	  
          $("input[title=red]").each(function(index, item){
   		   list.push($(item).val());	//클릭한 value값을 리스트에 저장
   	  	  });
          
      });
		   
      $(".btn-mvpage").on("click",function(event){
    	  if(adult+kid==0){
    		  alert("관람하실 인원수를 선택하세요.")
    	  }else if(adult+kid==temp){
	    	  if(confirm("선택한 좌석: "+list+"\n성인: "+adult+"명, 요금: "+adult*8000+"원\n청소년: "
	    			  +kid+"명, 요금: "+kid*5000+"원\n총 금액: "+(adult*8000+kid*5000)+"이 맞습니까?")){
		          $("#btn-test").val(list);
		          $("#btn-totalmoney").val((adult*8000+kid*5000));
				  $("#form-id").submit();
	    	  }
    	  }else{
    		  alert("선택한 인원수와 좌석의 수는 같아야 합니다.")
    	  }
		});
   });
 
</script>

<body>
<jsp:include page="navbar.jsp"></jsp:include> 
<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">좌석 선택
      <small>${bookOne.mvname }</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/movie/">Home</a> 
      </li>
      <li class="breadcrumb-item active"> ${bookOne.bDate}  ${fn:substring(bookOne.bTime,0,5)} </li>
      <li class="breadcrumb-item active"> ${bookOne.mvroom }상영관  </li>
    </ol>

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">
		
        <!-- Blog Post -->
        <div class="card mb-4">
        
           <div id="sample">
			   <div style="background-color: black; color: white; width:85%; height:30px; margin:5px; text-align: center; " >
			   		<b>Screen</b>
			   	</div>
			   	<br/>
			     
					   <c:forEach var="i" begin="1" end="10">
					   		<input type="button" class="seat" id="A${i}" title="gray" name="seat" value="A${i}">
					   </c:forEach>
					   <br/>
					   <c:forEach var="i" begin="1" end="10">
					   		<input type="button" class="seat" id="B${i}" title="gray" name="seat" value="B${i}">
					   </c:forEach>
					   <br/>
					   <c:forEach var="i" begin="1" end="10">
					   		<input type="button" class="seat" id="C${i}" title="gray" name="seat" value="C${i}">
					   </c:forEach>
					   <br/>
					   <c:forEach var="i" begin="1" end="10">
					   		<input type="button" class="seat" id="D${i}" title="gray" name="seat" value="D${i}">
					   </c:forEach>
					   <br/>
					   <c:forEach var="i" begin="1" end="10">
					   		<input type="button" class="seat" id="E${i}" title="gray" name="seat" value="E${i}">
					   </c:forEach>
				   
  			 </div>
        </div>
      </div>
   	  
	




      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card mb-4">
          <h5 class="card-header"><b>인원수 선택</b></h5>
          <div class="card-body">
          
          <!-- 보내기 -->
            <form action="selectseat.do" id="form-id" method="post">
		   		<input type="hidden" id="btn-test" name="seat" value="">
		   		<input type="hidden" id="btn-totalmoney" name="totalmoney" value=""> <!-- 총 금액 보내기 -->
		   		<input type="hidden" name="mvroom" value="${bookOne.mvroom}">
		   		<input type="hidden" name="bId" value="${bookOne.bId}">
		   		<input type="hidden" name="userId" value="${sessionScope.userId}">
		   		<tr>
			   		<td>성인: </td>
			   		<td>
				   		<select class="person" id="adult" name="adult">
					   		<c:forEach var="i" begin="0" end="8">
					   			<option value="${i}">${i}</option>
					   		</c:forEach>
				   		</select>
				   	</td>
				   	<td>/</td>
			   		<td>청소년: </td>
			   		<td>
				   		<select class="person" id="kid" name="kid">
					   		<c:forEach var="i" begin="0" end="8">
					   			<option value="${i}">${i}</option>
					   		</c:forEach>
				   		</select>
				   	</td>
		   		</tr>
		    </form>
          </div>
          
        </div>
        
        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header"><b>결제 금액</b></h5>
          <div id="money" class="card-body">
          		총 금액:
          </div>
           <a href="#" data-id="a-id" class="btn btn-primary btn-mvpage">예매하기<span/>
			</a>
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