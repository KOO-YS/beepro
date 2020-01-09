// 관심관련 정보vo

package com.semi.vo;

public class HeartVo {
	private String h_send;
	private String h_get;
	
	public HeartVo() {
		super();
	}
	
	
	public HeartVo(String h_send, String h_get) {
		super();
		this.h_send = h_send;
		this.h_get = h_get;
	}


	public String getH_send() {
		return h_send;
	}


	public void setH_send(String h_send) {
		this.h_send = h_send;
	}


	public String getH_get() {
		return h_get;
	}


	public void setH_get(String h_get) {
		this.h_get = h_get;
	}


	@Override
	public String toString() {
		return "HeartVo [h_send=" + h_send + ", h_get=" + h_get + "]";
	}
	
	
}
