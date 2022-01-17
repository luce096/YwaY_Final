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
Document doc3 = Jsoup.connect("https://www.leagueoflegends.com/ko-kr/news/tags/teamfight-tactics-patch-notes/").get();
Elements posts3 = doc3.body().getElementsByClass("style__WrapperInner-sc-106zuld-1");
Elements file3 = posts3.select(".style__Item-sc-106zuld-3");
%>
<html>
<head>

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
<!--    <link rel="stylesheet" href="resources/css/lezhin.css"> -->
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="resources/css/lezhin.css"> -->

<style>
a {
	color:#000;
}      
.patch a{
   color:#fff;
   font-weight: bolder;
}
.patch a:hover{
   color:#fff;
}
.lane_menu {
   display: flex;
   list-style: none;
   padding-left: 0;
}

.lane_menu li {
   padding: 3;
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

               <!-- Page Heading -->
               <div
                  class="d-sm-flex align-items-center justify-content-center mb-4">
                  <h1 class="h3 mb-0 text-gray-800">YwaY</h1>
               </div>


               <!-- Content Row -->
               <div class="row">

                  <!-- Earnings (Monthly) Card Example -->
                  <div class="col-xl-6 col-md-6 mb-4">
                     <!-- Illustrations -->
                     <div class="card mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary">패치노트</h6>
                        </div>
                        <!-- <div class="card-body" style="background-image: url('resources/img/patch/lol.png'); background-size: 100% 100%; "> -->
                        <div class="card-body" style="background-image: url('https://www.leagueoflegends.com/static/open-graph-2e582ae9fae8b0b396ca46ff21fd47a8.jpg'); background-size: 100% 100%; ">
                           <!-- https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt2161d99d433ee6fd/6189caf9cc735f786653bb6e/patch-10-24-banner.jpg -->
                           <div class="patch">
                              <%
                              for (Element e : file) {
                                 out.println("<a href = '");
                                 out.println("https://www.leagueoflegends.com/" + e.select(".style__Wrapper-sc-1h41bzo-0").attr("href"));
                                 out.println("' target='_blank'>");
                                 out.println(e.select(".style__Title-sc-1h41bzo-8").text());
                                 out.println("<br>");
                                 out.println("</a>");
                              }
                              %>
                              
                           </div>
                        
                        </div>
                        
                     <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary">TFT 패치노트</h6>
                        </div>
                        <!-- <div class="card-body" style="background-image: url('resources/img/patch/tft.png'); background-size: 100% 100%; "> -->
                        <div class="card-body" style="background-image: url('data:image/jpeg;base64,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'); background-size: 100% 100%; ">
                        <!-- https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltddc975cfd9c14f32/61721bab90079752a47e8cdc/Key_Art_Banner.jpg -->
                           
                           <div class="patch">
                              <%
                              for (Element e : file3) {
                                 out.println("<a href = '");
                                 //out.println(e.select(".style__Wrapper-sc-1h41bzo-0").attr("href").length());
                                 if(e.select(".style__Wrapper-sc-1h41bzo-0").attr("href").length() < 30){
                                    out.println(e.select(".style__Wrapper-sc-1h41bzo-0").attr("href"));   
                                 }else{
                                    out.println("https://www.leagueoflegends.com/" + e.select(".style__Wrapper-sc-1h41bzo-0").attr("href"));
                                 }
                                 out.println("' target='_blank'>");
                                 out.println(e.select(".style__Title-sc-1h41bzo-8").text());
                                 out.println("<br>");
                                 out.println("</a>");
                              }
                              %>
                           </div>
                        </div>
                     </div>
                     
                  </div>
                  
                  <!-- Earnings (Monthly) Card Example -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <!-- Illustrations -->
                     <div class="card mb-4 ">
                        <div class="card-header py-3 ">
                           <h6 class="m-0 font-weight-bold text-primary">픽률 순위</h6>
                        </div>
                        <div class="card-body">
                           <ul class="lane_menu">
                              <li><a class="collapse-item"
                                 href="javascript:Aj('top_home','#picklist')" id="click">탑</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('jungle_home','#picklist')" id="click">정글</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('mid_home','#picklist')" id="click">미드</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('bot_home','#picklist')" id="click">원딜</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('sup_home','#picklist')" id="click">서폿</a></li>
                           </ul>
                           <div class="text-center" id="picklist"></div>
                        </div>
                     </div>
                  </div>


                  <!-- Earnings (Monthly) Card Example -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <!-- Illustrations -->
                     <div class="card mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary">밴률 순위</h6>
                        </div>
                        <div class="card-body">
                           <ul class="lane_menu">
                              <li><a class="collapse-item"
                                 href="javascript:Aj('top_ban','#banlist')" id="click">탑</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('jungle_ban','#banlist')" id="click">정글</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('mid_ban','#banlist')" id="click">미드</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('bot_ban','#banlist')" id="click">원딜</a></li>
                              <li><a class="collapse-item"
                                 href="javascript:Aj('sup_ban','#banlist')" id="click">서폿</a></li>
                           </ul>
                           <div class="text-center" id="banlist"></div>
                        </div>
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

   <!-- Page level plugins -->
   <script src="resources/vendor/chart.js/Chart.min.js"></script>

   <!-- Page level custom scripts -->
   <!-- <script src="resources/js/demo/chart-area-demo.js"></script>
   <script src="resources/js/demo/chart-pie-demo.js"></script> -->
   <script type="text/javascript">
   let severData;
      
   function Aj(url, position){
      $.ajax({
         url : url,
         type : 'get',
         dataType : 'html' //json
      }).done((data)=>{console.log(data);$(position).html(data);slideShow();preLoaingImg();start();})
      .fail((err)=>console.log(err))
   } //Aj End
   </script>
   <script type="text/javascript">
       var index = 0;   //이미지에 접근하는 인덱스
       window.onload = function(){
           slideShow();
       }
       function slideShow() {
       var i;
       var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
       for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
       }
       index++;
       if (index > x.length) {
           index = 1;  //인덱스가 초과되면 1로 변경
       }   
       x[index-1].style.display = "block";  //해당 인덱스는 block으로
       setTimeout(slideShow, 4000);   //함수를 4초마다 호출
      }
       
      $(document).ready(function(){
         Aj('top_ban','#banlist')
         Aj('top_home','#picklist');
         
         
      })
   </script>
   
   
</body>

</html>