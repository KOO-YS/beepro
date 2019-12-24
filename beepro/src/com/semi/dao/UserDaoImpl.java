package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.vo.MessageVo;
import com.semi.vo.UserVo;

import common.JDBCTemplet;

public class UserDaoImpl extends JDBCTemplet implements UserDao {

	@Override
	public int login(String u_id, String u_pwd) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(loginSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(u_pwd))
					return 1;  //로그인성공
				else
					return 0; //비밀번호 불일치, 로그인 실패
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		return -1;//데이터베이스 오류
		
	}

	@Override
	public int join(UserVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getUserEmail(String u_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUserEmailChecked(String u_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String setUserEmailChecked(String email) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	// 모든 채팅 리스트를 메세지시퀀스로 불러오는 메소드
	public ArrayList<MessageVo> getChatListBySeq(String send_id, String get_id, String messageSeq){
		
		ArrayList<MessageVo> chatList = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MESSAGE WHERE ((send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) AND message_seq>? ORDER BY regdate ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, get_id);
			pstmt.setString(4, send_id);
			pstmt.setInt(5, Integer.parseInt(messageSeq));
			rs = pstmt.executeQuery();
			chatList = new ArrayList<MessageVo>();
			while(rs.next()) {
				MessageVo msg = new MessageVo();
				msg.setMessageSeq(rs.getInt("message_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n","<br>"));
				int regdate= Integer.parseInt(rs.getString("regdate").substring(11,13));
				String timeType = "오전";
				if(regdate >= 12) {
					timeType = "오후";
					regdate -=12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0,11) +" " + timeType + " " + regdate + ":"+rs.getString("regdate").substring(14,16)+"");
				chatList.add(msg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,conn);
		}
		
		return chatList;    
	}
	
	// 최근 업데이트된 채팅 불러오는 메소드
	public ArrayList<MessageVo> getChatListByRecent(String send_id, String get_id, int number){
		
		ArrayList<MessageVo> chatList = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MESSAGE WHERE ((send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) AND message_seq > (SELECT MAX(message_seq) - ? FROM message) ORDER BY regdate ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, get_id);
			pstmt.setString(4, send_id);
			pstmt.setInt(5, number);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<MessageVo>();
			
			while(rs.next()) {
				MessageVo msg = new MessageVo();
				msg.setMessageSeq(rs.getInt("message_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n","<br>"));
				//오전 오후 나타내기 위한
				int regdate= Integer.parseInt(rs.getString("regdate").substring(11,13));
				String timeType = "오전";
				if(regdate >= 12) {
					timeType = "오후";
					regdate -=12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0,11) +" " + timeType + " " + regdate + ":"+rs.getString("regdate").substring(14,16)+"");
				chatList.add(msg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(rs,pstmt,conn);
		}
		
		return chatList;    
	}
	
	//보낸 메세지
	public int submit(String send_id, String get_id, String content){

		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " INSERT INTO MESSAGE VALUE(MESSAGE_SEQ.NEXTVAL,?,?,?,SYSDATE) ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, content);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(rs,pstmt,conn);
		}
		
		return -1;   	//데이터베이스 오류 
	}
	
	
	
	

}
