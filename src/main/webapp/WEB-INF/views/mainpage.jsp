<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
* {
	margin: 0;
	padding: 20;
}

div {
	width: 100vw;
	height: 100vh;
}

#tablesty {
	width: 100%;
	height: 100%;
	cellspacing: "0";
	border: "1";
	cellpadding: "10";
}

td {
	align: center;
}

#tablesty2 {
	border: "1";
	cellspacing: "0";
	cellpadding: "20";
}
header{
	position: absolute;
	margin-top: 7%;
	margin-left: 80%;
	width : 10%;
	height : 170px;
	border:1px solid black;
	border-radius: 10px;
	background:#e9ecef;
}
#but{
	background:none;
	width: 45%; height: 70px;
	border:0px;
	transition-duration: 0.4s;
}
#but:hover{
	font-weight: bold;
	color : white;
	background-color: black;
}
</style>

<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<%
  	String sessionId = (String)session.getAttribute("mid");%>
<body bgcolor="#F4F2F3" style="height: 100%;">
	<header>
	<div style = "height : 80px;width : 90%; text-align: center; line-height: 30px;margin-left:5%;margin-top:10px;">${MemberDto.id }<br>님 반갑습니다. </div>
		<input id = "but" class="button" type="button" value="내 메뉴"
			onclick="location.href='Myboard'"
			style="border-right:1px solid black; margin-left:5%;"><input id = "but" class="button" type="button" value="로그아웃"
			onclick="location.href='logout'"
			>
	</header>
	<div>
		<table id="tablesty">

			<tr>
				<td bgcolor="#F4F2F3" align="center">
					<table id="tablesty2">
						<tr>
							<td colspan='3' align="center"><img
									src="${pageContext.request.contextPath }/resources/img/joong.png" style="width:20%; height:20%;"></td>
						</tr>
						<tr>
							<td><a href="/board_write"><img
									src="${pageContext.request.contextPath }/resources/img/clbox.jpeg"></a></td>
							<td><a href="/board_sell"> <img
									src="${pageContext.request.contextPath }/resources/img/sellbox.jpg"></a></td>
							<td><a href="/board_view"><img
									src="${pageContext.request.contextPath }/resources/img/opbox.jpg"></a></td>
							<!-- 상품구매 -->
						</tr>


					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>