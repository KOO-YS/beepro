
package com.semi.dao;

import java.util.List;

import com.semi.vo.MatchingProVo;


public interface MatchingDao {
	//프로젝트 글쓰기 
	String insertmatchingWriteSql = "INSERT INTO MATCHING_PROJECT VALUES(PROJECT_SEQ.NEXTVAL , ?, ?, ?, ?, ?, ?, ?, ? )";
	//프로젝트 글 수정 
	String updatetmatchingSql = "UPDATE MATCHING_PROJECT SET TITLE = ?, CONTENT = ?, SKILL = ?, NEED_PERSON = ?, LOCATION = ?, STARTDATE = ?, ENDDATE = ? WHERE PROJECT_SEQ = ?";
	//프로젝트 글 삭제
	String deletematchingSeq= "DELETE MATCHING_PROJECT WHERE PROJECT_SEQ = ?";
	//프로젝트 전체 목록 보기
	String selectAllMatchingProSql = "SELECT * FROM MATCHING_PROJECT";
	//프로젝트 상세페이지
	String selectMatchingReadSql = "SELECT * FROM MATCHING_PROJECT WHERE PROJECT_SEQ = ?";
	
	public int matchingWrite(MatchingProVo matchingProVo);
	public int matchingDelete(String matching_seq);
	public int matchingModifyProc(MatchingProVo matchingProVo);
	public List<MatchingProVo> matchingProAll(String pm_id);
	public MatchingProVo matchingRead(String matching_seq);
	
	
		
}
