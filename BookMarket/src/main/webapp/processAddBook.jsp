<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8"); // post 메서드 한글 지원 필수코드
	
	// 파일업로드 처리용 코드 추가
	String filename="";
	String realFolder=application.getRealPath("/resources/images"); // 톰켓이 관리하는 실제경로
					 // http://192.168.111.101:8080/BookMarket
	int maxSize = 5 * 1024 * 1024 ; // 5메가까지 저장
	String encType = "utf-8";		// 파일명이 한글일수 있음.
	
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
	
	
	BookRepository dao = BookRepository.getInstance();

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
	dao.addBook(newBook); // 만들어진 객체를 리스트배열에 꼽는다.
	
	response.sendRedirect("books.jsp"); // 성공시 강제로 이동하는 페이지


%>