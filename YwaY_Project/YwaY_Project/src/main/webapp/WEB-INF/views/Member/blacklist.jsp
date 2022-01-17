<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- 	<link rel="stylesheet" href="resources/css/lezhin.css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<script src="resources/js/SkincupHome.js?version=123"></script>
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/SkincupHome.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="resources/css/lezhin.css"> -->

<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="resources/vendor/chart.js/Chart.min.js"></script>
<!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<!-- Page level custom scripts -->
<!-- <script src="resources/js/demo/chart-area-demo.js"></script>
   <script src="resources/js/demo/chart-pie-demo.js"></script> -->
</head>
<body>
	<!-- DataTales Example -->
	<div style="width:1000px; margin:auto;">
	<div class="card shadow mb-3">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">블랙리스트관리</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="dataTable_length">
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<form id="userblacklist" action="" method="post">
							<table class="table table-bordered dataTable" id="dataTable"
								width="100%" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting sorting_asc" tabindex="0"
											aria-controls="dataTable" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 73px;">신고당한유저이름</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 93px;">신고날짜</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 58px;">신고이유</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 31px;">로그인정지기한</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th rowspan="1" colspan="1">신고당한유저이름</th>
										<th rowspan="1" colspan="1">신고날짜</th>
										<th rowspan="1" colspan="1">신고이유</th>
										<th rowspan="1" colspan="1">로그인정지기한</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${blList}" var="Blacklist">
									<tr class="odd">
										<td class="sorting_1"><input type="checkBox" name="r_id" id="r_id" value="${Blacklist.r_id}">${Blacklist.r_id}</td>
										<td>${Blacklist.r_date}</td>
										<td>${Blacklist.r_reason}</td>
										<td>${Blacklist.a_date}</td>
									</tr>
									</c:forEach>
								</tbody>
							
							</table>
						<button id="userdelete">삭제하기</button>
						<button id="loginblock" name="nextDayString" value="${nextDayString}">유저계정정지시키기</button>
						</form>
						
						</div>
					</div>
			
				</div>
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
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/datatables-demo.js"></script>



</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#userdelete').on("click", function() {
			$('#userblacklist').attr("action", "userdelete");
			$('#userblacklist').submit();
		});
		$('#loginblock').on("click", function() {
			$('#userblacklist').attr("action", "loginblock");
			$('#userblacklist').submit();
		});
	});
</script>
</html>