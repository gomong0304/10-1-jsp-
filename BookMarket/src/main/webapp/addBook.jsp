<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 태그라이브러리 -> 스크립틀립 대체용 -> jsp를 태그화 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="./resources/js/validation.js" ></script>  <!-- 입력폼 검증 코드 연결 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>

<title>도서 등록 페이지 입니다.....</title>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/> <!-- 웹브라우저의 지역언어를 가져옴 -->
<fmt:bundle basename="bundle.message"> <!-- 기본값은 한국어로 표시 -->
	<div class="container py-4">

		<%@ include file="menu.jsp"%>
		<!-- 메뉴바를 외부파일로 연결 -->


		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>
				<p class="col-md-8 fs-4">Book Addition</p>
			</div>
		</div>
		<!-- 중간타이틀 : 상단 box -->

		<div class="row align-items-md-stretch">
			<div class="text-end">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
				<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
				<!-- p378 추가 --> 
			</div> <!-- 언어변환 버튼 -->
			<form name="newBook" action="./processAddBook.jsp" 
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<!-- enctype="multipart/form-data" : 파일업로드용 타입 필수 -->
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="bookId" /></label>
					<div class="col-sm-3">
						<input type="text" id="bookId" name="bookId" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="name" /></label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="author" /></label>
					<div class="col-sm-3">
						<input type="text" id="author" name="author" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="publisher" /></label>
					<div class="col-sm-3">
						<input type="text" id="publisher" name="publisher" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
					<div class="col-sm-3">
						<input type="text" id="releaseDate" name="releaseDate" class="form-control">
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="description" /></label>
					<div class="col-sm-5">
						<textarea name="description" id="description" cols="50" rows="2"
							class="form-control" placeholder="100자 이상 적어주세요"></textarea>
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="category" /></label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="condition" /></label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New "> 신규도서
						<input type="radio" name="condition" value="Old"> 중고도서 
						<input type="radio" name="condition" value="EBook"> E-Book
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="bookImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="bookImage" class="form-control" />
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddBook()">
						<!-- onclick="CheckAddBook()" 버튼을 클릭했을때 핸들링 하기 위한 방법 js로 감 -->
					</div>
				</div>

			</form> <!--  -->
		</div>
		<!-- 본문영역 : 중간 box -->

		<%@ include file="footer.jsp"%>

	</div>
</fmt:bundle>
</body>
</html>