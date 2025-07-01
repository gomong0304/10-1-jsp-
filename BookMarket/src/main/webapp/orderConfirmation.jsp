<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String cartId = session.getId();

String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_country = "";
String shipping_zipCode = "";
String shipping_addressName = "";

Cookie[] cookies = request.getCookies(); // 사용자가 저장한 쿠키값을 가져온다.

if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
	shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_name"))
	shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_shippingDate"))
	shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_country"))
	shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_zipCode"))
	shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_addressName"))
	shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}
%>
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

<title>주문 정보</title>
</head>
<body>

	<div class="container py-4">

		<%@ include file="menu.jsp"%>
		<!-- 메뉴바를 외부파일로 연결 -->

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">주문정보</h1>
				<p class="col-md-8 fs-4">Order Infor</p>
			</div>
		</div>
		<!-- 중간타이틀 : 상단 box -->

		<div class="row align-items-md-stretch alert alert-info">
			<div class="text-center">
				<h1>영수증</h1>
			</div>
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배송 주소</strong> <br> 성명 :
					<%
 						out.println(shipping_name);
 					%>
 					<br> 우편번호 :
					
					<%
					 out.println(shipping_zipCode);
					%>
					<br> 주소 :
					
					<%
					 out.println(shipping_addressName);
					%>(<%
					 out.println(shipping_country);
					 %>)
					 <br>
				</div>
				<div class="col-4" align="right">
					<p>
						<em>배송일: <%
						out.println(shipping_shippingDate);
						%></em>
				</div>
			</div>
			<div class=" py-5">
				<table class="table table-hover">
					<tr>
						<th class="text-center">도서</th>
						<th class="text-center">#</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
					<%
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Book>();
					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Book book = cartList.get(i);
						int total = book.getUnitPrice() * book.getQuantity();
						sum = sum + total;
					%>
					<tr>
						<td class="text-center"><em><%=book.getName()%> </em></td>
						<td class="text-center"><%=book.getQuantity()%></td>
						<td class="text-center"><%=book.getUnitPrice()%>원</td>
						<td class="text-center"><%=total%>원</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td> </td>
						<td> </td>
						<td class="text-right"><strong>총액: </strong></td>
						<td class="text-center text-danger"><strong><%=sum%>
						</strong></td>
					</tr>
				</table>
				<a href="./ShippingInfo.jsp?cartId=<%=shipping_cartId%>"
					class="btn btn-secondary" role="button"> 이전 </a> <a
					href="./thankCustomer.jsp" class="btn btn-success" role="button">
					주문 완료 </a> <a href="./checkOutCancelled.jsp" class="btn btn-secondary"
					role="button"> 취소 </a>
			</div>
		</div>
		<!-- 본문영역 : 중간 box -->

		<%@ include file="footer.jsp"%>

	</div>

</body>
</html>