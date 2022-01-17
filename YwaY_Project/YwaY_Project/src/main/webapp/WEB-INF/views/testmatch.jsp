<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="resources/css/style.css?version=4">
<link rel="stylesheet" href="resources/css/clear.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700&display=swap"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--  <script src="resources/lib/home.js?version=17"></script> -->
<script src="resources/lib/home.js?version=92"></script>
<script src="resources/lib/jquery.ajax-cross-origin.min.js?version=1"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>전적검색을 해볼까요?</title>
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="resources/css/reset.css">
<!-- 모달 css  -->
<style>
button {
	background-color: #F9B514;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
}
span{
	color:#fff;
}
body {
	line-height: 0.9;
}
a {
    color: #fff;
    text-decoration: none;
    background-color: transparent;
}

</style>



</head>

<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="YwaY">
				<div class="sidebar-brand-text mx-3">
					YwaY<sup>tm</sup>
				</div>

			</a>
			<div class="collapse navbar-collapse" id="navbarColor02">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active"
						href="testmatch">전적검색 </a></li>
					<li class="nav-item"><a class="nav-link" href="champ">챔피언
							분석</a></li>
					<li class="nav-item"><a class="nav-link" href="multisearch">멀티서치</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="TeamList">팀명단</a></li>
					<li class="nav-item"><a class="nav-link" href="SkincupHome">일러스트스킨컵</a></li>
				</ul>
				<div class="searcher">
					<input id="search_summoner_input" placeholder="소환사명을 입력하세요..">
				</div>
			</div>
		</div>
	</nav>


	<!-- 소환사정보 -->
	<div class="user-repr-info text-light" style="height: 250px;">
		<div class="profile-icon-wrapper" style="width: 200px; height: 200px;">
			<img id="current_summoner_profile_icon_img"
				src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/0.png">
			<span class="summoner-level" id="current_summoner_level">-</span>
		</div>
		<div class="user-repr-info-wrapper">
			<span class="summoner-name" id="current_summoner_name"
				style="font-size: 50px">SummonerName</span>
			<div class="info-detail-wrapper" id="tier_info_detail_wrapper"></div>
		</div>
		<div class="wrap" onclick="ingame()">
			<button style="grid-column: 3;" id="current_game_info_tab">
				<span>현재 게임 정보</span>
			</button>
		</div>
		<div class="wrap" onclick="remaster()">
			<button style="grid-column: 3;" class="openBtn">
				<span>최근 전적 보기</span>
			</button>
		</div>

	</div>


	<!-- Content Row -->
	<div class="row" id="remaster">

		<!-- 숙련도 -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">숙련도</h6>

				</div>
				<!-- Card Body -->
				<div class="card-body text-light" id="champion_mastery_list">
					<div class="total-mastery">
						<span id="total_mastery_label">숙련도 총합</span> <span
							id="total_mastery">- 점</span>
					</div>
					<!-- 숙련도 들어가는 부분-->

				</div>

			</div>
		</div>

		<!-- 최근전적 -->
		<div class="col-xl-8 col-lg-6">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">최근 전적</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body text-light">
					<!-- 최근전적 들어가는 부분-->
					<div class="game-history-list" id="game_history_list_container">
						<div class="game-history-item-wrapper summoners-rift folded"
							id="game_history_item_wrapper">
							<div class="recent-game-info main-info-tab"
								id="recent_game_info_container">
								<div class="game-history-summary-container"
									id="game_history_summary_container">
									<div class="recent-game-summary-chart-wrapper">
										<canvas class="win-rate-pie-chart" id="win_rate_pie_chart"></canvas>
										<div id="win_rate_chart_desc">
											<span id="user_win_num"></span> <span id="user_lose_num"></span>
										</div>
										<span id="win_rate_chart_percentage"></span>
									</div>
								</div>
								<div class="game-history-item lose-type" id="game_history_item">
									<div class="item-wrapper">
										<div class="item-detail-1">
											<span class="map-type">Example</span> <span
												class="win-or-lose">패배</span> <span class="timelapse">5분
												전</span>
										</div>
										<div class="item-detail-2">
											<div class="champ-wrapper">
												<div class="upper-div">
													<div class="main-champion-illust-wrapper">
														<div class="last-champion-level">23</div>
													</div>
												</div>
												<div class="spell-wrapper">
													<div class="mid-container">
														<div class="spell-img"></div>
														<div class="spell-img"></div>
													</div>
												</div>
												<div class="spell-wrapper">
													<div class="mid-container">
														<div class="rune-img"></div>
														<div class="rune-img"></div>
													</div>
												</div>
												<div class="champion-name">
													<span>아트록스</span>
												</div>
											</div>
										</div>
										<div class="item-detail-3">
											<div class="KDA-wrapper">
												<div class="KDA-score">-4.00</div>
												<div class="KDA">
													<span class="kill">5</span> <span class="slash">/</span> <span
														class="death">2</span> <span class="slash">/</span> <span
														class="assist">3</span>
												</div>
											</div>
										</div>
										<div class="item-detail-5">
											<div class="gold-wrapper">
												<span>12,543 G</span>
											</div>
											<div class="cc-wrapper">
												<span>CC</span> <span>25s</span>
											</div>
											<div class="cs-wrapper">
												<span>CS</span> <span class="total-cs">63</span><span
													class="average-cs">(2.5)</span>
											</div>
										</div>
										<div class="item-detail-4">
											<div class="item-wrapper">
												<div class="item-item"></div>
												<div class="item-item"></div>
												<div class="item-item"></div>
												<div class="item-item"></div>
												<div class="item-item"></div>
												<div class="item-item"></div>
												<div class="item-item"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="game-history-item-description-tab"
									id="game_history_item_desc">
									<div class="item-detail-menu-list-tab">
										<div class="detail-menu-list-tab general-info focused"
											style="grid-column: 1;" id="general_match_info_tab">
											<span>일반 정보</span>
										</div>
										<div class="detail-menu-list-tab deal-amount-info unfocused"
											style="grid-column: 2;" id="deal_amount_info_tab">
											<span>딜량 확인</span>
										</div>
									</div>
									<div class="item-detail-desc-content-wrapper">
										<div class="item-detail-desc-content">
											<div class="team-desc-label-wrapper win">
												<span class="team-desc-win-or-lose">승리</span> <span
													class="team-label">블루 팀</span>
											</div>
											<div class="participant-info-container win">
												<div class="participant-info">
													<div class="participant-detail-info-1">
														<div class="participant-champion-img"></div>
													</div>
													<div class="participant-detail-info-2">
														<div class="participant-summoner-spell-wrapper">
															<div class="participant-spell"></div>
															<div class="participant-spell"></div>
														</div>
														<div class="participant-summoner-perk-wrapper">
															<div class="participant-perk"></div>
															<div class="participant-perk"></div>
														</div>
													</div>
													<div class="participant-detail-info-3">
														<div class="participant-info-wrapper">
															<span class="participant-username">딜 몬</span> <span
																class="participant-tier-level">그랜드마스터 IV</span>
														</div>
													</div>
													<div class="participant-detail-info-4">
														<div class="participant-kda-wrapper">
															<span class="participant-kda-score">2.52</span> <span
																class="participant-kda"> <span class="kill">5</span>
																<span class="slash">/</span> <span class="death">2</span>
																<span class="slash">/</span> <span class="assist">3</span>
															</span>
														</div>
													</div>
													<div
														class="participant-detail-info-5 pulled-deal-container">
														<div class="participant-cs-wrapper">
															<span class="participant-gold">612,563 G</span> <span
																class="participant-cs">CS 325(15.6)</span>
														</div>
													</div>
													<div
														class="participant-detail-info-6 pulled-deal-container">
														<div class="participant-item-wrapper">
															<div class="participant-item"></div>
															<div class="participant-item"></div>
															<div class="participant-item"></div>
															<div class="participant-item"></div>
															<div class="participant-item"></div>
															<div class="participant-item"></div>
															<div class="participant-item"></div>
														</div>
													</div>
													<div
														class="participant-detail-info-7 pushed-deal-container">
														<div class="deal-amount-wrapper">
															<span class="total-dealt-amount">-</span> ( <span
																class="physical-dealt-amount">-</span> / <span
																class="magical-dealt-amount">-</span> / <span
																class="true-dealt-amount">-</span> )
														</div>
														<div class="max-dealt-bar"></div>
													</div>
												</div>
											</div>
											<div class="team-desc-label-wrapper lose">
												<span class="team-desc-win-or-lose">패배</span> <span
													class="team-label">레드 팀</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<!-- 인게임 -->
		<div id="ingame">
			<div class="bg"></div>
			<div class="modalBox">
				<div class="col-xl-8 col-lg-6">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						
						<div class="current-game-info main-info-tab text-light"
							id="current_game_info_container">
							<!-- current game doesn't exist -->
							<div class="not-playing-now-msg-container"
								id="not_playing_now_container">
								<span class="not-playing-title">해당 플레이어는<br>현재 게임 중이
									아닙니다.
								</span>
							</div>
							<div class="current-game-content-wrapper"
								id="current_game_info_content_wrapper">
								<div class="current-game-content">
									<div class="current-game-map-type">칼바람 나락</div> <span
										class="current-game-elapsed-time"
										id="current_game_elapsed_time">17분 33초</span>
									<div class="current-game-participant-info-container">
										<div class="current-team-info-container blue-team">
											<div class="team-info-label">
												<span>블루 팀</span>
											</div>
											<div class="team-info-container"></div>
										</div>
										<div class="current-team-info-container red-team">
											<div class="team-info-label">
												<span>레드 팀</span>
											</div>
											<div class="team-info-container"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	

	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	
	<!— Bootstrap core JavaScript—>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!— Core plugin JavaScript—>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!— Custom scripts for all pages—>
	<script src="resources/js/sb-admin-2.min.js"></script>
	
			<script type="text/javascript">
				$(document).ready(function() {
					remaster();
				})

				function ingame() {
					$('#ingame').show();
					$('#remaster').hide();
				}
				function remaster() {
					$('#ingame').hide();
					$('#remaster').show();
				}
			</script>






</body>
</html>