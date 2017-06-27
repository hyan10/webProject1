<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모달창 -->
<div class="modal fade" id="insertFriend">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">친구 검색</h4>
			</div>

			<div class="modal-body">
				<p class="modal-contents"></p>
				
				<div class="form-group">
					<label for="inputId" class="col-lg-4 control-label">친구 검색 ID</label>
					<div class="col-lg-5">
						<input type="text" class="form-control friendId"
							name="friendId" maxlength="40" placeholder="친구 ID 입력">
							<input type="button" id="selectBtn" value="검색"/>
					</div>
					<form class="form-horizontal" name="selectForm" role="form"
						method="post" action="<%=request.getContextPath()%>/insertFriend.do">
						<label for="inputId" class="col-lg-4 control-label">결과 나올 곳</label>
						<label for="inputId" class="col-lg-4 control-label">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름</label>
			
						<div class="form-group">
							<span id="friendId"></span>&nbsp;
							<span id="friendName"></span>&nbsp;
						</div>
		
						<div class="col-lg-5">
							<input type="hidden" id="friendNo" name="friendNo"/>
							<input type="submit" value="추가"/>
						</div>
					</form>
				</div>
				
				
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!--// 모달창 -->