<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="articleWrite.do" method="post">
			<p>
				제목:<br/><input type="text" name="title" value="${param.title }"/>
				<c:if test="${errors.title }">제목을 입력하세요.</c:if>
			</p>
			<p>
				내용:<br/>
				<textarea rows="5" cols="30" name="content">${param.content }</textarea>
			</p>
			<input type="submit" value="새 글 등록"/>
		</form>
	</body>
</html>