package com.semi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MatchingDao;
import com.semi.dao.MatchingDaoImpl;
import com.semi.vo.MatchingProVo;

public class MatchingService {
	
	/** 
	 * 신규 프로젝트 작성 기능
	 * 
	 * @param request  view에서 form에 담은 데이터(request)를 Vo로 옮기기 위해서 받아옴.
	 * @param response
	 * @return DB INSERT 후 성공 여부에 따라 int 형으로 결과값을 받을 수 있음.
	 */
	public int matchingWrite(HttpServletRequest request, HttpServletResponse response) {
		MatchingDao matchingDao = new MatchingDaoImpl();
		
		HttpSession session = request.getSession();
        String pm_id = (String)session.getAttribute("u_id");
		
		/*
		 * request로 받은 데이터를 String 변수에 담아서 개별로 저장.
		 */
		String title = request.getParameter("title");
		String skill = request.getParameter("skill");
		String content = request.getParameter("content");
		String need_person = request.getParameter("need_person");
		String location = request.getParameter("location");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		/*
		 * String 변수에 옮긴 데이터를 Vo로 저장.
		 */
		
		MatchingProVo matchingProVo = new MatchingProVo(pm_id, skill, title, content, need_person, location, startdate, enddate);
		return matchingDao.matchingWrite(matchingProVo);
		
	}
	
	public List<MatchingProVo> matchingProAll(HttpServletRequest request){
		MatchingDao matchingDao = new MatchingDaoImpl();
		HttpSession session = request.getSession();
        String pm_id = (String)session.getAttribute("u_id");
        
        
		return matchingDao.matchingProAll(pm_id);
	}
	
	public MatchingProVo matchingRead(HttpServletRequest request) {
		MatchingDao matchingDao = new MatchingDaoImpl();
		String matching_seq = (String) request.getParameter("project_seq");
		
		MatchingProVo matVo = matchingDao.matchingRead(matching_seq);
		
		HttpSession session = request.getSession();
        String pm_id = (String)session.getAttribute("u_id");
        
        if(pm_id != null && !"".equals(pm_id)) {
			if(matVo.getPm_id().equals(pm_id)) {
				matVo.setModifyYn(true);
			}
        }
		return matVo;
	}
	public int matchingModifyProc(HttpServletRequest request) {
		MatchingDao matchingDao = new MatchingDaoImpl();
		HttpSession session = request.getSession();
        String pm_id = (String)session.getAttribute("u_id");
		
		/*
		 * request로 받은 데이터를 String 변수에 담아서 개별로 저장.
		 */
		String project_seq = request.getParameter("project_seq");
		String title = request.getParameter("title");
		String skill = request.getParameter("skill");
		String content = request.getParameter("content");
		String need_person = request.getParameter("need_person");
		String location = request.getParameter("location");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		MatchingProVo matVo = new MatchingProVo(pm_id, skill, title, content, need_person, location, startdate, enddate);
		matVo.setProject_seq(project_seq);
		
		return matchingDao.matchingModifyProc(matVo);
	}
	
	public int matchingDelete(HttpServletRequest request) {
		MatchingDao matchingDao = new MatchingDaoImpl();
		/*
		 * request로 받은 데이터를 String 변수에 담아서 개별로 저장.
		 */
		String matching_seq = request.getParameter("project_seq");
		
		return matchingDao.matchingDelete(matching_seq);
	}
	

}
