<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(function(){
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");
		$('#requestButton').click(function(){
			modalContents.text("아래의 내용을 확인하고 쪼르세요");
	        var id = $(this).parent().parent().find('#id').text();
	        var name = $(this).parent().parent().find('#name').text();
	        var url = "requestMoneyModal.jsp?id="+id +"&name=" + name;
	        $('div.modal').modal({
	        	'remote' : url
	        });
		});
	});
	function showModal(friendNo){
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");
		modalContents.text("아래의 내용을 확인하고 쪼르세요");
        //modal.modal('show');
        var id = $(this).parent().parent().find('#id').text();
        var name = $(this).parent().parent().find('#name').text();
        var url = "requestMoneyModal.jsp?id="+id +"&name=" + name;
        $('div.modal').modal({
        	'remote' : url
        });
	}
	
	function insert(no){
		var input_no = document.getElementById("send_friendNo");
		input_no.value = no;
		alert(input_no.value);
	}
</script>
</head>
<body>
	  <table>
	  <tr>
	  	<th>이름</th>
	  	<th>아이디</th>
	  </tr>
	  <tr>
	  	<td id="name">옵티머스프라임</td>
	  	<td id="id">오토봇</td>
	  	<td><button type="button">송금</button></td>
	  	<td><button type="button" id="requestButton" name="requestButton">쪼기</button></td>
	  </tr>
	  </table>
      <!-- 모달창 -->
      <div class="modal fade" id="defaultModal">
          <div class="modal-dialog">
              <div class="modal-content">
              </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
      <!--// 모달창 -->
</body>
</html>