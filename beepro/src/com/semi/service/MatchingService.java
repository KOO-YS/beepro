package com.semi.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public int projectWrite(HttpServletRequest request, HttpServletResponse response) {
		MatchingProVo matchingProVo = new MatchingProVo();
		MatchingDao matchingDao = new MatchingDaoImpl();
		/*
		 * request로 받은 데이터를 String 변수에 담아서 개별로 저장.
		 */
		String pm_id = request.getParameter("pm_id");
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
		matchingProVo.setPm_id(pm_id);
		matchingProVo.setTitle(title);
		matchingProVo.setSkill(skill);
		matchingProVo.setContent(content);
		matchingProVo.setNeed_person(need_person);
		matchingProVo.setLocation(location);
		matchingProVo.setStartdate(startdate);
		matchingProVo.setEnddate(enddate);
		System.out.println("=====================================");
		System.out.println("pmid : " + pm_id);
		System.out.println("title : " + title);
		System.out.println("skill : " + skill);
		System.out.println("content : " + content);
		System.out.println("need_person : " + need_person);
		System.out.println("location : " + location);
		System.out.println("startdate : " + startdate);
		System.out.println("enddate : " + enddate);
		System.out.println("=====================================");
		
		
		return matchingDao.projectWrite(matchingProVo);
		
	}
}
