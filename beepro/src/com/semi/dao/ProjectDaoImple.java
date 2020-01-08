package com.semi.dao;

import static common.JDBCTemplet.close;
import static common.JDBCTemplet.commit;
import static common.JDBCTemplet.getConnection;

import java.beans.Transient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.semi.vo.CommentVo;
import com.semi.vo.IssueVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.TodoVo;

import util.Paging;

public class ProjectDaoImple implements ProjectDao {

	// 이슈 생성
	@Override
	public boolean insertIssue(IssueVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(insertIssueSql);
			pstmt.setInt(1, vo.getProjectSeq());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getLevel());
            pstmt.setString(5, vo.getCategory());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getResponsibility());

			res=pstmt.executeUpdate();
			
			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return (res > 0) ? true : false;
	}

	// 전체 이슈 조회
	@Override
	public List<IssueVo> selectAllIssue() {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IssueVo> res = new ArrayList<IssueVo>();

		try {
			pstmt = con.prepareStatement(selectAllIssueSql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				IssueVo issue = new IssueVo();

				issue.setIssueSeq(rs.getInt(1));
				issue.setProjectSeq(rs.getInt(2));
				issue.setTitle(rs.getString(3));
				issue.setWriter(rs.getString(4));
				issue.setLevel(rs.getString(5));
				issue.setRegdate(rs.getDate(6));
				issue.setCategory(rs.getString(7));
				issue.setContent(rs.getString(8));

				res.add(issue);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("5. db종료");
		}
		return res;
	}

	// 이슈 하나 조회
	@Override
	public IssueVo selectOneIssue(int issue_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		IssueVo res = new IssueVo();

		try {
			pstmt = con.prepareStatement(selectOneIssueSql);
			pstmt.setInt(1, issue_seq);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				res.setIssueSeq(rs.getInt(1));
				res.setProjectSeq(rs.getInt(2));
				res.setTitle(rs.getString(3));
				res.setWriter(rs.getString(4));
				res.setLevel(rs.getString(5));
				res.setRegdate(rs.getDate(6));
				res.setCategory(rs.getString(7));
				res.setContent(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("5. db종료");
		}
		return res;
	}

	// 이슈 수정
	@Override
	public boolean updateIssue(IssueVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(updateIssueSql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getLevel());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getResponsibility());
			pstmt.setInt(6, vo.getIssueSeq());
			
			res = pstmt.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		
		return true;
	}

	// 이슈 삭제
	@Override
	public boolean deleteIssue(int issue_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(deleteIssueSql);
			pstmt.setInt(1, issue_seq);

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return true;
	}

	// 업무 생성
	@Override
	public int insertTodo(TodoVo todo) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(insertTodoSql);
			System.out.println(insertTodoSql);
			pstm.setInt(1, todo.getProjectSeq());
			pstm.setString(2, todo.getManager());
			pstm.setString(3, todo.getTitle());
			pstm.setString(4, todo.getContent());
			pstm.setDate(5, todo.getStartDate());
			pstm.setDate(6, todo.getEndDate());
			pstm.setString(7, todo.getCategory());
			pstm.setString(8, "예정");
			pstm.setInt(9, todo.getPriority());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm, con);
			System.out.println("DB 종료");
		}
		return res;
	}

	// 업무 리스트 출력
	@Override
	public List<TodoVo> selectAllTodo(int project_seq, String userId, Paging page) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TodoVo> res = new ArrayList<TodoVo>();

		try {
			pstm = con.prepareStatement(getTodoPageSql);
			pstm.setString(1, userId);
			pstm.setInt(2, project_seq);
			pstm.setInt(3, page.getFirstRow());
			pstm.setInt(4, page.getEndRow());
			rs = pstm.executeQuery();

			while (rs.next()) {
				TodoVo todo = new TodoVo();

				todo.setTodoSeq(rs.getInt(1));
				todo.setProjectSeq(rs.getInt(2));
				todo.setManager(rs.getString(3));
				todo.setTitle(rs.getString(4));
				todo.setContent(rs.getString(5));
				todo.setStartDate(rs.getDate(6));
				todo.setEndDate(rs.getDate(7));
				todo.setCategory(rs.getString(8));
				todo.setStatus(rs.getString(9));
				todo.setPriority(rs.getInt(10));
				todo.setFinishCk(rs.getString(11));

				res.add(todo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("5. db종료");
		}
		return res;
	}

	// 업무 상세 페이지 정보 출력
	// FIXME projectSeq 설정 필요
	@Override
	public TodoVo selectOneTodo(int todoSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TodoVo res = new TodoVo();
		try {
			pstm = con.prepareStatement(getOneTodoSql);
			pstm.setInt(1, todoSeq);

			rs = pstm.executeQuery();
			while (rs.next()) {
				res = new TodoVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(6), rs.getDate(7), rs.getString(8), rs.getString(9), rs.getInt(10),
						rs.getString(11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("detail : " + res.toString());
		return res;
	}

	// 프로젝트 전체 조회
	@Override
	public List<ProjectVo> selectAllProjectSql() {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProjectVo> res = new ArrayList<ProjectVo>();

		try {
			pstmt = con.prepareStatement(selectAllIssueSql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProjectVo project = new ProjectVo();

				project.setProjectSeq(rs.getInt(1));
				project.setStartDate(rs.getString(2));
				project.setEndDate(rs.getString(3));
				project.setFinish_ck(rs.getString(4));
				project.setProjectName(rs.getString(5));

				res.add(project);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("5. db종료");
		}
		return res;
	}

	// 업무 정보 수정
	@Override
	public int updateTodo(TodoVo todo) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(updateTodoSql);
			pstm.setString(1, todo.getTitle());
			pstm.setString(2, todo.getContent());
			pstm.setInt(3, todo.getPriority());
			pstm.setDate(4, todo.getStartDate());
			pstm.setDate(5, todo.getEndDate());
			pstm.setInt(6, todo.getTodoSeq());
			pstm.setInt(7, todo.getProjectSeq());

			res = pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	// 업무 상태 변경
	@Override
	public void updateTodoStatus(int todoSeq, int projectSeq, String status, char finishCk) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(updateTodoStatusSql);
			pstm.setString(1, status);
			pstm.setString(2, String.valueOf(finishCk));
			pstm.setInt(3, todoSeq);
			pstm.setInt(4, projectSeq);

			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 업무 삭제
	@Override
	public int deleteTodo(int todoSeq, int projectSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(deleteTodoSql);
			pstm.setInt(1, todoSeq);
			pstm.setInt(2, projectSeq);

			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	// 업무 중요도 변경
	@Override
	public void updateTodoPriority(int todoSeq, int projectSeq, int priority) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(updateTodoPrioritySql);
			pstm.setInt(1, priority);
			pstm.setInt(2, todoSeq);
			pstm.setInt(3, projectSeq);

			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// paging)) 1. 업무 count
	@Override
	public int getTodoCount(int projectSeq, String manager) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int todoCount = 0;
		try {
			pstm = con.prepareStatement(getTodoCountSql);
			pstm.setString(1, manager);
			pstm.setInt(2, projectSeq);
			rs = pstm.executeQuery();	// Query
			while(rs.next()) {
				todoCount = rs.getInt(1);				
			}
			System.out.println("todo 게시글 개수는 ? : "+todoCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return todoCount;
	}

	// 대시보드 통계 - Todo 종합
	@Override
	public HashMap<String, Integer> getTodoInfo(String userId, int projectSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		HashMap<String, Integer> todoInfo = new HashMap<String, Integer>();
		try {
			pstm = con.prepareStatement(getTodoInfoSql);
			pstm.setString(1, userId);
			pstm.setInt(2, projectSeq);

			rs = pstm.executeQuery();
			while(rs.next()) {
				System.out.println("todoCount ::::: "+rs.getInt(1));
				todoInfo.put("totalTodoCnt", rs.getInt(1));			// 전체 업무 수
				todoInfo.put("totalTodoRate", rs.getInt(2));		// 전체 업무 진행률
				todoInfo.put("userTodoLeft", rs.getInt(3));			// 개인 잔여 업무 수
//				todoInfo.put("userTodoRate", rs.getInt(3));			// 개인 업무 진행률
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return todoInfo;
	}

	// 대시보드 통계 - Issue 종합
	@Override
	public HashMap<String, Integer> getIssueInfo(String userId, int projectSeq) {
		// FIXME 유저에게 할당된 이슈 수 추가
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		HashMap<String, Integer> issueInfo = new HashMap<String, Integer>();

		try {
			pstm = con.prepareStatement(getIssueInfoSql);
			pstm.setString(1, userId);
			pstm.setInt(2, projectSeq);

			rs = pstm.executeQuery();
			while (rs.next()) {
				issueInfo.put("totalIssueCnt", rs.getInt(1)); // 전체 이슈 수
				issueInfo.put("weekIssueCnt", rs.getInt(2)); // 일주일 생성 이슈 수
				issueInfo.put("userIssueCnt", rs.getInt(3)); // 개인 등록 이슈 수
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return issueInfo;
	}

	// 이번주 발생 Issue 최대 3개 출력
	@Override
	public List<IssueVo> getWeekIssue(int projectSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<IssueVo> weekIssue = new ArrayList<IssueVo>();
		try {
			pstm = con.prepareStatement(getWeekIssueSql);
			pstm.setInt(1, projectSeq);

			rs = pstm.executeQuery();

			while (rs.next()) {
				IssueVo issue = new IssueVo();

				issue.setIssueSeq(rs.getInt(1));
				issue.setProjectSeq(rs.getInt(2));
				issue.setTitle(rs.getString(3));
				issue.setWriter(rs.getString(4));
				issue.setLevel(rs.getString(5));
				issue.setRegdate(rs.getDate(6));
				issue.setCategory(rs.getString(7));
				issue.setContent(rs.getString(8));

				weekIssue.add(issue);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return weekIssue;
	}

	// 마감기한 일주일 남은 todo 리스트 최대 3개 출력
	@Override
	public List<TodoVo> getUrsentTodo(String userId, int projectSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TodoVo> urgentTodo = new ArrayList<TodoVo>();
		TodoVo todo = null;
		try {
			pstm = con.prepareStatement(getUrgentTodoSql);
			pstm.setString(1, userId);
			pstm.setInt(2, projectSeq);

			rs = pstm.executeQuery();
			while (rs.next()) {
				todo = new TodoVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(6), rs.getDate(7), rs.getString(8), rs.getString(9), rs.getInt(10),
						rs.getString(11));
				System.out.println(todo.toString());
				urgentTodo.add(todo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return urgentTodo;
	}

	// todo 분류별 통계
	@Override
	public HashMap<String, Integer> getTodoType(int projectSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		HashMap<String, Integer> todoType = new HashMap<String, Integer>();
		try {
			pstm = con.prepareStatement(getByTodoTypeSql);
			pstm.setInt(1, projectSeq);

			rs = pstm.executeQuery();
			while (rs.next()) {
				todoType.put(rs.getString(1) + "Rate", rs.getInt(2));
				todoType.put(rs.getString(1) + "Cnt", rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return todoType;
	}

	// 댓글 입력
	@Override
	public boolean insertComment(CommentVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(insertCommentSql);
			pstmt.setInt(1, vo.getIssueSeq());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());

			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}

		return (res > 0) ? true : false;
	}

	// 댓글 조회
	@Override
	public List<CommentVo> selectAllComment(int seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommentVo> res = new ArrayList<CommentVo>();

		try {
			pstmt = con.prepareStatement(selectAllCommentSql);
			pstmt.setInt(1, seq);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVo vo = new CommentVo();

				vo.setCommentSeq(rs.getInt(1));
				vo.setIssueSeq(rs.getInt(2));
				vo.setWriter(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setRegdate(rs.getDate(5));

				res.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("db종료");
		}
		return res;
	}

	// 댓글 수정
	@Override
	public void updateComment(int commentSeq, int issueSeq, String content) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(updateCommentSql);
			pstmt.setString(1, content);
			pstmt.setInt(2, issueSeq);
			pstmt.setInt(3, commentSeq);

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
	}

	// 댓글 삭제
	@Override
	public boolean deleteComment(int comments_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(deleteCommentSql);
			pstmt.setInt(1, comments_seq);

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return true;
	}

}
