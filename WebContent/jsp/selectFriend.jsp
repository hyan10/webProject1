<%@page import="kr.co.bit.project.vo.Member"%>
<%@page import="kr.co.bit.project.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		
		String friendId = request.getParameter("friendId");
		
		System.out.println(friendId);
		
		MemberDAO dao = new MemberDAO();
		Member friend = dao.selectById(friendId);
		
		request.setAttribute("friend", friend);
%>
{"friendId":"${friend.id}", "friendName":"${friend.name}", "friendNo":"${friend.no}"}