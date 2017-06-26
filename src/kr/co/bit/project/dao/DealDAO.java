package kr.co.bit.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.bit.project.util.ConnectionFactory;
import kr.co.bit.project.vo.Deal;

public class DealDAO {
	public boolean insert(Deal deal){
		boolean result = false;
		
		System.out.println(deal.getComments());
		
		/*
		t_deal_history
		(
		    no             NUMBER           NOT NULL, 
		    sender_no      NUMBER           NOT NULL, 
		    receiver_no    NUMBER           NOT NULL, 
		    money          NUMBER           NOT NULL, 
		    start_date     DATE             NOT NULL, 
		    end_date       DATE             NOT NULL, 
		    comments        VARCHAR2(100)    NOT NULL, 
	    )*/
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_deal_history values ");
		sql.append(" (t_deal_history_seq.nextVal,?,?,?,sysdate,sysdate,?)");
		
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement st = conn.prepareStatement(sql.toString());
		){
			int loc = 1;
			st.setInt(loc++, deal.getSenderNo());
			st.setInt(loc++, deal.getReceiverNo());
			st.setInt(loc++, deal.getMoney());
		/*	st.setString(loc++, deal.getStartDate());
			st.setString(loc++, deal.getEndDate());*/
			st.setString(loc++, deal.getComments());
			
			System.out.println(st);
			
			if(st.executeUpdate()>0){
				result = true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
}
