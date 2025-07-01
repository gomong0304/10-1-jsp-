<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>

<title>오류발생!!!</title></head><body>

	<div class="container py-4">

		<%@ include file="menu.jsp" %> 
		<!-- 메뉴바를 외부파일로 연결 -->
				
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">요청하신 페이지를 찾을 수 없습니다..</h1>
				<p class="col-md-8 fs-4">관리자에게 문의하세요!!!</p>
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		
		 <div class="row align-items-md-stretch   text-center">
	     	<div class="col-md-12">
				<div class="h-100 p-5">
			  		<p> <%=request.getRequestURL() %>
			  		<!-- http://192.168.111.101:8080  -->
			  		<p> <a href="books.jsp" class="btn btn-secondary"> 도서목록 &raquo;</a>
			  		<!-- 도서목록페이지로 이동!!! -->         
		        </div>
	    	</div>   
	   	</div> <!-- 본문영역 : 중간 box --> 
	   	
		<%@ include file="footer.jsp" %>

	</div>

</body>
</html>