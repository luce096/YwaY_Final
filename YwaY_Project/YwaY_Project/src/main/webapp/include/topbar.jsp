<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.topbarvideo {
   object-fit: cover;
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
}
.video-wrapper1 {
   width: 100%;
   position: relative;
   display: flex;
}
.btn-primary {
   z-index:1;
}
</style>
</head>
<body>
   <div id="wrapper">
      <!-- Topbar -->
      <nav
         class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow video-wrapper1">
         <video autoplay loop
            
            class="topbarvideo" muted="muted">
            <source id="mp4" src="resources/videos/space.mp4" type="video/mp4">

         </video>
         <!-- Sidebar Toggle (Topbar) -->
         <button id="sidebarToggleTop"
            class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
         </button>

         <!-- Topbar Search -->
         <form
            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
               <input type="text" class="form-control bg-light border-0 small"
                  placeholder="SummonerName..." aria-label="Search"
                  aria-describedby="basic-addon2">
               <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                     <i class="fas fa-search fa-sm"></i>
                  </button>
               </div>
            </div>
         </form>

         <!-- Topbar Navbar -->
         <c:if test="${empty memberid}">
            <button class="btn btn-primary" onclick="location='loginfrm'">로그인</button>
         </c:if>

         <!-- 로그인 된 경우 -->
         <c:if test="${!empty memberid}">
            <ul class="navbar-nav ml-auto">


               <!-- Nav Item - User Information -->
               <li class="nav-item dropdown no-arrow"><a
                  class="nav-link dropdown-toggle" href="#" id="userDropdown"
                  role="button" data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="false"> <span
                     class="mr-2 d-none d-lg-inline text-gray-600 small">${mb.memberid}
                  </span> <img class="img-profile rounded-circle"
                     src="resources/champion_img/Aatrox.png">
               </a> <!-- Dropdown - User Information -->
                  <div
                     class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="userDropdown">
                     <a class="dropdown-item" href="mypage"> <i
                        class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내정보보기
                        <div class="dropdown-divider"></div> <a class="dropdown-item"
                        href="mModify"> <i
                           class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내정보수정
                           <div class="dropdown-divider"></div> <a class="dropdown-item"
                           href="#" data-toggle="modal" data-target="#logoutModal"> <i
                              class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                              로그아웃
                        </a>
                  </div></li>

            </ul>
         </c:if>
      </nav>
      <!--   End of Topbar -->

   </div>

</body>
</html>