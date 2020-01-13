package com.semi.vo;

import java.util.Date;

public class CommentVo {
	private int projectSeq; // 프로젝트 번호
	private int commentSeq; // 댓글 번호
	private int issueSeq; // 이슈 번호
	private String writer; // 댓글 작성자
	private String content; // 댓글 내용
	private String regdate; // 댓글 작성일
    
	public CommentVo() {
		
	}

	public CommentVo(int projectSeq, int commentSeq, int issueSeq, String writer, String content, String regdate) {
		super();
		this.projectSeq = projectSeq;
		this.commentSeq = commentSeq;
		this.issueSeq = issueSeq;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public int getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}

	public int getIssueSeq() {
		return issueSeq;
	}

	public void setIssueSeq(int issueSeq) {
		this.issueSeq = issueSeq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CommentVo [projectSeq=" + projectSeq + ", commentSeq=" + commentSeq + ", issueSeq=" + issueSeq
				+ ", writer=" + writer + ", content=" + content + ", regdate=" + regdate + "]";
	}
}
