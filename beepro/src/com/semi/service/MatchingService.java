package com.semi.service;


import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MatchingDao;
import com.semi.dao.MatchingDaoImpl;
import com.semi.vo.MatchingPerVo;
import com.semi.vo.MatchingProVo;
import com.semi.vo.UserVo;
import com.semi.vo.PostVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.VolunteerVo;

public class MatchingService {
	
	/** 
	 * 신규 프로젝트 작성 기능
	 * 
	 * @param request  view에서 form에 담은 데이터(request)를 Vo로 옮기기 위해서 받아옴.
	 * @param response
	 * @return DB INSERT 후 성공 여부에 따라 int 형으로 결과값을 받을 수 있음.
	 */

   MatchingDao matchingDao = new MatchingDaoImpl();
   MatchingDao Dao = new MatchingDaoImpl();
   
   // 프로필 정보 추출
   public UserVo getProfile(HttpServletRequest request, HttpServletResponse response) {
	   	String userId = request.getParameter("userId");
	   	UserVo profile = matchingDao.getProfile(userId);
		return profile;
	}
   
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
      String matching_seq = (String) request.getParameter("projectM_seq");
      int projectM_seq = Integer.parseInt(request.getParameter("projectM_seq"));
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
      String projectM_seq = request.getParameter("projectM_seq");
      String title = request.getParameter("title");
      String skill = request.getParameter("skill");
      String content = request.getParameter("content");
      String need_person = request.getParameter("need_person");
      String location = request.getParameter("location");
      String startdate = request.getParameter("startdate");
      String enddate = request.getParameter("enddate");
      
      MatchingProVo matVo = new MatchingProVo(pm_id, skill, title, content, need_person, location, startdate, enddate);
      matVo.setProjectM_seq(projectM_seq);
      
