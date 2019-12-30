//매칭-프로젝트 관련정보

package com.semi.vo;

public class MatchingProVo {
	

	private String subject;
	private String country;
	private String start;
	private String depart;
	private String region;
	private String people;
	private String comments;

	
	private String pm_id; //pm 아이디
	private String skill; //프로젝트 제목
	private String title; //프로젝트 제목
	private String content; //상세내용
	private String need_person; //필요한 사람 수
	private String location; //지역
	private String startdate; //시작날짜
	private String enddate; //끝나는 날짜
	
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
	

}
