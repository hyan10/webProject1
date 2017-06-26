package kr.co.bit.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.MemberVO;

public class FriendListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String s_no = (String) session.getAttribute("no");

		if (s_no != null) {
			int no = Integer.parseInt((String) session.getAttribute("no"));
			// List<MemberVO> list = dao.friendList(no);
		}
		
		///////////// test 1¹ø ¸â¹ö
		List<MemberVO> list = dao.friendList(1);
		request.setAttribute("list", list);

		return "/jsp/friendList.jsp";
	}

}
