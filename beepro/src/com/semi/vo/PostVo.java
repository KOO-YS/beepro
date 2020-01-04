package com.semi.vo;

public class PostVo {
	
	private String u_id;
	private String type;
	private int post_no;
	
	public PostVo() {
		super();
	}
	public PostVo(String u_id, String type, int post_no) {
		super();
		this.u_id = u_id;
		this.type = type;
		this.post_no = post_no;
	}
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	@Override
	public String toString() {
		return "PostVo [u_id=" + u_id + ", type=" + type + ", post_no=" + post_no + "]";
	}
	
	
}
