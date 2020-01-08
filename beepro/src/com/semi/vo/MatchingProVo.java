//매칭-프로젝트 관련정보

package com.semi.vo;

public class MatchingProVo {

	private String projectM_seq; //프로젝트 시퀀스
	private String pm_id; //pm 아이디
	private String skill; //프로젝트 제목
	private String title; //프로젝트 제목
	private String content; //상세내용
	private String need_person; //필요한 사람 수
	private String location; //지역
	private String startdate; //시작날짜
	private String enddate; //끝나는 날짜
	private String[] skillArr; //스킬 ARRAY
	private boolean modifyYn = false;	//수정 가능 여부
	private String searchCat;	//검색 카테고리
	private String searchKeyword; //검색 키워드
	private int startIndex; //페이징 시작
	private int cnrPerPage; //페이지사이즈

	public MatchingProVo() {}
	
	public MatchingProVo(String pm_id, String skill, String title, String content, String need_person, String location,
			String startdate, String enddate) {
		super();
		this.pm_id = pm_id;
		this.skill = skill;
		this.title = title;
		this.content = content;
		this.need_person = need_person;
		this.location = location;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	
	

	public String getProjectM_seq() {
		return projectM_seq;
	}

	public void setProjectM_seq(String projectM_seq) {
		this.projectM_seq = projectM_seq;
	}

	public String getPm_id() {
		return pm_id;
	}

	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNeed_person() {
		return need_person;
	}

	public void setNeed_person(String need_person) {
		this.need_person = need_person;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}
	
	public String toString() {
		StringBuffer sb = new StringBuffer();
		if(this.pm_id != null) {sb.append("pm_id : " + this.pm_id);}
		if(this.skill != null) {sb.append(", skill : " + this.skill);}
		if(this.title != null) {sb.append(", title : " + this.title);}
		if(this.content != null) {sb.append(", content : " + this.content);}
		if(this.need_person != null) {sb.append(", need_person : " + this.need_person);}
		if(this.location != null) {sb.append(", location : " + this.location);}
		if(this.startdate != null) {sb.append(", startdate : " + this.startdate);}
		if(this.enddate != null) {sb.append(", enddate : " + this.enddate);}
		
		return sb.toString();
	}

	public String getProject_seq() {
		return projectM_seq;
	}

	public void setProject_seq(String projectM_seq) {
		this.projectM_seq = projectM_seq;
	}

	public String[] getSkillArr() {
		return skillArr;
	}

	public void setSkillArr(String[] skillArr) {
		this.skillArr = skillArr;
	}

	public boolean isModifyYn() {
		return modifyYn;
	}

	public void setModifyYn(boolean modifyYn) {
		this.modifyYn = modifyYn;
	}
	
	public String getSearchCat() {
		return searchCat;
	}

	public void setSearchCat(String searchCat) {
		this.searchCat = searchCat;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCnrPerPage() {
		return cnrPerPage;
	}

	public void setCnrPerPage(int cnrPerPage) {
		this.cnrPerPage = cnrPerPage;
	}
}
