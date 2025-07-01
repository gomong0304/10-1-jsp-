<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id"); // ISBN1234 
	if (id==null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		// 파라미터가 비어있으면 강제로 books.jsp로 보낸다.
		return; // 돌아가라~ (아래쪽 코드 사용 안함.)
	}

	BookRepository dao = BookRepository.getInstance(); // 책의 객체를 가져옴
	
	Book book= dao.getBookById(id); // 전달온 파라미터 값으로 객체를 찾아옴.
	if(book==null){
		response.sendRedirect("exceptionNoBookId.jsp");// 찾은 책이 없다는 예외처리 jsp
	}
	
	ArrayList<Book> goodsList = dao.getAllBooks(); // 전체 책 정보 리스트를 가져옴
	Book goods=new Book();
	for (int i=0 ; i<goodsList.size() ; i++){
		// 전체 리스트에서 검사
		goods = goodsList.get(i); // 0번 인덱스부터 1개씩 가져와 goods 변수에 넣음
		if (goods.getBookId().equals(id)){
			// 파리미터로 받은 id과 리스트에 있는 id가 같은지 찾음
			break; // 더이상 찾지 말고 중지 
		}
	}
	
	// 장바구니에 생성되는 새로운 객체
	ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
	//          세션에 있는 객체를 어레이 리스트 객체로 강제타입 변환하여 사용
	if(list == null){
		list = new ArrayList<Book>();  // 세션이 비어 있으면 어레이 리스트 생성
		// 처음 장바구니에 담으면 객체 생성
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0 ; // 임시 카운트
	Book goodsQnt = new Book();
	
	for(int i=0; i< list.size() ; i++){
		// 장바구니 어레이스트에서 반복 수행작업
		goodsQnt = list.get(i); 
		if(goodsQnt.getBookId().equals(id)){
			cnt++ ; // 주문하기 버튼을 누를때마다 수량 추가
			int orderQuantity = goodsQnt.getQuantity() + 1 ;
			goodsQnt.setQuantity(orderQuantity); // 객체에 수량 추가 완료
		}
	}
	
	System.out.println(goodsQnt.toString()) ; // 테스트 코드
	
	if(cnt==0){
		goods.setQuantity(1);
		list.add(goods); // 장바구니 어레이 리스트에 최종 추가
	}
	
	response.sendRedirect("book.jsp?id="+id);  // 장바구니 추가후 원래 위치로 돌아감.
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCart.jsp</title>
</head>
<body>

</body>
</html>