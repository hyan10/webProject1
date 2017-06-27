package kr.co.bit.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.Member;

public class FriendListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		
		List<Member> list = new ArrayList<>();

		if (member != null) {
			 list = dao.friendList(member.getNo());
		}
		
		System.out.println(member);
		
		///////////// test 1¹ø ¸â¹ö
	//	list = dao.friendList(1);
		request.setAttribute("friendList", list);

		return "/jsp/friendList.jsp";
	}

}
