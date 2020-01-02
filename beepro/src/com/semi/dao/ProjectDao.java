package com.semi.dao;

import java.util.HashMap;
import java.util.List;

import com.semi.vo.IssueVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.TodoVo;

public interface ProjectDao {
	// 이슈부분
    String insertIssueSql = "INSERT INTO ISSUE VALUES(ISSUE_SEQ.NEXTVAL,PROJECT_SEQ.NEXTVAL,?,?,?,SYSDATE,?,?,?,?)";
    String updateIssueSql = "UPDATE ISSUE SET TITLE=?, ISSUE_LEVEL=?, ISSUE_CATEGORY=?, CONTENT=? WHERE ISSUE_SEQ=?";
    String deleteIssueSql = "DELETE FROM ISSUE WHERE ISSUE_SEQ=?";
    String selectAllIssueSql = "SELECT * FROM ISSUE"; 
    String selectOneIssueSql = "SELECT * FROM ISSUE WHERE ISSUE_SEQ=?";
    
    // 업무부분
    String insertTodoSql = "INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N')";
    String getAllTodoSql = "SELECT * FROM TODO WHERE MANAGER = ? AND PROJECT_SEQ = ?";
    String getOneTodoSql = "SELECT * FROM TODO WHERE TODO_SEQ = ?";
    String updateTodoSql = "UPDATE TODO SET TITLE=?, CONTENT=?, PRIORITY=?, STARTDATE=?, ENDDATE=? WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    String updateTodoStatusSql = "UPDATE TODO SET STATUS=?, FINISH_CK=? WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    String deleteTodoSql = "DELETE FROM TODO WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    String updateTodoPrioritySql = "UPDATE TODO SET PRIORITY=? WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    
    // 프로젝트부분
    String selectAllProjectSql = "SELECT * FROM ISSUE ORDER BY PROJECT_SEQ DESC";
    
    // 업무 진행상황 부분
    String getByTodoTypeSql = "SELECT CATEGORY 분류,"
    		+ " TRUNC(COUNT(CASE WHEN FINISH_CK = 'Y' THEN 1 END)/COUNT(*)*100) 분류별진행률,"
    		+ " COUNT(*) 분류별업무"
    		+ " FROM TODO"
    		+ " WHERE PROJECT_SEQ=? GROUP BY CATEGORY";
    
    String getTodoInfoSql = "SELECT COUNT(*) 총업무수,"
    		+ " COUNT(CASE WHEN FINISH_CK='Y' THEN 1 END)/COUNT(*)*100 총업무진행률,"
    		+ " COUNT(CASE WHEN FINISH_CK='N' AND MANAGER=? THEN 1 END) 개인잔여업무"
    		+ " FROM TODO"
    		+ " WHERE PROJECT_SEQ=?";
    
    String getIssueInfoSql = "SELECT COUNT(*) 총이슈,"
    		+ " COUNT(CASE WHEN REGDATE BETWEEN TO_CHAR(SYSDATE-7,'YY/MM/DD') AND TO_CHAR(SYSDATE+1,'YY/MM/DD') THEN 1 END) 이번주생성이슈,"
    		+ " COUNT(CASE WHEN WRITER=? THEN 1 END) 개인등록이슈"
    		+ " FROM ISSUE  WHERE PROJECT_SEQ = ?";
    
    String getWeekIssueSql = "SELECT * FROM ISSUE WHERE PROJECT_SEQ=? AND REGDATE  BETWEEN TO_CHAR(SYSDATE-7,'YY/MM/DD') AND TO_CHAR(SYSDATE+1,'YY/MM/DD') AND ROWNUM < 4";
    
    String getUrgentTodoSql = "SELECT * FROM TODO WHERE MANAGER=? AND PROJECT_SEQ=? AND ENDDATE BETWEEN TO_CHAR(SYSDATE,'YY/MM/DD') AND TO_CHAR(SYSDATE+7,'YY/MM/DD') AND ROWNUM<5";
    
    public List<IssueVo> selectAllIssue();
    
    public IssueVo selectOneIssue(int issue_seq);
    
    public boolean insertIssue(IssueVo vo);
    
    public boolean updateIssue(IssueVo vo);
    
    public boolean deleteIssue(int issue_seq);
    
    public int insertTodo(TodoVo todo);

	public List<TodoVo> selectAllTodo(int project_seq, String manager);

	public TodoVo selectOneTodo(int todoSeq);
	
	public List<ProjectVo> selectAllProjectSql();

	public int updateTodo(TodoVo todo);

	public void updateTodoStatus(int todoSeq, int projectSeq, String status, char finishCk);

	public int deleteTodo(int todoSeq, int projectSeq);

	public void updateTodoPriority(int todoSeq, int projectSeq, int priority);

	public HashMap<String, Integer> countCategory();

	public HashMap<String, Integer> getTodoInfo(String userId, int projectSeq);

	public HashMap<String, Integer> getIssueInfo(String userId, int projectSeq);

	public List<IssueVo> getWeekIssue(int projectSeq);

	public HashMap<String, Integer> getTodoType(int projectSeq);

	public List<TodoVo> getUrsentTodo(String userId, int projectSeq);


}

