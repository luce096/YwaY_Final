<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.championname{
	font-size: small;
	color: #000000;
}
.champsideicon{
			weight: 50px;
			height: 50px;
			margin: 0.5em;
	}
</style>
</head>
<body>
			<c:forEach items="${cpJungleBanList}" var="item">	
			<table>		 
				<td width="100px"> 
						<a href="champinfo?champ=${item.CHAMPIONNAME}&lane=JUNGLE"><img src="resources/img/Champion_No/${item.id}.png" class="champsideicon" />
					</td>
					
					<td width="100px">
					<a href="champinfo?champ=${item.CHAMPIONNAME}&lane=JUNGLE" class="championname text-center">${item.name}</a>
					</td>
					
					<td width="100px" class="championname text-left">${item.BAN_RATE}</td>
				</tr>
			</table>
			</c:forEach>
</body>
</html>