      return matchingDao.matchingModifyProc(matVo);
   }
   
   public int matchingDelete(HttpServletRequest request) {
      MatchingDao matchingDao = new MatchingDaoImpl();
      /*
       * request로 받은 데이터를 String 변수에 담아서 개별로 저장.
       */
      String matching_seq = request.getParameter("projectM_seq");
      
      return matchingDao.matchingDelete(matching_seq);
   }
   
      public int personalWrite(HttpServletRequest request, HttpServletResponse response) {
      MatchingDaoImpl dao = new MatchingDaoImpl();
   
      System.out.println("서비스 연결됨");
      
      HttpSession session = request.getSession();
       String user_id= (String)session.getAttribute("u_id");
      String title = request.getParameter("title");
      String skill = request.getParameter("skill");
      String emp_category = request.getParameter("emp_category");
      String content = request.getParameter("content");
      System.out.println(user_id);
      System.out.println(title);
      System.out.println(skill);
      System.out.println(emp_category);
      System.out.println(content);
      
      MatchingPerVo perVo = new MatchingPerVo(user_id, title, skill, emp_category, content);

      int res = dao.insertPer(perVo);
      
      return res;
      
   }

   //글 수정하기
   public int updatePer(HttpServletRequest request, HttpServletResponse response) {
      /*pstm.setInt(1, perVo.getPersonal_seq());
         pstm.setString(2, perVo.getUser_id());
         pstm.setString(3, perVo.getSkill());
         pstm.setString(4, perVo.getTitle());
         pstm.setString(5, perVo.getEmp_category());
         pstm.setString(6, perVo.getContent());*/
      int personal_seq = Integer.parseInt(request.getParameter("personal_seq"));
      String user_id = request.getParameter("user_id");
      String skill = request.getParameter("skill");
      String title = request.getParameter("title");
      String emp_category = request.getParameter("emp_category");
      String content = request.getParameter("content");
      
      MatchingPerVo perVo = new MatchingPerVo(personal_seq, user_id, skill, emp_category, title, content);
      
      return matchingDao.updatePer(perVo);
   }
   
   public int deletePer(HttpServletRequest request) {
      MatchingDao matchingDao = new MatchingDaoImpl();
      int personal_seq = Integer.parseInt(request.getParameter("personal_seq"));
      
      return matchingDao.deletePer(personal_seq);

   }
      
   //글 리스트 출력(personal 페이지)
   public List<MatchingPerVo> selectAllPer(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("글 리스트 출력 서비스");
      return matchingDao.selectAllPer();
   }
   
   //글 상세 보기
   public MatchingPerVo selectOnePer(HttpServletRequest request, HttpServletResponse response) {
      int personal_seq = Integer.parseInt(request.getParameter("personal_seq"));
      System.out.println("personal_seq : " + personal_seq);
      return matchingDao.selectOnePer(personal_seq);
      
   }

   // 프로젝트 생성
	public boolean insertProject(HttpServletRequest request, HttpServletResponse response) {
		
		int projectSeq = Integer.parseInt(request.getParameter("projectM_seq"));
		System.out.println("프로젝트 시퀀스:" + projectSeq);
		
	    String startDate = request.getParameter("startDate");
	    String endDate = request.getParameter("endDate");
		String projectName = request.getParameter("projectName");
		String content = request.getParameter("content");
		String member = request.getParameter("member");
		
		ProjectVo vo = new ProjectVo(projectSeq, startDate, endDate, projectName, content, member);
		
		System.out.println(vo.toString());
		
		MatchingDaoImpl dao = new MatchingDaoImpl();
		 
	    return dao.insertProject(vo);
    }
	
    // 프로젝트 조회
	public List<ProjectVo> selectAllProject(HttpServletRequest request, HttpServletResponse response) {
		
		MatchingDaoImpl dao = new MatchingDaoImpl();
		return dao.selectAllProject();
	}
   
   public boolean insertVolunteer(HttpServletRequest request, HttpServletResponse response) {
	   int projectM_seq = Integer.parseInt(request.getParameter("projectM_seq"));
	   System.out.println("service 프로젝트 공고 글 번호 :" + projectM_seq);
	   
	   HttpSession session = request.getSession();
	   String u_id = (String)session.getAttribute("u_id");
	   System.out.println("아이디:"+u_id);
	   
	    VolunteerVo vo = new VolunteerVo(projectM_seq, u_id);
	    
	    System.out.println(vo.toString());
	    
	    MatchingDaoImpl dao = new MatchingDaoImpl();
	    
		return dao.insertVolunteer(vo);
	}
   
   
   
   
   /* 관심 게시글 서비스 */
   
	public void togglePost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String u_id = request.getParameter("u_id");
		String type = request.getParameter("type");
		int post_no = Integer.parseInt(request.getParameter("post_no"));

		System.out.println("u__id : " + u_id);
		System.out.println("post_id : " + post_no);
		System.out.println("type : " + type);

		PostVo postVo = new PostVo(u_id, type, post_no);
		
		if(u_id == null || u_id.equals("")) {
			response.getWriter().write("0");
		}else {
			MatchingDaoImpl dao = new MatchingDaoImpl();
			if(dao.postChk(postVo) > 0) {
				response.getWriter().write(new MatchingDaoImpl().insertPost(postVo)+"");
				System.out.println("관심 게시글 추가");
			}else {
				response.getWriter().write(new MatchingDaoImpl().deletePer(postVo)+"");
				System.out.println("관심 게시글 삭제");
			}
			
		}

	}
	public void chkPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String u_id = request.getParameter("u_id");
		String type = request.getParameter("type");
		int post_no = Integer.parseInt(request.getParameter("post_no"));

		System.out.println("u__id : " + u_id);
		System.out.println("post_id : " + post_no);
		System.out.println("type : " + type);

		PostVo postVo = new PostVo(u_id, type, post_no);

		MatchingDaoImpl dao = new MatchingDaoImpl();
		if(dao.postChk(postVo) > 0) {
			response.getWriter().write('0'); //회색하트
		}else {
			response.getWriter().write('1'); //빨강하트
		}
	}
	
    // 모든 매칭 프로젝트 list 조회
	public List<MatchingProVo> selectAllPro(HttpServletRequest request, HttpServletResponse response) {
		MatchingDaoImpl dao = new MatchingDaoImpl();
		String u_id = request.getParameter("u_id");
		return dao.matchingProAll(u_id);
	}
	
}
