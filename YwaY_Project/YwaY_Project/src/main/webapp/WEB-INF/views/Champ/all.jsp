<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.championname{
	font-size: small;
	color: #000000;
}
.champsideicon{
			weight: 50px;
			height: 50px;
	}
</style>
<body>
      
      <div id="championimage">
         <c:forEach items="${cpAllList}" var="item">
            <div id="championbox">
                <a href="champinfo?champ=${item.CHAMPIONNAME}&lane=${item.lane1}"><img src="resources/img/Champion_No/${item.id}.png" id="championicon" />
               <p id="championname" class="championname text-center">${item.name}</p>
               </a>
            </div>
         </c:forEach>
      </div>
</body>
</html>