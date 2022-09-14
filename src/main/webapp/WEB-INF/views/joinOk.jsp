<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
	<table width="75%" cellspacing="0" border="0" cellpadding="20">
		<tr>
			<td bgcolor="#F4F2F3" align="center">
				<table id="tablesty2">
					<tr>
						<img
							src="${pageContext.request.contextPath }/resources/img/joong.png">
					</tr>
					<br>
					<tr>
					<tr height="534">
						<td bgcolor="#4375DB" align="center"><c:choose>
								<c:when test="${checkId == '0'}">
									<c:choose>
										<c:when test="${checkPw == '0'}">
											<script type="text/javascript">
												alert("${mname }님 회원가입을 축하드립니다.\n가입하신 아이디는 ${mid }입니다.");

												location.href = "/login";
											</script>
										</c:when>
										<c:otherwise>
											<script type="text/javascript">
												alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. ");
												history.go(-1);
											</script>
										</c:otherwise>
									</c:choose>

								</c:when>


								<c:otherwise>
									<script type="text/javascript">
										alert("가입하시려는 아이디는 이미 사용중입니다! 다른 아이디를 입력하세요.");//경고창 띄우기
										history.go(-1);//이전페이지로 돌려보냄
									</script>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
		</tr>
		</td>
		</tr>
	</table>
</body>
</html>