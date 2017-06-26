package kr.co.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.MemberVO;

public class APILoginController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();
			
		member.setId(request.getParameter("memberId"));
		member.setName(request.getParameter("memberName"));
		
		System.out.println(request.getParameter("memberId"));
		System.out.println(request.getParameter("memberName"));
		
		MemberVO memberVO = dao.selectById(member.getId());
		
		if(memberVO!=null){
			System.out.println("기존 회원");
		}else {
			System.out.println("새로운 회원");
			if(dao.insert(member)){
				System.out.println("추가 성공");
			}else{
				System.out.println("추가 실패");
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("member", memberVO);
		
		System.out.println((MemberVO)session.getAttribute("member"));
		
		
		////////////////////////// 메인 페이지로 이동
		return "/jsp/apiLogin.jsp";
	//	return request.getContextPath();
	}

}
