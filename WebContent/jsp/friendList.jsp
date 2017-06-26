<%@page import="kr.co.bit.project.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.bit.project.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>친구목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th></th>
		</tr>
		
 	 	<c:forEach var="member" items="${requestScope.list}">
			<tr>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td><input type="button" value="송금"/></td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>