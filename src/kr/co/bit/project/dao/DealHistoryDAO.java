package kr.co.bit.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.project.util.DBUtil;
import kr.co.bit.project.vo.DealHistory;


public class DealHistoryDAO {

	private static final int PAGE_CNT = 12;
	
	/**
	 * 회원의 완료된 거래내역을 모두 조회합니다.
	 * @param memberNo
	 * @return
	 */
	public List<DealHistory> selectAll(int memberNo, int pageNum){
		List<DealHistory> dealHistories = new ArrayList<DealHistory>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT NO, ");
		sql.append(" (SELECT ID FROM T_MEMBER M WHERE SENDER_NO = M.NO) AS SENDER_ID, ");
		sql.append(" (SELECT ID FROM T_MEMBER M WHERE RECEIVER_NO = M.NO) AS RECEIVER_ID, ");
		sql.append(" MONEY, START_DATE, END_DATE, COMMENTS ");
		sql.append(" FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM T_DEAL_HISTORY WHERE SENDER_NO = ? OR RECEIVER_NO = ? ORDER BY END_DATE DESC) A) "); 
		sql.append(" WHERE RN BETWEEN ? AND ?");

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql.toString());) {

			pst.setInt(1, memberNo);
			pst.setInt(2, memberNo);
			pst.setInt(3, PAGE_CNT * (pageNum - 1) + 1);
			pst.setInt(4, PAGE_CNT * (pageNum));
			
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				DealHistory dealHistory = new DealHistory();
				dealHistory.setNo(rs.getInt("NO"));
				dealHistory.setSenderId(rs.getString("SENDER_ID"));
				dealHistory.setReceiverId(rs.getString("RECEIVER_ID"));
				dealHistory.setMoney(rs.getInt("MONEY"));
				dealHistory.setStartDate(rs.getString("START_DATE"));
				dealHistory.setEndDate(rs.getString("END_DATE"));
				dealHistory.setComments(rs.getString("COMMENTS"));
				dealHistories.add(dealHistory);
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return dealHistories;
	}
	
	/**
	 * 
	 * @param memberNo
	 * @return
	 */
	public int selectMaxCount(int memberNo){
		int count = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT COUNT(*) AS MAXCOUNT FROM T_DEAL_HISTORY WHERE SENDER_NO = ? OR RECEIVER_NO = ? ");

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql.toString());) {
			pst.setInt(1, memberNo);
			pst.setInt(2, memberNo);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				count = rs.getInt("MAXCOUNT");
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return count;
	}
	
}
