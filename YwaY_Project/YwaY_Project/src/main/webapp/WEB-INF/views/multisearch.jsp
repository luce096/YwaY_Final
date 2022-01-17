<!DOCTYPE html>
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css?version=3">
<link rel="stylesheet" href="resources/css/clear.css">
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700&display=swap"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/lib/chart.js"></script>
<script src="resources/lib/jquery-ui.js"></script>

<script src="resources/lib/home.js?version=23"></script>
<!--  <script src ="resources/js/lol_project.js?version=16"></script> -->
<script src="resources/lib/jquery.ajax-cross-origin.min.js?version=1"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>멀티서치</title>
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="resources/css/lezhin.css"> -->
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">


<style>
textarea {
   width: 100%;
   height: 120px;
   padding: 12px;
   border: 0;
   box-sizing: border-box;
   background: #f7f7f9;
   resize: none;
   font-size: 12px;
   font-weight: normal;
   font-stretch: normal;
   font-style: normal;
   line-height: 1.33;
   letter-spacing: normal;
}

.ex1 {
   weight: 350px;
   height: 250px;
}

.ex2 {
   weight: 350px;
   height: 250px;
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
         <div id="content"
            style="background-image: 'resources/img/slide1.jpg'">

            <!-- topbar -->
            <jsp:include page="/include/topbar.jsp" />

            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <div id="multi-search-layout">


                  <div class="form-group">
                     <textarea class="form-control" rows="5" name="bdContent"
                        id="multi-search-input"
                        placeholder="빛준범님이 방에 참여했습니다.
작지만큰하늘님이 방에 참여했습니다.
김금민님이 방에 참여했습니다.
z관우님이 방에 참여했습니다.
혼자공부하는자바님이 방에 참여했습니다."
                        required></textarea>
                     <div id="search" onclick="searchbutton()">
                        <button class="btn btn-lg btn-primary" type="button"
                           id="searchbutton">채팅방 복사로 챔피언 검색하기</button>
                     </div>
                  </div>



                  <div id="detail-info">
                     <div class="card text-white bg-info mb-3"
                        style="max-width: 100rem;">
                        <div class="card-header" style="color: gray;">멀티서치</div>
                        <div class="card-body">
                           <h4 class="card-title">채팅창의 내용을 붙여 넣으면, 게임에 참여중인 모든 유저를
                              요약하여 볼 수 있습니다!</h4>
                           <p class="card-text">여러명의 소환사 이름으로 요약 검색</p>
                        </div>
                     </div>


                  </div>
                  <!-- 멀티서치 결과창 나오는 div -->
                  <div class="row" id="multi-example">
                     <img src="resources/img/multisearch1.png" class="ex1" /> <img
                        src="resources/img/multisearch2.png" class="ex2" />
                  </div>

               </div>
               <div class="row" id="multi-detail-info-data"></div>
               <!-- 멀티서치 결과창 나오는 div -->



            </div>
         </div>
         <!-- /.container-fluid -->
   <jsp:include page="/include/footer.jsp" />
      </div>
      <!-- End of Main Content -->


      <!--footer  -->
   

   </div>
   <!-- End of Content Wrapper -->

   
   
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



   <!-- Page level custom scripts -->
   <!-- <script src="resources/js/demo/chart-area-demo.js"></script>
   <script src="resources/js/demo/chart-pie-demo.js"></script> -->
      
   <script type="text/javascript">
       
       function searchbutton() {   
          $('.ex1').hide();
          $('.ex2').hide();
       }
       
   </script>
</body>
</html>