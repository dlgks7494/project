<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 20;
}

div {
	
}
</style>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body style="width: 100vw; height: 100vh; background-color: #F4F2F3;">


	<table width="100%" height="100%" cellspacing="0" cellpadding="10"
		border="0">

		<tr>
			<td align="center">
				<form action="infoModifyOk" method="post" name="join_form">
					<table border="0" cellspacing="0" cellpadding="10">


						<tr>
							<th colspan="2">정보수정</th>
						</tr>
						<tr>
							<td><span class="content_text">아이디 </span></td>
							<td><input class="input_box" type="text" name="id"
								value="${MemberDto.id }"></td>
						</tr>
						<tr>
							<td><span class="content_text">비밀번호 </span></td>
							<td><input class="input_box" type="password" name="pw"></td>
						</tr>

						<tr>
							<td><span class="content_text">비밀번호확인 </span></td>
							<td><input class="input_box" type="password" name="pw_check"></td>
						</tr>
						<tr>
							<td><span class="content_text">전화번호 </span></td>
							<td><input class="input_box" type="text" name="tel"
								value="${MemberDto.tel }"></td>
						</tr>
						<tr>
							<td><span class="content_text">이름 </span></td>
							<td><input class="input_box" type="text" name="name"
								value="${MemberDto.name }"></td>
						</tr>
						<tr>
							<td><span class="content_text">주소 </span></td>
							<td><input class="input_box" type="text" name="address"
								value="${MemberDto.address }"></td>
						</tr>
						<tr>
							<td><span class="content_text">태그 </span></td>
							<td><input class="input_box" type="text" name="bookmark"
								value="${MemberDto.bookmark }"></td>
						</tr>
						<tr>
							<td colspan="2"><input class="button" type="submit"
								value="확인" onclick="location.href='infoModifyOk'">&nbsp;&nbsp;
								<input class="button" type="button" value="취소"
								onclick="location.href='Myboard'"></td>
						</tr>

					</table>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>
