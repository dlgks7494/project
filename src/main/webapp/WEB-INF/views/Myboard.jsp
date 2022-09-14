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
<title>내 메뉴</title>

</head>

<body bgcolor="#F4F2F3">
	<img src="${pageContext.request.contextPath }/resources/img/joong.png" style="width:5%; height:9%; position: absolute; padding-left:5%;">
	<div class="col2">
		<input id = "but" class="button" type="button" value="내 정보"
			onclick="location.href='infoModify'"
			style="border-top:0px;border-left:0px;border-bottom:0px;"  ><input id = "but" class="button"
			type="button" value="글작성" onclick="location.href='board_write'"
			style="border-top:0px;border-left:0px;border-bottom:0px;"><input id = "but" class="button"
			type="button" value="메인페이지" onclick="location.href='mainpage'"
			style="border:0px;">

	</div>
	<div align="center">
		<h2>내가 쓴 글</h2>
		<div id="total_search">
			<div id="total">▷ 총 ${listCount }개의 게시물이 있습니다.</div>
			<hr>

			<table>
				<tr>
					<td></td>
					<td width=50; style="font-weight: bold">번호
						<hr>
					</td>
					<td width=50; style="font-weight: bold">유형
						<hr>
					</td>
					<td width=425; style="font-weight: bold; text-align: center">제목
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
					<td style="font-weight: bold" width=75;>거래상태
						<hr>
					</td>
					<td style="font-weight: bold">거래완료
						<hr>
					</td>

				</tr>



				<c:forEach items="${fblist}" var="fbdto">
					<tr>
						<form action="MyboardOk" method="post">
							<td></td>
							<td class="col1"><input type="hidden" value="${fbdto.num}"
								name="fbnum">${fbdto.num}</td>
							<td><script>
								var abc = "ㅁㄴㅇㄹ";
								if(${fbdto.trade } == 0){
									abc = "판매";
									}
									else{
										abc = "구매";
									}
								document.write(abc);
								</script></td>
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
							<td><input type="hidden" value="${fbdto.complete}"
								name="fbcom"> <script>
								var abc = "거래 전";
								if(${fbdto.complete} ==0){
									abc = "거래 전";
								}
								else{
									abc = "거래완료";
								}
								document.write(abc);
							</script></td>

							<td><input type="submit" value="거래완료"
								onclick="location.href='MyboardOk'"></td>
						</form>
					</tr>


				</c:forEach>

			</table>

			<div id="buttons">
				<!-- 
      <div class="col1">◀ 이전 1 다음 ▶</div>
       -->

			</div>
			<!-- section main -->
		</div>
	</div>
</body>
</html>