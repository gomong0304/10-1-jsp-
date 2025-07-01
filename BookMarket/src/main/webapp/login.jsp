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

<title>환영합니다. 로그인페이지 입니다....</title>
</head>
<body>

	<div class="container py-4">

		<%@ include file="menu.jsp"%>
		<!-- 메뉴바를 외부파일로 연결 -->

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">로그인</h1>
				<p class="col-md-8 fs-4">Login</p>
			</div>
		</div>
		<!-- 중간타이틀 : 상단 box -->

		<div class="row align-items-md-stretch   text-center">
			<div class="row justify-content-center align-items-center "> <!-- p375 추가 -->
				<div class="h-100 p-5 col-md-6">
					<h3>Please sign in</h3>
					<%
					String error = request.getParameter("error");
					if (error != null) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					}
					%>
					<form class="form-signin" action="j_security_check" method="post">

						<div class="form-floating  mb-3 row">
							<input type="text" class="form-control" name='j_username'
								required autofocus> <label for="floatingInput">ID</label>
						</div>
						<div class="form-floating  mb-3 row">
							<input type="password" class="form-control" name='j_password'>
							<label for="floatingInput">Password</label>
						</div>

						<button class="btn btn-lg btn-success" type="submit">로그인</button>

					</form>
				</div>
			</div>


		</div>
		<!-- 본문영역 : 중간 box -->

		<%@ include file="footer.jsp"%>

	</div>

</body>
</html>