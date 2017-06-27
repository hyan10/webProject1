package kr.co.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.Member;

public class SelectFriendController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String friendId = request.getParameter("friendId");
		
		MemberDAO dao = new MemberDAO();
		Member friend = dao.selectById(friendId);
		
		request.setAttribute("friend", friend);
		
		return "/jsp/friendList.jsp";
	}

}
