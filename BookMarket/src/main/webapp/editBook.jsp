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

<script type="text/javascript">
	function  deleteConfirm(id) {
		if(confirm("해당 도서를 삭제합니다!!")==true)
			location.href="./deleteBook.jsp?id=" +id;
		else
			return;
	}
</script>

<title>도서 수정</title></head>

<%
	String edit=request.getParameter("edit");
%>

<body>

	<div class="container py-4">

		<%@ include file="menu.jsp" %> 
		<!-- 메뉴바를 외부파일로 연결 -->
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서 수정</h1>
				<p class="col-md-8 fs-4">BookEditing</p>
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		
		<%@ include file="dbconn.jsp" %>
		<!-- jdbd 1,2 단계 연결자 -->
		
		<div class="row align-items-md-stretch   text-center">
	     	<%
	     		PreparedStatement pstmt=null;
	     		ResultSet rs=null;
	     		String sql="SELECT * FROM book";
	     		pstmt=conn.prepareStatement(sql); 	// 3단계
	     		rs=pstmt.executeQuery();			// 4단계
	     		while(rs.next()){ // ResultSet 표에 1번 행부터 마지막 행까지 true를 리턴
	     	%>
	     		<div class="col-md-4">
	     			<div class="h-100 p-2 round-3">
	     				<img src="./resources/images/<%=rs.getString("b_filename") %>"	width="200" height="300" /> <!-- style=" width:250 ;  height :350 " -->
	     				<p><h5><b><%=rs.getString("b_name") %></b></h5>
	     				<p> <%=rs.getString("b_author") %>
	     				<br>
	     					<%=rs.getString("b_publisher") %> | <%= rs.getString("b_releaseDate") %>
	     				<p> <%=rs.getString("b_description").substring(0,10) %>...</p>
	     				<p> <%=rs.getString("b_unitPrice") %>원	</p>
	     				<p><%
	     						if(edit.equals("update")){
	     					%>
	     					<a href="./updateBook.jsp?id=<%=rs.getString("b_id") %>" class="btn btn-success" role="button"> 정보 수정 &raquo;</a>
	     				
	     					<%
	     						} else if(edit.equals("delete")){// if문 종료
	     				
	     					%>
	     				
	     					<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="btn btn-danger" role="button">도서 삭제 &raquo;</a>
	     					
	     					<%
	     						}
	     					%>
	     			</div>
	     		</div>
	     	<%
	     		} // while문 종료
	     		
	     		if(rs!=null) rs.close();
	     		if(pstmt!=null) pstmt.close();
	     		if(conn!=null) conn.close();
	     	%> 
	     	 
	   	</div> <!-- 본문영역 : 중간 box --> 
	   	
		<%@ include file="footer.jsp" %>

	</div>

</body>
</html>