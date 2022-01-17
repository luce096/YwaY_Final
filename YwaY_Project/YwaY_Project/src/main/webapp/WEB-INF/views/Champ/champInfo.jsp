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

<title>ChampInfo</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">

<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.text-primary2{
	color:#4400B8;
}
b {
   color:#AA81F1;
   font-size:10px;
}

/*챔피언팁 */
.l-container {
   position: relative;
   min-height: 500px;
   padding-bottom: 120px;
}
.l-champion-statistics-header {
   position: relative;
   overflow: hidden;
   color: #000;
}
.l-champion-statistics-header:after {
   visibility: hidden;
   display: block;
   font-size: 0;
   content: "";
   clear: both;
   height: 0;
}

.champion-stats-position {
   margin-top: 30px;
   
}

ul {
   list-style: none;
   margin: 0;
   padding: 0;
   display: block;
   /*margin-block-start: 1em;*/
   margin-block-end: 1em;
   margin-inline-start: 0px;
   margin-inline-end: 0px;
   padding-inline-start: 10px;
}

.champion-stats-header__position:first-child {
   margin-left: 0;
}

.champion-stats-header__position--active {
   background: #4400B8;
   color: #fff;
}

.champion-stats-header__position {
   display: inline-block;
   min-width: 200px;
   border-radius: 2px;
}

.champion-stats-header__position--active .champion-stats-header__position__image--active
   {
   display: inline-block;
}

.champion-stats-header__position__image {
   float: left;
   height: 24px;
}

.champion-stats-header__position a {
   display: block;
   padding: 8px 20px 8px 16px;
   text-decoration: none;
   line-height: 24px;
}

img {
   border: 0;
}
a {
   color: inherit;
}

li {
   list-style: none;
   margin: 0;
   padding: 0;
   text-align: -webkit-match-parent;
}

.champion-stats-header-info {
   float: left;
   margin-top: 30px;
   margin-bottom: 24px;
   width: 630px;
}
h1 {
   margin: 0;
   display: block;
   margin-block-start: 0.67em;
   margin-block-end: 0.67em;
   margin-inline-start: 0px;
   margin-inline-end: 0px;
}

.champion-stats-header-info__skill {
   margin-top: 10px;
}

.champion-stats-header-info__image {
   position: relative;
   /*float: left;*/
   margin-right: 20px;
}
/*스킬 이미지 크기*/
.champion-stat__skill {
   position: relative;
   float: left;
   border: 1px solid #000;
   border-radius: 2px;
   margin-left: 8px;
   width: 40px;
   height: 40px;
   overflow: hidden;
}
/*스킬 이미지 크기 조절*/
.champion-stat__skill img {
   display: block;
   width: 100%;
}
/*스킬 이미지에 문자 추가*/
.champion-stat__skill .key {
   position: absolute;
   right: 0;
   bottom: 0;
   line-height: 14px;
   font-size: 12px;
   letter-spacing: -0.5px;
   padding: 3px 4px 3px 5px;
   background: #000;
   background: rgba(0, 0, 0, 0.5);
   border-radius: 1px;
   color: #fff;
}
/* 
챔피언 분석 카테고리 */
.l-champion-statistics-menu {
   background: #fff;
   border-bottom: 1px solid #dcdcdc;
}

.champion-stats-menu {
   width: 1080px;
   margin: 0 auto;
}

.champion-stats-menu__list__item {
   float: left;
}

.champion-stats-menu__list__item.active a {
   color: #3c8eec;
   border-bottom-color: #3c8eec;
   font-weight: bold;
}

.champion-stats-menu__list__item a {
   display: block;
   border-bottom: 2px solid transparent;
   padding: 14px 20px 15px;
   line-height: 19px;
   font-size: 15px;
   color: #777;
   text-decoration: none;
}

/*스킬 영상 CSS 시작 */
.modal1, .modal2, .modal3, .modal4, .modal5 {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
}
/*스킬 아이콘 클릭시 영상 modalBox 뒷배경 명암*/
.bg1, .bg2, .bg3, .bg4, .bg5 {
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.6);
}
/*ox 숨김*/
.hidden {
   display: none;
}
/*스킬 영상 CSS 끝 */

