package com.semi.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ProjectDao;
import com.semi.dao.ProjectDaoImple;
import com.semi.vo.TodoVo;
import com.semi.vo.IssueVo;


public class ProjectService {
	ProjectDao projectDao = new ProjectDaoImple();
	
	// 이슈 생성 서비스
	public void issueWrite(HttpServletRequest request, HttpServletResponse response) {
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
		
		if(res == true) {
			System.out.println("데이터 입력 성공");
		}
	}
    
	// 이슈 삭제 서비스
	public void issueDelete(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
    // 이슈 전체 조회 서비스
	public void issueAll(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	// 선택한 하나의 이슈 정보를 자세히
	public void issueDetail(HttpServletRequest request, HttpServletResponse response) {
		
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

	public TodoVo selectOneTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("선택한 seq : "+todoSeq);
		return projectDao.selectOneTodo(todoSeq);
	}
}
