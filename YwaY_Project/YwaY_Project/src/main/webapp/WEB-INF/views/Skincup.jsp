<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
  <head>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>YwaY - 롤 일러스트 월드컵</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/lezhin.css">
    <style>
		button {
			  margin: 20px;
			}
    	btn{
    		 display: block; margin: 0px auto;		 
			  width: 90%;
			  margin: 40px auto;
			  text-align: center;
    		}
    		
    	div { text-align: center; }
    	/* 12 */
		.btn-12{
		  position: relative;
		  right: 20px;
		  bottom: 20px;
		  border:none;
		  box-shadow: none;
		  width: 130px;
		  height: 40px;
		  line-height: 42px;
		  -webkit-perspective: 230px;
		  perspective: 230px;
		}
		.btn-12 span {
		  background: rgb(0,172,238);
		  background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
		  display: block;
		  position: absolute;
		  width: 130px;
		  height: 40px;
		  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
		   7px 7px 20px 0px rgba(0,0,0,.1),
		   4px 4px 5px 0px rgba(0,0,0,.1);
		  border-radius: 5px;
		  margin:0;
		  text-align: center;
		  -webkit-box-sizing: border-box;
		  -moz-box-sizing: border-box;
		  box-sizing: border-box;
		  -webkit-transition: all .3s;
		  transition: all .3s;
		}
		.btn-12 span:nth-child(1) {
		  box-shadow:
		   -7px -7px 20px 0px #fff9,
		   -4px -4px 5px 0px #fff9,
		   7px 7px 20px 0px #0002,
		   4px 4px 5px 0px #0001;
		  -webkit-transform: rotateX(90deg);
		  -moz-transform: rotateX(90deg);
		  transform: rotateX(90deg);
		  -webkit-transform-origin: 50% 50% -20px;
		  -moz-transform-origin: 50% 50% -20px;
		  transform-origin: 50% 50% -20px;
		}
		.btn-12 span:nth-child(2) {
		  -webkit-transform: rotateX(0deg);
		  -moz-transform: rotateX(0deg);
		  transform: rotateX(0deg);
		  -webkit-transform-origin: 50% 50% -20px;
		  -moz-transform-origin: 50% 50% -20px;
		  transform-origin: 50% 50% -20px;
		}
		.btn-12:hover span:nth-child(1) {
		  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
		   7px 7px 20px 0px rgba(0,0,0,.1),
		   4px 4px 5px 0px rgba(0,0,0,.1);
		  -webkit-transform: rotateX(0deg);
		  -moz-transform: rotateX(0deg);
		  transform: rotateX(0deg);
		}
		.btn-12:hover span:nth-child(2) {
		  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
		   7px 7px 20px 0px rgba(0,0,0,.1),
		   4px 4px 5px 0px rgba(0,0,0,.1);
		 color: transparent;
		  -webkit-transform: rotateX(-90deg);
		  -moz-transform: rotateX(-90deg);
		  transform: rotateX(-90deg);
		}
		
    </style>
  </head>
  <body onload="preLoaingImg()">
    <!--[if lt IE 7]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    <div class="wrap">
      <header>
        <h1>롤 일러스트 월드컵</h1>
        <p id="roundTitle">롤 일러스트 월드컵에 참여해 최고의 스킨을 뽑아주세요!</p>
      </header>
      <div class="btn" id="content">
       	<button onclick="start()" class="custom-btn btn-12"><span>시작하기</span><span>16강</span></button>
      </div>
      	<a href="YwaY">
        <p style="font-family: Andale Mono, monospace;">YwaY - 홈으로</p>
        </a>
      <footer class="footer soff" id="footer">
        <button id="cancel" onclick="lezhin.Event.clickCancel()">취소</button>
        <button id="prev" onclick="lezhin.Event.clickPrev()">이전</button>
      </footer>
    </div>
    
    <script src="resources/js/YwaY-16.js" async defer></script>
    <script>
      function start() {
        lezhin.start();
      }
      function start_32() {
        lezhin.start_32();
      }
      function preLoaingImg() {
        const preLoadingList = [
          'resources/img/LOL_SkinCup/Aatrox_8.jpg','resources/img/LOL_SkinCup/Ahri_1.jpg',
          'resources/img/LOL_SkinCup/Akali_32.jpg','resources/img/LOL_SkinCup/Alistar_10.jpg',
          'resources/img/LOL_SkinCup/Amumu_24.jpg','resources/img/LOL_SkinCup/Anivia_5.jpg',
          'resources/img/LOL_SkinCup/Ashe_17.jpg','resources/img/LOL_SkinCup/Azir_4.jpg',
          'resources/img/LOL_SkinCup/Bard_17.jpg','resources/img/LOL_SkinCup/Blitzcrank_29.jpg',
          'resources/img/LOL_SkinCup/Cassiopeia_18.jpg','resources/img/LOL_SkinCup/Chogath_14.jpg',
          'resources/img/LOL_SkinCup/Corki_18.jpg','resources/img/LOL_SkinCup/Darius_15.jpg',
          'resources/img/LOL_SkinCup/Diana_26.jpg','resources/img/LOL_SkinCup/Draven_20.jpg',
          'resources/img/LOL_SkinCup/Ekko_19.jpg','resources/img/LOL_SkinCup/Evelynn_15.jpg',
          'resources/img/LOL_SkinCup/Ezreal_21.jpg','resources/img/LOL_SkinCup/Fiora_31.jpg',
          'resources/img/LOL_SkinCup/Graves_3.jpg','resources/img/LOL_SkinCup/Irelia_6.jpg',
          'resources/img/LOL_SkinCup/Janna_5.jpg','resources/img/LOL_SkinCup/Jax_13.jpg',
          'resources/img/LOL_SkinCup/Jayce_24.jpg','resources/img/LOL_SkinCup/Jhin_2.jpg',
          'resources/img/LOL_SkinCup/Kaisa_15.jpg','resources/img/LOL_SkinCup/Kayn_9.jpg',
          'resources/img/LOL_SkinCup/Kennen_6.jpg','resources/img/LOL_SkinCup/Khazix_3.jpg',
          'resources/img/LOL_SkinCup/Kindred_3.jpg','resources/img/LOL_SkinCup/KogMaw_28.jpg',
          'resources/img/LOL_SkinCup/LeeSin_31.jpg','resources/img/LOL_SkinCup/Leona_11.jpg',
          'resources/img/LOL_SkinCup/Lucian_8.jpg','resources/img/LOL_SkinCup/Lulu_27.jpg',
          'resources/img/LOL_SkinCup/Lux_7.jpg','resources/img/LOL_SkinCup/Maokai_6.jpg',
          'resources/img/LOL_SkinCup/MissFortune_20.jpg','resources/img/LOL_SkinCup/Morgana_26.jpg',
          'resources/img/LOL_SkinCup/Nami_24.jpg','resources/img/LOL_SkinCup/Nautilus_3.jpg',
          'resources/img/LOL_SkinCup/Nidalee_18.jpg','resources/img/LOL_SkinCup/Nunu_3.jpg',
          'resources/img/LOL_SkinCup/Orianna_5.jpg','resources/img/LOL_SkinCup/Poppy_15.jpg',
          'resources/img/LOL_SkinCup/Qiyana_10.jpg','resources/img/LOL_SkinCup/Rammus_1.jpg',
          'resources/img/LOL_SkinCup/Renekton_17.jpg','resources/img/LOL_SkinCup/Riven_4.jpg',
          'resources/img/LOL_SkinCup/Rumble_3.jpg','resources/img/LOL_SkinCup/Ryze_3.jpg',
          'resources/img/LOL_SkinCup/Sejuani_5.jpg','resources/img/LOL_SkinCup/Senna_9.jpg',
          'resources/img/LOL_SkinCup/Seraphine_3.jpg','resources/img/LOL_SkinCup/Shaco_6.jpg',
          'resources/img/LOL_SkinCup/Shen_3.jpg','resources/img/LOL_SkinCup/Yasuo_18.jpg',
          'resources/img/LOL_SkinCup/Yone_19.jpg','resources/img/LOL_SkinCup/Yuumi_11.jpg',
          'resources/img/LOL_SkinCup/Zed_13.jpg','resources/img/LOL_SkinCup/Ziggs_23.jpg',
          'resources/img/LOL_SkinCup/Zoe_19.jpg','resources/img/LOL_SkinCup/Zyra_16.jpg'
        ], length = preLoadingList.length, tObj = document.getElementsByTagName("BODY")[0];
        let i = 0, imgNode;
        const hiddenNode = document.createElement('DIV');
        hiddenNode.className = 'pre_load soff';
        for(i; i < length; i++) {
          imgNode = document.createElement('IMG');
          imgNode.setAttribute('src', preLoadingList[i]);
          hiddenNode.appendChild(imgNode);
        }
        tObj.appendChild(hiddenNode);
      }
    </script>
  </body>
</html>