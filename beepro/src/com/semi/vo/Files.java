package com.semi.vo;

import java.sql.Date;

public class Files {
	private String userId;
	private Date regdate;
	private String fileName;
	private String fileRealName;
	
	public Files() {
		
	}

	public Files(String userId, Date regdate, String fileName, String fileRealName) {
		super();
		this.userId = userId;
		this.regdate = regdate;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
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

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

}
