<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>

	<h2>Scripting Tag</h2>
	
	<%!
	// 선언문 : 자바 변수나 메소드를 정의
	int count = 3; // 변수 선언
	
	String makeItLower(String data){ // 메서드 선언
		return data.toLowerCase();
	}
	
	%>
	
	
	<%
	// 스크립틀릿 : 자바 로직을 작성
		for(int i = 1; i <= count; i++ ){
			out.println("java server pages " + i + ".<br>");
		}
	%>
	
	
	<%= makeItLower("Hello World")
	// 표현문으로 print를 담당한다. (출력)
	
	%>

</body>
</html>