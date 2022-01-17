<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="resources/js/jquery.serializeObject.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

</head>
<style>
tbody{
   display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
form{
   display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
#ctFrm{
   position: relative;
    background: #fff;
    border: solid 5px #dce3e9;
    padding-top: 25px;
}
#ctTable{
   background-color: #fff;
    border: solid 1px #e6e6e6;
}
#ctTable td{
   padding: 1em;
}
#ctTable th{
   text-align: center;
   width: 400;
   font-weight: 800;
}
.tipbutton{
   width: 50px; height: 30px;
}
.champTipWrite{
   width:500px; height: 200px; font-size: 15px; padding: 10px; margin: 0.5em; resize: none;
}
.champTipbtn{
   width: 100px; height: 200px
}
</style>
<body>
   <h3>챔피언 팁</h3>

   <!-- 댓글 입력 -->
   <form id="ctFrm" name="ctFrm" action="champTipInsert">
      <table>
         <tr>
            <td><textarea class="champTipWrite" name="ct_contents" placeholder="챔피언에 대한 팁을 남겨주세요. 관련없는 글은 삭제처리됩니다."
                  id="ct_contents"></textarea></td>
            <td><input class="champTipbtn" type="button" value="등록"
               onclick="champTipInsert(${cp.id})"></td>
         </tr>
      </table>

      <!-- 댓글 리스트 출력 -->
   </form>
   
   <table id="ctTable">
      <tr><th width="250">아이디</th><th width="850">내용</th><th width="250">작성일</th><th width="50"></th><th width="50"></th></tr>
      <c:forEach var="champTip" items="${ctList}">
         <tr height="25" align="center" id="ccc">
            <td width="250">${champTip.ct_mid}</td>
            <td width="850">${champTip.ct_contents}</td>
            <td width="250">${champTip.ct_date}</td>
            <td width="50"><input type="button" onclick="userr('${champTip.ct_mid}','${champTip.ct_contents}')" value="신고" class="tipbutton"/></td>
            <c:if test="${session == champTip.ct_mid}">
               <td width="50"><input type="button" value="삭제"
                  onclick="tipdelete(${champTip.ct_num},${champTip.ct_cpnum})"
                  class="tipbutton"></td>
            </c:if>
         </tr>
      </c:forEach>

   </table>
   <script type="text/javascript">
var a = '<%=(String) session.getAttribute("memberid")%>';
function champTipInsert(num){
   console.log('ct_cpnum='+num);
   let obj=$('#ctFrm').serializeObject(); //form태그 안에 있는 내용 전부를 js객체로변환, 안에 파일태그가 있으면 안됨
   //폼데이터-->js객체-->json-->서버-->자바객체
   obj.ct_cpnum=num;
   
   let json=JSON.stringify(obj);      //obj-->json   //JSON.parse(json)   json-->obj
   
   $.ajax({
      type: 'post',   //json으로 넘길때는 get이 아닌 post로 넘긴다
      url: 'rest/champtipinsert',   //'list/member/10', 'list/board/10'
      //urlencoded 방식
      //data: {r_bnum:bNum, r_contents:$('#r_contents').val()},   //지금은 일부만 보내니까 이렇게 쓰고      bean안에 있는 키값이랑 이름 맞추기
      //data: $('#rFrm').serialize(),  //폼전체 데이터 전송 만약에 form태그 안에 있는 내용 전부를 js객체로변환
      data:json,
      //urlencoded 방식이 아닌 json형태의 데이터를 서버에 넘긴다
      contentType:"application/json; charset=UTF-8",
      dataType: 'json',   //댓글 리스트를 json으로 받으옴
      success: function(data){
         console.log(data);
         //for 또는 foreach 이용해서 <table id="rTable">에 댓글 리스트 출력할것.
         let ctlist='';
         ctlist='<tr><th width="250">아이디</th><th width="850">내용</th><th width="250">작성일</th><th width="50"></th><th width="50"></th></tr>';
         for(elem of data['ctList']){
            ctlist+='<tr height="25" align="center">'
            +'<td width="250">'+elem.ct_mid+'</td>'
            +'<td width="850">'+elem.ct_contents+'</td>'
            +'<td width="250">'+elem.ct_date+'</td>'
            +'<td width="50"><input type="button" onclick="userr('+elem.ct_mid+','+elem.ct_contents+')" value="신고" class="tipbutton"></td>'
            if(a == elem.ct_mid){
            ctlist+='<td width="50"><input type="button" value="삭제" onclick="tipdelete('+elem.ct_num+','+elem.ct_cpnum+')" class="tipbutton"></td>'
            }
            +'</tr>';
         }
         $('#ctTable').html(ctlist);
         $('#ct_contents').val('');
         $('#ct_contents').focusin();
      },
      error: function(err){
          alert("로그인 후 이용 바랍니다.");
         console.log(err);
      }
      
   });//ajax end
}
function tipdelete(num, num2){
   console.log(num);
   console.log(num2);
   console.log(a);
   let obj=$('#ctFrm').serializeObject();
   obj.ct_num=num;
   obj.ct_cpnum=num2;
   let json=JSON.stringify(obj);
   
   $.ajax({
      type: 'post',   
      url: 'rest/tipdelete',   
      data:json,
      //urlencoded 방식이 아닌 json형태의 데이터를 서버에 넘긴다
      contentType:"application/json; charset=UTF-8",
      dataType: 'json',   //댓글 리스트를 json으로 받으옴
      success: function(data){
         console.log(data);
         let ctlist='';
         ctlist='<tr><th width="250">아이디</th><th width="850">내용</th><th width="250">작성일</th><th width="50"></th><th width="50"></th></tr>';
         for(elem of data['ctList']){
            ctlist+='<tr height="25" align="center">'
            +'<td width="250">'+elem.ct_mid+'</td>'
            +'<td width="850">'+elem.ct_contents+'</td>'
            +'<td width="250">'+elem.ct_date+'</td>'
            +'<td width="50"><input type="button" onclick="userr('+elem.ct_mid+','+elem.ct_contents+')" value="신고" class="tipbutton"></td>'
            if(a == elem.ct_mid){
               ctlist+='<td width="50"><input type="button" value="삭제" onclick="tipdelete('+elem.ct_num+','+elem.ct_cpnum+')" class="tipbutton"></td>'
               }
            +'</tr>';
         }
         $('#ctTable').html(ctlist);
         $('#ct_contents').val('');
         $('#ct_contents').focusin();
         alert("댓글이 삭제되었습니다..");
      },
      error: function(err){
         console.log(err);
      }
   
});//ajax end
}
function userr(num,num1){
   console.log(num);
   console.log(num1);
   let obj=$('#ctFrm').serializeObject();
   obj.ct_mid = num;
   obj.ct_contents = num1;
   let json=JSON.stringify(obj);
   $.ajax({
      type: 'post',   
      url: 'rest/userr',   
      data:json,
      //urlencoded 방식이 아닌 json형태의 데이터를 서버에 넘긴다
      contentType:"application/json; charset=UTF-8",
      dataType: 'json',   //댓글 리스트를 json으로 받으옴
      success: function(data){
         console.log(data);
         alert("댓글이 신고되었습니다.");
      },
      error: function(err){
         console.log(err);
      }
   
});//ajax end
}
</script>
</body>
</html>