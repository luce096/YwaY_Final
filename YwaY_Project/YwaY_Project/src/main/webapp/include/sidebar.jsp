<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
video {
  object-fit: cover;
  position: absolute;
  top: 0;
  height: 100%;
}
.video-wrapper {
  
  width: 100%;
  position: relative;
  overflow: hidden;
  text-align: center;
  display: flex;

  
}

</style>

</head>
<body>
 <div id="wrapper"> 
 <div class="video-wrapper">
            <video autoplay loop poster="http://media.w3.org/2010/05/sintel/poster.png" muted="muted">
                <source id="mp4" src="resources/videos/space.mp4" type="video/mp4">
            </video>
            
            
	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="YwaY">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">
				YwaY<sup>tm</sup>
			</div> <!-- <img src="upload/champion_image/Garen.png"> -->

		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">


		<li class="nav-item active"><a class="nav-link" href="testmatch">
				<i class="fas fa-chalkboard-teacher"></i><span>전적검색</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="champ">
				<i class="fas fa-chalkboard-teacher"></i><span>챔피언 분석</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link"
			href="multisearch"> <i class="fas fa-align-left"></i> <span>멀티서치</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">


		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="TeamList">
				<i class="fas fa-gamepad"></i> <span>팀명단</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">


		<li class="nav-item"><a class="nav-link" href="SkincupHome">
				<i class="fas fa-chalkboard-teacher"></i><span>챔피언 일러스트 스킨컵</span>
		</a></li>


		${userblacklist}

		<!— Divider —>
		<hr class="sidebar-divider d-none d-md-block">

		<!— Sidebar Toggler (Sidebar) —>
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!— End of Sidebar —>
	</div>
</div>

</body>
</html>