.tooltip-inner {
   width: 800px;
   font-size: 10px;
   text-align: left;
}
 .icon {
   display: block;
   width: 100%;
}
.icon span:after {
   content: ""; /*가상클래스 before, after는 무조건 content가 있어야 작동*/
   position: absolute;
   background-color: #000;
   width: auto;
   height: auto;
   bottom: 0;
   left: 0; /*1. 왼쪽에서 50%위치에 둔다.*/
   z-index: 0; /*2. 크기값을 50%만큼 이동시켜준다.->항상 중앙에 위치하게됨*/
}
.icon:hover span {
   opacity: 1;
   /*hover시 발생하ㅡㄴ 이벤트*/
} 
th {
   display: table-cell;
   font-weight: bold;
   text-align: -internal-center;
   height: 40px;
   border-bottom: solid 1px #e6e6e6;
   line-height: 17px;
   font-size: 14px;
   letter-spacing: -0.2px;
   color: #777;
}
td {
   display: table-cell;
   vertical-align: inherit;
   /*padding: 10px 0 10px 20px;*/
}
.champion-box {
   background-color: #f9f9fa;
   border: solid 1px #e6e6e6;
   margin-top: 10px;
}
.champion-box-content {
   background: #fafafa;
   overflow: hidden;
}

table {
   border-collapse: collapse;
   border-spacing: 0;
   display: table;
   box-sizing: border-box;
   text-indent: initial;
   border-color: grey;
}
.champion-stats__table {
   width: 100%;
   table-layout: fixed;
}
.champion-stats__table__header--title {
   width: auto;
   text-align: left;
   font-weight: bold;
   color: #222;
   /*padding-left: 20px;*/
}
/*table header*/
.champion-stats__table__header {
   height: 39px;
   background: #fff;
   border-bottom: 1px solid #e9eff4;
   line-height: 17px;
   font-size: 14px;
   color: #b6b6b6;
   font-weight: normal;
   text-align: center;
   width: 95px;
   background-repeat: no-repeat;
   background-position: right 20px center;
}

/* th {
   display: table-cell;
   vertical-align: inherit;
   font-weight: bold;
   text-align: -internal-center;
} */


/*테이블 padding*/
.champion-stats__table__cell--data {
   padding-left: 30px;
   /*text-align: left;*/
}
/*테이블 크기*/
.champion-stats__table__cell {
   height: 62px;
   background: #f5f5f5;
   /*text-align: center;*/
   font-size: 13px;
   color: #666;
}
.champion-stats__table__cell--pickrate{
   text-align:center;
}
/* element.style {
   border-radius: 50%;
   border: solid 1px #000000;
}
 */
 /*아이템 이미지 크기*/
.champion-stats__single__item img {
   width: 42px;
   height: 42px;
   vertical-align: middle;
   border: 1px solid #000;
   box-sizing: border-box;
   margin-right: 10px;
   border-radius: 2px;
}
/*아이템 폰트*/
.champion-stats__single__item span {
   font-size: 14px;
   color: #666;
}
body {
   line-height: 1.5;
   font-weight: 400;
   font-family: "Spoqa Han Sans Neo";
   -webkit-font-smoothing: antialiased;
   font-size: 14px;
}
.menu-scroll ~main .scroll-anchor, .menu-scroll ~main .scroll-anchor.page-title
   {
   min-height: 44px;
   pointer-events: none;
   min-width: 10px;
   display: block;
   scroll-margin-top: 200px;
   margin-top: 0;
   padding-top: 0;
}
/*룬 이미지 크기*/
.champion-stats__single__rune img {
   width: 40px;
   height: 40px;
   vertical-align: middle;
   box-sizing: border-box;
   margin-right: 10px;
   margin-top: 2px;
   border-radius: 2px;
}
/* <!--챔피언 팁 --> */
#articleView_layer {
   position: fixed;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
}
#articleView_layer.open {
   display: block;
}
#articleView_layer #bg_layer {
   position: absolute;
   top: 0px;
   left: 0px;
   width: 100%;
   height: 100%;
   background: #000;
   opacity: .5;
   z-index: 9999;
}
#contents_layer {
   position: relative;
   width: 800px;
   height: 800px;
   margin: 0px auto;
   padding: 20px;
   border: 2px solid #555;
   background: #fff;
   font-size: 12px;
   z-index: 0;
   color: #767676;
   overflow: scroll
}
.modalBox {
   position: absolute;
   background-color: #888;
   width: 510px;
   height: 350px;
   padding: 5px;
}
.col-xl-6, .col-lg-5, .col-xl-12, .col-lg-5,.col-xl-9, .card {
   position : static;
}

