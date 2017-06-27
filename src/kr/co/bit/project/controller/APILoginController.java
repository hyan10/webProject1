package kr.co.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.project.dao.MemberDAO;
import kr.co.bit.project.vo.Member;

public class APILoginController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		MemberDAO dao = new MemberDAO();
		Member member = new Member();
			
		member.setId(request.getParameter("memberId"));
		member.setName(request.getParameter("memberName"));
		
		System.out.println(request.getParameter("memberId"));
		System.out.println(request.getParameter("memberName"));
		
		Member loginUser = dao.selectById(member.getId());
		
		if(loginUser!=null){
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
		session.setAttribute("loginUser", loginUser);
		
		System.out.println((Member)session.getAttribute("loginUser"));
		
		
		////////////////////////// ���� �������� �̵�
		return "/jsp/apiLogin.jsp";
	//	return request.getContextPath();
	}

}
