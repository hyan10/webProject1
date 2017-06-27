package kr.co.bit.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.project.util.ConnectionFactory;
import kr.co.bit.project.vo.Member;

public class MemberDAO {

	public List<Member> friendList(int memberNo){
		List<Member> list = new ArrayList<>();
	
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
				Member member = new Member();
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
	
	
	public boolean insert(Member member){
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
	
	public Member selectById(String id){
		Member result = null;
		
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
				result = new Member();
				result.setNo(rs.getInt("no"));
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setTel(rs.getString("tel"));
				result.setEmail(rs.getString("email"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean updateMoney(boolean plus, int no, int money){
		boolean result = false;
		String check = "+";
		
		if(!plus){
			check = "-";
		}
		
		System.out.println(check);
		
		StringBuilder sql = new StringBuilder();
		sql.append("update t_member set balance = balance "+check+" ? ");
		sql.append(" where no=?");
		
		System.out.println(sql.toString());
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement st = conn.prepareStatement(sql.toString());
		){
			st.setInt(1, money);
			st.setInt(2, no);
			
			if(st.executeUpdate()>0){
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}


	public boolean insertFriend(int memberNo, int friendNo) {
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_friend ");
		sql.append(" values (?,?)");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement st = conn.prepareStatement(sql.toString());
		){
			int loc=1;
			st.setInt(loc++, memberNo);
			st.setInt(loc++, friendNo);
			
			System.out.println(sql.toString());
			
			if(st.executeUpdate()>0){
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return result;
	}
}
