//메세지관련 정보

package com.semi.vo;


public class MessageVo {
	private int messageSeq;
	private String send_id;
	private String get_id;
	private String content;
	private String regdate;
	public int getMessageSeq() {
		return messageSeq;
	}
	public void setMessageSeq(int messageSeq) {
		this.messageSeq = messageSeq;
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
	
		
	
	
}
