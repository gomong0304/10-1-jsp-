<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html><html><head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" /> <!-- cdn이 아닌 로컬에 저장된 css -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>


<title>도서 수정</title></head>

<body>

	<div class="container py-4">

		<%@ include file="menu.jsp" %> 
		<!-- 메뉴바를 외부파일로 연결 -->
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서 수정</h1>
				<p class="col-md-8 fs-4">Book Updating</p>
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		
		<%@ include file="dbconn.jsp" %>
		
		<%
			String bookId=request.getParameter("id");
	     	PreparedStatement pstmt=null;
	     	ResultSet rs=null;
	     	String sql="SELECT * FROM book WHERE b_id=?";
	     	pstmt=conn.prepareStatement(sql); 	// 3단계
	     	pstmt.setString(1, bookId);
	     	rs=pstmt.executeQuery();			// 4단계
	     	if(rs.next()){ // ResultSet 표에 1번 행부터 마지막 행까지 true를 리턴
	     	%>
	     	<div class="row align-items-md-stretch">
				<div class = "col-md-5">
					<img alt="image" width=100% src="./resources/images/<%=rs.getString("b_filename")%>">
			</div>
			
			<div class = "col-md-7">
			<form name="newBook" action="./processUpdateBook.jsp" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" : 파일업로드용 타입 필수 -->
				
				<div class="mb-3 row">
					<label class="col-sm-2">도서코드</label>
					<div class="col-sm-5">
						<input type="text" id="bookId" name="bookId" class="form-control" 
						value='<%=rs.getString("b_id") %>'>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">도서명</label>
					<div class="col-sm-5">
						<input type="text" id="name" name="name" class="form-control"
						value='<%=rs.getString("b_name") %>'>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-5">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control"
						value='<%=rs.getString("b_unitPrice") %>'>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">저자</label>
					<div class="col-sm-5">
						<input type="text" id="author" name="author" class="form-control"
						value='<%=rs.getString("b_author") %>'>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">출판사</label>
					<div class="col-sm-5">
						<input type="text" id="publisher" name="publisher" class="form-control"
						value='<%=rs.getString("b_publisher") %>'>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">출판일</label>
					<div class="col-sm-5">
						<input type="text" id="releaseDate" name="releaseDate" class="form-control"
						value='<%=rs.getString("b_releaseDate") %>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">상세정보</label>
					<div class="col-sm-8">
						<textarea name="description" id="description" cols="50" rows="2"
							class="form-control" placeholder="100자 이상 적어주세요">
							<%=rs.getString("b_description") %>'></textarea>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-5">
						<input type="text" name="category" class="form-control"
						value='<%=rs.getString("b_category") %>'>
					</div>
				</div>
				
				
				<div class="mb-3 row">
					<label class="col-sm-2">재고수</label>
					<div class="col-sm-5">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control"
						value='<%=rs.getString("b_unitsInStock") %>'>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">상태</label>
					<div class="col-sm-8">
						<input type="radio" name="condition" value="New"> 신규도서 
						<input type="radio" name="condition" value="Old"> 중고도서 
						<input type="radio" name="condition" value="EBook"> E-Book
					</div>
				</div>
				
				<div class="mb-3 row"> <!-- 교재 이미지 처리용 폼 추가  p265 -->
					<label class="col-sm-2">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="BookImage" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary" value="등록"> <!-- onclick="CheckAddBook()" 버튼을 클릭했을 때 핸들링 하기 위한 방법 js로 감 -->
					</div>
				</div>
				
			</form>
		</div>
		
		<%
	     	}
	     	if(rs!=null) rs.close();
	     	if(pstmt!=null) pstmt.close();
	     	if(conn!=null) conn.close();
		%>
		
		<%@ include file="footer.jsp"%>

</div>
</body>
</html>