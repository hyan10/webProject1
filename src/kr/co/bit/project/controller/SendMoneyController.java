package kr.co.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.DealDAO;
import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.Deal;
import kr.co.bit.project.vo.MemberVO;

public class SendMoneyController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String s_no = request.getParameter("no");
		String s_money = request.getParameter("money");
		String comments = request.getParameter("comments");
		int receiverNo = 0, money = 0;
		
		if(s_no!=null || !s_no.equals("")){
			receiverNo = Integer.parseInt(s_no);
			
			if(s_money!=null || !s_money.equals("")){
				money = Integer.parseInt(s_money);
				
				MemberDAO dao = new MemberDAO();
				int senderNo = ((MemberVO)session.getAttribute("member")).getNo();
				
				// 내 돈에서 출금 처리
				if(dao.updateMoney(false, senderNo, money)){
					System.out.println("출금 완료");
					
					// 친구 입금 처리
					if(dao.updateMoney(true, receiverNo, money)){
						System.out.println("송금 완료");
						
						DealDAO d_dao = new DealDAO();
						Deal deal = new Deal();
						deal.setReceiverNo(receiverNo);
						deal.setSenderNo(senderNo);
						deal.setMoney(money);
						/*deal.setStartDate("sysdate");
						deal.setEndDate("sysdate");*/
						deal.setComments(comments);
						System.out.println(comments);
						if(d_dao.insert(deal)){
							System.out.println("거래 내역에 추가됨");
						}
					}
				}
			}
		}
		
		return "/jsp/friendList.jsp";
	}

}
