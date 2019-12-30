// 협업 - 프로젝트 관련 정보
package com.semi.vo;

import java.sql.Date;

public class ProjectVo {
	private int projectSeq; // 프로젝트 시퀀스
	private Date startDate; // 프로젝트 시작 일
	private Date endDate; // 프로젝트 종료 일
	private String finish_ck; // 프로젝트 종료 여부
	private String projectName; // 프로젝트 명
	
	public ProjectVo() {
	}
	
	public ProjectVo(int projectSeq, Date startDate, Date endDate, String finish_ck, String projectName) {
		super();
		this.projectSeq = projectSeq;
		this.startDate = startDate;
		this.endDate = endDate;
		this.finish_ck = finish_ck;
		this.projectName = projectName;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
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
}
