<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
<%
	String cartId = session.getId();  // 세션에 있는 id 값을 가져옴.
%>
<title>장바구니</title>
</head>
<body>

	<div class="container py-4">

		<%@ include file="menu.jsp"%>
		<!-- 메뉴바를 외부파일로 연결 -->

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">장바구니</h1>
				<p class="col-md-8 fs-4">Cart</p>
			</div>
		</div>
		<!-- 중간타이틀 : 상단 box -->

		<div class="row align-items-md-stretch">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left"><a
							href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
						<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a></td>
					</tr>
				</table>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>도서</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
					<%
					int sum = 0; // 총액
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Book>(); //  카트 리스트가 비었으면 객체 생성
						// if문 종료
					for (int i = 0; i < cartList.size(); i++) {
						Book book = cartList.get(i);
						int total = book.getUnitPrice() * book.getQuantity();
						// 단가 * 수량 = 총액
						sum = sum + total; // 여러책을 총액을 더함.
					%>
					<tr>
						<td><%=book.getBookId()%>-<%=book.getName()%></td>
						<td><%=book.getUnitPrice()%></td>
						<td><%=book.getQuantity()%></td>
						<td><%=total%></td>
						<td><a href="./removeCart.jsp?id=<%=book.getBookId()%>"
							class="badge text-bg-danger">삭제</a></td>
					</tr>
					<%
					} // for문 종료
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum%></th>
						<th></th>
					</tr>
				</table>
			</div>
		</div>
		<!-- 본문영역 : 중간 box -->

		<%@ include file="footer.jsp"%>

	</div>

</body>
</html>