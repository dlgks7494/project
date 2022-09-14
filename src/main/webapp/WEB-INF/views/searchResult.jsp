<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
	<c:choose>
		<c:when test="${checkWriter == '1'}">
			<script type="text/javascript">
				alert("닉네임 ${searchKeyword}(으)로 검색한 결과가 없습니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${checkContent == '1'}">
			<script type="text/javascript">
				alert("내용 ${searchKeyword}(으)로 검색한 결과가 없습니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${checkTitle == '1'}">
			<script type="text/javascript">
				alert("제목 ${searchKeyword}(으)로 검색한 결과가 없습니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${titleCheck == '1'}">
			<script type="text/javascript">
				alert("제목이 없습니다.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>