<!-- 챔피언 팁 -->
#articleView_layer {
   position: fixed;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
}
#articleView_layer.open {
   display: block;
}
#articleView_layer #bg_layer {
   position: absolute;
   top: 0px;
   left: 0px;
   width: 100%;
   height: 100%;
   background: #000;
   opacity: .5;
   z-index: 100
}
#contents_layer {
   position: relative;
   width: 700px;
   height: 700px;
   margin: 0px auto;
   padding: 20px;
   border: 2px solid #555;
   background: #fff;
   font-size: 12px;
   z-index: 200;
   color: #767676;
   overflow: scroll
}
<!-- 챔피언 팁 끝 -->

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
                  <!-- 챔피언정보 -->
                  <div class="col-xl-6 col-lg-5">
                     <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary2">챔피언정보</h6>
                        </div>
                        <div class="card-body">
                           <!-- 챔피언정보넣는부분 -->
                           <div class="l-champion-statistics">
                              <div class="l-champion-statistics-header">
                                 <!-- 상단시작 -->
                                 <div>
                                    <ul class="champion-stats-position">
                                       <c:if test="${cp.lane1 != 'Null'  }">
                                          <li
                                             class="champion-stats-header__position champion-stats-header__position--active">
                                             <a
                                             href="champinfo?champ=${cp.name_e}&lane=${cp.lane1}">
                                                <img src="resources/img/lane/${cp.lane1}.png"
                                                data-position="${cp.lane1}"
                                                class="champion-stats-header__position__image champion-stats-header__position__image--active">
                                                <span class="champion-stats-header__position__role">${cp.lane1}</span>
                                          </a></li>
                                       </c:if>
                                       <c:if test="${cp.lane2 != 'Null' }">
                                          <li
                                             class="champion-stats-header__position champion-stats-header__position--active"
                                             data-position="${cp.lane2}"><a
                                             href="champinfo?champ=${cp.name_e}&lane=${cp.lane2}">
                                                <img src="resources/img/lane/${cp.lane2}.png"
                                                data-position="${cp.lane2}"
                                                class="champion-stats-header__position__image champion-stats-header__position__image--active">
                                                <span class="champion-stats-header__position__role">${cp.lane2}
                                             </span>
                                          </a></li>
                                       </c:if>
                                       <c:if test="${cp.lane3 != 'Null' }">
                                          <li
                                             class="champion-stats-header__position champion-stats-header__position--active"
                                             data-position="${cp.lane3}"><a
                                             href="champinfo?champ=${cp.name_e}&lane=${cp.lane3}">
                                                <img src="resources/img/lane/${cp.lane3}.png"
                                                data-position="${cp.lane3}"
                                                class="champion-stats-header__position__image champion-stats-header__position__image--active">
                                                <span class="champion-stats-header__position__role">${cp.lane3}</span>
                                          </a></li>
                                       </c:if>
                                    </ul>
                                    <c:if test="${cp.id < 10}">
                                       <div class="champion-stats-header-info">
                                          <h1 class="champion-stats-header-info__name">
                                          <img src="resources/img/Champion_No/${cp.id}.png"
                                             id="championicon" class="champion-stats-info__image" />${cp.name}
                                             <div class="icon">
                                                <span data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title=" <b> ${cp.p_name} </b> <br>${cp.p_tooltip }">
                                                   <div
                                                      class="champion-stat__skill tip tpd-delegation-uid-1">
                                                      <a class="openBtn1"
                                                         href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_P1.webm"
                                                         class="Image"> <img
                                                         src="resources/img/champion_skill/${cp.p_img}"
                                                         id="championicon" /></a>
                                                      <div class="modal1 hidden">
                                                         <div class="bg1"></div>
                                                         <div class="modalBox">
                                                            <video id="vid" muted="muted" autoplay controls loop
                                                               preload="auto" width="500">
                                                               <source
                                                                  src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_P1.webm"
                                                                  type="video/webm">
                                                            </video>
                                                            <a class="closeBtn"></a>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </span>
                                             </div>
                                             <div class="icon">
                                                <span data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title=" <b> ${cp.q_name} </b> <br>재사용대기시간(초):${cp.q_cool} <br>소모:${cp.q_cost}<br>범위:${cp.q_range}<br>${cp.q_tooltip }">
                                                   <div
                                                      class="champion-stat__skill tip tpd-delegation-uid-1">
                                                      <a class="openBtn2"
                                                         href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_Q1.webm"
                                                         class="Image"> <img
                                                         src="resources/img/champion_skill/${cp.q_img}"
                                                         id="championicon" /><span class="key">Q</span></a>
                                                      <div class="modal2 hidden">
                                                         <div class="bg2"></div>
                                                         <div class="modalBox">
                                                            <video id="vid" muted="muted" autoplay controls loop
                                                               preload="auto" width="500">
                                                               <source
                                                                  src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_Q1.webm"
                                                                  type="video/webm">
                                                            </video>
                                                            <a class="closeBtn1"></a>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </span>
                                             </div>
                                             <div class="icon">
                                                <span data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title=" <b> ${cp.w_name} </b> <br>재사용대기시간(초):${cp.w_cool} <br>소모:${cp.w_cost}<br>범위:${cp.w_range}<br>${cp.w_tooltip }">
                                                   <div
                                                      class="champion-stat__skill tip tpd-delegation-uid-1">
                                                      <a class="openBtn3"
                                                         href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_W1.webm"
                                                         class="Image"> <img
                                                         src="resources/img/champion_skill/${cp.w_img}"
                                                         id="championicon" /><span class="key">W</span></a>
                                                      <div class="modal3 hidden">
                                                         <div class="bg3"></div>
                                                         <div class="modalBox">
                                                            <video id="vid" muted="muted" autoplay controls loop
                                                               preload="auto" width="500">
                                                               <source
                                                                  src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_W1.webm"
                                                                  type="video/webm">
                                                            </video>
                                                            <a class="closeBtn1"></a>
                                                         </div>
                                                      </div>

                                                   </div>
                                                </span>
                                             </div>
                                             <div class="icon">
                                                <span data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title=" <b> ${cp.e_name} </b> <br>재사용대기시간(초):${cp.e_cool} <br>소모:${cp.e_cost}<br>범위:${cp.e_range}<br>${cp.e_tooltip }">
                                                   <div
                                                      class="champion-stat__skill tip tpd-delegation-uid-1">
                                                      <a class="openBtn4"
                                                         href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_E1.webm"
                                                         class="Image"> <img
                                                         src="resources/img/champion_skill/${cp.e_img}"
                                                         id="championicon" /><span class="key">E</span></a>
                                                      <div class="modal4 hidden">
                                                         <div class="bg4"></div>
                                                         <div class="modalBox">
                                                            <video id="vid" muted="muted" autoplay controls loop
                                                               preload="auto" width="500">
                                                               <source
                                                                  src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_E1.webm"
                                                                  type="video/webm">
                                                            </video>
                                                            <a class="closeBtn1"></a>
                                                         </div>
                                                      </div>

                                                   </div>
                                                </span>
                                             </div>
                                             <div class="icon">
                                                <span data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title=" <b> ${cp.r_name} </b> <br>재사용대기시간(초):${cp.r_cool} <br>소모:${cp.r_cost}<br>범위:${cp.r_range}<br>${cp.r_tooltip }">
                                                   <div
                                                      class="champion-stat__skill tip tpd-delegation-uid-1">
                                                      <a class="openBtn5"
                                                         href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_R1.webm"
                                                         class="Image"> <img
                                                         src="resources/img/champion_skill/${cp.r_img}"
                                                         id="championicon" /><span class="key">R</span></a>
                                                      <div class="modal5 hidden">
                                                         <div class="bg5"></div>
                                                         <div class="modalBox">
                                                            <video id="vid" muted="muted" autoplay controls loop
                                                               preload="auto" width="500">
                                                               <source
                                                                  src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/000${cp.id}/ability_000${cp.id}_R1.webm"
                                                                  type="video/webm">
                                                            </video>
                                                            <a class="closeBtn1"></a>
                                                         </div>
                                                      </div>

                                                   </div>
                                                </span>
                                             </div>
                                          </h1>
                                       </div>
                                    </c:if>
                                    <c:if test="${cp.id < 100 && cp.id >= 10 }">


                                       <img src="resources/img/Champion_No/${cp.id}.png"
                                          id="championicon" class="champion-stats-info__image" />
                                       <h1 class="champion-stats-header-info__name">${cp.name}
                                          <!-- <span style="color: #9c9c9c;">빌드 - 10~100</span> -->
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.p_name} </b> <br>${cp.p_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1">
                                                   <a class="openBtn1"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_P1.webm"
                                                      class="Image"> <img
                                                      src="resources/img/champion_skill/${cp.p_img}"
                                                      id="championicon" /></a>
                                                   <div class="modal1 hidden">
                                                      <div class="bg1"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_P1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.q_name} </b> <br>재사용대기시간(초):${cp.q_cool} <br>소모:${cp.q_cost}<br>범위:${cp.q_range}<br>${cp.q_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn2"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_Q1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.q_img}"
                                                      id="championicon" /><span class="key">Q</span></a>
                                                   <div class="modal2 hidden">
                                                      <div class="bg2"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_Q1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn1"></a>
                                                      </div>
                                                   </div>
                                                   ${cp.q_name},${cp.q_cool},${cp.q_cost},${cp.q_range},${cp.q_tooltip}<br>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.w_name} </b> <br>재사용대기시간(초):${cp.w_cool} <br>소모:${cp.w_cost}<br>범위:${cp.w_range}<br>${cp.w_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn3"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_W1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.w_img}"
                                                      id="championicon" /><span class="key">W</span></a>
                                                   <div class="modal3 hidden">
                                                      <div class="bg3"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_W1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>
                                                   ${cp.w_name},${cp.w_cool},${cp.w_cost},${cp.w_range},${cp.w_tooltip}<br>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.e_name} </b> <br>재사용대기시간(초):${cp.e_cool} <br>소모:${cp.e_cost}<br>범위:${cp.e_range}<br>${cp.e_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn4"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_E1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.e_img}"
                                                      id="championicon" /><span class="key">E</span></a>
                                                   <div class="modal4 hidden">
                                                      <div class="bg4"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_E1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>
                                                   ${cp.e_name},${cp.e_cool},${cp.e_cost},${cp.e_range},${cp.e_tooltip}<br>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.r_name} </b> <br>재사용대기시간(초):${cp.r_cool} <br>소모:${cp.r_cost}<br>범위:${cp.r_range}<br>${cp.r_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn5"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_R1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.r_img}"
                                                      id="championicon" /><span class="key">R</span></a>
                                                   <div class="modal5 hidden">
                                                      <div class="bg5"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/00${cp.id}/ability_00${cp.id}_R1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>

                                                </div>
                                             </span>
                                          </div>
                                       </h1>
                                    </c:if>
                                    <c:if test="${cp.id >= 100}">

                                       <img src="resources/img/Champion_No/${cp.id}.png"
                                          id="championicon" class="champion-stats-info__image" />
                                       <h1 class="champion-stats-header-info__name">${cp.name}
                                          <!-- <span style="color: #9c9c9c;">빌드 - 서포터</span> -->
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.p_name} </b> <br>${cp.p_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1">
                                                   <a class="openBtn1"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_Q1.webm"
                                                      class="Image"> <img
                                                      src="resources/img/champion_skill/${cp.p_img}"
                                                      id="championicon" /></a>
                                                   <div class="modal1 hidden">
                                                      <div class="bg1"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_P1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.q_name} </b> <br>재사용대기시간(초):${cp.q_cool} <br>소모:${cp.q_cost}<br>범위:${cp.q_range}<br>${cp.q_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1">
                                                   <a class="openBtn2"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_Q1.webm"
                                                      class="Image"> <img
                                                      src="resources/img/champion_skill/${cp.q_img}"
                                                      id="championicon" /><span class="key">Q</span></a>
                                                   <div class="modal2 hidden">
                                                      <div class="bg2"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_Q1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn1"></a>
                                                      </div>
                                                   </div>

                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.w_name} </b> <br>재사용대기시간(초):${cp.w_cool} <br>소모:${cp.w_cost}<br>범위:${cp.w_range}<br>${cp.w_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn3"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_W1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.w_img}"
                                                      id="championicon" /><span class="key">W</span></a>
                                                   <div class="modal3 hidden">
                                                      <div class="bg3"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_W1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.e_name} </b> <br>재사용대기시간(초):${cp.e_cool} <br>소모:${cp.e_cost}<br>범위:${cp.e_range}<br>${cp.e_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn4"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_E1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.e_img}"
                                                      id="championicon" /><span class="key">E</span></a>
                                                   <div class="modal4 hidden">
                                                      <div class="bg4"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_E1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>
                                                </div>
                                             </span>
                                          </div>
                                          <div class="icon">
                                             <span data-toggle="tooltip" data-placement="top"
                                                data-html="true"
                                                title=" <b> ${cp.r_name} </b> <br>재사용대기시간(초):${cp.r_cool} <br>소모:${cp.r_cost}<br>범위:${cp.r_range}<br>${cp.r_tooltip }">
                                                <div
                                                   class="champion-stat__skill tip tpd-delegation-uid-1"
                                                   title="">
                                                   <a class="openBtn5"
                                                      href="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_R1.webm"
                                                      class="Image" target="_blank"> <img
                                                      src="resources/img/champion_skill/${cp.r_img}"
                                                      id="championicon" /><span class="key">R</span></a>
                                                   <div class="modal5 hidden">
                                                      <div class="bg5"></div>
                                                      <div class="modalBox">
                                                         <video id="vid" muted="muted" autoplay controls loop
                                                            preload="auto" width="500">
                                                            <source
                                                               src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${cp.id}/ability_0${cp.id}_R1.webm"
                                                               type="video/webm">
                                                         </video>
                                                         <a class="closeBtn"></a>
                                                      </div>
                                                   </div>

                                                </div>
                                             </span>
                                          </div>
                                       </h1>
                                    </c:if>
                                 </div>
                              </div>
                           </div>
                           <hr>
                           <div class="champion-box-content">
                              <table
                                 class="champion-stats__table"
                                 role="grid">
                                 <thead>
                                    <tr role="row">
                                       <th style="width:60%;"
                                          class="champion-stats__table__header champion-stats__table__header--title tablesorter-header sorter-false tablesorter-headerUnSorted"
                                          data-sorter="false" data-column="0" tabindex="0"
                                          scope="col" role="columnheader" aria-disabled="true"
                                          unselectable="on" aria-sort="none"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">스펠</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">픽률</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">승률</div></th>

                                    </tr>
                                 </thead>

                                 <tbody aria-live="polite" aria-relevant="all">
                                    <c:forEach items="${cs}" var="cs">
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/spell_image/${cs.s1name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cs.s1name}</b><br><span>${cs.s1tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/spell_image/${cs.s2name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cs.s2name}</b><br><span>${cs.s2tooltip}<br></span>"
                                                   class="tip" style="">
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${cs.rate}%<br> <em>${cs.cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${cs.winrate}%<br> <em>${cs.wincnt}</em>
                                          </td>
                                       </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                           </div>
                           
                           <hr>
                           <!-- 스펠 끝 -->
                           <div class="tabWrap _recognized">
                              <div class="l-champion-statistics-menu">
                                 <div class="champion-stats-menu">
                           <ul class="tab champion-stats-menu__list">
                                       <li class="" data-tab-show-class="championLayout-rune"><a
                                          href=".ttip" onclick="articleView(${cp.id})"><h6 class="m-0 font-weight-bold text-primary2">챔피언 팁</a></li>
                                    </ul>
                           </h6>
                           <div id="contents_layer" class="ttip"></div>
                                    <%-- <ul class="tab champion-stats-menu__list">
                                       <li class="" data-tab-show-class="championLayout-overview"><a
                                          href="#build" class="selected">정보</a></li>
                                       <li class="" data-tab-show-class="championLayout-rune"><a
                                          href=".ttip" onclick="articleView(${cp.id})">챔피언 팁</a></li>
                                    </ul> --%>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>



                  <!-- 룬/스펠 빌드 -->
                  <div class="col-xl-6 col-lg-5">
                     <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary2">아이템 빌드</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                           <!--룬/스펠 빌드 넣는부분-->

                           <!-- 아이템 -->
                           <div class="champion-box-content">
                              <table
                                 class="champion-stats__table"
                                 role="grid">
                                 <thead>
                                    <tr role="row">
                                       <th style="width:60%;"
                                          class="champion-stats__table__header champion-stats__table__header--title tablesorter-header sorter-false tablesorter-headerUnSorted"
                                          data-sorter="false" data-column="0" tabindex="0"
                                          scope="col" role="columnheader" aria-disabled="true"
                                          unselectable="on" aria-sort="none"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">아이템</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">픽률</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">승률</div></th>

                                    </tr>
                                 </thead>

                                 <tbody aria-live="polite" aria-relevant="all">
                                    <c:forEach items="${ci}" var="ci">
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/item_image/${ci.item1}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${ci.i1name}</b><br><span>${ci.i1tooltip}<br>가격 : ${ci.i1total}(${ci.i1base})</span>"
                                                   class="tip" style=""> <span>${ci.i1name}</span>
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item1_rate}%<br> <em>${ci.item1_cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item1_winrate}%<br> <em>${ci.item1_wincnt}</em>
                                          </td>
                                       </tr>
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/item_image/${ci.item2}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${ci.i2name}</b><br><span>${ci.i2tooltip}<br>가격 : ${ci.i2total}(${ci.i2base})</span>"
                                                   class="tip" style=""> <span>${ci.i2name}</span>
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item2_rate}%<br> <em>${ci.item2_cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item2_winrate}%<br> <em>${ci.item2_wincnt}</em>
                                          </td>
                                       </tr>
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/item_image/${ci.item3}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${ci.i3name}</b><br><span>${ci.i3tooltip}<br>가격 : ${ci.i3total}(${ci.i3base})</span>"
                                                   class="tip" style=""> <span>${ci.i3name}</span>
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item3_rate}%<br> <em>${ci.item3_cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item3_winrate}%<br> <em>${ci.item3_wincnt}</em>
                                          </td>
                                       </tr>
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/item_image/${ci.item4}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${ci.i4name}</b><br><span>${ci.i4tooltip}<br>가격 : ${ci.i4total}(${ci.i4base})</span>"
                                                   class="tip" style=""> <span>${ci.i4name}</span>
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item4_rate}%<br> <em>${ci.item4_cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item4_winrate}%<br> <em>${ci.item4_wincnt}</em>
                                          </td>
                                       </tr>
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/item_image/${ci.item5}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${ci.i5name}</b><br><span>${ci.i5tooltip}<br>가격 : ${ci.i5total}(${ci.i5base})</span>"
                                                   class="tip" style=""> <span>${ci.i5name}</span>
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item5_rate}%<br> <em>${ci.item5_cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${ci.item5_winrate}%<br> <em>${ci.item5_wincnt}</em>
                                          </td>
                                       </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                              <!-- 신발 -->
                              <table
                                 class="champion-stats__table"
                                 role="grid">
                                 <thead>
                                    <tr role="row">
                                       <th style="width:60%;"
                                          class="champion-stats__table__header champion-stats__table__header--title tablesorter-header sorter-false tablesorter-headerUnSorted"
                                          data-sorter="false" data-column="0" tabindex="0"
                                          scope="col" role="columnheader" aria-disabled="true"
                                          unselectable="on" aria-sort="none"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">아이템</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">픽률</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">승률</div></th>

                                    </tr>
                                 </thead>

                                 <tbody aria-live="polite" aria-relevant="all">
                                    <c:forEach items="${cis}" var="cis">
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__item">
                                                <img src="resources/img/item_image/${cis.item1}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cis.i1name}</b><br><span>${cis.i1tooltip}<br>가격 : ${cis.i1total}(${cis.i1base})</span>"
                                                   class="tip" style=""> <span>${cis.i1name}</span>
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${cis.item1_rate}%<br> <em>${cis.item1_cnt}</em>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${cis.item1_winrate}%<br> <em>${cis.item1_wincnt}</em>
                                          </td>
                                       </tr>
                                       
                                    </c:forEach>
                                 </tbody>
                              </table>

                           </div>
                           <!-- 아이템 끝 -->



                        </div>

                     </div>
                  </div>

                  <!-- 룬빌드 -->
                  <div class="col-xl-12 col-lg-5">
                     <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary2">룬 빌드</h6>
                        </div>
                        <div class="card-body">
                           <!-- 룬빌드 넣는부분-->

                           <!-- 룬 -->
                           <div class="champion-box-content">
                              <table
                                 class="champion-stats__table"
                                 role="grid">
                                 <thead>
                                    <tr role="row">
                                       <th style="width:60%;"
                                          class="champion-stats__table__header champion-stats__table__header--title tablesorter-header sorter-false tablesorter-headerUnSorted"
                                          data-sorter="false" data-column="0" tabindex="0"
                                          scope="col" role="columnheader" aria-disabled="true"
                                          unselectable="on" aria-sort="none"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">룬</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">픽률</div></th>
                                       <th
                                          class="champion-stats__table__header tablesorter-header tablesorter-headerUnSorted"
                                          data-column="1" tabindex="0" scope="col"
                                          role="columnheader" aria-disabled="false"
                                          unselectable="on" aria-sort="none"
                                          aria-label="픽률: No sort applied, activate to apply a descending sort"
                                          style="user-select: none;"><div
                                             class="tablesorter-header-inner">승률</div></th>

                                    </tr>
                                 </thead>

                                 <tbody aria-live="polite" aria-relevant="all">
                                    <c:forEach items="${cr}" var="cr">
                                       <tr role="row">
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--data">
                                             <div class="champion-stats__single__rune">
                                                <img
                                                   src="resources/img/champion_rune/${cr.r1name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.r1name}</b><br><span>${cr.r1tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.r2name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.r2name}</b><br><span>${cr.r2tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.r3name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.r3name}</b><br><span>${cr.r3tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.r4name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.r4name}</b><br><span>${cr.r4tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.r5name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.r5name}</b><br><span>${cr.r5tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.r6name_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.r6name}</b><br><span>${cr.r6tooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.offname_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.offname}</b><br><span>${cr.offtooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.flexname_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.flexname}</b><br><span>${cr.flextooltip}<br></span>"
                                                   class="tip" style=""> <img
                                                   src="resources/img/champion_rune/${cr.defenname_e}.png"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-html="true"
                                                   title="<b style='color: #00cfbc'>${cr.defenname}</b><br><span>${cr.defentooltip}<br></span>"
                                                   class="tip" style="">
                                             </div>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${cr.rate}%<br>${cr.cnt}<br>
                                          </td>
                                          <td
                                             class="champion-stats__table__cell champion-stats__table__cell--pickrate">
                                             ${cr.winrate}%<br>${cr.wincnt}<br>
                                          </td>
                                       </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                           </div>
                           <!-- 챔피언 룬 끝-->


                        </div>
                     </div>
                  </div>


                  <%-- <!-- 팁게시판 -->
                  <div class="col-xl-6 col-lg-5">
                     <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary">팁게시판
                           <ul class="tab champion-stats-menu__list">
                                       <li class="" data-tab-show-class="championLayout-rune"><a
                                          href=".ttip" onclick="articleView(${cp.id})">챔피언 팁</a></li>
                                    </ul>
                           </h6>
                        </div>
                        <div class="card-body">
                           
                           <!--팁게시판 넣는부분-->
                           <!-- 챔피언 팁 -->
                           <!-- <div id="contents_layer" class="ttip"></div> -->
                        </div>
                     </div>
                  </div> --%>
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
<!-- 챔피언 팁 -->
<script type="text/javascript">

   function articleView(num){
            console.log("챔피언 번호=",num);   
            //$("#contents_layer").addClass('open');
               
            $.ajax({
               type:'get',
               url: 'contents',//'contents?bNum='+num,      /를 직접 url을 명시할때는 루트로 처리되고 자바에서 명시할때는 url이 됨
               data: {id: num},
               dataType: 'html' //ajaxContents.jsp에 상세 내용을 출력후 리턴 
               }).done((data)=>$('#contents_layer').html(data))
               .fail((err)=>console.log(err)); //ajax End */
   }//articleView End
   
   $(function(){
      const $window=$("#articleView_layer");
      $window.find("#bg_layer").on('mousedown',function(evt){
         console.log(evt);
         $window.removeClass('open');
      })
      //esc 키 눌러 모달창 닫기
      $(document).keydown(function(evt){
         console.log(evt);
         if(evt.keyCode!=27) return;
         else if($window.hasClass('open')){
            $window.removeClass('open');
         }
      });//keydown End
      
      //삭제된 글번호 출력
      if('${ct_num}'===''){   //1=='1'  true
         return;
      }else if(parseInt('${ct_num}')>0){
         alert('댓글을 삭제했습니다.');
      }
      
   }); //ready end
</script> <!-- 챔피언 팁 끝 -->

      <script>
$(document).ready(function() {
    $(".ttip").hide();
    $(".tab a").click(function(){
        
        if($("#contents_layer").hasClass('open')){
           $("#contents_layer").removeClass('open');
           $($(this).attr("href")).hide();
           
        }else if(!$("#contents_layer").hasClass('open')){
           $("#contents_layer").addClass('open');
           $($(this).attr("href")).show();
        }
        return false;
    });
});
$(function(){
    $('.openBtn1').on("click",function(e){
        e.preventDefault();
    });
    $('.openBtn2').on("click",function(e){
        e.preventDefault();
    });
    $('.openBtn3').on("click",function(e){
        e.preventDefault();
    });
    $('.openBtn4').on("click",function(e){
        e.preventDefault();
    });
    $('.openBtn5').on("click",function(e){
        e.preventDefault();
    });
    $('.tab a').on("click",function(e){
        e.preventDefault();
    });
 });
  open1 = () => {
    document.querySelector(".modal1").classList.remove("hidden");
    }
  open2 = () => {
   document.querySelector(".modal2").classList.remove("hidden");
   }
  open3 = () => {
   document.querySelector(".modal3").classList.remove("hidden");
   }
  open4 = () => {
   document.querySelector(".modal4").classList.remove("hidden");
   }
  open5 = () => {
   document.querySelector(".modal5").classList.remove("hidden");
   }

  const close = () => {
    document.querySelector(".modal1").classList.add("hidden");
    document.querySelector(".modal2").classList.add("hidden");
    document.querySelector(".modal3").classList.add("hidden");
    document.querySelector(".modal4").classList.add("hidden");
    document.querySelector(".modal5").classList.add("hidden");
  }
  

  document.querySelector(".openBtn1").addEventListener("click", open1);
  document.querySelector(".openBtn2").addEventListener("click", open2);
  document.querySelector(".openBtn3").addEventListener("click", open3);
  document.querySelector(".openBtn4").addEventListener("click", open4);
  document.querySelector(".openBtn5").addEventListener("click", open5);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg1").addEventListener("click", close);
  document.querySelector(".bg2").addEventListener("click", close);
  document.querySelector(".bg3").addEventListener("click", close);
  document.querySelector(".bg4").addEventListener("click", close);
  document.querySelector(".bg5").addEventListener("click", close);
  document.getElementById('vid').play();
  

   
</script>

<script>
$("[data-toggle=tooltip]").tooltip();
</script>
</body>


</html>