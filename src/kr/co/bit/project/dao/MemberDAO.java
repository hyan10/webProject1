package kr.co.bit.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.project.util.ConnectionFactory;
import kr.co.bit.project.vo.MemberVO;

public class MemberDAO {

	public List<MemberVO> friendList(int memberNo){
		List<MemberVO> list = new ArrayList<>();
	
		StringBuilder sql = new StringBuilder();
		sql.append("select * from t_member where no in ");
		sql.append(" (select friend_no from t_friend ");
		sql.append(" where member_no=?)");
		
		try(
				Connection conn = new ConnectionFactory().getConnection() ;
				PreparedStatement st = conn.prepareStatement(sql.toString());
		) {
			
			st.setInt(1, memberNo);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				MemberVO member = new MemberVO();
				member.setNo(rs.getInt("no"));
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				list.add(member);
				System.out.println(member.getId());
			}
			
		
			
		} catch (Exception e) {
			
		}
		
		return list;
	}
	
	
	public boolean insert(MemberVO member){
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_member ");
		sql.append(" (no, id, name) values (t_member_seq.nextVal, ?,?)");
		
		System.out.println(sql.toString());
		System.out.println(member);
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement st = conn.prepareStatement(sql.toString());
		){
			st.setString(1, member.getId());
			st.setString(2, member.getName());
			
			if(st.executeUpdate()>0){
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean selectById(String id){
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from t_member ");
		sql.append(" where id=?");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement st = conn.prepareStatement(sql.toString());
		){
			st.setString(1, id);
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
}