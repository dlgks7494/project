<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 본문</title>
<style>
#info {
	border: 0px;
	border-top: 2px solid;
}

#but {
	background: none;
	width: 120px;
	height: 50px;
	transition-duration: 0.4s;
}

#but:hover {
	font-weight: bold;
	color: white;
	background-color: black;
}

.col2 {
	padding-top: 0px;
	padding-left: 1200px;
	position: absolute;
}
</style>
</head>
<body bgcolor="#F4F2F3">
<img src="${pageContext.request.contextPath }/resources/img/joong.png"
		style="width: 5%; height: 9%; position: absolute; padding-left: 5%;">
	<form action="replyOk">
		<div class="col2">
			<input id="but" class="button" type="button" value="글쓰기"
				onclick="location.href='board_write'"
				style="border-top: 0px; border-left: 0px; border-bottom: 0px;"><input
				id="but" type="button" value="이전창으로" onclick="history.go(-1)"
				style="border: 0px;">
		</div>
		<div style="margin-left: 15%; width: 70%">
			<div>
				<h2 style = "padding-bottom:6px;padding-top:6px;">
					<span style="display: inline-block; width: 52%;">제목:
						${fbView.title }</span>
				</h2>
				<hr id="info">
				<span>글쓴이 : ${fbView.id } |거래 장소:${fbView.address } |게시일 :
					${fbView.pdate }</span>
				<hr id="info">

				<span>가격 : ${fbView.price }<span><script>
					var abc = ${fbView.price};
					var abcTrue = isNumber(abc);
					if (abcTrue == true) {
						document.write("₩");
					}

					function isNumber(s) {
						s += ''; // 문자열로 변환
						s = s.replace(/^\s*|\s*$/g, ''); // 좌우 공백 제거
						if (s == '' || isNaN(s))
							return false;
						return true;
					}
				</script></span></span>
				<hr id="info">
			</div>
			<p>내용</p>
			<hr>
			<p>
				<textarea name="content"
					style="width: 1000px; height: 350px; resize: none; background-color: #F4F2F3; border: none;"
					readonly="readonly"> ${fbView.content }</textarea>
			</p>




			<hr id="info">
			<c:if
				test="${fileDto.fileextension  == 'jpg' or fileDto.fileextension  == 'gif' or fileDto.fileextension  == 'png' or fileDto.fileextension  == 'bmp'}">

				<p>

					<img
						src="${pageContext.request.contextPath }/resources/uploadfiles/${fileDto.filename}">
				</p>

			</c:if>
			<br>
			<p id="file_info">

				<a
					href="${pageContext.request.contextPath }/resources/uploadfiles/${fileDto.filename}"
					style="text-decoration: none; color: #2a557f;"> <span
					class="file_info">※ 첨부파일 : ${fileDto.orifilename}</span></a>
			</p>

			<hr id="info">
			<!-- 해당 글의 댓글 리스트 출력 -->

			<table cellpadding="0" cellspacing="0" width="750">
				<c:forEach items="${rblist }" var="rbdto">
					<tr>
						<td>댓글쓴이 : ${rbdto.rbid }</td>
					</tr>
					<tr>
						<td>${rbdto.rbcontent }</td>
					</tr>
					<tr>
						<td>댓글게시일 : ${rbdto.rbdate }
							<hr>
						</td>

					</tr>

				</c:forEach>
			</table>


			<div id="comment_box">

				<input type="hidden" name="boardnum" value="${fbView.num }">
				<table>
					<tr>
						<td><textarea name="rbcontent"
								style="width: 500px; height: 50px;"></textarea></td>
						<td><input type="submit" id="ok_ripple" value="등록"
							style="width: 120px; height: 50px;"></td>
					</tr>
				</table>

			</div>


		</div>

	</form>
</body>
</html>