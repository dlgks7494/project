<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.col2 {
	padding-top: 0px;
	padding-left: 1200px;
	position: absolute;
}
#but{
	background:none;
	width: 120px; height: 50px;
	transition-duration: 0.4s;
}
#but:hover{
	font-weight: bold;
	color : white;
	background-color: black;
}
</style>
<meta charset="UTF-8">

<title>판매 희망</title>
</head>
<body bgcolor="#F4F2F3">
	<img src="${pageContext.request.contextPath }/resources/img/joong.png"
		style="width: 5%; height: 9%; position: absolute; padding-left: 5%;">
	<div class="col2">
		<input id = "but" type="button" value="구매희망"
			onclick="location.href='board_view'"
			style="border-top:0px;border-left:0px;border-bottom:0px;"><input id = "but" 
			type="button" value="글작성" onclick="location.href='board_write'"
			style="border-top:0px;border-left:0px;border-bottom:0px;"><input id = "but" 
			type="button" value="메인페이지" onclick="location.href='mainpage'"
			style="border:0px;">
	</div>

	<div align="center" style = "height: 700px;">
		<h2>판매 희망</h2>
		<div>
			<div id="total">▷ 총 ${listCount }개의 게시물이 있습니다.</div>

			<table>
				<tr>
					<td width=50; style="font-weight: bold">번호
						<hr>
					</td>
					<td width=500; style="font-weight: bold; text-align: center">제목
						<hr>
					</td>
					<td width=100; style="font-weight: bold">가격
						<hr>
					</td>
					<td width=100; style="font-weight: bold">글쓴이
						<hr>
					</td>
					<td width=100; style="font-weight: bold">거래지역
						<hr>
					</td>
					<td style="font-weight: bold">등록날짜
						<hr>
					</td>
				</tr>
				<hr>


				<c:forEach items="${fblist}" var="fbdto">
					<tr>

						<td class="col1">${fbdto.num }</td>
						<td><a href="board_views?fbnum=${fbdto.num }"
							style="text-decoration: none; color: #2a557f;">${fbdto.title }</a>
						</td>
						<td>${fbdto.price }<span><script>
								var abc = ${fbdto.price};
								var abcTrue = isNumber(abc);
								if(abcTrue == true){
									document.write("₩");
								}
								
								function isNumber(s) {
									  s += ''; // 문자열로 변환
									  s = s.replace(/^\s*|\s*$/g, ''); // 좌우 공백 제거
									  if (s == '' || isNaN(s)) return false;
									  return true;
									}
							</script></span></td>
						<td>${fbdto.id }</td>
						<td>${fbdto.address }</td>
						<td>${fbdto.pdate }</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
	<form action="board_sell">
	<div id="search_select" align="center">
		<select name="searchOption">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">판매자</option>
		</select> <input type="text" name="searchKeyword" style="width: 300px;">
		<input type="submit" value="검색">
	</div>
	</form>
	<!-- section main -->
</body>
</html>