<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
</head>
<style>
th{
   text-align: center;
}
.type09{
   padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
</style>
<body>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
   <div id="userupdat" class="container">
      <h2>회원등급관리</h2>
   <form id="userupdate" action="usergradeup" method="post">
      <table class="table table-striped">
         <thead>
            <tr class="type09">
               <th>체크</th>
               <th>유저아이디</th>
               <th>유저등급</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${mblList}" var="Member">
         <tr height="20">
            <td align="center"><input type="checkBox" name="memberid" id="memberid" value="${Member.memberid}"></td>
            <td align="center">${Member.memberid}</td>
            <td align="center">${Member.grade}</td>
         </tr>
      </c:forEach>
         </tbody>
      </table>
      <button id="usergradeup" class="btn btn-primary">관리자로승급하기</button>
      </form>
   </div>
</body>
</html>