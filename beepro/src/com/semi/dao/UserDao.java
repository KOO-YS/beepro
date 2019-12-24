package com.semi.dao;

import com.semi.vo.UserVo;

public interface UserDao {
	String loginSql ="SELECT pwd from beepro_user WHERE user_id =?";
	String joinSql ="INSERT into beepro_user values(?,?,?,?,?,null,'N')";
	String getUserEmailSql = "SELECT email FROM beepro_user WHERE user_id = ?";
	String getEmailCkSql ="SELECT email_ck FROM beepro_user WHERE user_id = ?";
	String setEmailCkSql = "UPDATE beepro_user SET email_ck = true WHERE email= ? ";
	
	public int login(String u_id, String u_pwd);
	public int join(UserVo vo);
	public String getUserEmail(String u_id);
	public String getUserEmailChecked(String u_id);
	public String setUserEmailChecked(String email);
	
	
	
	
}
