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
	private String responsibility; // 이슈 담당자

	public IssueVo() {
	}

	public IssueVo(int issueSeq, int projectSeq, String title, String writer, String level, Date regdate,
			String category, String content, String responsibility) {
		super();
		this.issueSeq = issueSeq;
		this.projectSeq = projectSeq;
		this.title = title;
		this.writer = writer;
		this.level = level;
		this.regdate = regdate;
		this.category = category;
		this.content = content;
		this.responsibility = responsibility;
	}

	public IssueVo(int projectSeq, String title, String writer, String level, String category, String content, String responsibility) {
		super();
		this.projectSeq = projectSeq;
		this.title = title;
		this.writer = writer;
		this.level = level;
		this.category = category;
		this.content = content;
		this.responsibility = responsibility;
	}

	public IssueVo(int issueSeq, int projectSeq, String title, String level, String category, String content,
			String responsibility) {
		super();
		this.issueSeq = issueSeq;
		this.projectSeq = projectSeq;
		this.title = title;
		this.level = level;
		this.category = category;
		this.content = content;
		this.responsibility = responsibility;
	}

	public IssueVo(int issueSeq, String title, String level, String category, String content) {
		super();
		this.issueSeq = issueSeq;
		this.title = title;
		this.level = level;
		this.category = category;
		this.content = content;
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
	
	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	@Override
	public String toString() {
		return "IssueVo [issueSeq=" + issueSeq + ", projectSeq=" + projectSeq + ", title=" + title + ", writer="
				+ writer + ", level=" + level + ", regdate=" + regdate + ", category=" + category + ", content="
				+ content + ", responsibility=" + responsibility + "]";
	}

}
