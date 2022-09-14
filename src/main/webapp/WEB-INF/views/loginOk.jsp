<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<table width="75%" cellspacing="0" border="0" cellpadding="20">
						<tr>
					<td bgcolor="#F4F2F3" align="center">
						<table id="tablesty2" >
								<tr><img src="${pageContext.request.contextPath }/resources/img/joong.png"></tr>
								<br>
		<tr>

				<tr height="534">
					<td bgcolor="#4375DB" align="center">						 
						
						<c:choose>
						<c:when test="${checkId == '0'}">
							<script type="text/javascript">
								alert("입력하신 아이디는 존재하지 않는 아이디입니다. 다시 확인해주세요.");
								history.go(-1);								
							</script>						
						</c:when>						
						<c:when test="${checkIdPw == '0' }">
							<script type="text/javascript">
								alert("입력하신 비밀번호가 맞지 않습니다. 다시 확인해주세요.");
								history.go(-1);								
							</script>
						</c:when>						
						<c:otherwise>
						<script type="text/javascript">					
								location.href = "/mainpage";
								</script>
						</c:otherwise>						
						</c:choose>
						
							
						
						
					</td>					
				</tr>				
			</table>		
		</tr>
		</td>
		</tr>
	</table>
</body>
</html>