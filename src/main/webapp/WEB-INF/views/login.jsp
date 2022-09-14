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
</style>

<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div>
		<table id="tablesty">

			<tr>
				<td bgcolor="#F4F2F3" align="center">
					<table id="tablesty2">
						<tr>
							<a href="/login"><img
								src="${pageContext.request.contextPath }/resources/img/joong.png"></a>
						</tr>
						<br>
						<form action="loginOk" method="post" name="login_form">
							<tr>
								<td><span class="content_text">아 이 디 </span></td>
								<td><input class="input_box" type="text" name="mid"></td>
							</tr>
							<tr>
								<td><span class="content_text">비밀번호 </span></td>
								<td><input class="input_box" type="password" name="mpw"></td>
							</tr>
							<tr>
								<td colspan="2"><input class="button" type="submit"
									value="로그인" style="width: 120px">&nbsp; <input
									class="button" type="button" value="회원가입"
									onclick="location.href='join'" style="width: 120px;">
								</td>
							</tr>
						</form>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>