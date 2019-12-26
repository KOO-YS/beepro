// 이슈관련 정보
package com.semi.vo;

import java.sql.Date;

public class IssueVo {
	private int issueSeq; // 이슈 번호
	private int projectSeq; // 프로젝트 번호
	private String title; // 이슈 제목
	private String writer; // 이슈 작성자
	private String level; // 이슈 중요도
	private Date regdate; // 이슈 작성 날짜
	private String category; // 이슈 종류
	private String content; // 이슈 내용
	private String projectName; // 프로젝트 명
	private String people; // 프로젝트 참여인원들

	public IssueVo() {
	}

	public IssueVo(int issueSeq, int projectSeq, String title, String writer, String level, Date regdate,
			String category, String content, String projectName, String people) {
		super();
		this.issueSeq = issueSeq;
		this.projectSeq = projectSeq;
		this.title = title;
		this.writer = writer;
		this.level = level;
		this.regdate = regdate;
		this.category = category;
		this.content = content;
		this.projectName = projectName;
		this.people = people;
	}

	public int getIssueSeq() {
		return issueSeq;
	}

	public void setIssueSeq(int issueSeq) {
		this.issueSeq = issueSeq;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}
}
