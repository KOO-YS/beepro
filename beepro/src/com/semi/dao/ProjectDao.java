package com.semi.dao;

import java.util.List;

import com.semi.vo.CommentVo;
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
    String selectAllTodoSql = "SELECT * FROM TODO WHERE MANAGER = ? AND PROJECT_SEQ = ?";
    String selectOneTodoSql = "SELECT * FROM TODO WHERE TODO_SEQ = ?";
    String updateTodoSql = "UPDATE TODO SET TITLE=?, CONTENT=?, PRIORITY=?, STARTDATE=?, ENDDATE=? WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    String updateTodoStatusSql = "UPDATE TODO SET STATUS=? WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    String deleteTodoSql = "DELETE FROM TODO WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    String updateTodoPrioritySql = "UPDATE TODO SET PRIORITY=? WHERE TODO_SEQ=? AND PROJECT_SEQ=?";
    
    // 프로젝트부분
    String selectAllProjectSql = "SELECT * FROM ISSUE ORDER BY PROJECT_SEQ DESC";
    
    // 댓글 부분
    String insertCommentSql = "INSERT INTO COMMENTS VALUES (COMMENTS_SEQ.NEXTVAL,?,?,?,SYSDATE)";
    String selectAllCommentSql = "SELECT * FROM COMMENTS WHERE ISSUE_SEQ=?";
    String deleteCommentSql = "DELETE FROM COMMENTS WHERE COMMENTS_SEQ=?";
    String updateCommentSql = "UPDATE COMMENTS SET CONTENT=? WHERE COMMENTS_SEQ=? AND ISSUE_SEQ=?";
    
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

	public void updateTodoStatus(int todoSeq, int projectSeq, String status);

	public int deleteTodo(int todoSeq, int projectSeq);

	public void updateTodoPriority(int todoSeq, int projectSeq, int priority);

	public void countCategory();

	public boolean insertComment(CommentVo vo);

	public List<CommentVo> selectAllComment(int seq);
	
	public boolean deleteComment(int comments_seq);

	public void updateComment(int commentSeq, int issueSeq, String content);

}

