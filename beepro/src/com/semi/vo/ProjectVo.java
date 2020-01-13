// 협업 - 프로젝트 관련 정보
package com.semi.vo;

import java.io.Serializable;

public class ProjectVo  implements Serializable {
	private int projectSeq; // 프로젝트 시퀀스
	private String startDate; // 프로젝트 시작 일
	private String endDate; // 프로젝트 종료 일
	private String finish_ck; // 프로젝트 종료 여부
	private String projectName; // 프로젝트 명
	private String content; // 프로젝트 개요
	private String member; // 프로젝트 멤버
	private String pm_ck; // pm여부
	
	public ProjectVo() {
		
	}
	
	public ProjectVo(int projectSeq, String startDate, String endDate, String projectName, String content,
			String member) {
		super();
		this.projectSeq = projectSeq;
		this.startDate = startDate;
		this.endDate = endDate;
		this.projectName = projectName;
		this.content = content;
		this.member = member;
	}
	
	public ProjectVo(int projectSeq, String startDate, String endDate, String finish_ck, String projectName, String content,
			String member, String pm_ck) {
		super();
		this.projectSeq = projectSeq;
		this.startDate = startDate;
		this.endDate = endDate;
		this.finish_ck = finish_ck;
		this.projectName = projectName;
		this.content = content;
		this.member = member;
		this.pm_ck = pm_ck;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getFinish_ck() {
		return finish_ck;
	}

	public void setFinish_ck(String finish_ck) {
		this.finish_ck = finish_ck;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getPm_ck() {
		return pm_ck;
	}

	public void setPm_ck(String pm_ck) {
		this.pm_ck = pm_ck;
	}

	@Override
	public String toString() {
		return "ProjectVo [projectSeq=" + projectSeq + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", finish_ck=" + finish_ck + ", projectName=" + projectName + ", content=" + content + ", member="
				+ member + ", pm_ck=" + pm_ck + "]";
	}
}
