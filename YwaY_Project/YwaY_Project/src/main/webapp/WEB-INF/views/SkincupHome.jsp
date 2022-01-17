<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SkinCupHome</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
div {
	text-align: center;
}

img {
	display: block;
	margin: 0px auto;
}

.slide1 {
	width: 100% px;
}

.slide1 {
	height: 400px;
}

.btn6 {
	background-color:;
	padding: 15px 100px;
	margin: 10px 4px;
	color: #36b9cc;
	font-family: sans-serif;
	text-transform: uppercase;
	text-align: center;
	position: relative;
	text-decoration: none;
	display: inline-block;
}
/*=======Button 6============= */
.btn6 {
	border: 1px solid transparent;
	-webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
	transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
}

.btn6::before {
	content: '';
	position: absolute;
	left: 0px;
	bottom: 0px;
	z-index: -1;
	width: 0%;
	height: 1px;
	background: #6098FF;
	box-shadow: inset 0px 0px 0px #6098FF;
	display: block;
	-webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
	transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
}

.btn6:hover::before {
	width: 100%;
}

.btn6::after {
	content: '';
	position: absolute;
	right: 0px;
	top: 0px;
	z-index: -1;
	width: 0%;
	height: 1px;
	background: #6098FF;
	-webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
	transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
}

.btn6:hover::after {
	width: 100%;
}

.btn6:hover {
	border-left: 1px solid #6098FF;
	border-right: 1px solid #6098FF;
}
/* 특수버튼 */
* {
  box-sizing: border-box;
}

div {
  display: block;
  /* height: 100%; */
}

.button {
  -webkit-font-smoothing: antialiased;
  background-color: #222;
  border: none;
  color: #fff;
  display: inline-block;
  font-family: "Montserrat", sans-serif;
  font-size: 14px;
  font-weight: 100;
  text-decoration: none;
  user-select: none;
  letter-spacing: 1px;
  color: white;
  padding: 20px 40px;
  text-transform: uppercase;
  transition: all 0.1s ease-out;
  animation: hue-rotate 10s linear infinite;
}
.button:hover {
  background-color: #90feb5;
  color: #fff;
}
.button:active {
  transform: scale(0.95);
}
.button--bubble {
  position: relative;
  z-index: 2;
  color: white;
  background: none;
}
.button--bubble:hover {
  background: none;
}
.button--bubble:hover + .button--bubble__effect-container .circle {
  background: #44fd82;
}
.button--bubble:hover + .button--bubble__effect-container .button {
  background: #44fd82;
}
.button--bubble:active + .button--bubble__effect-container {
  transform: scale(0.95);
}
.button--bubble__container {
  position: relative;
  display: inline-block;
}
.button--bubble__container .effect-button {
  position: absolute;
  width: 50%;
  height: 25%;
  top: 50%;
  left: 25%;
  z-index: 1;
  transform: translateY(-50%);
  background: #222;
  transition: background 0.1s ease-out;
}

.button--bubble__effect-container {
  position: absolute;
  display: block;
  width: 200%;
  height: 400%;
  top: -150%;
  left: -50%;
  -webkit-filter: url("#goo");
  filter: url("#goo");
  transition: all 0.1s ease-out;
  pointer-events: none;
}
.button--bubble__effect-container .circle {
  position: absolute;
  width: 25px;
  height: 25px;
  border-radius: 15px;
  background: #222;
  transition: background 0.1s ease-out;
}
.button--bubble__effect-container .circle.top-left {
  top: 40%;
  left: 27%;
}
.button--bubble__effect-container .circle.bottom-right {
  bottom: 40%;
  right: 27%;
}

.goo {
  position: absolute;
  visibility: hidden;
  width: 1px;
  height: 1px;
}


.button--bubble__container {
  top: 50%;
  margin-top: -25px;
}

@keyframes hue-rotate {
  from {
    -webkit-filter: hue-rotate(0);
    -moz-filter: hue-rotate(0);
    -ms-filter: hue-rotate(0);
    filter: hue-rotate(0);
  }
  to {
    -webkit-filter: hue-rotate(360deg);
    -moz-filter: hue-rotate(360deg);
    -ms-filter: hue-rotate(360deg);
    filter: hue-rotate(360deg);
  }
}



</style>

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

					<!-- MainContent 넣는 부분!! -->
					<!-- MainContent 넣는 부분!! -->
					<!-- MainContent 넣는 부분!! -->
					<!-- MainContent 넣는 부분!! -->

					<div>
						<img class="slide1" src="resources/img/LOL_SkinCup/Aatrox_8.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Ahri_1.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Akali_32.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Alistar_10.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Amumu_24.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Anivia_5.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Ashe_17.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Azir_4.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Bard_17.jpg">
						<img class="slide1"
							src="resources/img/LOL_SkinCup/Blitzcrank_29.jpg"> <img
							class="slide1" src="resources/img/LOL_SkinCup/Cassiopeia_18.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Chogath_14.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Corki_18.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Darius_15.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Diana_26.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Draven_20.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Ekko_19.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Evelynn_15.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Ezreal_21.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Fiora_31.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Graves_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Irelia_6.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Janna_5.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Jax_13.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Jayce_24.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Jhin_2.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Kaisa_15.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Kayn_9.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Kennen_6.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Khazix_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Kindred_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/KogMaw_28.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/LeeSin_31.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Leona_11.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Lucian_8.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Lulu_27.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Lux_7.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Maokai_6.jpg">
						<img class="slide1"
							src="resources/img/LOL_SkinCup/MissFortune_20.jpg"> <img
							class="slide1" src="resources/img/LOL_SkinCup/Morgana_26.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Nami_24.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Nautilus_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Nidalee_18.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Nunu_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Orianna_5.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Poppy_15.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Qiyana_10.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Rammus_1.jpg">
						<img class="slide1"
							src="resources/img/LOL_SkinCup/Renekton_17.jpg"> <img
							class="slide1" src="resources/img/LOL_SkinCup/Riven_4.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Rumble_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Ryze_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Sejuani_5.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Senna_9.jpg">
						<img class="slide1"
							src="resources/img/LOL_SkinCup/Seraphine_3.jpg"> <img
							class="slide1" src="resources/img/LOL_SkinCup/Shaco_6.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Shen_3.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Yasuo_18.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Yone_19.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Yuumi_11.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Zed_13.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Ziggs_23.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Zoe_19.jpg">
						<img class="slide1" src="resources/img/LOL_SkinCup/Zyra_16.jpg">
					</div>

				<!— 버튼 넣는부분 —>
					<div class="content default" id="content">     
	   <a href="Skincup" class="btn6">시작</a>
</div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!--footer  -->
			<jsp:include page="/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

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

	<script>
		var index = 0; //이미지에 접근하는 인덱스
		window.onload = function() {
			slideShow();
		}

		function slideShow() {
			var i;
			var x = document.getElementsByClassName("slide1"); //slide1에 대한 dom 참조
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none"; //처음에 전부 display를 none으로 한다.
			}
			index++;
			if (index > x.length) {
				index = 1; //인덱스가 초과되면 1로 변경
			}
			x[index - 1].style.display = "block"; //해당 인덱스는 block으로
			setTimeout(slideShow, 4000); //함수를 4초마다 호출

		}
	</script>


	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!— Custom scripts for all pages—>
	<script src="resources/js/sb-admin-2.min.js"></script>

	<!— Page level plugins —>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>



</body>

</html>