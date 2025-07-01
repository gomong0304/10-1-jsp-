<%@page import="dao.BookRepository"%>
<%@ page import="dto.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%>
<!-- 자바 빈즈를 이용해서 객체를 가져옴.             저장은 세션 영역 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" /> <!-- cdn이 아닌 로컬에 저장된 css -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>

<title>환영합니다. 책판매 쇼핑몰입니다.....</title>
</head>
<body>

	<div class="container py-4">

		<%@ include file="menu.jsp" %> 
		<!-- 메뉴바를 외부파일로 연결 -->
		
		
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">도서목록</h1>
				<p class="col-md-8 fs-4">BookList</p>
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		<%
			BookRepository dao = BookRepository.getInstance(); // 폼으로 입력한 책 객체용
			ArrayList<Book> listOfBooks = dao.getAllBooks();
		//리스트타입으로 Book객체를 만들고 전체 리스트를 가져와 listOfBooks에 담음
		//세션 영역에 보관중.
		%>
		
		
		
		<div class="row align-items-md-stretch   text-center">
	     	<%
	     		for(int i=0 ; i< listOfBooks.size(); i++){
	     			// 리스트 배열에 0번 부터 끝까지 1씩 증가(인덱스)
	     			Book book = listOfBooks.get(i); // .add 추가 .get 가져옴
	     		
	     	%>
	     		<div class="col-md-4">
	     			<div class="h-100 p-2">
	     				<img src="./resources/images/<%=book.getFilename() %>"	width="200" height="300" />
	     				<!-- style=" width:250 ;  height :350 " -->
	     				<h5><b><%=book.getName() %></b></h5>
	     				<p> <%=book.getAuthor() %> </p>
	     				<br>
	     					<%=book.getPublisher() %> | <%= book.getReleaseDate() %>
	     				<p> <%=book.getDescription().substring(0,10) %>...</p>
	     				<p> <%=book.getUnitPrice() %>원	</p>
	     				<p> <a href="./book.jsp?id=<%=book.getBookId() %>"
	     					   class="btn btn-secondary" role="button"> 상세정보 &raquo;</a>
	     			</div>
	     		</div>
	     	<%
	     		} // for문 종료
	     	%> 
	     	 
	   	</div> <!-- 본문영역 : 중간 box --> 
	   	
		<%@ include file="footer.jsp" %>

	</div>

</body>
</html>