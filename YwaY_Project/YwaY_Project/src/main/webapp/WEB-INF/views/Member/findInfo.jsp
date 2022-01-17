<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
response.setStatus(200);
%>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="resources/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript-->
        <script src="resources/vendor/jquery/jquery.min.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages -->
        <script src="resources/js/sb-admin-2.min.js"></script>
        <script type="text/javascript"></script>
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

<script>
	$(function() {
		$("#findIdBtn").click(function() {
			$.ajax({
				url : "findid",
				type : "POST",
				data : {
					summonername : $("#summonername").val(),
					idhint : $("#idhint").val(),
					idanswer : $("#idanswer").val()
				},
				success : function(result) {
					alert(result)
				},
			})
		});
	})
	$(function() {
		$("#findPwBtn").click(function() {
			$.ajax({
				url : "findpw",
				type : "POST",
				data : {
					memberid : $("#memberid").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
   
<body>
	

	<video muted autoplay loop>
		<source src="resources/videos/space.mp4" type="video/mp4">
	</video>
		<div class="container-fluid jb">



            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-4">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-gamerroom"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                           <h1> <a class="h1 text-gray-900 mb-4" href="./">YWAY</a></h1>
                                           <h1>비밀번호 찾기</h1>
                                        </div>

                                        <form class="user">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                    id="memberid" name="memberid" aria-describedby="emailHelp"
                                                    placeholder="회원가입한 아이디를 입력하세요">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                    id="email" name="email"
                                                    placeholder="회원가입한 이메일주소를 입력하세요">
                                            </div>

                                            <button type="button" id="findPwBtn"
                  class="btn btn-primary btn-user btn-block">임시
                  비밀번호 전송</button>
               <button type="button" onclick="history.go(-1);"
                  class="btn btn-primary btn-user btn-block">이전으로</button>

                                        </form>
                                        <hr>
                              			<h1 style="text-align: center;">아이디 찾기</h1>
                                        <form class="user">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                    id="summonername" name="summonername" aria-describedby="emailHelp"
                                                    placeholder="소환사이름">
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
                                            <input type="text" class="form-control form-control-user" name="idanswer"
                                                id="idanswer" placeholder="힌트에 대한 답변">
                                        </div>
                                </div>

                                            <button type="button" id="findIdBtn"
                  class="btn btn-primary btn-user btn-block">아이디
                  찾기</button>
               <button type="button" onclick="history.go(-1);"
                  class="btn btn-primary btn-user btn-block">이전으로</button>

                                        </form>




                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </body>

</html>