package kr.co.bit.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.DealDAO;
import kr.co.bit.project.vo.Member;



public class InsertDealController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		Member member = (Member)session.getAttribute("loginUser");
		int friendNo = Integer.parseInt(request.getParameter("friendNo"));
		int receiverNo = member.getNo();
		int money = Integer.parseInt(request.getParameter("money"));
		String comments = request.getParameter("comments");
		
		DealDAO dao = new DealDAO();
		dao.insertDeal(friendNo, receiverNo, money, comments);
		System.out.println("뭐야 ");
		return "/jsp/friendList.jsp";
	}
	
}
