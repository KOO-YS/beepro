package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MatchingDaoImpl;
import com.semi.dao.ProjectDao;
import com.semi.dao.ProjectDaoImple;
import com.semi.dao.UserDaoImpl;
import com.semi.service.MatchingService;
import com.semi.service.UserService;
import com.semi.vo.MatchingPerVo;
import com.semi.vo.MatchingProVo;
import com.semi.vo.PageVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.UserVo;
import com.semi.vo.VolunteerVo;

//import common.Pagination;

@WebServlet("/MatchingServlet")
public class MatchingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public MatchingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		dual(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		dual(request, response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	private void dual(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**

		 * dual method : get, post 방식으로 들어온 요청을 둘다 받는다
		 * dual method : get, post 방식으로 들어온 요청을 둘다 받는다 : 구분값 설정 필요 (hidden값(예: command)
		 * or url/(추가 url로 구분 문자열 예: userservlet/login의 login)) : 구분값을 통해 service 로 값 전달
		 * 방식 예시
		 * https://github.com/jaewookleeee/semi/blob/master/src/com/semi/controller/Controller.java#L44
		 */
		String command = request.getParameter("command");
		System.out.println("[ " + command + " ]");
		// 서비스와 연결
		MatchingService matchingService = new MatchingService();

		MatchingDaoImpl dao = new MatchingDaoImpl();
		
		ProjectDao pdao = new ProjectDaoImple();
		
		UserDaoImpl userDao = new UserDaoImpl();

		// 현재 로그인 중인 아이디로 세션 받아옴

		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");
		
		if(command.equals("main")) {
			System.out.println(u_id);
			if(u_id != null) {
				List<ProjectVo> project = matchingService.getUserProject(u_id);
				request.setAttribute("projectList", project);
			}
//			dispatch("matching/common/nav_bar.jsp", request, response);
			dispatch("matching/index.jsp", request, response);
		}
		else if (command.equals("profile")) {
			System.out.println("유저 프로필 정보 추출");
			UserVo profile = matchingService.getProfile(request, response);
			// matching?command=profile&userId=1 로 연결
			
			//팔로우 체크
			String userId = request.getParameter("userId");
			UserDaoImpl userDAO = new UserDaoImpl();
			String chk=null;
			if(userDAO.heartChk(u_id, userId)>0) {
				chk="follow";
			}else {
				chk="unfollow";
			}
			//팔로워 팔로잉 갯수
			UserService userService = new UserService();
			String followers = userService.followerCount(request, response);
			String followings = userService.followingCount(request, response);
			
			//유저프로필 사진 명 가져오기
			String userPhoto = userDao.getUserPhoto(userId);
			request.setAttribute("userPhoto", userPhoto);
			
			request.setAttribute("followers", followers);
			request.setAttribute("followings", followings);
			request.setAttribute("chk", chk);
			request.setAttribute("profile", profile);
			dispatch("matching/profile.jsp", request, response);
		} else if (command.equals("matchingWrite")) {
			int success = matchingService.matchingWrite(request, response);

			if (success > 0) {
				System.out.println("글 게시 성공");
				// dispatch("/matching/matching.jsp", request, response);
				response.sendRedirect("matching?command=matchingAll");
			} else {
				System.out.println("글 게시 실패");
			}
			System.out.println("매칭 생성");

			// 매칭 전체보기
		} else if (command.equals("matchingAll")) {
			
			System.out.println("매칭 전체 보기");
			List<MatchingProVo> list = matchingService.matchingProAll(request);
			request.setAttribute("matchingList", list);
			
			
			   int listCount = list.size();
		         System.out.println(listCount);
		         request.setAttribute("listsize", listCount);
		         
		         String curpagenum = request.getParameter("curpagenum");
		         System.out.println(curpagenum+"현재페이지");
		         
		         //페이징 시작
		         int currentPage = 0;

		         if (curpagenum == null || curpagenum == "0") {
		            currentPage = 1;
		         } else {
		            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
		         }

		         PageVo page = new PageVo();

		         page.setCurrentPage(currentPage);
		         page.setListCount(listCount);
		         page.setAllPage(listCount);
		         page.setPreve(currentPage);
		         page.setStartRow(currentPage);
		         page.setStartPage(currentPage, page.getAllPage());
		         page.setEndPage(currentPage, page.getAllPage());
		         page.setNext(currentPage, page.getAllPage());

		         request.setAttribute("page", page);

		         
		        //페이징 끝
		         
			// 관심게시글 가져오기
			ArrayList<Integer> postList =  dao.selectPostNo(u_id,"project");
			request.setAttribute("postList", postList);
			
			dispatch("matching/matchingList.jsp", request, response);

			// 매칭 상세보기
		} else if (command.equals("matchingRead")) {
			System.out.println("매칭 상세보기");
			MatchingProVo matchingProVo = matchingService.matchingRead(request);
			System.out.println(matchingProVo.toString());

			int projectM_seq = Integer.parseInt(request.getParameter("projectM_seq"));
			List<VolunteerVo> list = dao.selectAllVolunteer(projectM_seq);

			System.out.println(list.toString());

			request.setAttribute("matchingVo", matchingProVo);

			request.setAttribute("list", list);

			dispatch("matching/matchingRead.jsp", request, response);

			// 프로젝트 매칭 글 삭제
		} else if (command.equals("matchingDelete")) {
			System.out.println("매칭 글 삭제");
			int success = matchingService.matchingDelete(request);
			if (success > 0) {
				System.out.println("글 삭제 성공");
				// dispatch("/matching/matching.jsp", request, response);
				response.sendRedirect("matching?command=matchingAll");
			} else {
				System.out.println("글 삭제 실패");
			}

			// 프로젝트 매칭 글 detail  수정		-- real 
		} else if (command.equals("matchingView")) {
			System.out.println("매칭 글 수정 페이지");
			int projectmSeq = Integer.parseInt(request.getParameter("projectM_seq"));
			
			MatchingProVo matchingProVo = matchingService.matchingRead(request);		// 게시글 디테일
			List<VolunteerVo> volunteer = matchingService.getVolunteer(projectmSeq);	// 지원자 목록
			int volunteerNum = matchingService.getVolunteerNum(projectmSeq);			// 지원자 수
			boolean created = matchingService.isProjectCreated(projectmSeq);			// 프로젝트 생성 여부
			
			request.setAttribute("matchingVo", matchingProVo);
			request.setAttribute("volunteer", volunteer);
			request.setAttribute("volunteerNum", volunteerNum);
			request.setAttribute("created", created);
			
			
			dispatch("matching/matchingRead.jsp", request, response);

		} else if (command.equals("matchingModifyProc")) {
			
			System.out.println("매칭 글 수정 수정");
			String project_seq = (String) request.getParameter("projectM_seq");
			System.out.println(project_seq);

			int projectM_seq = Integer.parseInt(request.getParameter("projectM_seq"));

			int success = matchingService.matchingModifyProc(request);
			if (success > 0) {
				System.out.println("글 수정 성공");
				// dispatch("/matching/matching.jsp", request, response);
				response.sendRedirect("matching?command=matchingAll");
			} else {
				System.out.println("글 수정 실패");
			}
			
// ----------------------------------------------------------------------------------------------- //
// --------------------------------------------------------------------------------------------------------------------------------
//			-------------------------------- 개인 매칭 컨트롤러 --------------------------------
//--------------------------------------------------------------------------------------------------------------------------------
	
//개인 매칭 글쓰기
} else if(command.equals("personalWrite")) {
	
    int success = matchingService.personalWrite(request, response);
	
	if(success > 0) {
		System.out.println("글 게시 성공");
		dispatch("personMatching?command=selectAllPer", request, response);
		
	} else {
		System.out.println("글 게시 실패");
	}
	
//개인 매칭 글 수정
	
} else if(command.equals("personalUpdate")) {
	System.out.println("게시글 수정");
	String personal_seq = request.getParameter("personal_seq");
	System.out.println(personal_seq);
	int success = matchingService.updatePer(request, response);
	
	if(success > 0) {
		dispatch("personMatching?command=selectAllPer", request, response);
		//시퀀스 말고 vo 자체를 가지고 오기->시퀀스는 시퀀스만 인식하기 때문에 다 가지고 오지 못함
		System.out.println("게시글 수정 성공");
	} else {
		System.out.println("게시글 수정 실패");
	}
	
//매칭 글 삭제	
} else if(command.equals("personalDelete")) {
	System.out.println("매칭 글 삭제");
	int success = matchingService.deletePer(request);
	
	 if(success > 0) {
        System.out.println("글 삭제 성공");
        response.sendRedirect("personMatching?command=selectAllPer");
     } else {
        System.out.println("글 삭제 실패"); 
     }

//개인 매칭 게시글 목록
} else if(command.equals("selectAllPer")) {
	List<MatchingPerVo> list = dao.selectAllPer();
	
	request.setAttribute("personList", list);
	System.out.println("게시글 리스트 확인");
	
	// 세션값 넘기기
	request.setAttribute("u_id", u_id);
	System.out.println("세션넘기기");

	//유저프로필 사진명 가져오기
	List<String> photoList = new ArrayList<String>();
	for(int i=0 ; i<list.size(); i++) {
		String userPhoto = userDao.getUserPhoto(list.get(i).getUser_id());
		photoList.add(userPhoto);
	}
	request.setAttribute("photoList", photoList);

				
	// 관심게시글 가져오기			
	ArrayList<Integer> postList =  dao.selectPostNo(u_id,"personal");
	request.setAttribute("postList", postList);
	
	for(MatchingPerVo m : list) {
		System.out.println(m);
	}
	
//---------------- 페이징 서블릿 코드 ----------------
	
     int listCount = list.size();
     System.out.println(listCount);
     request.setAttribute("listsize", listCount);
     
     String curpagenum = request.getParameter("curpagenum");
     System.out.println(curpagenum+"현재페이지");

     int currentPage = 0;

     if (curpagenum == null || curpagenum == "0") {
        currentPage = 1;
     } else {
        currentPage = Integer.parseInt(request.getParameter("curpagenum"));
     }

     PageVo page = new PageVo();

     page.setCurrentPage(currentPage);
     page.setListCount(listCount);
     page.setAllPage(listCount);
     page.setPreve(currentPage);
     page.setStartRow(currentPage);
     page.setStartPage(currentPage, page.getAllPage());
     page.setEndPage(currentPage, page.getAllPage());
     page.setNext(currentPage, page.getAllPage());

     request.setAttribute("page", page);
     
//---------------- 페이징 서블릿 코드 끝 ----------------
	
	RequestDispatcher dispatch = request.getRequestDispatcher("/matching/personal.jsp");
	
	dispatch.forward(request, response);

//개인 매칭 글 상세 확인
} else if(command.equals("selectOnePer")) {
	System.out.println("게시글 상세 확인하기");
	
	MatchingPerVo detail = matchingService.selectOnePer(request, response);
	if(detail != null) {
		System.out.println("개인 매칭 디테일 정보 출력");
		
		//유저프로필 사진 명 가져오기
		String userPhoto = userDao.getUserPhoto(detail.getUser_id());
		request.setAttribute("userPhoto", userPhoto);
		
		request.setAttribute("detail", detail);
		dispatch("matching/personalRead.jsp", request, response);
	}

			
			
			
			/* 보미 작성하는 부분입니다. */
			// 프로젝트 생성
		} else if (command.equals("projectCreate")) {
			System.out.println("프로젝트 생성");
			System.out.println("pm아이디:" + u_id);
			
			int projectSeq = matchingService.insertProject(request, response);

			String p_name = pdao.selectOneProjectName2(projectSeq);
			System.out.println("프로젝트 명 :"+p_name);
			
			if (projectSeq > 0) {
				System.out.println("프로젝트 생성 성공");
				session.setAttribute("projectSeq", projectSeq);
				session.setAttribute("pName", p_name);
				
				dispatch("cowork/index.jsp",request, response);
			} else {
				System.out.println("프로젝트 생성 실패");
			}

			// 프로젝트 조회
		} else if (command.equals("selectAllProject")) {
			System.out.println("프로젝트 전체 조회");
			List<ProjectVo> list = matchingService.selectAllProject(request, response);
			session.setAttribute("projectVo", list);
			dispatch("/cowork/common/dashboard.jsp", request, response);
           
           // 프로젝트 하나 조회		
		} else if (command.equals("selectOneProject")) {
			System.out.println("워크스페이스 이동");
			int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
			System.out.println("[servlet] 워크스페이스 : " + projectSeq);
			
			ProjectVo vo = matchingService.selectOneProject(request,response);
			session.setAttribute("projectSeq", projectSeq);			
			dispatch("project?command=dashboard&projectSeq="+projectSeq,request,response);

			// 게시글 controller //
		} else if (command.equals("togglePost")) {
			System.out.println("관심 게시글 추가");
			matchingService.togglePost(request, response);

		} else if (command.equals("chkPost")) {
			matchingService.chkPost(request, response);

		} else if (command.equals("insertVolunteer")) {
			System.out.println("아이디:" + u_id);

			int projectM_seq = Integer.parseInt(request.getParameter("projectM_seq"));
			System.out.println("프로젝트 공고 글 번호 : " + projectM_seq);
			boolean success = matchingService.insertVolunteer(request, response);

			if (success) {
				System.out.println("지원성공");
				response.sendRedirect("matching?command=matchingView&projectM_seq="+projectM_seq);
			} else {
				System.out.println("지원실패");
			}

			//마이페이지로 매칭 게시글목록 전달
		}else if(command.equals("mypage")) {
  	  		System.out.println("마이페이지");
  	  		
  	  		//지역 리스트 담기
  	  		String area = matchingService.getUserArea(request, response);
  	  		request.setAttribute("area", area);
  	  		
  	  		// user skill 리스트 담기
  	  		List<String> skill = matchingService.getUserSkill(request, response);
  	  		request.setAttribute("skillList", skill);
  	  		
  	  		//personal 목록담기
  	  		List<MatchingPerVo> list1 = matchingService.AllMyPersonal(request, response);
  	  		request.setAttribute("personalList", list1);
	      
  	  		//project 목록 담기
  	  		List<MatchingProVo> list2 = matchingService.AllMyProject(request, response);
  	  		request.setAttribute("projectList", list2);
	         
  	  		//관심 퍼스널 담기
  	  		List<MatchingPerVo> list3 = matchingService.allPersonalPost(request, response);
  	  		request.setAttribute("postPerList", list3);
  	  		
  	  		//관심 프로젝트 담기
  	  		List<MatchingProVo> list4 = matchingService.allProjectPost(request, response);
  	  		request.setAttribute("postProList", list4);
  	  		
  	  		//팔로일잉 담기
  	  		UserService userService = new UserService(); 
  	  		List<String> list5 = userService.getAllFollowing(request, response);
  	  		request.setAttribute("followingList", list5);	
  	  		
  	  	List<String> photoList = new ArrayList<String>();
  		for(int i=0 ; i<list5.size(); i++) {
  			String userPhoto = userDao.getUserPhoto(list5.get(i));
  			photoList.add(userPhoto);
  		}
  		request.setAttribute("photoList", photoList);
  	  		
  	  		dispatch("matching/mypage.jsp", request, response);
		}						

	}
}
