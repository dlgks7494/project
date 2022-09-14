<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 확인</title>
</head>
<body>
	
	<c:choose>
		<c:when test="${checkPwPw == '1'}">
			<c:choose>
				<c:when test="${checkPw == '0'}">
					<script type="text/javascript">
						alert("${MemberDto.id }님의 정보가 수정되었습니다.");

						location.href = "/mainpage";
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
				alert("현재 비밀번호와 동일합니다.");//경고창 띄우기
				history.go(-1);//이전페이지로 돌려보냄
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>