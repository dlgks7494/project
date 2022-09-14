<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.col1 {
	padding-top: 15px;
}
#button{
	transition-duration: 0.4s;
	background: none;
	width: 40%; height:50px;
}
#button:hover {
	font-weight: bold;
	color: white;
	background-color: black;
}
</style>
<meta charset="UTF-8">
<title>상품 등록</title>

</head>
<body bgcolor="#F4F2F3">

<form action="board_writeOk" method="post"
			enctype="multipart/form-data">
	<img src="${pageContext.request.contextPath }/resources/img/joong.png"
		style="width: 5%; height: 9%; position: absolute; padding-left: 5%;">
	<div id="write_title " style="display: inline-block; width: 100%;"
		align="center">
		<h2>상품 등록</h2>
	</div>
	<hr>
	<div style="margin-left: 20%;width:60%;">
			<table>
				<tr id="subject">
					<td class="col1" style="width:25%;text-align: center;">종류</td>
					<td class="col1"style="width:30%;"><select name="product" style = "width : 100px; height:25px;">
							<option value="의류">의류</option>
							<option value="핸드폰부품">핸드폰 부품</option>
							<option value="음식">음식</option>
							<option value="자동차 부품">자동차 부품</option>
							<option value="가전 제품">가전 제품</option>
							<option value="상품권/쿠폰">상품권/쿠폰</option>
							<option value="가구">가구</option>
							<option value="화장품">화장품</option>
							<option value="악세서리">악세서리</option>
							<option value="악기">악기</option>
							<option value="신발">신발</option>
							<option value="스포츠 용품">스포츠 용품</option>
							<option value="장난감">장난감</option>
					</select></td>
					<td rowspan="2"><div id="buttons">
				<input id="button" type="submit" value="등록" style="border-top:0px;border-left:0px;border-bottom:0px;" ><input id="button" type="button" value="취소"
					onclick="location.href='mainpage'" style="border:0px;">
			</div></td>
				</tr>
				<tr id="subject">
					<td class="col1" style="text-align: center;">거래목적</td>
					<td class="col1">구매<input type="radio" name="trade" value="1" checked>&nbsp;&nbsp;&nbsp;판매<input
						type="radio" name="trade" value="0"></td>
				</tr>
				<tr id="subject">
					<td class="col1" style="text-align: center;">가격</td>
					<td class="col1" colspan="2"><input type="text" name="price"
						style="width: 700px;height:25px;"></td>
				</tr>

				<tr id="subject">
					<td class="col1" style="text-align: center;">아이디</td>
					<td class="col1" colspan="2"><input type="text" name="id"
						style="width: 700px;height:25px;" value="${MemberDto.id}" readonly></td>
				</tr>
				<tr id="subject">
					<td class="col1" style="text-align: center;">제목</td>
					<td class="col1" colspan="2"><input type="text" name="title" id = "title"
						style="width: 700px;height:25px;"></td>
				</tr>
				<tr id="content">
					<td class="col1" style="text-align: center;">내용</td>
					<td class="col1" colspan="2"><textarea name="content"
							style="width: 700px; height: 350px; resize: none"></textarea></td>
				</tr>



				<tr id="upload">
					<td class="col1" style="text-align: center;">업로드 파일</td>

					<td class="col1" colspan="2"><input type="file" name="uploadFiles"></td>
				</tr>

			</table>
	</div>
	</form>
</body>
</html>