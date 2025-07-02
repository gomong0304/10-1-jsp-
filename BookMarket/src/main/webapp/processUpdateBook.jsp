<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8"); // post 메서드 한글 지원 필수코드
	
	// 파일업로드 처리용 코드 추가
	String filename="";
	String realFolder=application.getRealPath("/resources/images"); // 톰켓이 관리하는 실제경로
					 // http://192.168.111.101:8080/BookMarket
	int maxSize = 5 * 1024 * 1024 ; // 5메가까지 저장
	String encType = "UTF-8";		// 파일명이 한글일수 있음.
	
	MultipartRequest multipartRequest = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	// 만약 오류발생시 cos.jar 버전 확인 -> 마이그레이션 cos_2.jar 삽입
	// enctype="multipart/form-data" 하면 request영역이 아닌 multipartRequest으로 전달됨.
	
	// String bookId = request.getParameter("bookId"); -> multipartRequest로 변경함!!! 중요!!!
	String bookId = multipartRequest.getParameter("bookId");
	String name = multipartRequest.getParameter("name");
	String unitPrice = multipartRequest.getParameter("unitPrice");
	String author = multipartRequest.getParameter("author");
	String publisher = multipartRequest.getParameter("publisher");
	String releaseDate = multipartRequest.getParameter("releaseDate");	
	String description = multipartRequest.getParameter("description");	
	String category = multipartRequest.getParameter("category");
	String unitsInStock = multipartRequest.getParameter("unitsInStock");
	String condition = multipartRequest.getParameter("condition"); // post로 전달받은 값
	
	// 다중파일용 파일명 가져오기!!!
	Enumeration files = multipartRequest.getFileNames(); // 업로드 된 파일명들~ 을 가져옴
	String fname = (String) files.nextElement();		 // 파일 있는지 여부
	String fileName = multipartRequest.getFilesystemName(fname); // 파일명을 가져와 변수에 넣음
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice); 
	// 가격이 문자타입으로 전달됨, 정수타입으로 변경 

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	// 재고가 문자타입으로 전달됨, long 타입으로 변경
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="SELECT * FROM book WHERE b_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		if (fileName!=null){
			sql="UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=?, b_fileName=? WHERE b_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
		} else{
			sql="UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? WHERE b_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, bookId);
			pstmt.executeUpdate();
		}
	}
	
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	
	// p590 추가 데이터 베이스 사용할꺼기 때문에 밑에 내용은 주석처리
	/* BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book(); // 빈객체 생성
	newBook.setBookId(bookId); // 위 전달된 값을 객체에 넣음
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);  // 파일명 추가!!!
	
	System.out.print(newBook.toString());
	dao.addBook(newBook); // 만들어진 객체를 리스트배열에 꼽는다. */
	
	response.sendRedirect("editBook.jsp?edit=update"); // 성공시 강제로 이동하는 페이지


%>