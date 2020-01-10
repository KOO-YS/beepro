package com.semi.vo;

import java.sql.Date;

public class FileVo {
	private int fileSeq;
	private String userId;
	private Date regdate;
	private String fileName;
	private int projectSeq;
	
	public FileVo() {
		
	}

	public FileVo(int fileSeq, String userId, Date regdate, String fileName, int projectSeq) {
		super();
		this.fileSeq = fileSeq;
		this.userId = userId;
		this.regdate = regdate;
		this.fileName = fileName;
		this.projectSeq = projectSeq;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	@Override
	public String toString() {
		return "FileVo [fileSeq=" + fileSeq + ", userId=" + userId + ", regdate=" + regdate + ", fileName=" + fileName
				+ ", projectSeq=" + projectSeq + "]";
	}
}
