<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>친구목록</title>
<script>
	function update(no){
	//	$('#no').val(no);
		var input_no = document.getElementById("no");
		input_no.value = no;
		console.log(input_no.value);
		document.form.submit();
	}
	
	function add(){
		location.href = "<%=request.getContextPath()%>/insertFriend.do";
	}
</script>
</head>
<body>
	<input type="button" value="추가" onclick="add()"/>
	
	<table border="1">
		<tr> 
			<th>ID</th>
			<th>이름</th>
			<th></th>
			<th></th>
		</tr>
		
 	 	<c:forEach var="member" items="${requestScope.list}">
			<tr>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td><input type="button" value="송금" onclick="update(${member.no})"/></td>
				<td><input type="button" value="쪼기" onclick=""/></td>
			</tr>
		</c:forEach>		
	</table>
		<form action="<%=request.getContextPath()%>/sendMoney.do" name="form" method="post">
			<input type="hidden" id="no" name="no"/>
			<input type="text" name="comments"/>
			<input type="text" name="money"/>
		</form>
</body>
</html>