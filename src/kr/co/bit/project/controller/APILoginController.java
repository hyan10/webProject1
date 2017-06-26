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
		
		if(dao.selectById(member.getId())){
			System.out.println("���� ȸ��");
		}else {
			System.out.println("���ο� ȸ��");
			if(dao.insert(member)){
				System.out.println("�߰� ����");
			}else{
				System.out.println("�߰� ����");
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		
		System.out.println((MemberVO)session.getAttribute("member"));
		
		return "/jsp/APILogin.jsp";
	}

}