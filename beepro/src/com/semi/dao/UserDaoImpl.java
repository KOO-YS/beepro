package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.vo.MessageVo;
import com.semi.vo.UserVo;

import common.JDBCTemplet;
import util.sha256;

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
			String pwd_ch = sha256.getSHA256(u_pwd);
			
			if(rs.next()) {
				if(rs.getString(1).equals(pwd_ch))
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
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
				
		try {
			pstmt = con.prepareStatement(joinSql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getU_pwd());
			pstmt.setString(3, vo.getU_name());			
			pstmt.setString(4, vo.getU_email());
			pstmt.setString(5, vo.getU_emailhash());
			
			return pstmt.executeUpdate();//회원가입 성공

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		return -1;//회원가입 실패
	}

	@Override
	//아이디로 이메일 주소 가져오기
	public String getUserEmail(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		ResultSet rs = null;

		try {

			pstmt = con.prepareStatement(getUserEmailSql);

			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	
	//아이디로 이름 가져오기
		public String getUserName(String u_id) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;	
			ResultSet rs = null;
				
			String SQL = "SELECT name FROM beepro_user WHERE user_id = ?";
				
				try {
					
					pstmt = con.prepareStatement(SQL);
					
					pstmt.setString(1, u_id);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						return rs.getString(1); // 이름 반환
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return null; // 데이터베이스 오류
			}
	//아이디로 이름 가져오기
		public String getUserPwd(String u_id) {
			Connection con = getConnection();
					PreparedStatement pstmt = null;	
					ResultSet rs = null;
						
					String SQL = "SELECT pwd FROM beepro_user WHERE user_id = ?";
						
						try {
							
							pstmt = con.prepareStatement(SQL);							
							pstmt.setString(1, u_id);							
							rs = pstmt.executeQuery();
							
							while(rs.next()) {								
								return rs.getString(1); //비밀번호 반환
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						return null; // 데이터베이스 오류
					}
	@Override
	//아이디로 이메일 인증여부 가져오기
	public String getUserEmailChecked(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			pstmt = con.prepareStatement(getEmailCkSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				return rs.getString(1); //이메일 인증여부 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		return "N";
	}
	

	@Override
	//이메일 인증상태 변경(N->Y)
	public String setUserEmailChecked(String email) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		
		try {
			pstmt = con.prepareStatement(setEmailCkSql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			return "Y"; //이메일 인증성공
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "N";//이메일 인증실패
	}
	//비밀번호 변경 
	public int updatePwd(String newPwd, String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		
		String u_pwd = sha256.getSHA256(newPwd);
		String sql = "UPDATE beepro_user SET pwd = ? WHERE user_id = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_pwd);
			pstmt.setString(2, u_id);
			pstmt.executeUpdate();
			
			return 1; //비밀번호 변경 성공
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 2; //비밀번호 변경 실패
		
	}
	
	
	
	
	
	
	/* 메세지 DAO */
	
	
	// 모든 채팅 리스트를 메세지시퀀스로 불러오는 메소드
		public ArrayList<MessageVo> getChatListBySeq(String send_id, String get_id, String message_seq){
			
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
				pstmt.setInt(5, Integer.parseInt(message_seq));
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
			String sql = " SELECT * FROM MESSAGE WHERE ((send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) AND message_seq > (SELECT MAX(message_seq) - ? FROM message WHERE (send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) ORDER BY regdate ";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, send_id);
				pstmt.setString(2, get_id);
				pstmt.setString(3, get_id);
				pstmt.setString(4, send_id);
				pstmt.setInt(5, number);
				pstmt.setString(6, send_id);
				pstmt.setString(7, get_id);
				pstmt.setString(8, get_id);
				pstmt.setString(9, send_id);
				
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
			
			String sql = " INSERT INTO MESSAGE VALUES(MESSAGE_SEQ.NEXTVAL,?,?,?,SYSDATE,0) ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, send_id);
				pstmt.setString(2, get_id);
				pstmt.setString(3, content);

//				System.out.println("send_id : " + send_id );
//				System.out.println("get_id : " + get_id );
//				System.out.println("content : " + content );
				
				return pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace(); 
			} finally {
				close(pstmt,conn);
			}
			
			return -1;   	//데이터베이스 오류 
		}
		

		// 메세지를 읽었다고 반환(받는사람 입장에서 해당 메세지를 다 받았다고 알림!)
		public int readChat(String send_id, String get_id) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			String sql = " UPDATE MESSAGE SET read_ck = 1 WHERE (send_id = ? AND get_id = ?) ";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, get_id);			//받는사람과 보낸사람 교차해서 넣어줌
				pstmt.setString(2, send_id);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt,con);
			}
			return -1; //데이터베이스 오류
			
		}
		
		//현재 읽지 않은 메세지의 개수를 반환
		public int getAllUnreadChat(String u_id) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = " SELECT COUNT(message_seq) FROM message WHERE get_id = ? AND read_ck = 0 ";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, u_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt("COUNT(message_seq)");
				}
				return 0; // 받은 메시지 없음
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			return -1; //데이터베이스 오류
		}
	
	
	

}
