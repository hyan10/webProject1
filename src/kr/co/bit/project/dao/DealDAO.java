package kr.co.bit.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.bit.project.util.ConnectionFactory;
import kr.co.bit.project.vo.Deal;

public class DealDAO {
	
	/**
	 * 
	 * @param deal
	 * @param flag  1: 바로 송금, 2: 쪼기 후 완료된 데이터
	 * @return
	 */
	public boolean insert(Deal deal, int flag){
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
		sql.append(" (t_deal_history_seq.nextVal,?,?,?,");
		
		switch (flag) {
			case 1:
				// 바로 송금 시 시작 날짜는 현재 시간
				sql.append("sysdate");
				break;
				
			case 2:
				// 완료된 데이터로 이동 시 시작 날짜는 받아오기
				sql.append("?");
				break;	
		}
		
		sql.append(",sysdate,?)");
		
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement st = conn.prepareStatement(sql.toString());
		){
			int loc = 1;
			st.setInt(loc++, deal.getSenderNo());
			st.setInt(loc++, deal.getReceiverNo());
			st.setInt(loc++, deal.getMoney());
			
			switch (flag) {
			case 2:
				// 완료된 데이터로 이동 시 시작 날짜를 받아온다.
				st.setString(loc++, deal.getStartDate());
				break;	
			}

			st.setString(loc++, deal.getComments());
			
			if(st.executeUpdate()>0){
				result = true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void insertDeal(int friendNo, int receiverNo, int money, String comments){
		String sql = "insert into t_deal_list(no, comments, sender_no, receiver_no, money, start_date) "
				+ " values(t_deal_list_seq.nextval, ?, ?, ?, ?, sysdate)";
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);			
		){
			int loc = 1;
			pstmt.setString(loc++, comments);
			pstmt.setInt(loc++, friendNo);
			pstmt.setInt(loc++, receiverNo);
			pstmt.setInt(loc++, money);
			pstmt.executeUpdate();
			System.out.println("insert �꽦怨�");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
