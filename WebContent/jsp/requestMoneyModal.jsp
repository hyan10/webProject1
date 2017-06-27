<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
 	function submit(){
 		document.requestMoneyForm.submit();
 	}
 </script>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">×</button>
	<h4 class="modal-title">친구에게 돈 쪼르기</h4>
</div>
<div class="modal-body">
	<p class="modal-contents"></p>
	<form class="form-horizontal" name="requestMoneyForm" role="form"
		method="post" action="<%= request.getContextPath() %>/insertDeal.do">
		<input type="hidden" id="friendNo" name="friendNo" value="${param.friendNo }"/>
		<div class="form-group">
			<label for="inputId" class="col-lg-4 control-label">보낼 친구 이름</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="friendName"
					name="sendMoney" maxlength="10" value="${ param.name }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputId" class="col-lg-4 control-label">친구 ID</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="friendId"
					name="sendComments" maxlength="10" value="${ param.id }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputId" class="col-lg-4 control-label">쪼르기 내용</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="sendComments"
					name="comments" placeholder="받을 내용 입력" maxlength="10">
			</div>
		</div>
		<div class="form-group">
			<label for="inputId" class="col-lg-4 control-label">보낼 금액</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="sendMoney"
					name="money" placeholder="받을 돈 입력" maxlength="10">
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="submit()">전송</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>

