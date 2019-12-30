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

import com.semi.vo.CommentVo;
import com.semi.vo.IssueVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.TodoVo;

public class ProjectDaoImple implements ProjectDao {

	// 이슈 생성
	@Override
	public boolean insertIssue(IssueVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(insertIssueSql);
			pstmt.setInt(1, vo.getIssueSeq());
			pstmt.setInt(2, vo.getProjectSeq());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getWriter());
			pstmt.setString(5, vo.getLevel());
			pstmt.setDate(6, vo.getRegdate());
			pstmt.setString(7, vo.getCategory());
			pstmt.setString(8, vo.getContent());

			res = pstmt.executeUpdate();

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
		return false;
	}

	// 이슈 삭제
	@Override
	public boolean deleteIssue(int issue_seq) {
		return false;
	}

	// 업무 생성
	@Override
	public int insertTodo(TodoVo todo) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(insertTodoSql);
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
		}
		return res;
	}

	// 업무 리스트 출력
	@Override
	public List<TodoVo> selectAllTodo(int project_seq, String manager) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TodoVo> res = new ArrayList<TodoVo>();

		try {
			pstm = con.prepareStatement(selectAllTodoSql);
			pstm.setString(1, manager);
			pstm.setInt(2, project_seq);

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

//				System.out.println(todo.toString());

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
	@Override
	public TodoVo selectOneTodo(int todoSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TodoVo res = new TodoVo();
		try {
			pstm = con.prepareStatement(selectOneTodoSql);
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
				project.setStartDate(rs.getDate(2));
				project.setEndDate(rs.getDate(3));
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
	public void updateTodoStatus(int todoSeq, int projectSeq, String status) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(updateTodoStatusSql);
			pstm.setString(1, status);
			pstm.setInt(2, todoSeq);
			pstm.setInt(3, projectSeq);

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

	@Override
	public void countCategory() {
		// TODO Auto-generated method stub

	}

	// 댓글 입력
	@Override
	public boolean insertComment(CommentVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(insertCommentSql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getContent());

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
	public List<CommentVo> selectAllComment() {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<CommentVo> res = new ArrayList<>();

		try {
			pstmt = con.prepareStatement(selectAllCommentSql);
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
