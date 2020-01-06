package com.semi.vo;

public class VolunteerVo {
	private int projectM_seq;
	private String userId;
	private String accept;
	
	public VolunteerVo() {
		
	}
	
	public VolunteerVo(int projectM_seq, String userId, String accept) {
		super();
		this.projectM_seq = projectM_seq;
		this.userId = userId;
		this.accept = accept;
	}

	public VolunteerVo(int projectM_seq, String userId) {
		super();
		this.projectM_seq = projectM_seq;
		this.userId = userId;
	}

	public int getProjectM_seq() {
		return projectM_seq;
	}

	public void setProjectM_seq(int projectM_seq) {
		this.projectM_seq = projectM_seq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}
}
