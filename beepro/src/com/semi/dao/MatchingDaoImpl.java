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

import com.semi.vo.MatchingPerVo;
import com.semi.vo.MatchingProVo;
import com.semi.vo.PostVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.UserVo;
import com.semi.vo.VolunteerVo;

public class MatchingDaoImpl implements MatchingDao {
	
	@Override
	public List<ProjectVo> getUserProject(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProjectVo> project = new ArrayList<ProjectVo>();
		try {
			pstm = con.prepareStatement("SELECT * FROM PROJECT WHERE MEMBER_ID LIKE '%"+userId+"/%'");
//				pstm.setString(1, userId);
			rs = pstm.executeQuery();
			while(rs.next()) {
				ProjectVo vo = new ProjectVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				project.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
		}
		return project;
	}
	
	@Override
	public UserVo getProfile(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserVo profile = null;
		try {
			pstm = con.prepareStatement(getUserInfoSql);
			pstm.setString(1, userId);

			rs = pstm.executeQuery();
			while (rs.next()) {
				rs.getString(1);
				profile = new UserVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				System.out.println(profile.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return profile;
	}

	// 김지민 매칭 부분 시작
	// 프로젝트 매칭 글쓰기
	// 실제로 DB에 데이터를 넣는 부분
	public int matchingWrite(MatchingProVo matchingProVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try { // 실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(insertmatchingWriteSql);
			pstmt.setString(1, matchingProVo.getPm_id());
			pstmt.setString(2, matchingProVo.getTitle());
			pstmt.setString(3, matchingProVo.getContent());
			pstmt.setString(4, matchingProVo.getSkill());
			pstmt.setString(5, matchingProVo.getNeed_person());
			pstmt.setString(6, matchingProVo.getLocation());
			pstmt.setString(7, matchingProVo.getStartdate());
			pstmt.setString(8, matchingProVo.getEnddate());

			res = pstmt.executeUpdate(); // 실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

	// 프로젝트 매칭 검색 기능
	public List<MatchingProVo> matchingProAll(MatchingProVo matchingProVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MatchingProVo> res = new ArrayList<MatchingProVo>();

		try {
			String selectAllMatchingSql = selectAllMatchingProSql;
			String whereStr = "";
			System.out.println(matchingProVo.getSearchCat());
			System.out.println(matchingProVo.getSearchKeyword());

			switch (matchingProVo.getSearchCat()) {
			case "pm_id":
				whereStr = "WHERE PM_ID = '" + matchingProVo.getSearchKeyword() + "'";
				break;
			case "skill":
				whereStr = "WHERE SKILL LIKE '%" + matchingProVo.getSearchKeyword() + "%'";
				break;
			case "location":
				whereStr = "WHERE LOCATION LIKE '%" + matchingProVo.getSearchKeyword() + "%'";
				break;
			default:
			}
			System.out.println(whereStr);
			selectAllMatchingSql = selectAllMatchingSql.replace("?", whereStr);

			System.out.println(selectAllMatchingSql);
			pstmt = con.prepareStatement(selectAllMatchingSql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MatchingProVo matVo = new MatchingProVo();
				matVo.setProjectM_seq(rs.getString(1));
				matVo.setPm_id(rs.getString(2));
				matVo.setTitle(rs.getString(3));
				matVo.setContent(rs.getString(4));
				matVo.setSkill(rs.getString(5));
				matVo.setNeed_person(rs.getString(6));
				matVo.setLocation(rs.getString(7));
				matVo.setStartdate(rs.getString(8));
				matVo.setEnddate(rs.getString(9));

				if (matVo.getSkill() != null && !"".equals(matVo.getSkill())) {
					String[] skillArr = matVo.getSkill().split(",");
					matVo.setSkillArr(skillArr);
				}
				res.add(matVo);
			}
			System.out.println(res.size());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("DB 종료");
		}

		return res;
	}

	public MatchingProVo matchingRead(String matching_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MatchingProVo matVo = new MatchingProVo();
		try {
			pstmt = con.prepareStatement(selectMatchingReadSql);
			pstmt.setString(1, matching_seq);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				matVo.setProjectM_seq(rs.getString(1));
				matVo.setPm_id(rs.getString(2));
				matVo.setTitle(rs.getString(3));
				matVo.setContent(rs.getString(4));
				matVo.setSkill(rs.getString(5));
				matVo.setNeed_person(rs.getString(6));
				matVo.setLocation(rs.getString(7));
				matVo.setStartdate(rs.getString(8));
				matVo.setEnddate(rs.getString(9));

				if (matVo.getSkill() != null && !"".equals(matVo.getSkill())) {
					String[] skillArr = matVo.getSkill().split(",");
					for (String skill : skillArr) {
						System.out.println("============ : " + skill);
					}
					matVo.setSkillArr(skillArr);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
			System.out.println("DB 종료");
		}

		return matVo;
	}

	@Override
	public List<VolunteerVo> getVolunteer(int projectmSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<VolunteerVo> volunteer = new ArrayList<VolunteerVo>();
		try {
			pstm = con.prepareStatement(getVolunteerSql);
			pstm.setInt(1, projectmSeq);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				VolunteerVo vo = new VolunteerVo(rs.getInt(1), rs.getString(2), rs.getString(3));
				volunteer.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
		}
		return volunteer;
	}
	@Override
	public int getVolunteerNum(int projectmSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int num = 0;
		try {
			pstm = con.prepareStatement(getVolunteerNumSql);
			pstm.setInt(1, projectmSeq);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
		}
		return num;
	}
	@Override
	public int isProjectCreated(int projectmSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(isProjectCreatedSql);
			pstm.setInt(1, projectmSeq);
			rs = pstm.executeQuery();
			while(rs.next()) {
				res = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int matchingModifyProc(MatchingProVo matchingProVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		try { // 실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(updatetmatchingSql);
			System.out.println(matchingProVo.toString());
			pstmt.setString(1, matchingProVo.getTitle());
			pstmt.setString(2, matchingProVo.getContent());
			pstmt.setString(3, matchingProVo.getSkill());
			pstmt.setString(4, matchingProVo.getNeed_person());
			pstmt.setString(5, matchingProVo.getLocation());
			pstmt.setString(6, matchingProVo.getStartdate());
			pstmt.setString(7, matchingProVo.getEnddate());
			pstmt.setString(8, matchingProVo.getProjectM_seq());

			res = pstmt.executeUpdate(); // 실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

	public int matchingDelete(String matching_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		try { // 실행문에 넣을 데이터를 만드는 구문
			pstmt = con.prepareStatement(deletematchingSeq);
			pstmt.setString(1, matching_seq);

			res = pstmt.executeUpdate(); // 실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

	// 김지민 매칭 부분

	// 퍼스널 매칭 글쓰기

	public int insertPer(MatchingPerVo perVo) {
		Connection con = getConnection();
		System.out.println("---- dao : 커넥션 성공 ----");
		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(insertPerSql);

			pstm.setString(1, perVo.getUser_id());
			pstm.setString(2, perVo.getSkill());
			pstm.setString(3, perVo.getEmp_category());
			pstm.setString(4, perVo.getTitle());
			pstm.setString(5, perVo.getContent());

			res = pstm.executeUpdate();

			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm, con);
		}
		return res;
	}

	// 개인 매칭 글목록 조회하기
	@Override
	public List<MatchingPerVo> selectAllPer() {
		Connection con = getConnection();
		System.out.println("----- dao Impl 연결 -----");
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MatchingPerVo> res = new ArrayList<MatchingPerVo>();

		try {
			pstm = con.prepareStatement(selectAllPerSql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				MatchingPerVo perVo = new MatchingPerVo();

				perVo.setPersonal_seq(rs.getInt(1));
				perVo.setUser_id(rs.getString(2));
				perVo.setSkill(rs.getString(4));
				perVo.setTitle(rs.getString(3));
				perVo.setEmp_category(rs.getString(5));
				perVo.setContent(rs.getString(6));

				res.add(perVo);
			}
			System.out.println("---- res.add(perVo) 성공 ---- ");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
			System.out.println("---------- DB 종료 ----------");
		}

		return res;
	}

	// 개인 매칭 게시글 상세보기
	@Override
	public MatchingPerVo selectOnePer(int personal_seq) {
		Connection con = getConnection();
		System.out.println("개인 매칭 상세보기 DaoImpl 연결됨");
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MatchingPerVo res = new MatchingPerVo();

		try {
			pstm = con.prepareStatement(selectOnePerSql);
			pstm.setInt(1, personal_seq);

			rs = pstm.executeQuery();

			while (rs.next()) {
				res.setPersonal_seq(rs.getInt(1));
				res.setUser_id(rs.getString(2));
				res.setSkill(rs.getString(4));
				res.setTitle(rs.getString(3));
				res.setEmp_category(rs.getString(5));
				res.setContent(rs.getString(6));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
			System.out.println("----- DB 종료 -----");
		}
		System.out.println("detail : " + res.toString());
		return res;
	}

	// 개인 매칭 게시글 수정하기
	@Override
	public int updatePer(MatchingPerVo perVo) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(updatePerSql);

			pstm.setInt(1, perVo.getPersonal_seq());
			pstm.setString(2, perVo.getUser_id());
			pstm.setString(3, perVo.getSkill());
			pstm.setString(4, perVo.getTitle());
			pstm.setString(5, perVo.getEmp_category());
			pstm.setString(6, perVo.getContent());

			res = pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	// 게시글 삭제
	@Override
	public int deletePer(int personal_seq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(deletePerSql);
			pstm.setInt(1, personal_seq);

			res = pstm.executeUpdate(); // 실제로 db에 실행시키는 구문

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm, con);
		}

		return res;
	}

	@Override
	public int MatchingWrite(MatchingProVo MatchingProVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 프로젝트 생성
	@Override
	public int insertProject(ProjectVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		int projectSeq = 0;
		try {
			pstmt = con.prepareStatement(insertProjectSql);
			pstmt.setInt(1, vo.getProjectSeq());
			pstmt.setString(2, vo.getStartDate());
			pstmt.setString(3, vo.getEndDate());
			pstmt.setString(4, vo.getProjectName());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getMember());

			res = pstmt.executeUpdate();
			if(res>0) {	// success
				projectSeq = vo.getProjectSeq();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return projectSeq;
	}
	
	// 지원자 승인
	@Override
	public int acceptVolunteer(int projectSeq, String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(acceptVolunteerSql);
			pstm.setInt(1, projectSeq);
			pstm.setString(2, userId);
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	// 프로젝트 조회
	public List<ProjectVo> selectAllProject() {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProjectVo> res = new ArrayList<ProjectVo>();

		try {
			pstmt = con.prepareStatement(selectAllProjectSql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProjectVo vo = new ProjectVo();

				vo.setProjectSeq(rs.getInt(1));
				vo.setStartDate(rs.getString(2));
				vo.setEndDate(rs.getString(3));
				vo.setFinish_ck(rs.getString(4));
				vo.setProjectName(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setMember(rs.getString(7));
				vo.setPm_ck(rs.getString(8));

		System.out.println(vo.toString());
				res.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return res;
	}
	
	// 하나의 프로젝트 조회
	public ProjectVo selectOneProject(int projectSeq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProjectVo res = new ProjectVo();
		
		try {
			pstmt = con.prepareStatement(selectOneProjectSql);
			pstmt.setInt(1, projectSeq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				res.setProjectSeq(rs.getInt(1));
				res.setStartDate(rs.getString(2));
				res.setEndDate(rs.getString(3));
				res.setFinish_ck(rs.getString(4));
				res.setProjectName(rs.getString(5));
				res.setContent(rs.getString(6));
				res.setMember(rs.getString(7));
				res.setPm_ck(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return res;
	}

	/* 관심 게시글 DAO */

	public ArrayList<Integer> selectPostNo(String u_id, String type) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> list = new ArrayList<Integer>();

		String sql = " select DISTINCT post_no from post join matching_personal ON(u_id = user_id) where type=? AND u_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, u_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return list; // 자신이 좋아요한 게시글 번호
	}

	public int postChk(PostVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM post WHERE u_id=? AND type=? AND post_no=? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getType());
			pstmt.setInt(3, vo.getPost_no());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				return -1; // 컬럼이 존재하면 음수 리턴

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return 1; // 컬럼이 존재하지 않으면 양수 리턴
	}

	public int insertPost(PostVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		String sql = " INSERT INTO post VALUES(?,?,?) ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getType());
			pstmt.setInt(3, vo.getPost_no());

			res = pstmt.executeUpdate();
			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return res;
	}

	public int deletePer(PostVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		String sql = " DELETE FROM post WHERE u_id=? AND type=? AND post_no=? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getType());
			pstmt.setInt(3, vo.getPost_no());

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			} else {
				System.out.println("삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return -1;
	}

	// 지원자 정보받기
	public boolean insertVolunteer(VolunteerVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(insertVolunteerSql);
			pstmt.setInt(1, vo.getProjectM_seq());
			pstmt.setString(2, vo.getUserId());

			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return (res > 0) ? true : false;
	}

	// 지원자 리스트로 조회
	@Override
	public List<VolunteerVo> selectAllVolunteer(int projectM_seq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<VolunteerVo> res = new ArrayList<VolunteerVo>();

		try {
			pstmt = con.prepareStatement(selectAllVolunteerSql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				VolunteerVo vol = new VolunteerVo();

				vol.setProjectM_seq(rs.getInt(1));
				vol.setUserId(rs.getString(2));
				vol.setAccept(rs.getString(3));
				System.out.println(vol.toString());

				res.add(vol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return res;
	}
	
	//내가 쓴 프로젝트 조회
	@Override
	public List<MatchingProVo> AllMyProject(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MatchingProVo> res = new ArrayList<MatchingProVo>();
		System.out.println(u_id);
		
		try {
			pstmt = con.prepareStatement(getAllMyProjectSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MatchingProVo matVo = new MatchingProVo();
				matVo.setProjectM_seq(rs.getString(1));
				matVo.setPm_id(rs.getString(2));
				matVo.setTitle(rs.getString(3));
				matVo.setContent(rs.getString(4));
				matVo.setSkill(rs.getString(5));
				matVo.setNeed_person(rs.getString(6));
				matVo.setLocation(rs.getString(7));
				matVo.setStartdate(rs.getString(8));
				matVo.setEnddate(rs.getString(9));
				
				res.add(matVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs, pstmt, con);
		}
		return res;
	}
	//내가 쓴 퍼스널 조회
	@Override
	public List<MatchingPerVo> AllMyPersonal(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MatchingPerVo> res = new ArrayList<MatchingPerVo>();
		System.out.println(u_id);

		try {
			pstmt = con.prepareStatement(getAllMyPersonalSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MatchingPerVo perVo = new MatchingPerVo();

				perVo.setPersonal_seq(rs.getInt(1));
				perVo.setUser_id(rs.getString(2));
				perVo.setSkill(rs.getString(4));
				perVo.setTitle(rs.getString(3));
				perVo.setEmp_category(rs.getString(5));
				perVo.setContent(rs.getString(6));
				res.add(perVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return res;
	}
}
