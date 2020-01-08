package com.semi.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.semi.vo.MatchingPerVo;
import com.semi.vo.MatchingProVo;
import com.semi.vo.UserVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.VolunteerVo;

public interface MatchingDao {

	// 유저 프로필 보기
	public UserVo getProfile(String userId);
	// 유저 정보 조회
	String getUserInfoSql = "SELECT USER_ID, NAME, EMAIL, LOCATION FROM BEEPRO_USER WHERE USER_ID=?";
	
	// 개인 매칭
	public int MatchingWrite(MatchingProVo MatchingProVo);
	// 글쓰기
	String insertPerSql = "INSERT INTO matching_personal VALUES(personal_seq.nextval, ?, ?, ?, ?, ?)";
	// 수정
	String updatePerSql = "UPDATE matching_personal SET title=?, skill=?, emp_category=?, content=? WHERE personal_seq";
	// 삭제
	String deletePerSql = "DELETE FROM matching_personal WHERE personal_seq=?";
	// 목록 전체 보기
	String selectAllPerSql = "SELECT * FROM matching_personal ORDER BY personal_seq DESC";
	// 글 상세보기
	String selectOnePerSql = "SELECT * FROM matching_personal WHERE personal_seq=?";

	public int insertPer(MatchingPerVo perVo);

	public int updatePer(MatchingPerVo perVo);

	public int deletePer(int personal_seq);

	public List<MatchingPerVo> selectAllPer();

	public MatchingPerVo selectOnePer(int personal_seq);

	// 프로젝트 매칭

	String insertmatchingWriteSql = "INSERT INTO MATCHING_PROJECT VALUES(PROJECTM_SEQ.NEXTVAL , ?, ?, ?, ?, ?, ?, ?, ? )";
	// 프로젝트 글 수정
	String updatetmatchingSql = "UPDATE MATCHING_PROJECT SET TITLE = ?, CONTENT = ?, SKILL = ?, NEED_PERSON = ?, LOCATION = ?, STARTDATE = ?, ENDDATE = ? WHERE PROJECTM_SEQ = ?";
	// 프로젝트 글 삭제
	String deletematchingSeq = "DELETE MATCHING_PROJECT WHERE PROJECTM_SEQ = ?";
	// 프로젝트 전체 목록 보기
	String selectAllMatchingProSql = "SELECT * FROM MATCHING_PROJECT ORDER BY PROJECTM_SEQ DESC";
	//프로젝트 검색
	String selectSearchSql = "SELECT * FROM MATCHING_PROJECT ? ORDER BY PROJECTM_SEQ DESC";

	// 프로젝트 상세페이지
	String selectMatchingReadSql = "SELECT * FROM MATCHING_PROJECT WHERE PROJECTM_SEQ = ?";
    
	// cowork 페이지에 뿌려질 프로젝트 생성하는 부분
	String insertProjectSql = "INSERT INTO PROJECT VALUES(?,?,?,'N',?,?,?,'N')";
	String selectAllProjectSql = "SELECT * FROM PROJECT";		// FIXME userid 조건
	String selectOneProjectSql = "SELECT * FROM PROJECT WHERE PROJECT_SEQ=?";
	
	// 지원자
	String insertVolunteerSql = "INSERT INTO VOLUNTEER VALUES(1, ?,'N')";
	
	// 지원자 전체조회
	String selectAllVolunteerSql = "SELECT * FROM VOLUNTEER WHERE PROJECTM_SEQ=?";
	
	// 프로젝트 전체 목록 보기
	String getAllMyProjectSql = "SELECT * FROM MATCHING_PROJECT WHERE PM_ID=? ORDER BY PROJECTM_SEQ DESC";
	
	// 목록 전체 보기
	String getAllMyPersonalSql = "SELECT * FROM matching_personal WHERE USER_ID=?  ORDER BY personal_seq DESC";
	
	public int matchingWrite(MatchingProVo matchingProVo);

	public int matchingDelete(String matching_seq);

	public int matchingModifyProc(MatchingProVo matchingProVo);

	public List<MatchingProVo> matchingProAll(MatchingProVo matchingProVo);
	
	public MatchingProVo matchingRead(String matching_seq);

	public int insertProject(ProjectVo vo);
	
	public boolean insertVolunteer(VolunteerVo vo);

	public List<VolunteerVo> selectAllVolunteer(int projectM_seq);

	public List<ProjectVo> selectAllProject();
	
	public List<MatchingProVo> AllMyProject(String pm_id);
	
	public List<MatchingPerVo> AllMyPersonal(String u_id);
	

}
