package kr.co.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.project.dao.MemberDAO;

public class AddMoneyController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String s_no = (String)request.getParameter("no");
		String s_money = (String)request.getParameter("money");
		int no = 0,  money = 0;
		
		System.out.println(s_no);
		System.out.println(s_money);
		
		if(s_no != null || !s_no.equals("")){
			
			no = Integer.parseInt(s_no);
			
			if(s_money!=null){
				money = Integer.parseInt(s_money);
				MemberDAO dao_m = new MemberDAO();
				dao_m.updateMoney(true, no, money);
			}
		}
		
		return request.getContextPath();
	}

}
