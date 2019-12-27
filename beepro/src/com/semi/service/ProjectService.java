package com.semi.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ProjectDao;
import com.semi.dao.ProjectDaoImple;
import com.semi.vo.IssueVo;
import com.semi.vo.TodoVo;

public class ProjectService {
	ProjectDao projectDao = new ProjectDaoImple();

	// 이슈 생성 서비스
	public boolean issueWrite(HttpServletRequest request, HttpServletResponse response) {
		ProjectDaoImple dao = new ProjectDaoImple();

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String issue_level = request.getParameter("issue_level");
		String issue_category = request.getParameter("issue_category");
		String content = request.getParameter("content");

		IssueVo vo = new IssueVo();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setLevel(issue_level);
		vo.setCategory(issue_category);
		vo.setContent(content);

		boolean res = dao.insertIssue(vo);

		if (res == true) {
			System.out.println("데이터 입력 성공");
		}
		return res;
	}

	// 이슈 삭제 서비스
	public void issueDelete(HttpServletRequest request, HttpServletResponse response) {

	}

	// 이슈 전체 조회 서비스
	public List<IssueVo> issueAll(HttpServletRequest request, HttpServletResponse response) {
          return projectDao.selectAllIssue();
	}

	// 선택한 하나의 이슈 정보를 자세히
	public IssueVo issueDetail(HttpServletRequest request, HttpServletResponse response) {
		int issueSeq = Integer.parseInt(request.getParameter("issue_seq"));
		System.out.println("선택한 이슈 번호 : " + issueSeq);
		return projectDao.selectOneIssue(issueSeq);
	}

	// 업무 생성 서비스
	public int insertTodo(HttpServletRequest request, HttpServletResponse response) {

		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String title = request.getParameter("title");
		String manager = request.getParameter("manager");
		String content = request.getParameter("content");
		Date startDate = Date.valueOf(request.getParameter("from"));
		Date endDate = Date.valueOf(request.getParameter("to"));
		String category = request.getParameter("category");
		int priority = Integer.parseInt(request.getParameter("priority"));

		TodoVo todo = new TodoVo(projectSeq, title, content, manager, startDate, endDate, category, priority);

		System.out.println(todo.toString());

		return projectDao.insertTodo(todo);
	}

	// 업무 리스트 출력 (조건 : 아이디)
	public List<TodoVo> selectAllTodo(int project_seq, String manager) {
		return projectDao.selectAllTodo(project_seq, manager);
	}
	
	// 선택 업무 출력
	public TodoVo selectOneTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("선택한 seq : " + todoSeq);
		return projectDao.selectOneTodo(todoSeq);
	}
	// 업무 내용 변경
	public int updateTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int priority = Integer.parseInt(request.getParameter("priority"));
		Date startDate = Date.valueOf(request.getParameter("from"));
		Date endDate = Date.valueOf(request.getParameter("to"));
		TodoVo todo = new TodoVo(todoSeq, projectSeq, title, content, startDate, endDate, priority);
		
		System.out.println(todo.toString());
		
		return projectDao.updateTodo(todo);
	}
	
	// 업무 상태 변경
	public void updateTodoStatus(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String status = request.getParameter("status");
		
		projectDao.updateTodoStatus(todoSeq, projectSeq, status);
	}
	
	// 업무 삭제
	public int deleteTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		
		return projectDao.deleteTodo(todoSeq, projectSeq);
	}
	// 업무 중요도 변경
	public void updateTodoPriority(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		int priority = Integer.parseInt(request.getParameter("priority"));
		
		projectDao.updateTodoPriority(todoSeq, projectSeq, priority);
	}

	public void countCategory() {
		projectDao.countCategory();
	}
}
