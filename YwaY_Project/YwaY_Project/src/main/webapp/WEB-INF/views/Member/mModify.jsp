<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<style>
body {
	padding: 0px;
	margin: 0px;
}

.jb-box {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0px auto;
	position: relative;
}

video {
	width: 100%;
}

.jb {
	position: absolute;
	top: 1%;
	width: 100%;
}
</style>

</head>

<body>
	

	<video muted autoplay loop>
		<source src="resources/videos/particle.mp4" type="video/mp4">
	</video>
		<div class="container-fluid jb">



        <div class="card o-hidden border-0 shadow-lg my-4">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-login-gamerroom"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원정보수정</h1>
                            </div>
                            <form class="user" name="mModify" action="mModify" method="post"
                                onsubmit="return joinform_check()">
                                <div class="form-group row">
                                    <div class="col-sm-9 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="memberid"
                                            name="memberid" value="${mb.memberid}" readonly>
                                        <div id="result"></div>
                                    </div>



                                    <div class="col-sm-9 mb-2 " id="result"></div>

                                    <div class="col-sm-9">
                                        <input type="password" id="memberpw" class="form-control form-control-user"
                                            name="memberpw" placeholder="영문자+숫자+특수문자 조합">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-9 ">
                                        <input type="text" name="email" id="email"
                                            class="form-control form-control-user" value="${mb.email}"></label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-9 ">
                                        <input type="text" name="summonername" class="form-control form-control-user"
                                            id="summonername" value="${mb.summonername}">
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <select name="idhint" id="idhint" class="form-controlss form-control-users" style="font-size: 0.8rem; width:270px; height:50px; border-radius:10rem;">
                                            <option value="none">힌트</option>
                                            <option value="내가 가장 좋아하는 챔피언 이름은">내가 가장 좋아하는 챔피언
                                                이름은</option>
                                            <option value="가장 좋아하는 프로게이머 선수 이름은">가장 좋아하는 프로게이머
                                                선수이름은</option>
                                            <option value="내가 졸업한 초등학교 이름은">내가 졸업한 초등학교 이름은</option>
                                            <option value="나의 고향은">나의 고향은</option>
                                        </select>
                                    </div>

                                    <div class="col-sm-9">
                                        <input type="text" name="idanswer" id="idanswer"
                                            class="form-control form-control-user" value="${mb.idanswer}">
                                    </div>
                                </div>
                                <hr>
                                <div class="col-sm-12 mb-2">
                                    <div class="join_btn ">
                                        <button type="button"
                                            class="btn btn-primary btn-user btn-block align-items-center"
                                            onclick="history.back();">이전페이지</button>
                                        <!-- (window삭제).history.back 뒤로가기/history.forward 앞으로가기-->
                                        <button type="submit"
                                            class="btn btn-primary btn-user btn-block align-items-center" id="checkId2"
                                            value="수정하기">수정하기</button>
                                        <!-- 입력된 경우에 따라서 다르게 액션되면 button으로, 입력 값 상관 없이 무조건 보내기면 submit -->
                                        <!-- type을 submit으로 하여 전송하기를 하지말고, script가서 함수를 만들고 전송하기를 함 button onclick으로 함수를 불러옴 함수안에 문제가 있는 경우 return false;-->
                                    </div>
                                </div>
                                <!-- <a href="login.html" class="btn btn-primary btn-user btn-block">
                                            Register Account </a> -->

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
    function joinform_check() {
        //변수에 담아주기
        var memberid = document.getElementById("memberid");
        var memberpw = document.getElementById("memberpw");
        var email = document.getElementById("email");
        var summonername = document.getElementById("summonername");
        var idhint = document.getElementById("idhint");


        if (memberid.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
            alert("아이디를 입력하세요.");
            memberid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
            event.preventDefault();
            return false;
        }
        var idCheck = /^[a-zA-Z0-9]{4,12}$/;
        if (!idCheck.test(memberid.value)) {
            alert("아이디는 영문자 또는 숫자로 최소 4~12자리 사용해야 합니다.");
            memberid.focus();
            event.preventDefault();
            return false;
        }
        if (memberpw.value == "") {
            alert("비밀번호를 입력하세요.");
            memberpw.focus();
            event.preventDefault();
            return false;
        }
        //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
        var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
        if (!pwdCheck.test(memberpw.value)) {
            alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
            memberpw.focus();
            event.preventDefault();
            return false;
        }
        if (email.value == "") {
            alert("이메일 주소를 입력하세요.");
            email.focus();
            event.preventDefault();
            return false;
        }
        var emailCheck = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        var emailCheck2 = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,2}[.]{1}[A-Za-z]{1,2}$/;
        if (!emailCheck.test(email.value) or !emailCheck2.test(email.value)) {
            alert("이메일을 형식에 맞게 입력해주세요.");
            email.focus();
            event.preventDefault();
            return false;
        }
        if (summonername.value == "") {
            alert("소환사 이름을 입력하세요.");
            summonername.focus();
            event.preventDefault();
            return false;
        }
        var summonernameCheck = /^[가-힣a-zA-Z0-9]{2,15}*$/;
        if (!summonernameCheck.test(summonername.value)) {
            alert("소환사 이름 2~10자 이내");
            summonername.focus();
            event.preventDefault();
            return false;
        }
        if (idhint.value == "none") {
            alert("질문을 선택하세요.");
            idhint.focus();
            event.preventDefault();
            return false;
        }
        if (idanswer.value == "") {
            alert("질문의 대답을 입력하세요.");
            idanswer.focus();
            event.preventDefault();
            return false;
        }
        var idanswerCheck = /^[가-힣a-zA-Z0-9]{1,10}$/;
        if (!idanswerCheck.test(idanswer.value)) {
            alert("대답 1~10자 이내");
            idanswer.focus();
            event.preventDefault();
            return false;
        }
        //입력 값 전송
        return true; //유효성 검사의 포인트   
    }
          
    </script>
	<!-- Bootstrap core JavaScript-->
		<script src="resources/vendor/jquery/jquery.min.js"></script>
		<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="resources/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="resources/vendor/chart.js/Chart.min.js"></script>
	
</body>
</html>