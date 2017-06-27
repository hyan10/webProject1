package kr.co.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.Member;

public class InsertFriendController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		int memberNo = 0;
		
		System.out.println(member);

		if(member!=null){
			memberNo = member.getNo();
			String s_friendNo = request.getParameter("friendNo");
			
			if(s_friendNo !=null && !s_friendNo.equals("")){
				int friendNo = Integer.parseInt(s_friendNo);
				MemberDAO dao = new MemberDAO();
				
				if(dao.insertFriend(memberNo, friendNo)){
					System.out.println("친구 추가 완료");
				}else{
					System.out.println("친구 추가 실패");
				}
			}
		}
		
		
		return "/jsp/apiLogin.jsp";
	}
	
}
