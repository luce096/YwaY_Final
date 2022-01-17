<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setStatus(200);
%>
<html>

<head>
<script type="text/javascript">
	
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YwaY - Login</title>

<!-- Custom fonts for this template-->
<link href="resources/css/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<style>
body {
	padding: 0px;
	margin: 0px;
}

.jb-box {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0px auto;
	position: relative;
}

video {
	width: 100%;
}

.jb {
	position: absolute;
	top: 1%;
	width: 100%;
}
</style>

</head>

<body>
	<script type="text/javascript">
		window.onload = function() {
			let chk = '${check}';
			if (chk === '1') {
				alert('회원가입 성공');
			} else if (chk === '2') {
				alert('로그인 실패');
			}
		};
	</script>
<body>
	<video muted autoplay loop>
		<source src="resources/videos/space.mp4" type="video/mp4">
	</video>
		<div class="container-fluid jb">

			<!-- Outer Row -->
			<div class="row justify-content-center">

				<div class="col-xl-10 col-lg-12 col-md-9">

					<div class="card o-hidden border-0 shadow-lg my-4">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-6 d-none d-lg-block bg-login-gamerroom"></div>
								<div class="col-lg-6">
									<div class="p-5">
										<div class="text-center">
											<h1>
												<a class="h1 text-gray-900 mb-4" href="./">YWAY</a>
											</h1>
										</div>

										<form class="user" action="access" name="loginfrm"
											method="post">
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="exampleInputEmail" name="memberid"
													aria-describedby="emailHelp" placeholder="아이디를 입력하세요...">
											</div>
											<div class="form-group">
												<input type="password" class="form-control form-control-user"
													id="exampleInputPassword" name="memberpw"
													placeholder="비밀번호를 입력하세요...">
											</div>

											<button class="btn btn-primary btn-user btn-block">로그인</button>

										</form>

										<hr>
										<div class="text-center">
											<a class="small" href="./findinfo">아이디/비밀번호찾기</a>
										</div>
										<div class="text-center">
											<a class="small" href="./joinfrm">회원가입</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>

		<script type="text/javascript">
			window.onload = function() {
				let chk = '${check}';
				let chk2 = '${check2}';
				if (chk === '1') {
					alert('회원가입 성공');
				} else if (chk === '2') {
					alert('로그인 실패');
				}
				if (chk2) {
					alert(chk2 + '까지로그인이불가합니다.');
				}
			};
		</script>


		<!— Bootstrap core JavaScript—>
		<script src="resources/vendor/jquery/jquery.min.js"></script>
		<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!— Core plugin JavaScript—>
		<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!— Custom scripts for all pages  —>
		<script src="resources/js/sb-admin-2.min.js"></script>
</body>

</html>