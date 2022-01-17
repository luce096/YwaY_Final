<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>TeamList</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- 	<link rel="stylesheet" href="resources/css/lezhin.css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/lol_project.js?version=14"></script>


<style>
table.type01 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type01 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #000000;
	text-align: center
}

table.type01 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
}

table.type01 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #d5faf8;
}

table.type01 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr01 {
	background: #2fded2;
}

.teamname01 {
	background: #000000;
}

table.type02 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 20px 10px;
}

table.type02 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #1a1818;
	text-align: center
}

table.type02 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #ffffff;
}

table.type02 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #ffc5c5;
	color: #ffffff;
}

table.type02 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr02 {
	background: #ff0000;
}

.teamname02 {
	background: #1a1818;
}

table.type03 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type03 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #a8a8a8;
	text-align: center
}

table.type03 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #ffffff;
}

table.type03 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #a2a2a2;
	color: #fdffc8;
}

table.type03 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr03 {
	background: #a59f0c;
}

.teamname03 {
	background: #000000;
}

table.type04 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type04 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #000000;
	text-align: center
}

table.type04 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #ffebe6;
}

table.type04 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: rgba(255, 159, 76, 0.73);
	color: #ffffff;
}

table.type04 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr04 {
	background: #ff764d;
}

.teamname04 {
	background: #000000;
}

table.type05 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type05 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #000000;
	text-align: center
}

table.type05 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #767676;
}

table.type05 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: rgb(255, 208, 8);
	color: #000000;
}

table.type05 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr05 {
	background: rgb(255, 208, 8);
}

.teamname05 {
	background: #000000;
}

table.type06 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type06 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #000000;
	text-align: center
}

table.type06 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #ffffff;
}

table.type06 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: rgb(0, 0, 0);
	color: rgb(71, 128, 237);
}

table.type06 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr06 {
	background: rgb(71, 128, 237);
}

.teamname06 {
	background: #000000;
}

table.type07 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type07 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #ffffff;
	text-align: center
}

table.type07 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #ff1818;
}

table.type07 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: rgb(0, 0, 0);
	color: rgb(255, 11, 11);
}

table.type07 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr07 {
	background: rgb(83, 83, 83);
}

.teamname07 {
	background: #000000;
}

table.type08 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type08 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #ffffff;
	text-align: center
}

table.type08 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #00831e;
}

table.type08 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #00831e;
	color: rgb(255, 255, 255);
}

table.type08 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr08 {
	background: rgb(0, 0, 0);
}

.teamname08 {
	background: #ffffff;
}

table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type09 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #ffffff;
	text-align: center
}

table.type09 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #f78e00;
}

table.type09 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f78e00;
	color: rgb(0, 0, 0);
}

table.type09 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr09 {
	background: rgb(0, 0, 0);
}

.teamname09 {
	background: #ffffff;
}

table.type10 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 10px;
}

table.type10 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #ffffff;
	text-align: center
}

table.type10 thead th {
	padding: 4px;
	font-weight: bold;
	vertical-align: top;
	color: #f78e00;
}

table.type10 tbody th {
	width: 230px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #000000;
	color: rgb(255, 0, 0);
}

table.type10 td {
	width: 350px vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.teamnamekr10 {
	background: rgb(0, 0, 0);
}

.teamname10 {
	background: #ff0000;
}

.reversecol {
	background: #b5b5b5;
}

#teamlogo {
	width: 6rem;
	height: 6rem;
	border: 1px solid white;
	float: left;
}

.teamlogo {
	width: 6rem;
	height: 6rem;
}

