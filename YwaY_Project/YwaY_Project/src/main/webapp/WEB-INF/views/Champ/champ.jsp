<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>	
	
</head>
<style>
#wrap {
	float: left;
	width: 605px;
	background-color: #f9f9fa;
	border: solid 1px #e9eff4;
	border-right: none;
	box-sizing: border-box;
}

#choice {
	background-color: #fff;
	border-bottom: solid 1px #e9eff4;
}

#championimage {
	margin: 10px 8px;
	font-size: 5px;
	text-align: left;
	width:
}

ul {
	float: left;
	margin-left: 20px;
}

#sc {
	float: right;
	margin: 7px 7px 7px 0;
}

input {
	height: 36px;
	width: 193px;
	border: none;
	background: #f7f7f7;
	line-height: 15px;
	font-size: 15px;
	color: #9b9b9b;
	padding: 9px 0 10px 10px;
	box-sizing: border-box;
}

#championbox {
	float: left;
}

#icon {
	position: relative;
	width: 45px;
	height: 45px;
	padding: 2px;
}

#championicon {
	position: relative;
	width: 95px;
	height: 95px;
	padding: 5px;
}

#click:link {
	color: black;
	text-decoration: none;
	fontsize: 20px;
}

#click:visited {
	color: green;
	text-decoration: underline;
}

#click:active {
	color: blue;
	text-decoration: none;
}

#click:hover {
	color: red;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	background-color: white;
}

ul:after {
	content: '';
	display: block;
	clear: both;
}

li {
	float: left;
}

li a {
	display: block;
	color: #64AAFF;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not(.active) {
	
}

.pickcolor {
	color: #000;
}

.bancolor {
	color: #777579;
}
</style>

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
<script src="http://code.jquery.com/jquery-latest.js"></script>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/include/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content"
				style="background-image: 'resources/img/slide1.jpg'">

				<!-- topbar -->
				<jsp:include page="/include/topbar.jsp" />



				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-7 col-md-6 mb-4">
							<!-- Illustrations -->
							<div class="card mb-4">
								<div class="card-header py-3">
									<ul>
										<li><a class="collapse-item"
											href="javascript:Aj('all','#chamlist')" id="click">??????</a></li>
										<li><a class="collapse-item"
											href="javascript:Aj('top','#chamlist')" id="click">???</a></li>
										<li><a class="collapse-item"
											href="javascript:Aj('jungle','#chamlist')" id="click">??????</a></li>
										<li><a class="collapse-item"
											href="javascript:Aj('mid','#chamlist')" id="click">??????</a></li>
										<li><a class="collapse-item"
											href="javascript:Aj('bottom','#chamlist')" id="click">??????</a></li>
										<li><a class="collapse-item"
											href="javascript:Aj('support','#chamlist')" id="click">??????</a></li>

									</ul>
									<div id="sc">
										<input type="text" class="searchchampion" placeholder="????????? ??????(??????, ??????, ..)">
									</div>
								</div>
								<div class="card-body" id="chamlist"></div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<!-- Illustrations -->
							<div class="card  mb-4">
								<div class="card-header py-3" style="display: flex">
									<h6 class="m-2 font-weight-bolder">???????????????</h6>
									<h6 class="m-2 font-weight-bold">
										<a href="javascript:pick();"
											class="font-weight-bold pickcolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-bold">
										<a href="javascript:ban();" class="font-weight-bold bancolor">??????</a>
									</h6>
								</div>
								<div class="card-header py-2" style="display: flex"
									id="picklist">
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('top_pick','#pick')"
											class="font-weight-bold pickcolor">???</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('jungle_pick','#pick')"
											class="font-weight-bold pickcolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('mid_pick','#pick')"
											class="font-weight-bold pickcolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('bot_pick','#pick')"
											class="font-weight-bold pickcolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('sup_pick','#pick')"
											class="font-weight-bold pickcolor">??????</a>
									</h6>
								</div>
								<div class="card-header py-2" style="display: flex" id="banlist">
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('top_pickban','#ban')"
											class="font-weight-bold bancolor">???</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('jungle_pickban','#ban')"
											class="font-weight-bold bancolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('mid_pickban','#ban')"
											class="font-weight-bold bancolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('bot_pickban','#ban')"
											class="font-weight-bold bancolor">??????</a>
									</h6>
									<h6 class="m-2 font-weight-normal">
										<a href="javascript:Aj('sup_pickban','#ban')"
											class="font-weight-bold bancolor">??????</a>
									</h6>
								</div>
								<div class="card-body" id="ban">
									<div class="text-center"></div>
								</div>
								<div class="card-body" id="pick">
									<div class="text-center"></div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
			<!-- footer -->
			<jsp:include page="/include/footer.jsp" />
		</div>
		<!-- End of Content Wrapper -->
<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">???????????? ???????????????????</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">??</span>
					</button>
				</div>
				<div class="modal-body">????????? ?????? ?????? ????????? ??????. ????????? ????????? ??? ?????? ????????? ???
					?????????. -??????-</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">??????</button>
					<a class="btn btn-primary" href="logout">????????????</a>
				</div>
			</div>
		</div>

	</div>
	<!-- End of Page Wrapper -->



	<script type="text/javascript"> 
		let severData;
	
			
		function Aj(url, position){
			$.ajax({
				url : url,
				type : 'get',
				dataType : 'html' //json
			}).done((data)=>{console.log(data);$(position).html(data);})
			.fail((err)=>console.log(err))
		} //Ajj End
	
	</script>
	<script>
		function pick(){
			$('#ban').hide();
			$('#banlist').hide();
			$('#pick').show();
			$('#picklist').show();
		}
		
		function ban(){
			$('#ban').show();
			$('#banlist').show();
			$('#pick').hide();
			$('#picklist').hide();
		}
		
	$(document).ready(function(){
		pick();	
		Aj('top_pick','#pick');
		Aj('all','#chamlist');
		
		
		
	})
	
 $(document).ready(function() {
	$(".searchchampion").keyup(function () {
		   var a = $(this).val();
			 console.log(a);
			 $(".card-body>#championimage>#championbox>a").hide();
			 var temp = $(".card-body>#championimage>#championbox>a>p:contains('" + a + "')");
		     $(temp).parent().show();
		  });
	});
	
	</script>

	<!??? Bootstrap core JavaScript???>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!??? Core plugin JavaScript???>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!??? Custom scripts for all pages???>
	<script src="resources/js/sb-admin-2.min.js"></script>

	<!??? Page level plugins ???>
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!??? Page level custom scripts ???>
	<script src="resources/js/demo/datatables-demo.js"></script>
</body>
</html>