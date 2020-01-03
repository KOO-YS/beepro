package com.semi.dao;

import static common.JDBCTemplet.close;
import static common.JDBCTemplet.commit;
import static common.JDBCTemplet.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.vo.MatchingProVo;

public class MatchingDaoImpl implements MatchingDao{
	
	//프로젝트 매칭 글쓰기
	//실제로 DB에 데이터를 넣는 부분
	public int matchingWrite(MatchingProVo matchingProVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try { //실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(insertmatchingWriteSql);
			pstmt.setString(1, matchingProVo.getPm_id());
			pstmt.setString(2, matchingProVo.getTitle());
			pstmt.setString(3, matchingProVo.getContent());
			pstmt.setString(4, matchingProVo.getSkill());
			pstmt.setString(5, matchingProVo.getNeed_person());
			pstmt.setString(6, matchingProVo.getLocation());
			pstmt.setString(7, matchingProVo.getStartdate());
			pstmt.setString(8, matchingProVo.getEnddate());
			

			res = pstmt.executeUpdate(); //실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}
	
	
	public List<MatchingProVo> matchingProAll(String pm_id){
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MatchingProVo> res = new ArrayList<MatchingProVo>();
		
		try {
			pstmt = con.prepareStatement(selectAllMatchingProSql);
			//pstmt.setString(1, pm_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MatchingProVo matVo = new MatchingProVo();
				matVo.setProject_seq(rs.getString(1));
				matVo.setPm_id(rs.getString(2));
				matVo.setTitle(rs.getString(3));
				matVo.setContent(rs.getString(4));
				matVo.setSkill(rs.getString(5));
				matVo.setNeed_person(rs.getString(6));
				matVo.setLocation(rs.getString(7));
				matVo.setStartdate(rs.getString(8));
				matVo.setEnddate(rs.getString(9));
				
				if(matVo.getSkill() != null && !"".equals(matVo.getSkill())){
					String[] skillArr = matVo.getSkill().split(",");
					matVo.setSkillArr(skillArr);
				}
				res.add(matVo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("DB 종료");
		}
		
		return res;
	}
	
	
	public MatchingProVo matchingRead(String matching_seq){
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MatchingProVo matVo = new MatchingProVo();
		try {
			pstmt = con.prepareStatement(selectMatchingReadSql);
			pstmt.setString(1, matching_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				matVo.setProject_seq(rs.getString(1));
				matVo.setPm_id(rs.getString(2));
				matVo.setTitle(rs.getString(3));
				matVo.setContent(rs.getString(4));
				matVo.setSkill(rs.getString(5));
				matVo.setNeed_person(rs.getString(6));
				matVo.setLocation(rs.getString(7));
				matVo.setStartdate(rs.getString(8));
				matVo.setEnddate(rs.getString(9));
				
				if(matVo.getSkill() != null && !"".equals(matVo.getSkill())){
					String[] skillArr = matVo.getSkill().split(",");
					for(String skill : skillArr) {
						System.out.println("============ : " + skill);
					}
					matVo.setSkillArr(skillArr);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("DB 종료");
		}
		
		return matVo;
	}
	
	public int matchingModifyProc(MatchingProVo matchingProVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		try { //실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(updatetmatchingSql);
			System.out.println(matchingProVo.toString());
			pstmt.setString(1, matchingProVo.getTitle());
			pstmt.setString(2, matchingProVo.getContent());
			pstmt.setString(3, matchingProVo.getSkill());
			pstmt.setString(4, matchingProVo.getNeed_person());
			pstmt.setString(5, matchingProVo.getLocation());
			pstmt.setString(6, matchingProVo.getStartdate());
			pstmt.setString(7, matchingProVo.getEnddate());
			pstmt.setString(8, matchingProVo.getProject_seq());

			res = pstmt.executeUpdate(); //실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}
	
	public int matchingDelete(String matching_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		try { //실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(deletematchingSeq);
			pstmt.setString(1, matching_seq);
			
			res = pstmt.executeUpdate(); //실제로 db에 실행시키는 구문
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

}