.profileImgid {
	width: 3rem;
	height: 3rem;
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
					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-3 col-lg-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">팀명단</h6>
								</div>


								<div class="card-body">
									<div class="tooltip-link" data-tooltip="DWA KIA"
										onclick="dwg()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210129155857.adcdcb5ff15347ca02764a46801ff332.png">
									</div>

									<div class="tooltip-link" data-tooltip="Gen.G" onclick="geng()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210521225424.62c6b33257bd538564ef9baf3e9a6c01.png">
									</div>

									<div class="tooltip-link" data-tooltip="농심 레드포스" onclick="ns()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210522034233.f1c4a90e7b22ce50780f27568890a7d0.png">
									</div>

									<div class="tooltip-link" data-tooltip="T1" onclick="T1()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210105193943.36a822a9e7936c7941fb7875aa40d734.png">
									</div>
									<div class="tooltip-link" data-tooltip="리브 샌드박스" onclick="ls()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210125155258.f75f3b84fbacea286ec36fe9dcd408b7.png">
									</div>
									<div class="tooltip-link" data-tooltip="아프리카 프릭스"
										onclick="AF()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210521180620.e9a757a2e0f1ace0bf425c18e2e668c7.png">
									</div>
									<div class="tooltip-link" data-tooltip="KT 롤스터" onclick="kt()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210917173743.fd0fc23506d71d130aec738d64acb61a.png">
									</div>
									<div class="tooltip-link" data-tooltip="한화생명 e스포츠"
										onclick="hle()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210522024124.83e1ffc604320a821d36baec8e8bb657.png">
									</div>
									<div class="tooltip-link" data-tooltip="프레딧 브리온"
										onclick="bro()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20210104130506.426a6d4028e24f5a73c7b97b390c0f1e.png">
									</div>
									<div class="tooltip-link" data-tooltip="DRX" onclick="drx()">
										<img id="teamlogo"
											src="https://attach.s.op.gg/teamLogo/20200701202557.ac8aea4e0ccc1587f10bd42a4aaf21f1.png">
									</div>
								</div>
								<hr>
							</div>
						</div>


						<!-- 로스터 -->
						<div class="col-xl-9 col-lg-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">로스터</h6>
								</div>
								<div class="card-body row">

									<table class="DWG type01">
										<thead>
											<tr>
												<th colspan="2" scope="cols"><div class="tooltip-link"
														data-tooltip="DWA KIA" onclick="dwg()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210129155857.adcdcb5ff15347ca02764a46801ff332.png">
													</div></th>
											</tr>
											<tr>
												<th class="teamnamekr01" colspan="2" scope="cols">담원기아</th>
											</tr>
											<tr>
												<th class="teamname01" colspan="2" scope="cols">DWG</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td class="reversecol">김정균 kkOma,양대인 Daeny / 이재민 Zefa,박준형 Bubbling / 허수 ShowMaker</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td class="reversecol">LCK 내에서도 가장 파괴적인 스타일을 가진 팀이다.상징하는 키워드는 교전, 즉 무력</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td><div class="DWG justify-center">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th class="icon-th" rowspan="3"><img
																	class="profileImgid"
																	id="current_summoner_profile_icon_img_0"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>Top Burdol(노태윤)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_0"></span></td>
															</tr>

														</table>


														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_1"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Canyon(김건부)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_1"></span></td>
															</tr>

														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_2"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 ShowMaker(허수)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_2"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_3"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 deokdam(서대길)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_3"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_4"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Kellin(김형규)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_4"></span></td>
															</tr>
														</table>

													</div> <!-- 소환사정보 end --></td>
											</tr>
										</tbody>
										<!--  DWG -->
									</table>




									<!--T1-->
									<table class="t1 type02">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="T1" onclick="T1()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210105193943.36a822a9e7936c7941fb7875aa40d734.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr02" colspan="2" scope="cols">티원</th>
											</tr>
											<tr>
												<th class="teamname02" colspan="2" scope="cols">T1</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td>최성훈 Polt / 김지환 moment,배성웅 Bengi / 이상혁 Faker </td>
											</tr>
											<tr>
												<th scope="row">팀 스타일</th>
												<td>'최종 보스' 페이커를 중심으로한 빠른 판단과 운영</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<div class="t1 justify-center">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_5"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Zeus(최우제)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_5"></span></td>
															</tr>
														</table>


														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_6"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Oner(문현준)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_6"></span></td>
															</tr>
														</table>


														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_7"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Faker(이상혁)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_7"></span></td>
															</tr>
														</table>


														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_8"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Gumayusi(이민형)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_8"></span></td>
															</tr>
														</table>


														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_9"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Keira(류민석)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_9"></span></td>
															</tr>
														</table>

													</div> <!-- 소환사정보 end -->
												</td>
											</tr>
										</tbody>
										<!--  DWG -->
									</table>


									<!-- t1 end -->


									<!-- Gen.g  -->
									<table class="gg type03">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="Gen.G">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210521225424.62c6b33257bd538564ef9baf3e9a6c01.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr03" colspan="2" scope="cols">젠지</th>
											</tr>
											<tr>
												<th class="teamname03" colspan="2" scope="cols">Gen.G</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td>고동빈 Score / 원상연 Mafa,김무성 Museong / 박재혁 Ruler</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td>선발전 혹은 가을의 젠지 / 안정적인 운영을 위주로 한 후반 바텀 캐리</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<div class="gg">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_10"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Doran(최현준)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_10"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_11"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Peanut(한왕호)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_11"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_12"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Chovy(정지훈)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_12"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_13"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Ruler(박재혁)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_13"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_14"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Lehends(손시후)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_14"></span></td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</tbody>
										<!--  Gen.g -->
									</table>


									<!--  광동 프릭스 -->
									<table class="af type04">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="아프리카 프릭스"
														onclick="AF()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20220105005450.ec73703cc391fcd13de53ebd230130b1.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr04" colspan="2" scope="cols">광동
													프릭스</th>
											</tr>
											<tr>
												<th class="teamname04" colspan="2" scope="cols">Kwangdong
													Freecs</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td>장누리 Cain / 이다윤 Spirit, 최병철 Alvingo / 박진성 Teddy</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td>중위권 수문장 역할 / 탑이 강하다는 강점과 원딜의 보장된 후반 캐리력</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<div class="af">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_15"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Kiin(김기인)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_15"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_16"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Ellim(최엘림)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_16"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_17"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Fate(유수혁)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_17"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_18"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Teddy(박진성)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_18"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_19"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Hoit(류호성)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_19"></span></td>
															</tr>
														</table>
													</div>

												</td>
											</tr>
										</tbody>
										<!--  광동 -->
									</table>


									<!-- LSB 리브샌드박 -->
									<table class="lsb type05">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="리브 샌드박스"
														onclick="ls()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210125155258.f75f3b84fbacea286ec36fe9dcd408b7.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr05" colspan="2" scope="cols">리브
													샌드박스</th>
											</tr>
											<tr>
												<th class="teamname05" colspan="2" scope="cols">Liiv
													SANDBOX</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td>김목경 Micro / 조재읍 Joker,강태수 Travel,허원석 PawN / 김재연 Dove</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td>교전 지향 주의/ 지루하다고 평가받던 LCK에서 '낭만'이라는 평가를 받고있음.</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<!-- LSB 리브샌드박 -->
													<div class="lsb">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_20"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Dove(김재연)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_20"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_21"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Croco(김동범)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_21"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_22"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Clozer(이주현)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_22"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_23"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Envyy(이명준)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_23"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_24"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Kael(김진홍)</span></th>
															</tr>
															<tr>
																<td><span class="summoner-name"
																	id="current_summoner_name_24"></span></td>
															</tr>
														</table>
													</div>

												</td>
											</tr>
										</tbody>
									</table>
									<!--  리브샌박 -->

									<!-- DRX 디알액 -->
									<table class="drx type06">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="DRX"
														onclick="drx()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20200701202557.ac8aea4e0ccc1587f10bd42a4aaf21f1.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr06" colspan="2" scope="cols">디알엑스</th>
											</tr>
											<tr>
												<th class="teamname06" colspan="2" scope="cols">DRX</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td class="reversecol">김정수 KIM / 이재하 Mowgli,신동욱 Shine / 김혁규 Deft</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td class="reversecol">아직 입증된건 없지만 네임벨류 확실한 선수들의 영입으로 기대해볼만한 팀</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<!-- DRX -->
													<div class="drx">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_25"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Kingen(황성훈)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_25"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_26"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Pyosik(홍창현)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_26"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_27"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Zeka(김건우)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_27"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_28"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Deft(김혁규)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_28"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_29"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 BeryL(조건희)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_29"></span></td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</tbody>
										<!--  DRX -->
									</table>


									<!-- KT -->
									<table class="kt type07">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="KT 롤스터"
														onclick="kt()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210917173743.fd0fc23506d71d130aec738d64acb61a.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr07" colspan="2" scope="cols">KT
													롤스터</th>
											</tr>
											<tr>
												<th class="teamname07" colspan="2" scope="cols">KT</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td class="reversecol">강동훈 Hirai / 최천주 Acorn ,최승민 supreme</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td class="reversecol">대대적인 팀 개편</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<!-- KT -->
													<div class="kt">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_30"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Rascal(김광희)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_30"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_31"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Cuzz(문우찬)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_31"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_32"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Aria(이가을)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_32"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_33"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Aiming(김하람)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_33"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_34"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Life(김정민)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_34"></span></td>
															</tr>
														</table>
													</div>

												</td>
											</tr>
										</tbody>
										<!--  KT -->
									</table>


									<!-- Fredit BRION -->
									<table class="bro type08">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="프레딧 브리온"
														onclick="bro()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210104130506.426a6d4028e24f5a73c7b97b390c0f1e.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr08" colspan="2" scope="cols">프레딧
													브리온</th>
											</tr>
											<tr>
												<th class="teamname08" colspan="2" scope="cols">Fredit
													BRION</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td class="reversecol">최우범 Edgar / 이승후 Drinker / 엄성현 UmTi</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td class="reversecol">약체로 평가받지만 상위권팀들을 잡는 자이언트킬링을 보여줌</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<!-- Fredit BRION -->
													<div class="bro">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_35"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Morgan(박기태)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_35"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_36"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Umti(엄성현)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_36"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_37"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Lava(김태훈)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_37"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_38"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Hena(박증환)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_38"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_39"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Delight(유환중)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_39"></span></td>
															</tr>
														</table>
													</div>


												</td>
											</tr>
										</tbody>
										<!--  BRO -->
									</table>

									<!-- Hanwha Life Esports -->
									<table class="hle type09">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="한화생명 e스포츠"
														onclick="hle()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210522024124.83e1ffc604320a821d36baec8e8bb657.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr09" colspan="2" scope="cols">한화생명
													e스포츠</th>
											</tr>
											<tr>
												<th class="teamname09" colspan="2" scope="cols">Hanwha
													Life Esports</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td class="reversecol">손대영 Kezman / 김성진 Sudal,김현식 Bibra / 김장겸 OnFleek</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td class="reversecol"> - </td> 
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<!-- Hanwha Life Esports -->
													<div class="hle">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_40"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 DuDu(이동주)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_40"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_41"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Willer(김정현)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_41"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_42"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Karis(김홍조)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_42"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_43"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 SamD(이재훈)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_43"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_44"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Vsta(오효성)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_44"></span></td>
															</tr>
														</table>
													</div>

												</td>
											</tr>
										</tbody>
										<!--  HLE -->
									</table>


									<!-- Nongsim -->
									<table class="ns type10">
										<thead>
											<tr>
												<th colspan="2" scope="cols">
													<div class="tooltip-link" data-tooltip="농심 레드포스"
														onclick="ns()">
														<img class="teamlogo"
															src="https://attach.s.op.gg/teamLogo/20210522034233.f1c4a90e7b22ce50780f27568890a7d0.png">
													</div>
												</th>
											</tr>
											<tr>
												<th class="teamnamekr10" colspan="2" scope="cols">농심
													레드포스</th>
											</tr>
											<tr>
												<th class="teamname10" colspan="2" scope="cols">NongShim
													REDFORCE</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">감독/코치/주장</th>
												<td class="reversecol">배지훈 sBs / 채도준 Noblesse, 임혜성 Comet / 장용준 Ghost</td>
											</tr>
											<tr>
												<th scope="row">팀스타일</th>
												<td class="reversecol">넓은 챔프폭, 전체적으로 좋은 라인밸런스</td>
											</tr>
											<tr>
												<th scope="row">선수명단</th>
												<td>
													<!-- Nongsim -->
													<div class="ns">
														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_45"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>탑 Canna(김창동)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_45"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_46"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>정글 Dread(이진혁)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_46"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_47"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>미드 Bdd(곽보성)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_47"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_48"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>원딜 Ghost(장용준)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_48"></span></td>
															</tr>
														</table>

														<table class="user-repr-info">
															<tr class="profile-icon-wrapper">
																<th rowspan="3"><img class="profileImgid"
																	id="current_summoner_profile_icon_img_49"
																	src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
																</th>
																<th><span>서폿 Effort(이상호)</span></th>
															</tr>
															<tr>
																<td class="reversecol"><span class="summoner-name"
																	id="current_summoner_name_49"></span></td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</tbody>
										<!--  NS -->
									</table>


								</div>
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

			<!-- Bootstrap core JavaScript-->
			<script src="resources/vendor/jquery/jquery.min.js"></script>
			<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="resources/js/sb-admin-2.min.js"></script>



			<script type="text/javascript">
				$(document).ready(function() {
					dwg();
				})

				function dwg() {
					$('.DWG').show();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function geng() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').show();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function T1() {
					$('.DWG').hide();
					$('.t1').show();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function AF() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').show();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function ns() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').show();
				}
				function ls() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').show();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function bro() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').show();
					$('.hle').hide();
					$('.ns').hide();
				}
				function drx() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').show();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function kt() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').show();
					$('.bro').hide();
					$('.hle').hide();
					$('.ns').hide();
				}
				function hle() {
					$('.DWG').hide();
					$('.t1').hide();
					$('.gg').hide();
					$('.af').hide();
					$('.lsb').hide();
					$('.drx').hide();
					$('.kt').hide();
					$('.bro').hide();
					$('.hle').show();
					$('.ns').hide();
				}
			</script>
</body>

</html>