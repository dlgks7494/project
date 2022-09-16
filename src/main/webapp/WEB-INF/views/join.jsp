<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
*{
	margin:0;
	padding:20;
}	
 div{width: 100vw;
        height: 100vh;
       background-color:#F4F2F3;
 }

 </style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div>
	<table width="100%" height="100%" cellspacing="0" cellpadding="10" border="0">
		<tr>
			<td align="center">
				<table>
					<tr><a href="/login"><img src="${pageContext.request.contextPath }/resources/img/joong.png"></a></tr><br>
					<form action="joinOk" method="post" name="join_form">
						<span >회원가입</span>
						<tr>
							<td><span class="content_text">아이디 </span></td>
							<td><input  type="text" name="mid"></td>
						</tr>
						<tr>
							<td><span class="content_text">비밀번호</span></td>
							<td><input  type="password" name="mpw"></td>
						</tr>
						<tr>
							<td><span class="content_text">비밀번호 확인 </span></td>
							<td><input  type="password" name="mpw_check"></td>
						</tr>
						<tr>
							<td><span class="content_text">이름 </span></td>
							<td><input  type="text" name="mname"></td>
						</tr>
						<tr>
							<td><span class="content_text">주민번호 </span></td>
							<td><input  type="text" name="mjumin" pattern="[0-9]+" title="숫자만 입력하여 주세요. "></td>
						</tr>
						<tr>
							<td><span class="content_text">성별 </span></td>
							<td><input type="radio"  name="mgender" value="남">남자&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"  name="mgender" value="여">여자</td>	
						</tr>
						<tr>
							<td><span class="content_text">전화번호 </span></td>
							<td><input  type="text" name="mtel" pattern="[0-9]+" title="숫자만 입력하여 주세요. "></td>
						</tr>
						<tr>
							<td><span class="content_text">거래지역 </span></td>
							<td><input  type="text" name="maddress"></td>
						</tr>								
						<tr>
							<td colspan="2">
								<input class="button" type="button" value="로그인" onclick="location.href='login'" style="width:120px">&nbsp;
								<input class="button" type="submit" value="회원가입" style="width:120px">
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