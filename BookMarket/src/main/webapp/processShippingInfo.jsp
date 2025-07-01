<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 장바구니 이후에 배송 정보와 영수증 처리용 페이지
	// <form action="./processShippingInfo.jsp" method="post">

	request.setCharacterEncoding("UTF-8"); // POST방식의 한글처리용
	
	// 쿠키에 값을 생성한다.
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	// 24시간 제한 -> 이후에 자동 삭제
	cartId.setMaxAge( 24 * 60 * 60);
	name.setMaxAge( 24 * 60 * 60);
	zipCode.setMaxAge( 24 * 60 * 60);
	country.setMaxAge( 24 * 60 * 60);
	addressName.setMaxAge( 24 * 60 * 60);
	
	// 클라이언트에게 보냄 
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);

	response.sendRedirect("orderConfirmation.jsp"); // 최종페이지로 이동
	
%>