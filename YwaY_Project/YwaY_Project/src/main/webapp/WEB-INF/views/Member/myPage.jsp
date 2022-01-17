<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<%
Document doc2 = Jsoup.connect("https://www.leagueoflegends.com/ko-kr/news/tags/patch-notes/").get();
Elements posts = doc2.body().getElementsByClass("style__WrapperInner-sc-106zuld-1");
Elements file = posts.select(".style__Item-sc-106zuld-3");
%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YwaY.GG</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/include/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- topbar -->
				<jsp:include page="/include/topbar.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">


					<div class="card o-hidden border-0 shadow-lg my-4">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">

								<div class="col-lg-9">
									<div class="p-5">
										<div class="text-center">
											<h1>
												<a class="h4 text-gray-900 mb-4" href="./">내정보페이지</a>
											</h1>
										</div>

										<div class="user">
											<div class="form-group">
												<div type="text" class="div-control div-control-user" style="font-size:.8rem;border:1px solid black;border-radius:10rem;padding:1.5rem 1rem">
													아이디:${mb.memberid}</div>
											</div>
											<div class="form-group">
												<div type="text" class="form-control form-control-user">
													소환사 이름: ${mb.summonername}</div>
											</div>
											<div class="form-group">
												<div type="text" class="form-control form-control-user">
													이메일: ${mb.email}</div>
											</div>
											
										</div>

										<hr>

									</div>
								</div>
								<div class="col-lg-3 d-none d-lg-block bg-login-gamerroom"></div>
							</div>
						</div>
					</div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


			<!--footer  -->
			<jsp:include page="/include/footer.jsp" />

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">가끔은 슬픈 것도 나쁘지 않아. 그래야 행복한 게 어떤 느낌인 지
						알잖아. -누누-</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
						<a class="btn btn-primary" href="logout">로그아웃</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="resources/vendor/jquery/jquery.min.js"></script>
		<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="resources/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="resources/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<!-- <script src="resources/js/demo/chart-area-demo.js"></script>
   <script src="resources/js/demo/chart-pie-demo.js"></script> -->
</body>

</html>