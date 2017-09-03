<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일업로드 성공</h2>
		
	<c:forEach begin="0" end="${returnObject.files.size()-1}" var="i">
		<p>
		원본파일명${i} : ${returnObject.files[i].origName}
		<br/>
		저정된파일명${i} : ${returnObject.files[i].sfile}
		</p>
	</c:forEach>

</body>
</html>