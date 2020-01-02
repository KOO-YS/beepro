
package com.semi.dao;

import com.semi.vo.MatchingProVo;


public interface MatchingDao {
	//프로젝트 글쓰기 
	String insertProjectWriteSql = "INSERT INTO MATCHING_PROJECT VALUES(PROJECT_SEQ.NEXTVAL , ?, ?, ?, ?, ?, ?, ?, ? )";
	
	public int projectWrite(MatchingProVo matchingProVo);
	public int matchingWrite(MatchingProVo matchingProVo);
}
