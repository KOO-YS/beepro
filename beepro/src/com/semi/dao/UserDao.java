package com.semi.dao;

import com.semi.vo.UserVo;

public interface UserDao {
	String loginSql ="SELECT pwd from beepro_user WHERE user_id =?";
	String joinSql ="INSERT into beepro_user values(?,?,?,?,?,null,'N','')";
	String getUserEmailSql = "SELECT email FROM beepro_user WHERE user_id = ?";
	String getUserNameSql = "SELECT name FROM beepro_user WHERE user_id = ?";
	String getEmailCkSql ="SELECT email_ck FROM beepro_user WHERE user_id = ?";
	String setEmailCkSql = "UPDATE beepro_user SET email_ck ='Y' WHERE email= ? ";
	String deleteSql = "DELETE * from beepro_user WHERE user_id =?";
	
	String insertHeartSql = "INSERT INTO heart VALUES(?,?) ";
	String selectAllHeartSql = " SELECT * FROM heart ";
	String followerSql = " SELECT send_id FROM heart WHERE get_id=?  ";
	String followingSql = " SELECT get_id FROM heart WHERE send_id=? ";
	
	
	public int login(String u_id, String u_pwd);
	public int join(UserVo vo);
	public String getUserEmail(String u_id);
	public String getUserEmailChecked(String u_id);
	public String setUserEmailChecked(String email);
	public int withdrawal(String u_id);
	
	
	
	
}
