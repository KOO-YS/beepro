package com.semi.dao;

import com.semi.vo.MatchingPerVo;
import static common.JDBCTemplet.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.vo.MatchingProVo;
import com.semi.vo.ProjectVo;

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
   
   //퍼스널 매칭 글쓰기
   
   public int insertPer(MatchingPerVo perVo) {
      Connection con = getConnection();
      System.out.println("---- dao : 커넥션 성공 ----");
      PreparedStatement pstm = null;
      int res = 0;
      
      
      try {
         pstm = con.prepareStatement(insertPerSql);
         
         pstm.setString(1, perVo.getUser_id());
         pstm.setString(2, perVo.getSkill());
         pstm.setString(3, perVo.getEmp_category());
         pstm.setString(4, perVo.getTitle());
         pstm.setString(5, perVo.getContent());
         
         res = pstm.executeUpdate();
         
         if(res > 0) {
            commit(con);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstm, con);
      }
      return res;
   }
   
   //개인 매칭 글목록 조회하기
   @Override
   public List<MatchingPerVo> selectAllPer() {
      Connection con = getConnection();
      System.out.println("----- dao Impl 연결 -----");
      PreparedStatement pstm = null;
      ResultSet rs = null;
      List<MatchingPerVo> res = new ArrayList<MatchingPerVo>();
      
      try {
         pstm = con.prepareStatement(selectAllPerSql);
         rs = pstm.executeQuery();
         
         while(rs.next()) {
            MatchingPerVo perVo = new MatchingPerVo();
            
            perVo.setPersonal_seq(rs.getInt(1));
            perVo.setUser_id(rs.getString(2));
            perVo.setSkill(rs.getString(4));
            perVo.setTitle(rs.getString(3));
            perVo.setEmp_category(rs.getString(5));
            perVo.setContent(rs.getString(6));
            
            res.add(perVo);
         }
         System.out.println("---- res.add(perVo) 성공 ---- ");
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs, pstm, con);
         System.out.println("---------- DB 종료 ----------");
      }
      
      return res;
   }

   //개인 매칭 게시글 상세보기
   @Override
   public MatchingPerVo selectOnePer(int personal_seq) {
      Connection con = getConnection();
      System.out.println("개인 매칭 상세보기 DaoImpl 연결됨");
      PreparedStatement pstm = null;
      ResultSet rs = null;
      MatchingPerVo res = new MatchingPerVo();
      
      try {
         pstm = con.prepareStatement(selectOnePerSql);
         pstm.setInt(1, personal_seq);
         
         rs = pstm.executeQuery();
         
         while(rs.next()) {
            res.setPersonal_seq(rs.getInt(1));
            res.setUser_id(rs.getString(2));
            res.setSkill(rs.getString(4));
            res.setTitle(rs.getString(3));
            res.setEmp_category(rs.getString(5));
            res.setContent(rs.getString(6));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs, pstm, con);
         System.out.println("----- DB 종료 -----");
      }
      System.out.println("detail : " + res.toString());
      return res;
   }
   
   //개인 매칭 게시글 수정하기
   @Override
   public int updatePer(MatchingPerVo perVo) {
      Connection con = getConnection();
      PreparedStatement pstm = null;
      int res = 0;
      try {
         pstm = con.prepareStatement(updatePerSql);
         
         pstm.setInt(1, perVo.getPersonal_seq());
         pstm.setString(2, perVo.getUser_id());
         pstm.setString(3, perVo.getSkill());
         pstm.setString(4, perVo.getTitle());
         pstm.setString(5, perVo.getEmp_category());
         pstm.setString(6, perVo.getContent());

         res = pstm.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      }
      return res;
   }
   
   //게시글 삭제
   @Override
   public int deletePer(int personal_seq) {
      Connection con = getConnection();
      PreparedStatement pstm = null;
      int res = 0;
      try {
         pstm = con.prepareStatement(deletePerSql);
         pstm.setInt(1, personal_seq);
         
         res = pstm.executeUpdate(); //실제로 db에 실행시키는 구문
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstm, con);
      }
      
      return res;
   }


   @Override
   public int MatchingWrite(MatchingProVo MatchingProVo) {
      // TODO Auto-generated method stub
      return 0;
   }
   
}
