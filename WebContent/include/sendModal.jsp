<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function send(){
		document.sendMoneyForm.submit();
	}
</script>    
<div class="modal fade" id="sendMoney">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">송금하기</h4>
			</div>
			
			<div class="modal-body">
			<span id="send_friendName1"></span>
				<p class="modal-contents"></p>
				<form class="form-horizontal" name="sendMoneyForm" role="form"
					method="post" action="<%=request.getContextPath()%>/sendMoney.do">
					<div class="form-group" id="div_friendName" name="friendName">
						<label for="inputId" class="col-lg-4 control-label">보낼 친구 이름</label>
						<div class="col-lg-5">
							<input type="text" id="send_friendName" class="form-control" readonly="readonly"></input>							
						</div>
					</div>
					<div class="form-group" id="div_friendID" name="friendID">
						<label for="inputId" class="col-lg-4 control-label">친구 ID</label>
						<div class="col-lg-5">
							<span id="send_friendId"></span>
						</div>
					</div>
					<input type="hidden" id="send_friendNo" name="friendNo"/>
					<div class="form-group" id="div_comments" name="div_comments">
						<label for="inputId" class="col-lg-4 control-label">쪼르기 내용</label>
						<div class="col-lg-5">
							<input type="text" class="form-control" id="comments"
								name="comments" placeholder="받을 내용 입력" maxlength="10">
						</div>
					</div>
					<div class="form-group" id="div_money" name="div_money">
						<label for="inputId" class="col-lg-4 control-label">보낼 금액</label>
						<div class="col-lg-5">
							<input type="text" class="form-control" id="money"
								name="money" placeholder="받을 돈 입력" maxlength="10">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="send()">전송</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
