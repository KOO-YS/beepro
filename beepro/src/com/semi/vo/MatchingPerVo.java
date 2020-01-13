//매칭-사람 관련정보

package com.semi.vo;

import java.sql.Date;

public class MatchingPerVo {
	
	private int personal_seq;	//매칭 글의 글 번호
	private String user_id;		//글을 쓰는 사람 아이디
	private String skill;		//해당 지원자가 다룰 수 있는 언어 및 툴
	private String emp_category;	//프론트, 백 유무
	private String title;		//글 제목
	private String content;		//글 내용
	private String searchCat;   //검색 카테고리
	private String searchKeyword; //검색 키워드
	private String[] skillArr;
	private String regdate;
	
	public MatchingPerVo() {}

	public MatchingPerVo(int personal_seq, String user_id, String skill, String emp_category, String title,
			String content) {
		super();
		
		this.personal_seq = personal_seq;
		this.user_id = user_id;
		this.skill = skill;
		this.emp_category = emp_category;
		this.title = title;
		this.content = content;
	}
	
	
	public MatchingPerVo(String user_id, String skill, String emp_category, String title, String content, String regdate) {
		super();
		this.user_id = user_id;
		this.skill = skill;
		this.emp_category = emp_category;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public int getPersonal_seq() {
		return personal_seq;
	}

	public void setPersonal_seq(int personal_seq) {
		this.personal_seq = personal_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getEmp_category() {
		return emp_category;
	}

	public void setEmp_category(String emp_category) {
		this.emp_category = emp_category;
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
	
	public String[] getSkillArr() {
		return skillArr;
	}

	public void setSkillArr(String[] skillArr) {
		this.skillArr = skillArr;
	}
	
	/*
	public String toString() {
		
		StringBuffer sb = new StringBuffer();
	    if(this.user_id != null) {sb.append("user_id : " + this.user_id);}
	    if(this.emp_category != null) {sb.append(", emp_category : " + this.emp_category);}
	    if(this.skill != null) {sb.append(", skill : " + this.skill);}
	    if(this.title != null) {sb.append(", title : " + this.title);}
	    if(this.content != null) {sb.append(", content : " + this.content);}
	      
	    return sb.toString();
	    
	   }*/
	
	@Override
	public String toString() {
		return "MatchingPerVo [personal_seq=" + personal_seq + ", user_id=" + user_id + ", skill=" + skill
				+ ", emp_category=" + emp_category + ", title=" + title + ", content=" + content + "]";
	}
	
}
