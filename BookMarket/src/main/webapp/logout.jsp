<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	session.invalidate();  // 세션 저장소 클리어 (기간만료)
	response.sendRedirect("addBook.jsp"); // 세션 만료 시키고 강제 이동 페이지
%>