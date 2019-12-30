package com.semi.dao;

import static common.JDBCTemplet.close;
import static common.JDBCTemplet.commit;
import static common.JDBCTemplet.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.vo.MatchingProVo;

public class MatchingDaoImpl implements MatchingDao{
	
	 //프로젝트 매칭 글쓰기
	//실제로 DB에 데이터를 넣는 부분
	public int projectWrite(MatchingProVo projectVo) {
		return 1;
	}

	public int matchingWrite(MatchingProVo MatchingProVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try { //실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(insertProjectWriteSql);
			pstmt.setString(1, MatchingProVo.getPm_id());
			pstmt.setString(2, MatchingProVo.getTitle());
			pstmt.setString(3, MatchingProVo.getContent());
			pstmt.setString(4, MatchingProVo.getSkill());
			pstmt.setString(5, MatchingProVo.getNeed_person());
			pstmt.setString(6, MatchingProVo.getLocation());
			pstmt.setString(7, MatchingProVo.getStartdate());
			pstmt.setString(8, MatchingProVo.getEnddate());
			

			res = pstmt.executeUpdate(); //실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

}
