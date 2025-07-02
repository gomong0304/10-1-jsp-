<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn=null; 

	try{ // 오류가 나올 확률이 있는 코드에 예외 처리용
		
		String url="jdbc:mysql://192.168.111.101:3306/bookmarketdb";
		String user="mbcbook";
		String password="mbc1234";
		
		Class.forName("com.mysql.jdbc.Driver"); // jdbc 드라이버 사용
		System.out.println("1단계 성공");
		conn=DriverManager.getConnection(url, user, password); // jdbc 1,2 단계 연결용
		System.out.println("2단계 성공");
		
	} catch(SQLException ex){ // 예외 발생시 처리문
		out.println("데이터 베이스 연결이 실패했습니다.(1,2단계 오류 발생)<br>");
		out.println("SQLException :" + ex.getMessage());
	}
	
%>