package com.semi.vo;

public class MsgVo {
	private int msg_seq;
	private String send_id;
	private String get_id;
	private String content;
	private String regdate;
	private int read_ck; 		// 읽지 않았으면 0 읽었으면 1
	
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getGet_id() {
		return get_id;
	}
	public void setGet_id(String get_id) {
		this.get_id = get_id;
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
	public int getRead_ck() {
		return read_ck;
	}
	public void setRead_ck(int read_ck) {
		this.read_ck = read_ck;
	}
	
	
	
}
