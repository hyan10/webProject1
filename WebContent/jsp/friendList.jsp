<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구목록</title>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

	$(document).ready(function(){
		$('#selectBtn').click(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/jsp/selectFriend.jsp",
				type: "post",
				data: {"friendId": $('.friendId').val()},
				success: callback
			})
		})
	})
	
	function callback(data){
		console.dir(data);
		var friend = JSON.parse(data);
		$('#friendId').text(friend.friendId);
		$('#friendName').text(friend.friendName);
		var inputNo = document.getElementById('friendNo')
		inputNo.value = friend.friendNo;
		//$('#friendNo').val(friend.friendNo);
	}

/* 	window.onload = function(){
		$('#selectForm').hide();
	} */

	function update(no,id,name){
	//	$('#no').val(no);
		var input_no = document.getElementById("send_friendNo");
		var input_name = document.getElementById("send_friendName");
		var input_id = document.getElementById("send_friendId");
		input_no.value = no;
		input_name.value = name;
		input_id.text = id;
		console.log(input_no.value);
		alert(input_name.value+" "+input_id.text);
	}
	
	/* function insert(no){
		var input_no = document.getElementById("insert_friendNo");
		input_no.value = no;
		alert(input_no.value);
	} */
	
	function checkAdd(){
		return confirm('친구 목록에 추가하시겠습니까?');
	}
	
	function showSelectForm(){
		$('#selectForm').show();
	}
	
<%-- 	$(function(){
		$('#requestButton').click(function(){
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");
			modalContents.text("아래의 내용을 확인하고 쪼르세요");
	        var id = $(this).parent().parent().find('#id').text();
	        var name = $(this).parent().parent().find('#name').text();
	        var url = "<%=request.getContextPath()%>/jsp/requestMoneyModal.jsp?id="+"abc" +"&name=" + "ccc"+"&friendNo="+$(this).attr("name");
	        $('div.modal').modal({
	        	'remote' : url
	        });
		});
	}); --%>

	
</script>
</head>
<body>

	<a class="btn" data-toggle="modal" data-target="#insertFriend">추가</a>
	<input type="button" value="추가" onclick="showSelectForm()" />


	<table border="1">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th></th>
			<th></th>
		</tr>

		<c:forEach var="friend" items="${friendList}">
			<tr>
				<td><span id="id">${friend.id}</span></td>
				<td><span id="name">${friend.name}</span></td>
<%-- 				<td><input type="button" value="송금"
					onclick="update(${friend.no})" /></td>
				<td><input type="button" value="쪼기" onclick="" /></td> --%>
				<td><a class="btn" data-toggle="modal" data-target="#sendMoney" onclick="update('${friend.no}','${friend.id}','${friend.name}')">송금</a></td>
				<td><button type="button" id="requestButton" name="${friend.no}">쪼기</button></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<!-- 모달창 -->
      <div class="modal fade" id="defaultModal">
          <div class="modal-dialog">
              <div class="modal-content">
              </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
      <!--// 모달창 -->
	<!-- 송금 -->
	<%-- <form action="<%=request.getContextPath()%>/sendMoney.do"
		name="updateForm" method="post">
		<input type="hidden" id="no" name="no" />
		 코멘트 <input type="text"	name="comments" /><br />
		 얼마  <input type="text" name="money" />
	</form> --%>
	<br />
<%-- 	<form action="<%=request.getContextPath()%>/selectFriend.do"
		id="selectForm" name="selectForm" method="post">
		친구id 입력
		 <input type="text" name="friendId" /><br />
		 <input	type="submit" value="검색" />
	</form> --%>

	<%-- <c:if test="${not empty friend}">
		<form action="<%=request.getContextPath()%>/insertFriend.do"
			method="post" onsubmit="return checkAdd()">
			검색된 친구<br /> 아이디: ${friend.id}<br />
			이름: ${friend.name}
			<input type="hidden" name="friendNo" value="${friend.no}" />
			<input type="submit" value="추가" />
		</form>
	</c:if> --%>
</body>
</html>
<!-- 모달창 -->
<%-- <div class="modal fade" id="insertFriend">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">친구 검색</h4>
			</div>

			<div class="modal-body">
				<p class="modal-contents"></p>
				
					<div class="form-group" name="friendId">
						<label for="inputId" class="col-lg-4 control-label">친구 ID</label>
						<div class="col-lg-5">
							<input type="text" class="form-control friendId"
								name="friendId" maxlength="10">
							<input type="button" id="selectBtn" value="검색"/>
						</div>
					</div>
			
				<div class="form-group">
				<form class="form-horizontal" name="selectForm" role="form"
					method="post" action="<%=request.getContextPath()%>/insertFriend.do">
					결과 나올 곳<br/>
					아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름<br/>
					<span id="friendId"></span>&nbsp;
					<span id="friendName"></span>&nbsp;
					<input type="hidden" id="friendNo" name="friendNo"/>
					<input type="submit" value="추가"/>
				</form>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!--// 모달창 --> --%>

<%@include file="/include/selectFriendModal.jsp" %>
<%@include file="/include/sendModal.jsp" %>